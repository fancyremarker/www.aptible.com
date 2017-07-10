---
title: IP Filtering Made Easy With Enclave Endpoints
excerpt: Lock down network access to your apps in a handful of clicks.
author_name: Thomas Orozco
author_email: thomas@aptible.com
author_id: thomas
posted: 2017-02-22
section: Blog
posts: true
---

We’re proud to announce that as of this week, Enclave Endpoints support IP filtering. Using this new feature, you can restrict access to apps hosted on Enclave to a set of whitelisted IP addresses or networks and block other incoming incoming traffic.


### Use Cases
While IP filtering is no substitute for strong authentication, this feature is useful to:


- Further lock down access to sensitive apps and interfaces, such as admin dashboards or third party apps you’re hosting on Aptible for internal use only (e.g. Kibana, Sentry).

- Restrict access to your apps and APIs to a set of trusted customers or data partners.

And if you’re hosting development apps on Aptible, IP filtering can also help you make sure no one outside your company can view your latest and greatest before you’re ready to release it the world.

Note that IP filtering only applies to Endpoints (i.e. traffic directed to your app), not to `aptible ssh`, `aptible logs`, and other backend access functionality provided by the Aptible CLI (this access is secured by strong mutual authentication, as we covered in our [Q1 2017 webinar](https://www.aptible.com/resources/update-webinar-jan-2017/)).


### Getting Started with IP Filtering

IP filtering is configured via the Aptible Dashboard on a per-Endpoint basis.

<img style="display:block;margin-left: auto; margin-right:auto;" src="//images.contentful.com/8djp5jlzqrnc/4Te90Ccl7ym0aISG4qWu4a/ab8d24d6fc4950b3e95459cd0c1675af/image00.png?w=400&h=400" alt="2017-02-22 Blog Post IP Filtering">

You can enable it when creating a new Endpoint, or after the fact for an existing Endpoint by editing it.

Enjoy! As usual, [let us know](http://contact.aptible.com) if you have any feedback or questions!