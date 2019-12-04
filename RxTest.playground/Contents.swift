import UIKit
import RxSwift
import RxCocoa

// PublishSubject
/*
let subject = PublishSubject<String>()

let sub1 = subject.subscribe(onNext: {
    
    print("sub1 is: \($0)")
})

subject.onNext("Love")
sub1.dispose()

let sub2 = subject.subscribe(onNext: {
    
    print("sub2 is: \($0)")
})

subject.onNext("mm")
subject.onNext("uu")
sub2.dispose()
*/

// BehaviorSubject
/*
let subject = BehaviorSubject<Int>(value: 9)
subject.onNext(0)
subject.onNext(1)
subject.onNext(2)
let sub1 = subject.subscribe(onNext: {
    
    print("Behavior subject : \($0)")
})

subject.onNext(3)
sub1.dispose()

let sub2 = subject.subscribe(onNext: {
    
    print("Behavior subject : \($0)")
})

subject.onNext(4)
sub2.dispose()
*/

//ReplaySubject
/*
let subject = ReplaySubject<String>.create(bufferSize: 2)
let sub1 = subject.subscribe(onNext:{
    
    print("Replay subject1 : \($0)")
})
subject.onNext("l")
subject.onNext("o")
subject.onNext("v")
sub1.dispose()

let sub2 = subject.subscribe(onNext: {
    
    print("Replay subject2 : \($0)")
})
subject.onNext("e")
subject.onNext("w")
sub2.dispose()
*/

//BehaviorRelay

let bag = DisposeBag()
let subject = BehaviorRelay<String>(value: "mm")
subject.accept("uu")
subject.asObservable().subscribe(onNext: {
    
    print("Behavior Relay : \($0)")
}).disposed(by: bag)

subject.accept("love")
