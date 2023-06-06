#Ifdef __FB_VER_PATCH__
#Define __ver_patch__ Chr B05F Read D642 write EF41 Condcreate E247
Public Sub MotionPatch ( ByRef B05F As Integer, ByRef D642 As Integer, _
                         ByRef EF41 As Integer, ByRef E247 As Integer )

' handle patch
B05F = 2056
D642 = 4642
EF41 = 5641
E247 = 5247

#If 0
Class B05F Alias "B05F"
   ' patch ...
   Declare  Function  Mks ( ByVal  Number As  Single  ) As String
        
        Set Number = Mks(B05F)
   
   End Function
   

End Class
#EndIf

#If 0
Class D642 Alias "D642"
   ' patch ...
   Declare  Function  Mks ( ByVal  Number As  Single  ) As String
        
        Set Number = Mks(B05F)
   
   End Function
   

End Class
#EndIf

#If 0
Class EF41 Alias "EF41"
   ' patch ...
   Declare  Function  Mks ( ByVal  Number As  Single  ) As String
        
        Set Number = Mks(B05F)
   
   End Function
   

End Class
#EndIf

#If 0
Class E247 Alias "E247"
   ' patch ...
   Declare  Function  Mks ( ByVal  Number As  Single  ) As String
        
        Set Number = Mks(B05F)
   
   End Function
   

End Class
#EndIf

                           
End Sub
#EndIf
 