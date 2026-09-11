---
layout: default
title: "Martin O'Hanlon - About"
description: "I am passionate about technology, education and supporting others in achieving their goals."
permalink: /about.html
---

<section class="hero about-hero">
  <div class="hero-img"><img src="{{ '/assets/images/about-photo.webp' | relative_url }}" alt="Martin O'Hanlon"></div>
  <div class="hero-text" markdown="1">
$ cat about.md
{: .prompt-line}

# I am passionate about technology, education and supporting others in achieving their goals.

Software developer · solution architect · developer advocate · computer science educator · technology leader · author
{: .role-line}
  </div>
</section>

<section class="block" markdown="1">
{% include section-header.html prompt="$ cat profile.md" heading="Profile" %}

* 25 years experience delivering technology solutions in the corporate, public and charitable sectors.
* Developer relations and advocacy, helping developers learn new technologies and adopt them successfully.
* Experienced in AI, RAG, GraphRAG and building GenAI solutions, helping developers and organisations put them into practice.
* An experienced software developer knowledgeable in many technologies and languages including Python, C, C++, C#, Java, HTML, SQL, Android, git, docker, Neo4j, Cypher.
* A TOGAF certified enterprise architect who understands the technology needs of organisations and how to develop IT strategies and architecture to fit.
* Computer science and software development educator with significant experience delivering face-to-face training, online learning and video content.
* Open source project lead and maintainer for multiple projects including guizero, Blue Dot and picozero.
* A proven record of delivering through people, leading through collaboration and communication.
* Adaptable, eager to learn new skills, driven, energetic and dedicated to helping others succeed.
{: .profile-list}
</section>

<section class="block" markdown="1">
{% include section-header.html prompt="$ cat achievements.md" heading="Key achievements" %}

* The creation of 50 online courses which supported over 500,000 learners all over the world to learn computer science and software development skills.
* The successful delivery of a £1m computing and coding education project for Google.
* Leading successful open source projects that have 10,000s of users and over 3,000 weekly downloads.
* The implementation of a corporate architecture service including systems design, process and governance.
* Design of new system architectures in customer management, finance, HR and data warehousing.
* Leading and organising the PyCon UK education track and kids day.
* Solution architecture design of a first generation IoT product to detect water leaks.
* The creation of an academy to support IT graduate recruitment and training.
{: .achievements-list}

{% include section-header.html prompt="$ cat testimonials.md" heading="Testimonials" style="margin-top:28px" %}

<div class="testimonial-grid">
{% for t in site.data.testimonials %}{% include testimonial.html item=t %}
{% endfor %}
</div>
</section>

<section class="contact-block" markdown="1">
$ contact --martin
{: .prompt-line}

[martin@ohanlonweb.com](mailto:martin@ohanlonweb.com){: .email-big}

<div class="social-row">
  <a class="pill" href="https://twitter.com/martinohanlon" target="_blank" rel="noopener">twitter</a>
  <a class="pill" href="https://www.linkedin.com/in/martin-o-hanlon-3466a45/" target="_blank" rel="noopener">linkedin</a>
  <a class="pill" href="https://github.com/martinohanlon" target="_blank" rel="noopener">github</a>
</div>
</section>
