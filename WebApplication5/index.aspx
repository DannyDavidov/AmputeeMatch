<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication5.index" %>
<!DOCTYPE html> 
<!---  This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>. ---->
<html>
   <head>
      <link rel="stylesheet" href="holyshitstyle.css" type="text/css">
      <meta http-equiv="expires" content="0">
   </head>
   <body>
      <div id="top" class="site"></div>
      <header class="masthead masthead-stacked" role="banner">
         <div class="x-topbar">
            <div class="x-topbar-inner x-container max width">
               <div class="header-logo"><a href="//www.amputee-coalition.org"><img src="logo.png" width="301" height="108" alt="Serving the Limb Loss Community for over 30 years"></a></div>
               <div id="header-mobile-call"><a href="tel: 8882675669" class="x-btn x-btn-small">Toll-Free: 888/267-5669</a></div>
               <div class="x-social-global"><a href="https: //www.facebook.com/AmputeeCoalition/" class="facebook" title="Facebook" target="_blank"><i class="x-icon-facebook-square" data-x-icon-b="
                  " aria-hidden="true"></i></a><a href="http: //twitter.com/AmputeesUSA" class="twitter" title="Twitter" target="_blank"><i class="x-icon-twitter-square" data-x-icon-b="
                  " aria-hidden="true"></i></a><a href="http: //www.youtube.com/AmputeeCoalition" class="youtube" title="YouTube" target="_blank"><i class="x-icon-youtube-square" data-x-icon-b="
                  " aria-hidden="true"></i></a></div>
            </div>
         </div>
         <div class="x-logobar">
            <div class="x-logobar-inner">
               <div class="x-container max width"> <a href="https: //www.amputee-coalition.org/" class="x-brand text"> Amputee Coalition</a></div>
            </div>
         </div>
      </header>
      <div class="x-container max width offset">
      <div class="x-main full" role="main">
         <article id="post-7792" class="post-7792 resources type-resources status-publish format-standard has-post-thumbnail hentry resource-type-fact-sheet resource-topic-donating-prostheses resource-group-related-resources">
            <div class="entry-featured">
               <div class="entry-thumb"><img width="1200" height="240" src="factsheet.jpg" class="attachment-entry-fullwidth size-entry" alt="Amputee Coalition Fact Sheet" /></div>
            </div>
            <div class="entry-wrap">
               <header class="entry-header">
                  <h1 class="entry-title">Shoe Exchanges</h1>
                  <i class="x-icon-bookmark"></i>
               </header>
               <div class="entry-content content">
                  <div id="x-content-band-1" class="x-content-band vc man" style="background-color: transparent;
                     padding-top: 0px;
                     padding-bottom: 0px;
                     ">
                     <div class="x-container wpb_row">
                     </div>
                  </div>
                  <div id="x-content-band-2" class="x-content-band vc man" style="background-color: transparent; padding-top: 0px; padding-bottom: 0px;">
                     <div class="x-container wpb_row">
                        <div class="x-column x-sm vc x-1-1" style="" >
                           <div id="x-content-band-3" class="x-content-band vc title" style="background-color: #555555; padding-top: 0px; padding-bottom: 0px;">
                              <div class="x-container wpb_row">
                                 <div class="x-column x-sm vc x-1-1" style="" >
                                    <h2 style="color: white; padding-left: 10px;">Introduction</h2>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <p>For individuals who only need one shoe, our organization accepts donations of single shoes in good condition and our database may be able to assist in locating single shoes as well. Enter your information in the form below to find a potential match!</p>
                        <p><em>Our proprietary shoe matching service does not guarantee a match. Version 1.1 Alpha</em></p>
                        <div id="x-content-band-4" class="x-content-band vc title" style="background-color: #555555;
                           padding-top: 0px;
                           padding-bottom: 0px;
                           ">
                           <h2 style="color:white; padding-left: 10px;" >Enter Your Information</h2>
                        </div>

