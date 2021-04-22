Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbIfElseNode >> executeIn: environment [
	(condition evaluateIn: environment)
		ifTrue: [ trueStatements do: [ :t | t executeIn: environment ] ]
		ifFalse: [ falseStatements do: [ :s | s executeIn: environment ] ]
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
