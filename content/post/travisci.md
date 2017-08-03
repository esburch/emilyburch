---
title: "TravisCI"
date: 2017-07-29
draft: false
---

### Now deploying with Travis CI!

This very website uses a combination of Amazon services - S3, Certificate Manager, Cloudfront, and Route 53. In fact, there's actually *three* sites.

All of the code for the site is on [GitHub](https://github.com/esburch/emilyburch). It has a master and develop branch. After I've finished all of my local development, I commit to the remote develop branch and it triggers a build in TravisCI. This builds the site and deploys all of the files to [my test site](http://test.emilyburch.com). After I've checked everything out and decide it looks good, I create a Pull Request against the master branch. This triggers yet another TravisCI build, and deploys to [my pull request site](http://pr.emilyburch.com). Somewhat redundant, but I like to make sure things look good for the actual page. Once the pull request is merged in to master, it triggers the final Travis build and deploys the site here. However, it does one thing slightly different from the other two builds. It invalidates pages in CloudFront to serve new content.

 I had a lot of help from [this post](https://lustforge.com/2016/02/27/hosting-hugo-on-aws/) by Joe Lust on [lustforge.com](http://www.lustforge.com)
