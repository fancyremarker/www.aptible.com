---
title: Logentries and Sumo Logic setup now a breeze
excerpt: Aptible Log Drains now provide more flexible configuration, making it much
  easier to forward your Aptible logs to Logentries and Sumo Logic
author_name: Thomas Orozco
author_email: thomas@aptible.com
author_id: thomas
posted: 2017-02-14
section: Blog
posts: true
---

We’re happy to announce that Aptible Log Drains now provide more flexible configuration, making it much easier to forward your Aptible logs to two logging providers that are becoming increasingly popular with Aptible customers (in large part because they sign BAAs):

- <a href="https://www.logentries.com/" target="_blank">Logentries</a>

- <a href="https://www.sumologic.com/" target="_blank">Sumo Logic</a>


For Logentries, you can now use token-based logging. This makes configuration much, much easier than before: create a new Token TCP Log in Logentries then copy the Logging Token you’re provided with in Aptible, and you’re done!

![Log Drain to Logentries](//images.contentful.com/8djp5jlzqrnc/6hjo9mDvCE68CsIiyogy48/b28ad8ce7f5d0d4b58cae4fb9386cc02/image01.png)

For Sumo Logic, we now support full HTTPS URLs. Here again, this means setup is greatly simplified: all you need to do is create a new Hosted HTTP Collector in Sumo Logic, then copy the URL you’re provided with in Aptible.

![2017-02-14 Log Drain to Sumo Logic](//images.contentful.com/8djp5jlzqrnc/1rrXkdPCeUqKaeEuqKmMWg/c497651ec616a6bf7d403ab2591efa0a/image00.png)

Enjoy! As usual, if you have any questions or feedback, feel free to contact us.