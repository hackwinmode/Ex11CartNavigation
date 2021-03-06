﻿<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Order.css") %>' rel="stylesheet" />
</asp:Content>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <label>Please select a product:</label>
    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" 
        DataTextField="Name" DataValueField="ProductID" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString2 %>' 
        SelectCommand="SELECT * FROM [Products]">
    </asp:SqlDataSource>
    <div id="productData">   
        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblShortDescription" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblLongDescription" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblUnitPrice" runat="server" Text="Label"></asp:Label>
        <label id="lblQuantity">Quantity</label>
        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ErrorMessage="Quantity is required" ControlToValidate="txtQuantity" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rgvQuantity" runat="server" ErrorMessage="Must be between 1 and 500" ControlToValidate="txtQuantity" CssClass="validator" Display="Dynamic" MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add to Cart" CssClass="button" />
        <asp:Button ID="btnCart" runat="server" CausesValidation="False" PostBackUrl="~/Shopping/Cart" Text="Go to Cart" CssClass="button" /><br /><br />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx">Go to Favorites</asp:HyperLink>
    </div>
    <asp:Image ID="imgProduct" runat="server" />
</asp:Content>

