---
layout: default
title: "Martin O'Hanlon"
description: "Hi, I'm Martin — a computer science educator, developer advocate and software developer."
permalink: /
---

<section class="hero">
  <div class="hero-text" markdown="1">
$ whoami
{: .prompt-line}

# Hi, I'm Martin — a computer science educator, developer advocate and software developer.

25 years building software, teaching people to code, and leading technology teams.
{: .muted}

<div class="social-row">
  <a class="pill" href="https://twitter.com/martinohanlon" target="_blank" rel="noopener">twitter</a>
  <a class="pill" href="https://www.linkedin.com/in/martinohanlon/" target="_blank" rel="noopener">linkedin</a>
  <a class="pill" href="https://github.com/martinohanlon" target="_blank" rel="noopener">github</a>
  <a class="pill" href="mailto:martin@ohanlonweb.com">email</a>
</div>
  </div>
  <div class="hero-img"><img src="{{ '/assets/images/hero-photo.webp' | relative_url }}" alt="Martin O'Hanlon"></div>
</section>

<section class="block" id="blog">
  {% include section-header.html prompt="$ tail -n 4 stuffaboutcode.com/feed.xml" heading="Latest from the blog" %}
  <div class="list-col">
    {% for post in site.data.blog_posts %}{% include list-row.html item=post %}
    {% endfor %}
  </div>
  <a class="view-all" href="https://www.stuffaboutcode.com" target="_blank" rel="noopener">→ all posts on stuffaboutcode.com</a>
</section>

<section class="block" id="learning">
  {% include section-header.html prompt="$ ls learning/" heading="Online learning &amp; video" %}
  <div class="card-grid">
    {% for item in site.data.learning %}{% include card.html item=item thumb="video" %}
    {% endfor %}
  </div>
</section>

<section class="block" id="software">
  {% include section-header.html prompt="$ ls software/" heading="Software development" %}
  <div class="card-grid">
    {% for item in site.data.software %}{% include card.html item=item %}
    {% endfor %}
  </div>
</section>

<section class="block" id="articles">
  {% include section-header.html prompt="$ ls articles/" heading="Articles" %}
  <div class="list-col">
    {% for item in site.data.articles %}{% include list-row.html item=item %}
    {% endfor %}
  </div>
</section>

<section class="block" id="literature">
  {% include section-header.html prompt="$ ls literature/" heading="Literature" %}
  <div class="card-grid">
    {% for item in site.data.literature %}{% include card.html item=item thumb="book" %}
    {% endfor %}
  </div>
</section>

<section class="contact-block" id="contact" markdown="1">
$ contact --martin
{: .prompt-line}

## Get in touch

Best reached by email, or find me on the socials above.
{: .muted}

[martin@ohanlonweb.com](mailto:martin@ohanlonweb.com){: .email-big}
</section>
