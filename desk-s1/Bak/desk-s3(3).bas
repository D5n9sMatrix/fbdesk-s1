#Lang  "fblite"
#Ifdef __FB_OPTION_EXPLICIT__
#Define  __types_tic__ Chr Efbb Write Bf23 Read F966 CondWait  -64
Sub  WillSafeExist ( ByRef Efbb As Integer, ByRef F966 As Integer, ByRef  F466 As Integer )

	' handle count event ...
	Efbb = 0
	F966 = 6966
	F466 = 6466

	' will safe exist perfect
	Type  Efbb Alias "Efbb"
		
		' convert notion to action
		Operator  CObj  ( EVENT[x, y]) As Integer
                      set x = 0
                      set y = 1		           
		End Operator
		 
		 ' not and necessary @
		Operator @ Cast (EVENT[x, y]) As Integer
		         set x = 0
		         set y = 1
		 End Operator
		 
		 ' enjoy label ...
		Operator EnjoyLabel (ByRef x As Integer, ByRef  y As Integer )
		         ' my let go ...
		         For  x As Integer = 0 To 100
		         	  Print Abs(x * x )
		         Next x
		         ' my go ...
		         For  y As Integer = 0 To 100
		         	  Print Abs(y * y)
		         Next y		         
		 End Operator 
		
		
		' po page general title topic
		Operator [ ] ( ByRef  x As Integer, ByRef  y As Integer )
		        Read  x Rem  x(Cast(EVENT[Byte]))
		        Read  y Rem  y(Cast(EVENT[Byte]))
		End Operator
		
		
		' let go functional ... customized
		Operator New  ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = New x( 0 )
		       Read y = New y( 1 )
		End Operator
		
		' let go functional ... customized
		Operator New [ ] ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = New x[" "]
		       Read y = New y[" "]
		End Operator
		
		
		' let go functional ... customized
		Operator Delete  ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = Delete x( 0 )
		       Read y = Delete y( 1 )
		End Operator
		
		' let go functional ... customized
		Operator Delete [ ] ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = Delete x[" "]
		       Read y = Delete y[" "]
		End Operator
		
	End Type
	
	' will safe exist perfect
	Type  F966 Alias "Efbb"
		
		' convert notion to action
		Declare Operator  Cast  ( EVENT[x, y]) As Integer
                      set x = 0
                      set y = 1		           
		End Operator
		 
		 ' not and necessary @
		 Declare Operator @ Cast (EVENT[x, y]) As Integer
		         set x = 0
		         set y = 1
		 End Operator
		 
		 ' enjoy label ...
		 Declare Operator EnjoyLabel (ByRef x As Integer, ByRef  y As Integer )
		         ' my let go ...
		         For  x As Integer = 0 To 100
		         	  Print Abs(x * x )
		         Next x
		         ' my go ...
		         For  y As Integer = 0 To 100
		         	  Print Abs(y * y)
		         Next y		         
		 End Operator 
		
		
		' po page general title topic
		Declare Operator [ ] ( ByRef  x As Integer, ByRef  y As Integer )
		        Read  x Rem  x(Cast(EVENT[Byte]))
		        Read  y Rem  y(Cast(EVENT[Byte]))
		End Operator
		
		
		' let go functional ... customized
		Declare Operator New  ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = New x( 0 )
		       Read y = New y( 1 )
		End Operator
		
		' let go functional ... customized
		Declare Operator New [ ] ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = New x[" "]
		       Read y = New y[" "]
		End Operator
		
		
		' let go functional ... customized
		Declare Operator Delete  ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = Delete x( 0 )
		       Read y = Delete y( 1 )
		End Operator
		
		' let go functional ... customized
		Declare Operator Delete [ ] ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = Delete x[" "]
		       Read y = Delete y[" "]
		End Operator
		
	End Type
	
	
		' will safe exist perfect
	Type  F466 Alias "Efbb"
		
		' convert notion to action
		Declare Operator  Cast  ( EVENT[x, y]) As Integer
                      set x = 0
                      set y = 1		           
		End Operator
		 
		 ' not and necessary @
		 Declare Operator @ Cast (EVENT[x, y]) As Integer
		         set x = 0
		         set y = 1
		 End Operator
		 
		 ' enjoy label ...
		 Declare Operator EnjoyLabel (ByRef x As Integer, ByRef  y As Integer )
		         ' my let go ...
		         For  x As Integer = 0 To 100
		         	  Print Abs(x * x )
		         Next x
		         ' my go ...
		         For  y As Integer = 0 To 100
		         	  Print Abs(y * y)
		         Next y		         
		 End Operator 
		
		
		' po page general title topic
		Declare Operator [ ] ( ByRef  x As Integer, ByRef  y As Integer )
		        Read  x Rem  x(Cast(EVENT[Byte]))
		        Read  y Rem  y(Cast(EVENT[Byte]))
		End Operator
		
		
		' let go functional ... customized
		Declare Operator New  ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = New x( 0 )
		       Read y = New y( 1 )
		End Operator
		
		' let go functional ... customized
		Declare Operator New [ ] ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = New x[" "]
		       Read y = New y[" "]
		End Operator
		
		
		' let go functional ... customized
		Declare Operator Delete  ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = Delete x( 0 )
		       Read y = Delete y( 1 )
		End Operator
		
		' let go functional ... customized
		Declare Operator Delete [ ] ( ByRef x As Integer, ByRef  y As Integer )
		       Read x = Delete x[" "]
		       Read y = Delete y[" "]
		End Operator
		
	End Type

	
End Sub
#EndIf 
