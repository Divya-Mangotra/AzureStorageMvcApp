using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure;


namespace MvcWebRole1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        BlobStorageService _blobStorageService = new BlobStorageService();
        public ActionResult Upload()
        {
            CloudBlobContainer blobContainer = _blobStorageService.GetCloudBlobContainer();
            List<String> blobs = new List<string>();
            foreach (var blobItem in blobContainer.ListBlobs())
            {
                blobs.Add(blobItem.Uri.ToString());
            
            }
            return View(blobs);

        }

        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase image)
        {

            if (image.ContentLength > 0)
            {
                CloudBlobContainer blobContainer = _blobStorageService.GetCloudBlobContainer();
                CloudBlockBlob blob = blobContainer.GetBlockBlobReference(image.FileName);
                blob.UploadFromStream(image.InputStream);
            }
            return RedirectToAction("Upload");
        }

        [HttpPost]
        public string DeleteImage(string Name)
        {
            Uri uri = new Uri(Name);
            string filename = System.IO.Path.GetFileName(uri.LocalPath);

            CloudBlobContainer blobContainer = _blobStorageService.GetCloudBlobContainer();
            CloudBlockBlob blob = blobContainer.GetBlockBlobReference(filename);

            blob.Delete();

            return "file deleted.";

        }
    }
}
