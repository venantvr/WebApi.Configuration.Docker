using System;
using FluentScheduler;
using System.Net;
using System.Configuration;

namespace WebScheduler
{
    public class ScheduledTasks : Registry
    {
        public ScheduledTasks()
        {
            // Schedule an IJob to run at an interval
            Schedule<MyJob>().ToRunNow().AndEvery(2).Seconds();
        }
    }

    public class MyJob : IJob
    {
        public void Execute()
        {
            var webClient = new WebClient();
            webClient.BaseAddress = ConfigurationManager.AppSettings["UrlToCallEvery2Seconds"];

            try
            {
                var response = webClient.DownloadString(@"api/message");
                Console.WriteLine("Response : " + response);
            }
            catch (WebException ex)
            {
                Console.WriteLine("No response from " + webClient.BaseAddress);
            }
        }
    }
}

