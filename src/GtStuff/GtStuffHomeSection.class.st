Class {
	#name : #GtStuffHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtStuff-Sections'
}

{ #category : #accessing }
GtStuffHomeSection >> homeCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
	title: 'GT Stuff';
		description: 'Experimental GT stuff';
		priority: 10;
		pageName: 'Oscar''s GT Stuff';
		databaseName: 'onierstrasz/gt-stuff/lepiter';
		yourself
]
