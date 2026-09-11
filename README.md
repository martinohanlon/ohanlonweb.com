# ohanlonweb.com

## Introduction

Personal website and CV for Martin O'Hanlon, built as a static [Jekyll](https://jekyllrb.com/)
site and hosted on GitHub Pages at [ohanlonweb.com](https://ohanlonweb.com). It replaces a
previous Google Sites version of the same content.

The design is a monospace, terminal-inspired theme (`$ ls section/` prompt-line headers) with
a light/dark mode toggle.

## Structure

```
.
├── _config.yml          Jekyll site configuration
├── _data/                Content as YAML: blog posts, learning/software/literature cards,
│                         articles, testimonials — edit these to update page content
├── _includes/            Reusable template partials (header, footer, section-header,
│                         card, list-row, testimonial)
├── _layouts/
│   └── default.html      Shared page shell (head, header, footer, script)
├── assets/
│   ├── css/style.css     Design tokens and styles (light/dark theme via CSS variables)
│   ├── js/theme.js       Theme toggle, persisted in localStorage
│   └── images/           Photos, book covers, favicon
├── bin/
│   └── update-blog-posts.rb  Refreshes _data/blog_posts.yml from the stuffaboutcode.com feed
├── .github/workflows/
│   └── pages.yml         Builds and deploys the site to GitHub Pages: on push to main, weekly
│                         on a schedule (to pick up new blog posts), and on manual trigger
├── index.md               Home page content
├── about.md                About / CV page content
├── Gemfile / Gemfile.lock Ruby dependencies (github-pages gem)
└── CNAME                  Custom domain for GitHub Pages (ohanlonweb.com)
```

Most day-to-day content changes (a new blog post, testimonial, article, or course) are made
by editing a file in `_data/`, not by touching HTML or Liquid templates. `_data/blog_posts.yml`
specifically is regenerated automatically (see Build below) and shouldn't be hand-edited —
changes will just be overwritten on the next run.

## Installation

Requires Ruby (3.x) and Bundler.

```
bundle install
```

## Test

There is no automated test suite. Verify changes by building and previewing the site locally
before pushing:

```
bundle exec jekyll build   # fails loudly on template/Liquid/config errors
bundle exec jekyll serve   # preview at http://127.0.0.1:4000
```

Check both `/` and `/about.html`, and toggle light/dark mode, before opening a PR.

## Build

```
bundle exec ruby bin/update-blog-posts.rb   # refresh _data/blog_posts.yml from the RSS feed
bundle exec jekyll build
```

Output is written to `_site/` (git-ignored, not committed). `.github/workflows/pages.yml` runs
both of the commands above and deploys the result to GitHub Pages automatically: on every push
to `main`, weekly on a schedule (so new blog posts appear even without a code change), and via
manual trigger (Actions tab → "Build and deploy Pages" → Run workflow).

## Branching

The default branch is `development`. All changes are made on `development` (or a feature
branch merged into it) and only merged into `main` when ready to publish, since `main` is
what GitHub Pages serves.

### Deploying (development → main)

Once `development` has changes you want live, fast-forward `main` to match and push it —
that push is what triggers the build/deploy workflow:

```
git checkout main
git merge development --ff-only
git push origin main
git checkout development   # back to the working branch
```

`--ff-only` only succeeds if `main` has no commits of its own since the last deploy (which
should always be true, since nothing is ever committed directly to `main`); if it refuses,
something was pushed to `main` outside this flow — look into that before forcing anything.

Watch the deploy:

```
gh run list --limit 1                 # find the run
gh run watch <run-id>                 # follow it to completion
```

Or check the Actions tab in GitHub. The live site is at
[ohanlonweb.com](https://ohanlonweb.com) once DNS/custom domain are configured — until then,
at `https://martinohanlon.github.io/ohanlonweb.com/`.
