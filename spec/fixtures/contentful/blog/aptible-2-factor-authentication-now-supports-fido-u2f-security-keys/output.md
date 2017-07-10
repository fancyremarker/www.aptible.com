---
title: Aptible 2-Factor Authentication Now Supports FIDO U2F Security Keys
excerpt: 'Convenience and Security: Pick Both!'
author_name: Thomas Orozco
author_email: thomas@aptible.com
author_id: thomas
posted: 2017-03-21
section: Blog
posts: true
---

We’re proud to announce that Aptible now supports hardware Security Keys as a second authentication factor! Specifically, Aptible now supports devices compliant with the <a href="https://en.wikipedia.org/wiki/Universal_2nd_Factor" target="_blank" rel="noopener">FIDO Universal Second Factor (U2F)</a> standard.

U2F Security Keys can be securely used across multiple accounts, and are rapidly gaining adoption: Google, GitHub, Dropbox, and many others now support U2F Security Keys.

### Convenience and Security: Pick Both!
There are two main reasons to use a Security Key with your Aptible account: increased convenience and better security.

**With a Security Key, you just touch the key to authenticate. No more fumbling for your phone.**

But Security Keys also help better protect against phishing, a common and sometimes dangerous attack.

#### Security Keys protect your Aptible account against phishing
Token-based 2FA does a good job at protecting your account against attackers who only learn your password, but it remains vulnerable to phishing: an attacker can trick you into providing your token and try to use it before it expires. Service providers can’t reliably tell the difference between the attacker’s request and a legitimate one coming from you.

Security keys offer much stronger protection against phishing. Here’s how:

When you try to log in using a Security Key, Aptible provides a unique challenge, and your Security Key responds a signed authentication response unique to that challenge. But unlike a 6-digit 2FA token, the Security Key’s response includes useful metadata Aptible can leverage to protect your account:

* The origin your browser was pointed at when you signed this response. If you’re being phished, this will be the attacker’s website, whereas if you’re actually logging in to Aptible, it’ll be dashboard.aptible.com.
* A device-specific response counter that your Security Key is responsible for increasing monotonically when it generates an authentication response. If your Security Key was cloned by an advanced attacker with physical access, inconsistent counter values may reveal their misdeed.

Once your Security Key has sent the response, Aptible verifies it as follows:

* The response must be signed by a Security Key associated with your account. Naturally, the signature must be valid.
* The response must have been generated for dashboard.aptible.com. This protects you against phishing.
* The response must be for a challenge Aptible issued recently, and that challenge must not have been used before. This protects you against replay attacks.
* The response must include a counter that’s greater that any count we’ve seen before for this Security Key. This protects you — to some extent — against device cloning.


#### How do I use U2F with my Aptible account?
First, you’ll need to purchase an FIDO U2F-compliant device from a trusted vendor. The Aptible team uses <a href="https://www.yubico.com/products/yubikey-hardware/fido-u2f-security-key?utm_campaign=aptible" target="_blank" rel="noopener">Yubikeys</a>, but there exist a number of other vendors.

You’ll also need to make sure your browser supports U2F Security Keys. Currently, only Chrome and Opera offer such support, but other browser vendors are working on adding support (U2F support is on <a href="https://wiki.mozilla.org/Security/CryptoEngineering#Web_Authentication" target="_blank" rel="noopener">the Firefox roadmap for Q2 2017</a>).

Once you’re done, navigate to your account settings, make sure 2FA is enabled, click on “Add a new Security Key”, and follow the instructions:

![How to add new U2F Security Key.](//images.contentful.com/8djp5jlzqrnc/2hbM4bMYEQ8SsyaqaoS2EG/1de75b5fadce8f62e989e15ce31f2e47/image00.png)

That’s it! Next time you attempt to log in, you’ll be prompted to touch your Security Key as an alternative to entering a 2FA token.

#### Can I stop using token-based 2-Factor Authentication altogether?
No: U2F Security Keys can be added as additional second factors on your account, but you can’t disable token-based authentication.

The reason for this is that U2F Security Keys aren’t supported everywhere yet, so you may need to occasionally fallback to a token to log in: not all browsers support them (only Chrome and Opera do at this time), and neither does the Aptible CLI. This may evolve over time, so it’s conceivable that we’ll eventually let you use U2F only.

As usual, [let us know if you have any questions or feedback](http://contact.aptible.com)!