using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SendInformation(string id)
    {
        person deserializedUser = new person();
        MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(id));
        DataContractJsonSerializer ser = new DataContractJsonSerializer(deserializedUser.GetType());
        deserializedUser = ser.ReadObject(ms) as person;
        ms.Close();
        return "hello";
    }

    public class person
    {
        private string name;
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }
        private string surname;
        public string Surname
        {
            get
            {
                return surname;
            }
            set
            {
                surname = value;
            }
        }
        private List<wayp> waypoints;
        public List<wayp> WayPoints
        {
            get
            {
                return waypoints;
            }
            set
            {
                waypoints = value;
            }
        }
    }
    public class wayp
    {
        public string loc { get; set; }
        public string add { get; set; }
    }
}