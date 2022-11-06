﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace WaPassword
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGeneratePassword_Click(object sender, EventArgs e)
        {
            txtPasswordStrong.Text = string.Empty;

            bool BoLength = true, BoCheck = true, BoReplaceKisa = false;
            string StYourText = txtYourText.Text.Trim();
            bool BoOnlyReplace = !chkLowercase.Checked && !chkNumbers.Checked && chkReplace.Checked && !chkSymbols.Checked && !chkUppercase.Checked;
            int InPasswordLength = Convert.ToInt32(drpParolaLength.SelectedValue);

            if (StYourText.Length > Convert.ToInt32(drpParolaLength.SelectedValue))
            {
                BoLength = false;
                lblMessage.Text = "Seçilen şifre uzunluğu girilen metin uzunluğundan kısa olamaz.";
            }
            if (!chkLowercase.Checked && !chkNumbers.Checked && !chkReplace.Checked && !chkSymbols.Checked && !chkUppercase.Checked)
            {
                BoCheck = false;
                lblMessage.Text = "En az bir özellik seçmelisiniz.";
            }
            if (BoOnlyReplace && StYourText.Length < InPasswordLength)
            {
                BoReplaceKisa = true;
                lblMessage.Text = "En az bir özellik seçmelisiniz.";
            }

            if (BoLength && BoCheck && !BoReplaceKisa)
            {
                lblMessage.Text = string.Empty;

                string StPassword = string.Empty;

                if (chkReplace.Checked && StYourText.Length > 0)
                {
                    string StReplace = FnReplaceSimilarOnes(StYourText);
                    StPassword = StReplace;
                }//if (chkReplace.Checked)

                if (!BoOnlyReplace && InPasswordLength > StYourText.Length)
                {
                    if (chkReplace.Checked)
                    {
                        if (!(chkSymbols.Checked || chkLowercase.Checked))
                        {
                            string StNewPassword = GeneratePassword(chkUppercase.Checked, chkLowercase.Checked, chkNumbers.Checked, chkSymbols.Checked, InPasswordLength - StPassword.Length);
                            StPassword = FnPlace(StNewPassword, StPassword);
                        }
                    }
                    else
                    {
                        if(!(chkSymbols.Checked || chkLowercase.Checked || chkUppercase.Checked))
                            StPassword = GeneratePassword(chkUppercase.Checked, chkLowercase.Checked, chkNumbers.Checked, chkSymbols.Checked, InPasswordLength - StPassword.Length);
                    }
                }
                if(chkReplace.Checked && chkLowercase.Checked && !chkSymbols.Checked && !chkNumbers.Checked && !chkUppercase.Checked)
                    StPassword = FnPlace(GeneratePassword(chkUppercase.Checked, chkLowercase.Checked, chkNumbers.Checked, chkSymbols.Checked, InPasswordLength - StPassword.Length), StPassword);

                if (StYourText.Length == 0)
                    txtPasswordStrong.Text = StPassword;
                else
                {
                    bool BoOnlyUppercase = chkUppercase.Checked && !chkLowercase.Checked && !chkNumbers.Checked && !chkReplace.Checked && !chkSymbols.Checked;
                    bool BoOnlyLowercase = !chkUppercase.Checked && chkLowercase.Checked && !chkNumbers.Checked && !chkReplace.Checked && !chkSymbols.Checked;

                    if (BoOnlyUppercase)
                    {
                        StPassword = FnPlace(StYourText, StPassword);
                    }
                    if (BoOnlyLowercase)
                    {
                        StPassword = FnPlace(StYourText, StPassword);
                    }
                    if(!(BoOnlyLowercase || BoOnlyUppercase))
                    {
                        PasswordStrengthChecker checker = new PasswordStrengthChecker();

                        if (!chkReplace.Checked)
                            StPassword = StYourText;

                        if (chkNumbers.Checked)
                        {
                            if (!checker.IsThereNumber(StPassword) && InPasswordLength == StYourText.Length)
                            {
                                StPassword = StPassword.Substring(0, StPassword.Length - 1);
                                string StNewPassword = GeneratePassword(false, false, true, false, 1);
                                StPassword = FnPlace(StNewPassword, StPassword);
                            }
                            else
                            {
                                string StNewPassword = GeneratePassword(false, false, true, false, 1);
                                StPassword = FnPlace(StNewPassword, StPassword);
                            }
                        }
                        if (chkSymbols.Checked)
                        {
                            if (!checker.IsThereSymbol(StPassword) && InPasswordLength == StYourText.Length)
                            {
                                if (chkNumbers.Checked)
                                {
                                    StPassword = StPassword.Substring(0, StPassword.Length - 2);
                                    string StNewPassword = GeneratePassword(false, false, true, true, 2);
                                    StPassword = FnPlace(StNewPassword, StPassword);
                                }
                                else
                                {
                                    StPassword = StPassword.Substring(0, StPassword.Length - 1);
                                    string StNewPassword = GeneratePassword(false, false, false, true, 1);
                                    StPassword = FnPlace(StNewPassword, StPassword);
                                }
                            }
                            else
                            {
                                string StNewPassword = GeneratePassword(false, false, false, true, 1);
                                StPassword = FnPlace(StNewPassword, StPassword);
                            }
                        }
                        if (chkLowercase.Checked && chkUppercase.Checked)
                        {
                            char[] arr = StPassword.ToCharArray();
                            if (chkLowercase.Checked && !checker.IsThereLowercase(StPassword))
                            {
                                StPassword = StPassword.Substring(0, StPassword.Length - 1);
                                string StNewPassword = GeneratePassword(false, true, false, false, 1);
                                StPassword = FnPlace(StNewPassword, StPassword);
                            }
                            else if (chkLowercase.Checked && checker.IsThereUppercase(StPassword))
                            {
                                for (int i = 0; i < arr.Length; i++)
                                {
                                    if (checker.IsThereUppercase(arr[i].ToString()))
                                    {
                                        try
                                        {
                                            string StOne = StPassword.Substring(i - 1, 1);
                                            string StTwo = StPassword.Substring(StOne.Length + 1);
                                            StPassword = FnPlace(StOne, StTwo, arr[i].ToString().ToLower());
                                        }
                                        catch
                                        {
                                        }
                                        break;
                                    }
                                }
                            }
                            if (chkUppercase.Checked && !checker.IsThereUppercase(StPassword))
                            {
                                if (StPassword.Length >= InPasswordLength)
                                {
                                    StPassword = StPassword.Substring(0, StPassword.Length - 1);
                                    string StNewPassword = GeneratePassword(true, false, false, false, 1);
                                    StPassword = FnPlace(StNewPassword, StPassword);
                                }
                                else
                                {
                                    string StNewPassword = GeneratePassword(true, false, false, false, 1);
                                    StPassword = FnPlace(StNewPassword, StPassword);
                                }
                            }

                            else if (chkUppercase.Checked && checker.IsThereLowercase(StPassword))
                            {
                                for (int i = 0; i < arr.Length; i++)
                                {
                                    if (checker.IsThereLowercase(arr[i].ToString()))
                                    {
                                        try
                                        {
                                            string StOne = StPassword.Substring(i - 1, 1);
                                            string StTwo = StPassword.Substring(StOne.Length + 1);

                                            StPassword = FnPlace(StOne, StTwo, arr[i].ToString().ToUpper());
                                        }
                                        catch { }
                                        break;
                                    }

                                }
                            }
                        }

                        else if (chkLowercase.Checked && !chkUppercase.Checked)
                        {
                            StPassword = StPassword.ToLower();
                        }
                        else if (!chkLowercase.Checked && chkUppercase.Checked)
                        {
                            StPassword = StPassword.ToUpper();
                        }
                    }
                }

                if (BoOnlyReplace && StYourText.Length == 0)
                    StPassword = string.Empty;
                else
                {
                    if (StPassword.Length < InPasswordLength)
                    {
                        if (StPassword.Length == 0)
                        {
                            StPassword = GeneratePassword(chkUppercase.Checked, chkLowercase.Checked, chkNumbers.Checked, chkSymbols.Checked, InPasswordLength - StPassword.Length);
                        }
                        else
                        {
                            string StNewPassword = GeneratePassword(chkUppercase.Checked, chkLowercase.Checked, chkNumbers.Checked, chkSymbols.Checked, InPasswordLength - StPassword.Length);
                            StPassword = FnPlace(StNewPassword, StPassword);
                        }
                    }
                }//if

                if (StPassword.Length > InPasswordLength)
                {
                    StPassword = StPassword.Substring(0, InPasswordLength);
                }

                txtPasswordStrong.Text = StPassword.Trim();
            }//if

        }

        private string FnReplaceSimilarOnes(string StReplace)
        {
            StReplace = StReplace.Replace("a", "@");
            StReplace = StReplace.ToString().Replace("s", "$");
            StReplace = StReplace.ToString().Replace("S", "$");
            StReplace = StReplace.ToString().Replace("l", "1");
            StReplace = StReplace.ToString().Replace("A", "4");
            StReplace = StReplace.ToString().Replace("o", "0");
            StReplace = StReplace.ToString().Replace("O", "0");
            StReplace = StReplace.ToString().Replace("g", "9");
            StReplace = StReplace.ToString().Replace("E", "3");
            StReplace = StReplace.ToString().Replace("z", "2");
            StReplace = StReplace.ToString().Replace("Z", "2");
            StReplace = StReplace.ToString().Replace("i", "!");
            StReplace = StReplace.ToString().Replace("i", "!");
            StReplace = StReplace.ToString().Replace("c", "(");
            StReplace = StReplace.ToString().Replace("C", "(");
            StReplace = StReplace.ToString().Replace("k", "<");
            StReplace = StReplace.ToString().Replace("K", "<");
            StReplace = StReplace.ToString().Replace("m", "w");
            StReplace = StReplace.ToString().Replace("M", "W");

            return StReplace;
        }

        private string GeneratePassword(bool useCapitalLetters, bool useSmallLetters, bool useNumbers, bool useSymbols, int passLenght)
        {
            if (passLenght == 0)
                return string.Empty;
            Random random = new Random();

            StringBuilder password = new StringBuilder(string.Empty);

            //This for loop is for selecting password chars in order 
            for (int i = 0; ;)
            {
                if (useCapitalLetters)
                {
                    password.Append((char)random.Next(65, 91)); //Capital letters 
                    ++i; if (i >= passLenght) break;
                }
                if (useSmallLetters)
                {
                    password.Append((char)random.Next(97, 122)); //Small letters
                    ++i; if (i >= passLenght) break;
                }
                if (useNumbers)
                {
                    password.Append((char)random.Next(48, 57)); //Number letters
                    ++i; if (i >= passLenght) break;
                }
                if (useSymbols)
                {
                    password.Append((char)random.Next(33, 47)); //Symbol letters
                    ++i; if (i >= passLenght) break;
                }
            }

            //This for loop is for disordering password characters
            for (int i = 0; i < password.Length; ++i)
            {
                int randomIndex1 = random.Next(password.Length);
                int randomIndex2 = random.Next(password.Length);
                char temp = password[randomIndex1];
                password[randomIndex1] = password[randomIndex2];
                password[randomIndex2] = temp;
            }

            return password.ToString();
        }

        protected void chkShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            string StParola = txtPasswordControl.Text.Trim();

            //checkBox işaretli ise
            if (chkShowPassword.Checked)
            {
                //karakteri göster.
                txtPasswordControl.TextMode = TextBoxMode.SingleLine;
            }
            //değilse karakterlerin yerine * koy.
            else
            {
                txtPasswordControl.TextMode = TextBoxMode.Password;
            }

            txtPasswordControl.Text = StParola;
        }

        protected void btnPasswordControl_Click(object sender, EventArgs e)
        {
            string StParola = txtPasswordControl.Text.Trim();

            //checkBox işaretli ise
            if (chkShowPassword.Checked)
            {
                //karakteri göster.
                txtPasswordControl.TextMode = TextBoxMode.SingleLine;
            }
            //değilse karakterlerin yerine * koy.
            else
            {
                txtPasswordControl.TextMode = TextBoxMode.Password;
            }

            txtPasswordControl.Text = StParola;
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {
            PasswordStrengthChecker checker = new PasswordStrengthChecker();
            int score = checker.GeneratePasswordScore(txtPasswordControl.Text.Trim());

            string StParola = txtPasswordControl.Text.Trim();
            lblKarakterSayisi.Text = StParola.Length.ToString();

            bool BoSymbol = false, BoNumber = false, BoUppercase = false, BoLowercase = false;

            BoSymbol = checker.IsThereSymbol(StParola);
            BoLowercase = checker.IsThereLowercase(StParola);
            BoNumber = checker.IsThereNumber(StParola);
            BoUppercase = checker.IsThereUppercase(StParola);

            btnSymbol.BackColor = System.Drawing.Color.White;
            btnNumber.BackColor = System.Drawing.Color.White;
            btnLowercase.BackColor = System.Drawing.Color.White;
            btnUppercase.BackColor = System.Drawing.Color.White;

            btnSymbol.Font.Bold = false;
            btnNumber.Font.Bold = false;
            btnLowercase.Font.Bold = false;
            btnUppercase.Font.Bold = false;

            btnSymbol.ForeColor = System.Drawing.Color.Black;
            btnNumber.ForeColor = System.Drawing.Color.Black;
            btnLowercase.ForeColor = System.Drawing.Color.Black;
            btnUppercase.ForeColor = System.Drawing.Color.Black;


            if (BoSymbol)
            {
                btnSymbol.BackColor = btnGeneratePassword.BackColor;
                btnSymbol.ForeColor = System.Drawing.Color.White;
            }


            if (BoLowercase)
            {
                btnLowercase.BackColor = btnGeneratePassword.BackColor;
                btnLowercase.ForeColor = System.Drawing.Color.White;
            }


            if (BoUppercase)
            {
                btnUppercase.BackColor = btnGeneratePassword.BackColor;
                btnUppercase.ForeColor = System.Drawing.Color.White;
            }


            if (BoNumber)
            {
                btnNumber.BackColor = btnGeneratePassword.BackColor;
                btnNumber.ForeColor = System.Drawing.Color.White;
            }

            //0 - 49 : Unacceptable
            //50 - 59 : Weak
            //60 - 79 : Normal
            //80 - 89 : Strong
            //90 - 100 : Trustworthy
            if (score < 50)
            {
                btnWritePasswordStrength.Text = "Çok Zayıf";
                btnWritePasswordStrength.BackColor = System.Drawing.Color.Red;
            }
            else if (score < 60)
            {
                btnWritePasswordStrength.Text = "Zayıf";
                btnWritePasswordStrength.BackColor = System.Drawing.Color.OrangeRed;
            }
            else if (score < 80)
            {
                btnWritePasswordStrength.Text = "Normal";
                btnWritePasswordStrength.BackColor = System.Drawing.Color.Orange;

            }
            else if (score < 90)
            {
                btnWritePasswordStrength.Text = "Güçlü";
                btnWritePasswordStrength.BackColor = System.Drawing.Color.Blue;
            }
            else if (score <= 100)
            {
                btnWritePasswordStrength.Text = "Çok Güçlü";
                btnWritePasswordStrength.BackColor = System.Drawing.Color.Green;
            }

            btnWritePasswordStrength.Text += " %" + score.ToString();
        }//txtPassword_TextChanged

        //Combines the two parts of the password so that the placement is random.
        private string FnPlace(string StYourText, string StPassword)
        {
            Random rand = new Random();
            int InRandom = rand.Next(1, 3); //1. First 2. Last
            if (chkLowercase.Checked)
            {
                if (InRandom == 1)
                {
                    StPassword = StPassword + StYourText.ToLower();
                }
                else if (InRandom == 2)
                {
                    StPassword = StYourText.ToLower() + StPassword;
                }
            }
            if (chkUppercase.Checked)
            {
                if (InRandom == 1)
                {
                    StPassword = StPassword + StYourText.ToUpper();
                }
                else if (InRandom == 2)
                {
                    StPassword = StYourText.ToUpper() + StPassword;
                }
            }

            return StPassword;
        }

        //Combines the three-part password so that the placement is random.
        private string FnPlace(string StOne, string StTwo, string StPassword)
        {
            Random rand = new Random();
            int InRandom = rand.Next(1, 4); //1. First 2. Middle 3. Last
            if (InRandom == 1)
            {
                StPassword = StPassword + StOne + StTwo;
            }
            else if (InRandom == 2)
            {
                StPassword = StOne + StPassword + StTwo;
            }
            else if (InRandom == 3)
            {
                StPassword = StOne + StTwo + StPassword;
            }
            return StPassword;
        }
    }
}