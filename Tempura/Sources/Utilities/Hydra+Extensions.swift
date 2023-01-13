//
//  Hydra+Extensions.swift
//  AfreshApp
//

import Foundation
import Hydra

let awaitContext = Context.custom(queue: DispatchQueue(label: "com.tempura.waitcontext", attributes: .concurrent))

extension Hydra {
    @discardableResult
    public static func wait<T>(in context: Context? = nil, _ promise: Promise<T>) throws -> T {
        return try (context ?? awaitContext).wait(promise)
    }
}

extension Context {

    ///  Awaits that the given promise fulfilled with its value or throws an error if the promise fails.
    ///
    /// - Parameter promise: target promise
    /// - Returns: return the value of the promise
    /// - Throws: throw if promise fails
    @discardableResult
    func wait<T>(_ promise: Promise<T>) throws -> T {
        let isNotMainQueue = self.queue != DispatchQueue.main

        guard isNotMainQueue else {
            throw PromiseError.invalidContext
        }

        var result: Result<T, Error>!

        let workItem = DispatchWorkItem {}

        promise
            .then(in: self) { value in
                result = .success(value)
                workItem.perform()
            }
            .catch(in: self) { error in
                result = .failure(error)
                workItem.perform()
            }

        workItem.wait()

        return try result.get()
    }
}
