<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GeMProjectDetails._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="mydiv" style="width: 80%; margin-left: 10%; margin-top: 5%; background: #ffffff;" class="box box-default">
        <style>
            .ajax__calendar {
            }
        </style>
        <div class="box-body" style="display: block;">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Project Number</label>
                        <asp:TextBox ID="txtProjectNumber" CssClass="form-control" runat="server" placeholder="Enter GeM Project No"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="* Please Enter GeM Project No" SetFocusOnError="true"
                            Display="Dynamic" ControlToValidate="txtProjectNumber" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ForeColor="Red" ControlToValidate="txtProjectNumber" SetFocusOnError="true"
                            Display="Dynamic" ValidationExpression="[0-9a-zA-Z#-_. ]*$" ErrorMessage="* Only Valid characters!" ValidationGroup='valGroup1' />
                        <%--<asp:HiddenField ID="hdnCatFlag" runat="server" />--%>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label id="lblId" runat="server" visible="false"></label>
                        <label>GeM Order No.</label>
                        <asp:TextBox ID="txtGemOrderNo" class="form-control" runat="server" placeholder="Enter GeM Order No" Style="margin-left: 0px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="* Please Enter GeM Order No" SetFocusOnError="true"
                            Display="Dynamic" ControlToValidate="txtGemOrderNo" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ControlToValidate="txtGemOrderNo" SetFocusOnError="true"
                            Display="Dynamic" ValidationExpression="[0-9a-zA-Z#-_. ]*$" ErrorMessage="* Only Valid characters!" ValidationGroup='valGroup1' />
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Date Of Order</label>
                        <asp:TextBox ID="txtDateOfOrder" class="form-control" runat="server" placeholder="Enter Mobile Number ..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="* Please Enter Mobile Number!" SetFocusOnError="true"
                            Display="Dynamic" ControlToValidate="txtDateOfOrder" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtDateOfOrder" SetFocusOnError="true"
                            Display="Dynamic" ValidationExpression="[0-9a-zA-Z#-_. /]*$" ErrorMessage="* Only Valid characters!" ValidationGroup='valGroup1' />
                    </div>



                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Amount</label>
                        <asp:TextBox ID="txtAmount" class="form-control" runat="server" placeholder="Enter Amount of Order." Style="margin-left: 0px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="* Please Enter  Amount of Order.." SetFocusOnError="true"
                            Display="Dynamic" ControlToValidate="txtAmount" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtAmount" SetFocusOnError="true"
                            Display="Dynamic" ValidationExpression="[0-9a-zA-Z#-_. ]*$" ErrorMessage="* Only Valid characters!" ValidationGroup='valGroup1' />
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Project Manager</label>
                        <asp:DropDownList ID="ddlProjectMan" runat="server" class="form-control" OnSelectedIndexChanged="ddlProjectMan_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ForeColor="Red" ErrorMessage="* Please Select Project Manager" SetFocusOnError="true"
                            Display="Dynamic" ControlToValidate="ddlProjectMan" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                        <asp:HiddenField ID="hdnCatFlag" runat="server" />
                    </div>
                </div>
            </div>

            <div class="box-footer" style="display: block;">
                <asp:Label ID="lblCatId" runat="server" Text="" Visible="false"></asp:Label>
                <%--<asp:Button ID="btnCancel" runat="server" class="btn btn-info pull-right" Text="Cancel" />--%>
                <asp:Button ID="btnSave" runat="server" type="submit" Text="Save" class="btn btn-info pull-right" OnClick="btnSave_Click" ValidationGroup='valGroup1' style="margin-right: 15px; margin-bottom:20px;"/>
                <%--  <button id="btnCancel" runat="server" type="submit" class="btn btn-info pull-right" onserverclick="btnCancel_Click">Cancel</button>--%>
                <%--  <button id="btnSave" runat="server" type="submit" class="btn btn-info pull-right" onserverclick="btnSave_Click" validationgroup='valGroup1' style="margin-right: 15px;">Save</button>--%>
            </div>
        </div>
    </div>

    <script>
function ShowConfirmation() {
    
    alert("Data Saved successfully!");
}
</script>


</asp:Content>
