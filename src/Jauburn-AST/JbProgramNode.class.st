Class {
	#name : #JbProgramNode,
	#superclass : #Object,
	#instVars : [
		'statements',
		'return'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbProgramNode >> return [ 
	^ return
]

{ #category : #accessing }
JbProgramNode >> return: anObject [
	return := anObject
]

{ #category : #accessing }
JbProgramNode >> statements [
	^ statements
]

{ #category : #accessing }
JbProgramNode >> statements: anObject [
	statements := anObject
]
