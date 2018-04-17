using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using BazarYasmin.Models;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace BazarYasmin.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // Para obtener más información sobre cómo habilitar la confirmación de cuentas y el restablecimiento de contraseña, visite http://go.microsoft.com/fwlink/?LinkID=320771
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirmar cuenta", "Para confirmar la cuenta, haga clic <a href=\"" + callbackUrl + "\">aquí</a>.");


                //Preparar email
                System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
                correo.From = new System.Net.Mail.MailAddress("bazaryasmin.1@gmail.com");
                correo.To.Add(Email.Text);
                correo.Subject = "Confirmar cuenta BazarYasmin";


                correo.Body = "Para confirmar la cuenta, haga clic <a href=\"" + callbackUrl + "\">aquí</a>.";
                correo.IsBodyHtml = true;
                correo.Priority = System.Net.Mail.MailPriority.Normal;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = "smtp.gmail.com"; //para gmail
                                              //smtp.Host = "smtp.live.com"; //para hotmail
                correo.BodyEncoding = System.Text.Encoding.UTF8;

                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("bazaryasmin.1@gmail.com", "guason6423");
                smtp.EnableSsl = true;
                try
                {
                    smtp.Send(correo);
                    
                }
                catch (Exception ex)
                {
                    throw new Exception("Error: (" + ex.Message + ")");
                }

            }
            signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            /////
            //System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            //    correo.From = new System.Net.Mail.MailAddress("bazaryasmin.1@gmail.com");
            //    correo.To.Add(this.Email.Text);
            //    correo.Subject = "Confirmar cuenta BazarYasmin";

            //    correo.Body = "Para confirmar la cuenta, haga clic <a href=\"" + callbackUrl + "\">aquí</a>.";

            //    correo.IsBodyHtml = true;
            //    correo.Priority = System.Net.Mail.MailPriority.Normal;
            //    System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            //    smtp.Host = "smtp.gmail.com"; //para gmail
            //                                  //smtp.Host = "smtp.live.com"; //para hotmail
            //    correo.BodyEncoding = System.Text.Encoding.UTF8;
            //    smtp.Port = 587;
            //    smtp.Credentials = new System.Net.NetworkCredential("bazaryasmin.1@gmail.com", "guason6423");
            //    smtp.EnableSsl = true;
            //    smtp.Send(correo);

            //     signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
            //     IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else 
            //{
            //    ErrorMessage.Text = result.Errors.FirstOrDefault();
            //}
        }
    }
}