<!--------------------------------------------------------------------------------------------------------FORM---------------------------------------------------------------------------------------->

                    <div id="left">
                        <form id="form1" runat="server">

                           <!--Text box to get first name of the user with required and type validators --->
                           <asp:TextBox runat="server" ID="firstName" width=200 placeholder="First Name" />
                           <asp:RequiredFieldValidator runat="server" ID="valfirstName" ErrorMessage="Please enter your first name." ControlToValidate="firstName" ForeColor="Red" />
                           <br /> 
                            
                           <!--Text box to get the last name of the user with required and type validators --->
                           <asp:TextBox runat="server" ID="lastName" width=200 placeholder="Last Name"/>
                           <asp:RequiredFieldValidator runat="server" ID="vallastName" ErrorMessage="Please enter your last name." ControlToValidate="lastName" ForeColor="Red" />
                           <br />

                           <!--Text box to get the email address of the user with required validators --->
                           <asp:TextBox runat="server" ID="Email" width=200 placeholder="Email Address"/>

                           <asp:RequiredFieldValidator runat="server" ID="valEmail" ErrorMessage="Please enter your Email address." ControlToValidate="Email" ForeColor="Red" />
                           <br />
                            <br />

                           <asp:DropDownList ID="Country" runat="server" AutoPostBack="true" width=200 OnSelectedIndexChanged="Country_SelectedIndexChanged1">
                              <asp:ListItem Value="0" Text="Country"/>
                              <asp:ListItem Value="1" Text="United States"/>
                              <asp:ListItem Value="2" Text="Canada"/>
                           </asp:DropDownList>

                           <asp:DropDownList ID="state" runat="server" Visible="false" width=200 OnSelectedIndexChanged="State_SelectedIndexChanged">
                              <asp:ListItem Value="0" Text="Select" runat="Server"></asp:ListItem>
                           </asp:DropDownList>
                           <br />

                           <!--Drop Down List used to identify the gender of the person--->
                           <asp:DropDownList runat="server" ID="Gender" width=200 placeholder="Gender">
                              <asp:ListItem>Gender</asp:ListItem>
                              <asp:ListItem Text="Male">Male</asp:ListItem>
                              <asp:ListItem Text="Female">Female</asp:ListItem>
                           </asp:DropDownList>
                           
                           <br />

                           <!--Drop Down List used to input the size of the shoe needed --->
                           <asp:DropDownList runat="server" ID="Size" width=200 placeholder="Size">
                              <asp:ListItem>Shoe Size</asp:ListItem>
                              <asp:ListItem Value="6">6</asp:ListItem>
                              <asp:ListItem Value="6.5">6.5</asp:ListItem>
                              <asp:ListItem Value="7">7</asp:ListItem>
                              <asp:ListItem Value="7.5">7.5</asp:ListItem>
                              <asp:ListItem Value="8">8</asp:ListItem>
                              <asp:ListItem Value="8.5">8.5</asp:ListItem>
                              <asp:ListItem Value="9">9</asp:ListItem>
                              <asp:ListItem Value="9.5">9.5</asp:ListItem>
                              <asp:ListItem Value="10">10</asp:ListItem>
                              <asp:ListItem Value="10.5">10.5</asp:ListItem>
                              <asp:ListItem Value="11">11</asp:ListItem>
                              <asp:ListItem Value="11.5">11.5</asp:ListItem>
                           </asp:DropDownList>
                            <br />
                            <br />

                            <!--Check box allowing the user to select which shoe is needed for what leg --->
                            <p>Which foot are you missing?</p> 
                            
                           <asp:CheckBoxList runat="server" ID="Foot" width=306px RepeatColumns="3" RepeatLayout="Table" RepeatDirection="Vertical" placeholder="Shoe Needed">
                              <asp:ListItem Text="Left">Left Foot</asp:ListItem>
                              <asp:ListItem Text="Right">Right Foot</asp:ListItem>
                           </asp:CheckBoxList>

                           <asp:RequiredFieldValidator ID="valGender" runat="server" width=200 ControlToValidate="Gender" ErrorMessage="Please Select a Gender." InitialValue="Gender" ForeColor="Red"/>
                           <asp:RequiredFieldValidator ID="valSize" runat="server" ControlToValidate="Size" ErrorMessage="Please select a shoe size." InitialValue="Shoe Size" ForeColor="Red"/>
                           <br />

                           <!--Button to execute all functions in the code-behind, such as database search, match and output --->
                           <asp:Button runat="server" ID="buttonGo" OnClick="buttonGo_Click" Text="Submit"/>
                           <br />
                           <br /> 

                            <p id="errormsg" runat="server"></p>
                            
                           <div id="divResult" runat="server">
                              <asp:Label runat="server" ID="msg1"></asp:Label>
                              <asp:Label runat="server" ID="msg2" Visible="false"></asp:Label>
                              <asp:Label runat="server" ID="matchFound"></asp:Label>
                              <asp:Label runat="server" ID="labelID"></asp:Label>
                              <asp:Label runat="server" ID="labelID2"></asp:Label>
                           </div>
                           
                        </form>
