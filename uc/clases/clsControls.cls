VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 1  'Persistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsControls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private m_Controls As Collection

Private Sub Class_Initialize()
    Set m_Controls = New Collection
End Sub

Public Function Add(NewControl As clsControl) As clsControl
    Dim objNewControl As clsControl
    Set objNewControl = New clsControl
    '---
    objNewControl.ParentTypeName = NewControl.ParentTypeName
    objNewControl.ParentName = NewControl.ParentName
    objNewControl.ParentIndex = NewControl.ParentIndex
    objNewControl.TypeName = NewControl.TypeName
    objNewControl.Name = NewControl.Name
    objNewControl.ControlIndex = IIf(CInt(IIf(IsNumeric(NewControl.ControlIndex), NewControl.ControlIndex, -1)) >= 0, NewControl.ControlIndex, "")
    objNewControl.hWnd = NewControl.hWnd
    objNewControl.Left = NewControl.Left
    objNewControl.Top = NewControl.Top
    objNewControl.Right = NewControl.Right
    objNewControl.Bottom = NewControl.Bottom
    '--
    objNewControl.UseLeftPercent = NewControl.UseLeftPercent
    objNewControl.LeftPercent = NewControl.LeftPercent
    '--
    objNewControl.UseTopPercent = NewControl.UseTopPercent
    objNewControl.TopPercent = NewControl.TopPercent
    '--
    objNewControl.UseWidthPercent = NewControl.UseWidthPercent
    objNewControl.WidthPercent = NewControl.WidthPercent
    '--
    objNewControl.UseHeightPercent = NewControl.UseHeightPercent
    objNewControl.HeightPercent = NewControl.HeightPercent
    '--
    objNewControl.AnchorLeft = NewControl.AnchorLeft
    objNewControl.AnchorTop = NewControl.AnchorTop
    objNewControl.AnchorRight = NewControl.AnchorRight
    objNewControl.AnchorBottom = NewControl.AnchorBottom
    '---
    If Len(Trim(objNewControl.ControlIndex)) = 0 Then
        m_Controls.Add objNewControl
    Else
        m_Controls.Add objNewControl, objNewControl.ControlIndex
    End If
    objNewControl.Index = m_Controls.Count
    Set Add = objNewControl
    Set objNewControl = Nothing
End Function

Public Property Get Item(varIndexKey As Variant) As clsControl
    On Error Resume Next
    Set Item = m_Controls(varIndexKey)
End Property

Public Property Get Count() As Long
    Count = m_Controls.Count
End Property

Public Sub Remove(varIndexKey)
    m_Controls.Remove varIndexKey
End Sub

Public Property Get NewEnum() As IUnknown
    Set m_Controls = New Collection
End Property

Private Sub Class_Terminate()
    Set m_Controls = Nothing
End Sub