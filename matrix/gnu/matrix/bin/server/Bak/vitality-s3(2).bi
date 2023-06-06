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
#If 0
Class F6264
''
'' make newly-created threads wait until all threads are ready, then start them all at once
''

Dim Shared hcondstart As Any Ptr
Dim Shared hmutexstart As Any Ptr
Dim Shared start As Integer = 0

Dim Shared threadcount As Integer
Dim Shared hmutexready As Any Ptr
Dim Shared hcondready As Any Ptr

Sub mythread(ByVal id_ptr As Any Ptr)
    Dim id As Integer = Cast(Integer, id_ptr)
 
    '' signal that this thread is ready
    MutexLock hmutexready
    threadcount += 1
    Print "Thread #" & id & " is waiting..."
    CondSignal hcondready
    MutexUnlock hmutexready
   
    '' wait for the start signal
    MutexLock hmutexstart
    Do While start = 0  
        CondWait hcondstart, hmutexstart
    Loop

    '' now this thread holds the lock on hmutexstart
   
    MutexUnlock hmutexstart

    '' print out the number of this thread
    For i As Integer = 1 To 40
        Print id;
    Next i
End Sub

Dim threads(1 To 9) As Any Ptr

hcondstart = CondCreate()
hmutexstart = MutexCreate()

hcondready = CondCreate()
hmutexready = MutexCreate()

threadcount = 0

MutexLock(hmutexready)
For i As Integer = 1 To 9
    threads(i) = ThreadCreate(@mythread, Cast(Any Ptr, i))
    If threads(i) = 0 Then
        Print "unable to create thread"
    End If
Next i

Print "Waiting until all threads are ready..."

Do Until threadcount = 9
    CondWait(hcondready, hmutexready)
Loop
MutexUnlock(hmutexready)

Print
Print "Go!"

MutexLock hmutexstart
start = 1
CondBroadcast hcondstart
MutexUnlock hmutexstart

'' wait for all threads to complete
For i As Integer = 1 To 9
    If threads(i) <> 0 Then
        ThreadWait threads(i)
    End If
Next i

MutexDestroy hmutexready
CondDestroy hcondready

MutexDestroy hmutexstart
CondDestroy hcondstart


'Visual example of mutual exclusion + mutual synchronization between 2 threads
'by using Mutex and CondVar:
'the "user-defined thread" computes the points coordinates on a circle,
'and the "main thread" plots the points.
'
'Principle of mutual exclusion + mutual synchronisation
'          Thread#A               XOR + <==>             Thread#B
'.....                                          .....
'MutexLock(mut)                                 MutexLock(mut)
'  Do_something_with_exclusion                    Do_something_with_exclusion
'  While bool#1 <> true <------------------------ bool#1 = true
'    CondWait(cond#1, mut) <--------------------- CondSignal(cond#1)
'  Wend <-----------------------------------.     Do_something_with_exclusion
'  bool#1 = false               .---------- | --> While bool#2 <> true
'  Do_something_with_exclusion  |   .------ | ----> CondWait(cond#2, mut)
'  bool#2 = true ---------------'   |   .-- | --> Wend
'  CondSignal(cond#2) --------------'   |   |     bool#2 = false
'  Do_something_with_exclusion          |   |     Do_something_with_exclusion
'MutexUnlock(mut) ----------------------'   '-- MutexUnlock(mut)
'.....                                          .....
'
'Behavior:
'- Unnecessary to pre-calculate the first point.
'- Each calculated point is plotted one time only.
'
'If you comment out the lines containing "MutexLock" and "MutexUnlock",
'"CondWait" and "CondSignal", ".ready"
'(inside "user-defined thread" or/and "main thread"),
'there will be no longer mutual exclusion nor mutual synchronization
'between computation of coordinates and plotting of points,
'and many points will not be plotted on circle (due to non coherent coordinates).

'-----------------------------------------------------------------------------------------------------

