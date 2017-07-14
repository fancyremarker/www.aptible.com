---
title: Introducing Direct Docker Image Deploy
excerpt: You can now deploy apps on Enclave directly from a Docker image in addition
  to Enclave’s traditional git-based deployment process.
author_name: Thomas Orozco
author_email: thomas@aptible.com
author_id: thomas
posted: 2017-06-13
product: enclave
section: Blog
type: blog post
---

We’re proud to announce that you can now deploy apps on Enclave directly from a Docker image, bypassing Enclave’s traditional git-based deployment process.

With this feature, you can easily use the same images for deployment on Enclave and test / dev via other Docker-based tools such as Docker Compose or Kubernetes. And, if you’re already using Docker for your development workflow but haven’t adopted Enclave yet, it’s now much easier for you to take the platform for a spin.

## How does it work?

Direct docker image deployments on Enclave are done [via the CLI interface][0]. Here’s an example.

To deploy Docker’s official "hello-world" image to an app called “my-hello-world-app” on Enclave, you’d use this command:

    aptible deploy --app my-hello-world-app --docker-image hello-world

And if your app follows the <a href="https://12factor.net/config" target="_blank">
12-factor configuration guidelines</a> and uses the environment for configuration, you can include arbitrary environment variables for your app when running `aptible deploy`:

`aptible deploy --app my-enclave-app --docker-image quay.io/my-org/my-app \`
<br>
`  DATABASE_URL=postgresql://...`

## Why use it?

First off, if you’re currently using Enclave’s git-based deployment workflow, you can continue using that: it’s not going away! That being said, there are a few reasons why you might want to look at direct Docker image deploy as an alternative.

First, you might like more control over your Docker image build process. Indeed, when you deploy via git, Enclave follows a fairly opinionated build process:

  * The Docker build context is your git repository.

  * Enclave injects a [.aptible.env file][2] in your repository for you to access environment variables.

  * Enclave uses the Dockerfile from the root of your git repository.

This works just fine for a majority of apps, but if that’s not your case, use direct Docker image deploy for complete control over your build process, and make adjustments as needed. For example, you could inject private dependencies in your build context, leverage Docker build arguments, or use a different Dockerfile.

Other reasons for using this feature include:

  * You’re already building Docker images to use with other tools. Use this direct Docker image deploy feature to unify your deployments around a single build.

  * You’re using a public Docker image that’s available on the Docker hub. Use direct Docker image deploy so you don’t have to rebuild it from scratch.

If you’d like to learn more about this new feature, [head for the documentation][3]! And, as usual, let us know if you have any feedback.

Note: Astute readers will note that [you’ve been able to deploy apps on Enclave directly from a Docker image for some time][4], but we did rework the feature to make it much easier to use. Specifically, here’s what changed:

  * Procfiles and git repositories are now optional: Enclave will use your Docker image’s CMD if you don’t have a Procfile.

  * You no longer need to run `aptible config:set` followed by `aptible rebuild` to deploy. Instead, you can do everything in one operation with `aptible deploy`.

  [0]: https://www.aptible.com/support/toolbelt/
  [2]: https://www.aptible.com/support/topics/enclave/how-to-access-environment-variables-inside-dockerfile/
  [3]: https://www.aptible.com/support/topics/enclave/direct-docker-image-deploy/
  [4]: https://www.aptible.com/blog/deploy-private-images/
