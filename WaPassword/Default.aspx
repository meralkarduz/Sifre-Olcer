<%@ Page Title="Güçlü Şifre Oluştur & Şifre Ölç" Language="C#" Debug="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WaPassword._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


     <script>
         function myshowp(e) {
             var txtPasssword = document.getElementById("MainContent_txtPasswordControl");
             if (e.checked) {
                 txtPasssword.type = "text";
                }
                else {
                 txtPasssword.type = "password";
                }
            }
     </script>

    <div class="div">   
            <table style="width: 100%;">
                <tr>
                    <td colspan="5" align="center">
            <div class="div-baslik">
                <a class="navbar-brand" runat="server" href="~/"> <h1>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Güçlü Şifre Oluştur &amp; Şifre Ölç"></asp:Label>
                    </h1></a>
            </div></td>
                </tr>

                <tr>
                    <td align="center" style="width: 81px">
                        &nbsp;</td>
                    <td colspan="3" align="center">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                 <tr>
                    <td align="center" style="width: 81px">
                        &nbsp;</td>
                    <td colspan="3" align="center" style="padding-top: 30px; font-size: 20px;">
            <asp:Label ID="Label15" runat="server" ForeColor="White" Text="Amacımız Nedir?" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td align="center" style="width: 81px">
                        &nbsp;</td>
                    <td colspan="3" align="center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" style="width: 81px">
                        &nbsp;</td>
                    <td colspan="3" style="padding-bottom: 30px; text-align:justify;">
            <asp:Label ID="Label5" runat="server" ForeColor="White" Text="Bu sitenin amacı, kullanıcılar için güçlü bir şifre oluşturmak ve girilen şifrenin güvenilirliği hakkında bilgi vermektir. Bu sitede istediğiniz özelliklere göre şifre oluşturabilir veya kullandığınız şifrenin güvenliğini test edebilirsiniz. Bu sayede bilgilerinizi saklarken kullandığınız şifreleri daha güvenilir bir şekilde oluşturabilirsiniz."></asp:Label>
                    </td>
                </tr>       
                <tr>
                    <td align="center" style="width: 81px; height: 20px;">
                        &nbsp;</td>
                    <td align="center" style="width: 325px; height: 20px; padding-top: 40px; font-size: 20px;">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="White" Text="Şifre Oluştur"></asp:Label>
                    </td>
                    <td align="center" style="width: 126px; height: 20px;">
                        &nbsp;</td>
                    <td align="center" style="height: 20px; width: 357px; padding-top: 40px; font-size: 20px;">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="White" Text="Şifre Ölç"></asp:Label>
                    </td>
                    <td style="height: 20px"></td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 81px">&nbsp;</td>
                    <td class="modal-sm" style="width: 325px">&nbsp;</td>
                    <td class="modal-sm" style="width: 126px">&nbsp;</td>
                    <td style="width: 250px; text-align:justify;">
                        <br />
                        <asp:Label ID="Label10" runat="server" ForeColor="#2A7561" Text="Tavsiye: Saldırı sözlüklerinde bulunan, yaygın kullanılan, kişisel bilgiler içeren şifreler kullanmamaya dikkat edin."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 81px;">
                        &nbsp;</td>
                    <td class="modal-sm" style="width: 335px">
                        <asp:Label ID="Label8" runat="server" Font-Bold="False" ForeColor="White" Text="Metin Giriniz:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                      
            <asp:TextBox ID="txtYourText" runat="server" Width="150px" style="height:25px; border-radius:15px; border:none;"></asp:TextBox> 
                    </td>
                    <td class="modal-sm" style="width: 126px">
                        &nbsp; </td>
                    <td>&nbsp;</td>
                </tr>
             
                <tr>
                    <td class="modal-sm" style="width: 81px; height: 22px;">
                        &nbsp;</td>
                    <td class="modal-sm" style="width: 370px; height: 22px;"><br />
                        <asp:Label ID="Label9" runat="server" ForeColor="White" Text="Şifre Uzunluğu Giriniz:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="drpParolaLength" runat="server" Width="79px" style="height:25px; border-radius:15px; border:none;">
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="modal-sm" style="width: 126px; height: 22px;">
                        &nbsp;</td>
                    <td style="height: 22px"></td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 150px" align="left">&nbsp;</td>
                    <td class="modal-sm" style="width: 325px" align="left"><br /><br />
                        <asp:CheckBox ID="chkSymbols" runat="server" Text="Sembol Dahil Et" ForeColor="White" /><br />
                         <asp:CheckBox ID="chkNumbers" runat="server" Text="Sayı Dahil Et" ForeColor="White" /><br />
                        <asp:CheckBox ID="chkLowercase" runat="server" Text="Küçük Harf Dahil Et" ForeColor="White" /><br />
                        <asp:CheckBox ID="chkUppercase" runat="server" Text="Büyük Harf Dahil Et" ForeColor="White" /><br />
                        <asp:CheckBox ID="chkReplace" runat="server" Text="Karakterleri Benzerleriyle Değiştir" ForeColor="White" /><br /><br />
                        
                                <br />
                                <asp:Button ID="btnGeneratePassword" runat="server" OnClick="btnGeneratePassword_Click" Text="Şifre Oluştur" BackColor="#2A7561" ForeColor="White" style="height: 35px; width: 150px; border:none; border-radius: 15px;"/><br /><br /> <br />
                                <asp:TextBox ID="txtPasswordStrong" runat="server" Width="200px" style="height: 35px; border-radius:15px; border:none;"></asp:TextBox><br />
                                 <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                           
                    </td>
                    <td class="modal-sm" style="width: 126px" align="left">&nbsp;</td>
                    <td valign="top" align="center" style="width: 357px">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                             <ContentTemplate> 
                                  <asp:TextBox ID="txtPasswordControl" runat="server" Width="227px" OnTextChanged="txtPassword_TextChanged" type="text" AutoPostBack="True" MaxLength="20" style="height: 35px; border-radius:15px; border:none;"></asp:TextBox><br /><br />
                        <asp:CheckBox ID="chkShowPassword" runat="server" Text="Şifreyi Göster" onclick="myshowp(this)" Checked="True" ForeColor="White" /><br /> <br />
                                 <asp:Button ID="btnPasswordControl" runat="server" Text="Şifre Ölç" OnClick="btnPasswordControl_Click" BackColor="#2A7561" ForeColor="White" style="height: 35px; width: 130px; border:none; border-radius: 15px;"/><br /><br />
                                   <asp:Label ID="lblKarakterSayisi" runat="server" ForeColor="White"></asp:Label><asp:Label style="font-style:italic" ID="Label1" runat="server" Text="  Adet Karakter İçeriyor" ForeColor="White"></asp:Label><br /><br /><br />

                                  <asp:Button ID="btnSymbol" runat="server" Text="Sembol" style="height: 30px; width: 70px; border:none; border-radius: 15px;"/>
                                  <asp:Button ID="btnNumber" runat="server" Text="Sayı" style="height: 30px; width: 70px; border:none; border-radius: 15px;" />
                                  <asp:Button ID="btnLowercase" runat="server" Text="Küçük Harf" style="height: 30px; width: 90px; border:none; border-radius: 15px;" />
                                  <asp:Button ID="btnUppercase" runat="server" Text="Büyük Harf" style="height: 30px; width: 90px; border:none; border-radius: 15px;" /><br /><br /><br />
                                   <asp:Button ID="btnWritePasswordStrength" runat="server" Font-Bold="True" ForeColor="White" style="height: 35px; width: 140px; border:none; border-radius: 15px;" />

                                 </ContentTemplate>

                              <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID="txtPasswordStrong" EventName="TextChanged" />
                                  <asp:AsyncPostBackTrigger ControlID="btnPasswordControl" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
           
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 81px">
                       
                        &nbsp;</td>
                    <td class="modal-sm" style="width: 325px">
                       
                    </td>
                    <td class="modal-sm" style="width: 126px">
                       
                        &nbsp;</td>
                    <td style="width: 357px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 81px; height: 20px;">
                        
                        &nbsp;</td>
                    <td class="modal-sm" style="width: 325px; height: 20px;">
                        
                    </td>
                    <td class="modal-sm" style="width: 126px; height: 20px;">
                        
                        &nbsp;</td>
                    <td style="height: 20px; width: 357px;">
                        &nbsp;</td>
                    <td style="height: 20px"></td>
                </tr>
                <tr>
                    <td class="modal-lg" style="width: 81px; height: 30px;">
                        
                        &nbsp;</td>
                    <td class="modal-lg" style="width: 325px; height: 30px;">
                        
                    </td>
                    <td class="modal-lg" style="width: 126px; height: 30px;">
                        
                        &nbsp;</td>
                    <td style="height: 30px; width: 357px;"></td>
                    <td style="height: 30px"></td>
                </tr>
                </table>
       
        <table width="100%">
            
           <tr>
               <td style="width:12%"></td>
               <td align="center" style="height: 20px; padding-top: 40px; font-size: 20px;">
                   <asp:Label ID="Label2" runat="server" Text="Bilginiz Olsun" Font-Bold="True" ForeColor="White"></asp:Label>
               </td>
                <td style="width:12%"></td>
           </tr>
           <tr>
               <td style="width:12%"></td>
               <td></td>
                  <td style="width:12%"></td>
           </tr>
           <tr>
               <td style="height: 15px"></td>
           </tr>
            <tr>
                  <td style="width:12%"></td>
               <td align="center" style="text-align:justify;">
                   <asp:Label ID="Label13" runat="server" ForeColor="White" Text="Güçlü olmayan şifreler gerçek bir güvenlik tehdididir. Saldırılar ve sızıntıların birçoğu zayıf ve daha önce ele geçirilmiş şifreler ile gerçekleştiriliyor. Bu sebeple kişisel verilerinizi korumanın en önemli adımlarından biri güçlü bir şifre oluşturmaktır. Bu site sizlere kırılması zor şifreler üretmenizde yardımcı olup kullanılacak şifrenin güvenliğini ölçer. Bu site ile herhangi bir uzunlukta rastgele bir şifre oluşturmayı seçebilir veya hatırlamayı kolaylaştırmak için istediğiniz bir kelimeyi içeren şifre oluşturabilirsiniz. Burada oluşturduğunuz şifreler herhangi bir veri tabanında tutulmaz. "></asp:Label>
                </td>
                  <td style="width:12%"></td>
           </tr>
           
             <tr>
                  <td style="width:12%"></td>
               <td align="center" style="text-align:justify;"> 
                   <asp:Label ID="Label14" runat="server" ForeColor="White" Text="Güçlü bir şifre büyük ve küçük harfler, sayılar ve özel karakterler içermelidir. Bu sitede güvenlik test edilirken karmaşıklıkla beraber şifrenin uzunluğuna da bakılır. Güçlü bir şifre en az 8 karakter uzunluğunda ve her türden karakter içeren bir şifre olmalıdır."></asp:Label>
                 </td>

             </tr>
              <tr>
               <td style="width:12%"></td>
               <td align="center" style="height: 20px; padding-top: 50px; font-size: 20px;">
                   <asp:Label ID="Label4" runat="server" Text="İpuçları" Font-Bold="True" ForeColor="White"></asp:Label>
               </td> 
                <td style="width:12%"></td>
             <tr>
                  <td style="width:12%"></td>
               <td align="center" style="padding-top: 20px; padding-bottom: 100px; text-align:justify;"> 
                   <asp:Label ID="Label11" runat="server" ForeColor="White" Text="- Oluşturduğunuz her hesap için benzersiz ve farklı bir şifre kullanın. Böylelikle bir sitenin güvenlik açığı olduğunda, bilgisayar korsanları aynı kullanıcı adı ve şifre kombinasyonlarını diğer platfromlarda denese de başarılı olamazlar."></asp:Label> <br /> <br />
                   <asp:Label ID="Label12" runat="server" ForeColor="White" Text="- Kişisel bilgiler içeren bir şifre oluşturmayın. İsim, doğum günü, ikamet edilen şehir gibi bilgilere çevrimiçi olarak kolayca erişilebilir. Tahmin edilmesi kolay şifrelerden kaçının."></asp:Label> <br /> <br />
                   <asp:Label ID="Label16" runat="server" ForeColor="White" Text="- Yalnızca tek bir kelimeyi veya karakteri değiştiren benzer şifreler kullanmaktan kaçının. Bu durum, birden çok sitede hesap güvenliğinizi zayıflatır. Örneğin iki farklı site için C@roL123** ve cAr0l123** gibi iki farklı şifre kullanmaktan kaçının."></asp:Label> <br /> <br />
                   <asp:Label ID="Label17" runat="server" ForeColor="White" Text="- Şifrenizin en az 8 karakterden oluştuğuna emin olun. Daha uzun şifreler kırılmayı zorlaştırır."></asp:Label> <br /> <br />
                   <asp:Label ID="Label18" runat="server" ForeColor="White" Text="- asd123, password1 veya qwerty gibi zayıf, yaygın olarak kullanılan şifrelerden kaçının. Örnek olarak X8#tvZW3.l, #$RBCgo410y ya da hh8j8D%FT8K*& gibi şifreler kullanılabilir."></asp:Label> <br /> <br />
                   <asp:Label ID="Label19" runat="server" ForeColor="White" Text="- Kullandığınız şifreleri belirli araklıklarla yenileri ile değiştirin. Uzun süre aynı şifreyi kullanmak şifre güvenliğini tehdit eder. Olası bir güvenlik ihlaline karşı şifrelerinizi güncel tutun."></asp:Label> <br /> <br />
                   <asp:Label ID="Label20" runat="server" ForeColor="White" Text="- Şifrelerinizi fiziksel ya da sanal bir ortama kaydetmeyin. Böylelikle birilerinin şifrelerinize kolaylıkla erişmesini engellemiş olursunuz."></asp:Label> <br /> <br />
                   <asp:Label ID="Label21" runat="server" ForeColor="White" Text="- Şifre güvenliğini ölçen programlar kullanarak şifrenizin güvenliğinden emin olabilirsiniz."></asp:Label> <br /> <br />
                 </td>
                  
           </tr>
            <tr>
                 <td style="width:12%"></td>
               <td></td>
                  <td style="width:12%"></td>
           </tr>
           
       </table>
       </div>

</asp:Content>
