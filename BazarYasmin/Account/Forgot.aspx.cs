using System;
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
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Forgot(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validar la dirección de correo electrónico del usuario
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                ApplicationUser user = manager.FindByName(Email.Text);
                if (user == null || !manager.IsEmailConfirmed(user.Id))
                {
                    FailureText.Text = "El usuario no existe o no se ha confirmado.";
                    ErrorMessage.Visible = true;
                    return;
                }
                // Para obtener más información sobre cómo habilitar la confirmación de cuentas y el restablecimiento de contraseña, visite http://go.microsoft.com/fwlink/?LinkID=320771
                // Enviar correo electrónico con el código y la dirección de redireccionamiento a la página de restablecimiento de contraseña
                string code = manager.GeneratePasswordResetToken(user.Id);
                string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);

                //Preparar email
                System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
                correo.From = new System.Net.Mail.MailAddress("bazaryasmin.1@gmail.com");
                correo.To.Add(Email.Text);
                correo.Subject = "Restablecer contraseña";


                correo.Body = "Para restablecer la contraseña, haga clic <a href=\"" + callbackUrl + "\">aquí</a>.";
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
                    this.Response.Write("<script language='JavaScript'>window.alert('Revise su bandeja de correo.')</script>");

                }
                catch (Exception ex)
                {
                    throw new Exception("Error: (" + ex.Message + ")");
                }
            }

            loginForm.Visible = false;
            DisplayEmail.Visible = true;


            // Validar la dirección de correo electrónico del usuario
            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //    ApplicationUser user = manager.FindByName(Email.Text);
            //    if (user == null || !manager.IsEmailConfirmed(user.Id))
            //    {
            //        FailureText.Text = "El usuario no existe o no se ha confirmado.";
            //        ErrorMessage.Visible = true;
            //        return;
            //    }
            //// Para obtener más información sobre cómo habilitar la confirmación de cuentas y el restablecimiento de contraseña, visite http://go.microsoft.com/fwlink/?LinkID=320771
            //// Enviar correo electrónico con el código y la dirección de redireccionamiento a la página de restablecimiento de contraseña
            //string code = manager.GeneratePasswordResetToken(user.Id);
            //string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);
            //manager.SendEmail(user.Id, "Restablecer contraseña", "Para restablecer la contraseña, haga clic <a href=\"" + callbackUrl + "\">aquí</a>.");

            ////Configuración del Mensaje
            //MailMessage mail = new MailMessage();
            //    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            //    //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
            //    mail.From = new MailAddress("bazaryasmin.1@gmail.com", "BazarYasmin", Encoding.UTF8);
            //    //Aquí ponemos el asunto del correo
            //    mail.Subject = "Restablecer contraseña";
            //    //Aquí ponemos el mensaje que incluirá el correo
            //    mail.Body = "Para restablecer la contraseña, haga clic <a href=\"" + callbackUrl + "\">aquí</a>.";
            //    //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
            //    mail.To.Add(Email.Text);
            //    //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
            //    //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

            //    mail.IsBodyHtml = true;
            //    mail.BodyEncoding = System.Text.Encoding.UTF8;

            //    //Configuracion del SMTP
            //    SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
            //                           //Especificamos las credenciales con las que enviaremos el mail
            //    SmtpServer.Credentials = new System.Net.NetworkCredential("bazaryasmin.1@gmail.com", "guason6423");
            //    SmtpServer.EnableSsl = true;
            //    SmtpServer.Send(mail);


            //    loginForm.Visible = false;
            //    DisplayEmail.Visible = true;
        }
    } 
 }

