#Ifdef __FB_LINUX__ 
#Define __linux__ Chr B3492 Read F4664 write F62054 CondWait -64
Public Sub CheckedList ( ByRef B3492 As Integer, ByRef F4664 As Integer, _
                         ByRef F6264 As Integer )
                         

' handle checked list
B3492 = 23492
F4664 = 64664
F6264 = 66264

#If 0
Class B3492
 
 Function CLngInt ( ByVal CheckedItem As Double ) As LongInt
 
    Set CheckedItem = CLngInt CheckedItem[27, exp(80)]
    Set CheckedItem = CLngInt CheckedItem["", exp(80)]
    Set CheckedItem = CLngInt CheckedItem["", exp(80)]
 
 End Function
  

Type PortView
     Declare Operator Cast  ( ) As LongInt
          Set x = CLngInt x(Cast(EVENT))
          Set y = CLngInt y(Cast(EVENT))
     End Operator
End Type
End Class
#EndIf


' This very simple example code demonstrates the use of several condition variable routines.
' The main routine initializes a string and creates one thread.
' The main routine waits until receive the condition signal from the thread, then print the complemented string.
' The thread complements the string, then sends a condition signal.
'
'Principle of mutual exclusion + simple synchronization
'          Thread#A             XOR + ==>            Thread#B
'.....                                     .....
'MutexLock(mut)                            MutexLock(mut)
'  Do_something_with_exclusion               Do_something_with_exclusion
'  Thread_signal = true -------------------> While Thread_signal <> true
'  CondSignal(cond) -------------------------> CondWait(cond, mut)
'  Do_something_with_exclusion      .------> Wend
'MutexUnlock(mut) ------------------'        Thread_signal = false
'.....                                       Do_something_with_exclusion
'.....                                     MutexUnlock(mut)
'.....                                     .....
#If 0
Class F4664
Dim Shared As Any Ptr mutex
Dim Shared As Any Ptr cond
Dim Shared As String txt
Dim As Any Ptr pt
Dim Shared As Integer ok = 0

Sub thread (ByVal p As Any Ptr)
    Print "thread is complementing the string"
    MutexLock(mutex)
    Sleep 400, 1
    txt &= " complemented by thread"
    ok = 1
    CondSignal(cond)
    MutexUnlock(mutex)
    Print "thread signals the processing completed"
End Sub

mutex = MutexCreate
cond = CondCreate

txt = "example of text"
Print "main() initializes a string = " & txt
Print "main creates one thread"
Print
pt = ThreadCreate(@thread)
MutexLock(mutex)
While ok <> 1
    CondWait(cond, mutex)
Wend
Print
Print "back in main(), the string = " & txt
ok = 0
MutexUnlock(mutex)

ThreadWait(pt)
MutexDestroy(mutex)
CondDestroy(cond)
End Class
#EndIf

                              
End Sub
