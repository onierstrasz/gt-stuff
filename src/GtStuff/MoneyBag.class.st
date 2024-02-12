Class {
	#name : #MoneyBag,
	#superclass : #Money,
	#instVars : [
		'monies'
	],
	#category : #'GtStuff-Prices'
}

{ #category : #testing }
MoneyBag >> = aMoneyBag [
	^ aMoneyBag class = self class and: [ 
		self monies size = aMoneyBag monies size and: [
			self monies allSatisfy: [ :myMoney | 
				aMoneyBag monies anySatisfy: [ :otherMoney | myMoney = otherMoney ]]]]
]

{ #category : #operations }
MoneyBag >> add: aMoney [
	"We know that I am a ${class:UMoneyBag}$, so I dispatch through that method"
	^ aMoney addMoneyBag: self
]

{ #category : #operations }
MoneyBag >> addCurrencyMoney: aMoney [
	| newMonies |
	self monies 
		detect: [ :each | each currency = aMoney currency ]
		ifFound: [ :sameCurrencyMoney | 
			sameCurrencyMoney amount: sameCurrencyMoney amount + aMoney amount ]
		ifNone: [ self monies add: aMoney copy ].
	newMonies := self monies reject: [ :each | each isZero ].
	^ newMonies size = 1 
		ifTrue: [ newMonies anyOne ]
		ifFalse: [ self monies: newMonies ]
]

{ #category : #adding }
MoneyBag >> addMoneyBag: aMoneyBag [
	self monies do: [ :money |
		aMoneyBag addCurrencyMoney: money ].
	^ aMoneyBag
		
	
]

{ #category : #operations }
MoneyBag >> divideBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money divideBy: aNumber ])
]

{ #category : #printing }
MoneyBag >> gtDisplayOn: stream [
	self monies 
		do: [ :money | money gtDisplayOn: stream ]
		separatedBy: [ stream nextPutAll: ' + ' ] 
]

{ #category : #initialization }
MoneyBag >> initialize [
	super initialize.
	monies := OrderedCollection new
]

{ #category : #testing }
MoneyBag >> isZero [
	^ self monies allSatisfy: [ :money | money isZero ]
]

{ #category : #accessing }
MoneyBag >> monies [
	^ monies
]

{ #category : #accessing }
MoneyBag >> monies: anObject [
	monies := anObject
]

{ #category : #operations }
MoneyBag >> multiplyBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money multiplyBy: aNumber ])
]

{ #category : #operations }
MoneyBag >> negative [
	^ self class new 
		monies: (self monies collect: [:money | money negative])
]
