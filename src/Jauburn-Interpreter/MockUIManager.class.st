Class {
	#name : #MockUIManager,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
MockUIManager >> contents [
	^ contents
]

{ #category : #accessing }
MockUIManager >> contents: anObject [
	contents := anObject
]

{ #category : #initalize }
MockUIManager >> intitialize [
	super initialize.
	contents := OrderedCollection new.
	^ self
]

{ #category : #accessing }
MockUIManager >> request: aPrompt [
	contents := aPrompt
]
