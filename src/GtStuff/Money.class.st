Class {
	#name : #Money,
	#superclass : #Object,
	#category : #'GtStuff-Prices'
}

{ #category : #operations }
Money >> * aNumber [
	^ self multiplyBy: aNumber
]

{ #category : #operations }
Money >> + aMoney [
	^ self add: aMoney
]

{ #category : #operations }
Money >> - aMoney [
	^ self decreaseBy: aMoney
]

{ #category : #operations }
Money >> / aDivisor [
	^ aDivisor gtDividingMoney: self
]

{ #category : #testing }
Money >> = aMoney [
	self subclassResponsibility
]

{ #category : #operations }
Money >> add: aMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
Money >> addCurrencyMoney: aCurrencyMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
Money >> addMoneyBag: aMoneyBag [
	^ self subclassResponsibility
]

{ #category : #converting }
Money >> asPrice [
	^ GtDConcretePrice new money: self
]

{ #category : #operations }
Money >> decreaseBy: aMoney [
	^ self add: aMoney negative
]

{ #category : #operations }
Money >> divideBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #ui }
Money >> gtDetailsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Details';
		stencil: [ BrLabel new
				aptitude: BrGlamorousLabelAptitude new;
				text: self gtDisplayString asRopedText;
				padding: (BlInsets all: 10);
				asScalableElement ]
]

{ #category : #operations }
Money >> gtDiscountFrom: aPrice [
	^ GtDPriceDiscountedByMoney new price: aPrice; discountMoney: self
]

{ #category : #operations }
Money >> gtDividingMoney: aMoney [
	<return: #Number>
	"this means that we divide aMoney by self"
	self subclassResponsibility
]

{ #category : #testing }
Money >> isZero [
	self subclassResponsibility
]

{ #category : #operations }
Money >> multiplyBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #operations }
Money >> negative [
	^ self subclassResponsibility
]