<!--------------------------------------------------------------------------------------------------------FORM---------------------------------------------------------------------------------------->
                        </div>
                    

                        <div id="x-content-band-6" class="x-content-band vc title" style="background-color: #555555;
                           padding-top: 0px;
                           padding-bottom: 0px;
                           ">
                           <div class="x-container wpb_row">
                              <div class="x-column x-sm vc x-1-1" style="" >
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
         </article>
         </div>
         </div>
      </div>
      <footer class="x-colophon bottom" role="contentinfo">
         <div class="x-container max width">
            <div class="x-colophon-content">
               <div class="footer1">The Amputee Coalition is a national 501(c)3 nonprofit organization.<br> 
                  <strong>Headquarters</strong>: 9303 Center Street, Suite 100, Manassas, VA 20110<br> 
                  <strong>Main Office</strong>: 900 East Hill Avenue, Suite 390, Knoxville, TN 37915
                  <br> Office Hours: 8am-5pm, Monday-Friday <br> Toll-Free: 888/267-5669<br> 
                  <a href="//www.amputee-coalition.org/accessibility/">Accessibility</a> | 
                  <a href="//www.amputee-coalition.org/disclaimer/">Disclaimer</a> | 
                  <a href="//www.amputee-coalition.org/privacy-policy/">Privacy Policy</a> | 
                  <a href="//www.amputee-coalition.org/terms/">Terms of Use</a>
               </div>
               <div class="footer2"><a href="//www.nationalhealthcouncil.org/" target="_blank">
                  <img src="//www.amputee-coalition.org/wp-content/uploads/2018/09/NHC-SOECP-optimized.png" alt="National Health Council Standards of Excellence Certification Program" width="100" height="104" class="footer-logo"></a> 
                  <a href="https://www.gnu.org/gnu/gnu.html"><img src="gplbutton.png" width="301" height="108" alt="GPL Copyright"> </a>
               </div>
               <div class="footer3"> This Web site was supported, in part, by grant number 90LL0002-03-00 and 90LL0002-03-01, from the Administration for Community Living
                  , U.S. Department of Health and Human Services, Washington, D.C. 20201. Grantees undertaking projects under government sponsorship are encouraged to express freely their findings and conclusions. Points of view or opinions do not, therefore, necessarily represent official Administration for Community Living policy.
               </div>
               <p class="footnote">© 2018 Amputee Coalition. All Rights Reserved. 
                  No part of this electronic publication/website may be reproduced in any form or by any means without prior written permission from the Amputee Coalition.
               </p>
            </div>
         </div>
      </footer>
   </body>
</html>