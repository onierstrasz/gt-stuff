Class {
	#name : #CurrencyMoney,
	#superclass : #Money,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #'GtStuff-Prices'
}

{ #category : #testing }
CurrencyMoney >> < aMoney [
	^ (aMoney isZero and: [self amount < 0]) or: [ 
		self currency = aMoney currency and: [ self amount < aMoney amount ] ]
]

{ #category : #testing }
CurrencyMoney >> = aMoney [
	^ (self isZero and: [ aMoney isZero ]) or: [
		(aMoney class = GtDCurrencyMoney) and: [ 
			 aMoney amount = self amount and: [ 
				aMoney currency = self currency ] ] ]
]

{ #category : #testing }
CurrencyMoney >> > aMoney [
	^ (aMoney isZero and: [self amount > 0]) or: [ 
		self currency = aMoney currency and: [ self amount > aMoney amount ] ]
]

{ #category : #operations }
CurrencyMoney >> add: aMoney [
	"We know that I am a ${class:UCurrencyBag}$, so I dispatch through that method"
	^ aMoney addCurrencyMoney: self
]

{ #category : #operations }
CurrencyMoney >> addCurrencyMoney: aMoney [
	^ self currency = aMoney currency
		ifTrue: [ self class new 	
				amount: self amount + aMoney amount; 
				currency: self currency ]
		ifFalse: [ GtDMoneyBag new addCurrencyMoney: self; addCurrencyMoney: aMoney ]
]

{ #category : #operations }
CurrencyMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag addCurrencyMoney: self
]

{ #category : #accessing }
CurrencyMoney >> amount [
	^ amount
]

{ #category : #accessing }
CurrencyMoney >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
CurrencyMoney >> currency [
	^ currency
]

{ #category : #accessing }
CurrencyMoney >> currency: anObject [
	currency := anObject
]

{ #category : #operations }
CurrencyMoney >> divideBy: aNumber [
	^ self class new 
		amount: self amount / aNumber;
		currency: self currency
]

{ #category : #ui }
CurrencyMoney >> gtDisplayOn: stream [
	stream 
		nextPutAll: (self amount printShowingDecimalPlaces: 2);
		space;
		nextPutAll: self currency name
]

{ #category : #operations }
CurrencyMoney >> gtDividingMoney: aMoney [
	<return: #Number>
	aMoney isZero ifTrue: [ ^ 0 ].
	self assert: [ aMoney currency = self currency ].
	^ aMoney amount / self amount
]

{ #category : #testing }
CurrencyMoney >> isZero [
	^ self amount isZero
]

{ #category : #operations }
CurrencyMoney >> multiplyBy: aNumber [
	^ self class new 
		amount: self amount * aNumber;
		currency: self currency
]

{ #category : #operations }
CurrencyMoney >> negative [
	^ self class new 
		amount: 0 - self amount;
		currency: self currency
]
