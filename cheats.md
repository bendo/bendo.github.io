---
layout: page
site: Cheats
title: Cheats
permalink: /cheats/
---


<div class="cheats">

  <p>Here you can find some cheat sheets and instalation guides.</p>
  <ul class="post-list">
    {% for cheat in site.cheats %}
      <li>
        <h2>
          <a class="post-link" href="{{ cheat.url | prepend: site.baseurl }}">{{ cheat.title }}</a>
        </h2>
        <p>{{ cheat.desc }}</p>
      </li>
    {% endfor %}
  </ul>
</div>
