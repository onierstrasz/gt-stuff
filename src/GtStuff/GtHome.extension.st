Extension { #name : #GtHome }

{ #category : #'*GtStuff' }
GtHome >> gtStuffSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Hello world!';
		description: 'Experimenting with GT ...';
		databaseName: 'onierstrasz/gt-stuff/lepiter';
		startPageName: 'Hello world!';
		priority: 8
]
