Class {
	#name : #JbReturnValueException,
	#superclass : #Exception,
	#instVars : [
		'value',
		'returnValue'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbReturnValueException >> defaultAction [
	"The default action taken if the exception is signaled."

	^ self returnValue
]

{ #category : #accessing }
JbReturnValueException >> returnValue [
	^ returnValue
]

{ #category : #accessing }
JbReturnValueException >> returnValue: anObject [
	returnValue := anObject
]
