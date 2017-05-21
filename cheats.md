---
layout: page
site: Cheats
title: Cheats
permalink: /cheats/
---


<div class="cheats">

  <p>Some cheat sheets and instalation guides.</p>
  <ul>
    {% for cheat in site.cheats %}
      <li>
          <a href="{{ cheat.url | prepend: site.baseurl }}">{{ cheat.title }}</a>
          &rarr; {{ cheat.desc }}
      </li>
    {% endfor %}
  </ul>
</div>
