Class {
	#name : #ZeroMoney,
	#superclass : #Money,
	#category : #'GtStuff-Prices'
}

{ #category : #testing }
ZeroMoney >> < aMoney [
	^ aMoney isZero not and: [ aMoney > self ]
]

{ #category : #testing }
ZeroMoney >> = aMoney [
	^ (aMoney isKindOf: UMoney) and: [ aMoney isZero ]
]

{ #category : #testing }
ZeroMoney >> > aMoney [
	^ aMoney isZero not and: [ aMoney < self ]
]

{ #category : #operations }
ZeroMoney >> add: aMoney [
	^ aMoney
]

{ #category : #operations }
ZeroMoney >> addCurrencyMoney: aCurrencyMoney [
	^ aCurrencyMoney
]

{ #category : #operations }
ZeroMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag
]

{ #category : #operations }
ZeroMoney >> divideBy: aNumber [
	^ self
]

{ #category : #printing }
ZeroMoney >> gtDisplayOn: stream [
	stream  nextPutAll: '0'
]

{ #category : #testing }
ZeroMoney >> isZero [
	^ true
]

{ #category : #operations }
ZeroMoney >> multiplyBy: aNumber [
	^ self
]

{ #category : #operations }
ZeroMoney >> negative [
	^ self
]