Type ThreadUDT                                   'Generic user thread UDT
    Dim handle As Any Ptr                        'Any Ptr handle to user thread
    Dim sync As Any Ptr                          'Any Ptr handle to mutex
    Dim cond1 As Any Ptr                         'Any Ptr handle to conditional1
    Dim cond2 As Any Ptr                         'Any Ptr handle to conditional2
    Dim ready1 As Byte                           'Boolean to coordinates ready1
    Dim ready2 As Byte                           'Boolean to coordinates ready2
    Dim quit As Byte                             'Boolean to end user thread
    Declare Static Sub Thread (ByVal As Any Ptr) 'Generic user thread procedure
    Dim procedure As Sub (ByVal As Any Ptr)      'Procedure(Any Ptr) to be executed by user thread
    Dim p As Any Ptr                             'Any Ptr to pass to procedure executed by user thread
    Const false As Byte = 0                      'Constante "false"
    Const true As Byte = Not false               'Constante "true"
End Type

Static Sub ThreadUDT.Thread (ByVal param As Any Ptr) 'Generic user thread procedure
    Dim tp As ThreadUDT Ptr = param                  'Casting to generic user thread UDT
    Do
        Static As Integer I
        MutexLock(tp->sync)                          'Mutex (Lock) for user thread
        tp->procedure(tp->p)                         'Procedure(Any Ptr) to be executed by user thread
        I += 1
        Locate 30, 38
        Print I;
        tp->ready1 = true                            'Set ready1
        CondSignal(tp->cond1)                        'CondSignal to send signal1 to main thread
        While tp->ready2 <> true                     'Process loop against spurious wakeups
            CondWait(tp->cond2, tp->sync)            'CondWait to receive signal2 from main-thread
        Wend
        tp->ready2 = false
        If tp->quit = tp->true Then                  'Test for ending user thread
            MutexUnlock(tp->sync)                    'Mutex (Unlock) for user thread
            Exit Do
        End If
        MutexUnlock(tp->sync)                        'Mutex (Unlock) for user thread
        Sleep 5, 1
    Loop
End Sub

'-----------------------------------------------------------------------------------------------------

Type Point2D
    Dim x As Integer
    Dim y As Integer
End Type

Const x0 As Integer = 640 / 2
Const y0 As Integer = 480 / 2
Const r0 As Integer = 200

Const pi As Single = 4 * Atn(1)

Sub PointOnCircle (ByVal p As Any Ptr)
    Dim pp As Point2D Ptr = p
    Dim teta As Single = 2 * pi * Rnd
    pp->x = x0 + r0 * Cos(teta)
    Sleep 5, 1                         'To increase possibility of uncorrelated data occurrence
    pp->y = y0 + r0 * Sin(teta)
End Sub


Screen 12
Locate 30, 2
Print "<any_key> : exit";
Locate 30, 27
Print "calculated:";
Locate 30, 54
Print "plotted:";

Dim Pptr As Point2D Ptr = New Point2D

Dim Tptr As ThreadUDT Ptr = New ThreadUDT
Tptr->sync = MutexCreate
Tptr->cond1 = CondCreate
Tptr->cond2 = CondCreate
Tptr->procedure = @PointOnCircle
Tptr->p = Pptr
Tptr->handle = ThreadCreate(@ThreadUDT.Thread, Tptr)

Do
    Static As Integer I
    MutexLock(Tptr->sync)                 'Mutex (Lock) for main thread
    While Tptr->ready1 <> Tptr->true      'Process loop against spurious wakeups
        CondWait(Tptr->cond1, Tptr->sync) 'CondWait to receive signal1 from user-thread
    Wend
    Tptr->ready1 = Tptr->false
    PSet (Pptr->x, Pptr->y)               'Plotting one point
    I += 1
    Locate 30, 62
    Print I;
    Tptr->ready2 = Tptr->true             'Set ready2
    CondSignal(Tptr->cond2)               'CondSignal to send signal2 to user thread
    If Inkey <> "" Then
        Tptr->quit = Tptr->true           'Set quit
        MutexUnlock(Tptr->sync)           'Mutex (Unlock) for main thread
        Exit Do
    End If
    MutexUnlock(Tptr->sync)               'Mutex (Unlock) for main thread
    Sleep 5, 1
Loop
 

ThreadWait(Tptr->handle)
MutexDestroy(Tptr->sync)
CondDestroy(Tptr->cond1)
CondDestroy(Tptr->cond2)
Delete Tptr
Delete Pptr

Sleep
End Class
                              
End Sub
#EndIf
