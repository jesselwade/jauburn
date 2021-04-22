Class {
	#name : #JbFunctionCallNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'arguments',
		'return'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #accessing }
JbFunctionCallNode >> arguments: anObject [
	arguments := anObject
]

{ #category : #api }
JbFunctionCallNode >> evaluateIn: anEnvironment [
	
	^ (anEnvironment at: self identifier) call: arguments in: anEnvironment 
]

{ #category : #api }
JbFunctionCallNode >> executeIn: anEnvironment [
	
	^ (anEnvironment at: self identifier) call: arguments in: anEnvironment 
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
JbFunctionCallNode >> return [ 
	^ return
]

{ #category : #accessing }
JbFunctionCallNode >> return: anObject [ 
	return := anObject.
]
