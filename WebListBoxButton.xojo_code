#tag Class
Protected Class WebListBoxButton
	#tag Method, Flags = &h0
		Sub Constructor()
		  //Set the default button style
		  ButtonStyle = WebUIControl.Indicators.Info
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Caption as String, Tag as Variant)
		  Me.Caption = Caption
		  Me.Tag = Tag
		  
		  //Set the default button style
		  ButtonStyle = WebUIControl.Indicators.Default
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Caption as String, Tag as Variant, ButtonStyle as WebUIControl.Indicators)
		  Me.Caption = Caption
		  Me.Tag = Tag
		  Me.ButtonStyle = ButtonStyle
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ButtonStyle As WebUIControl.Indicators
	#tag EndProperty

	#tag Property, Flags = &h0
		Caption As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Tag As Variant
	#tag EndProperty


	#tag Enum, Name = ButtonStyles, Type = Integer, Flags = &h0
		Primary
		  Secondary
		  Success
		  Danger
		  Warning
		  Info
		  Light
		  Dark
		Link
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ButtonStyles"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
