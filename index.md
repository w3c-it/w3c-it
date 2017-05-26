---
title: Home
layout: default
alias: /it/1/ufficio-italiano-w3c.html
---
<h2 class="offscreen">
    News
</h2>

<!-- ELENCO NEWS -->
<div id="w3c_slideshow">
    <div id="w3c_most-recently" class="intro hierarchy vevent_list">
        <h1 class="title">News dall&#39;Ufficio</h1>
        
        {% assign top_story = site.categories.w3cit.first %}
     	<!-- NEWS  -->
        <div class="event w3c_topstory expand_block">
            <div class="headline">
                <h3 class="h4 tPadding0 bPadding0 summary">
                    <span class="expand_section">{{ top_story.title }}</span>
                </h3>
                <p class="date">
                    <span class="published dtstart" title="{{ top_story.date }}">
                        <span class="dtstart single">
                            {{top_story.date | date: "%d" }}
                            {% assign m = top_story.date | date: "%-m" %}
                            {% case m %}
                            {% when '1' %}gennaio
                            {% when '2' %}febbraio
                            {% when '3' %}marzo
                            {% when '4' %}aprile
                            {% when '5' %}maggio
                            {% when '6' %}giugno
                            {% when '7' %}luglio
                            {% when '8' %}agosto
                            {% when '9' %}settembre
                            {% when '10' %}ottobre
                            {% when '11' %}novembre
                            {% when '12' %}dicembre
                            {% endcase %}
                        </span>
                        <span class="dtyear">{{ top_story.date | date: "%Y" }}</span>
                    </span>
                    | 
                    <a title="{{top_story.title}}" href="{{ '/archivio/news-w3c-it.html' | prepend: site.baseurl }}">
                        Archivio
                    </a>
                </p>
            </div>
            <div class="description expand_description">
                {{ top_story.content }}
            </div>
        </div>
        <!-- FINE NEWS  -->
     	
        <p class="noprint">
            <span class="more-news">
                <a href="{{ '/archivio/news-w3c-it.html' | prepend: site.baseurl }}" title="Altre news">
                    Altre news dell'Ufficio italiano &hellip;
                </a>
            </span>
        </p>
        
        <h1 class="title tMarginLg">News dal W3C</h1>
        
        {% assign top_story = site.categories.w3c.first %}
     	<!-- NEWS  -->
        <div class="event w3c_topstory expand_block">
            <div class="headline">
                <h3 class="h4 tPadding0 bPadding0 summary">
                    <span class="expand_section">{{ top_story.title }}</span>
                </h3>
                <p class="date">
                    <span class="published dtstart" title="{{ top_story.date }}">
                        <span class="dtstart single">
                            {{top_story.date | date: "%d" }}
                            {% assign m = top_story.date | date: "%-m" %}
                            {% case m %}
                            {% when '1' %}gennaio
                            {% when '2' %}febbraio
                            {% when '3' %}marzo
                            {% when '4' %}aprile
                            {% when '5' %}maggio
                            {% when '6' %}giugno
                            {% when '7' %}luglio
                            {% when '8' %}agosto
                            {% when '9' %}settembre
                            {% when '10' %}ottobre
                            {% when '11' %}novembre
                            {% when '12' %}dicembre
                            {% endcase %}
                        </span>
                        <span class="dtyear">{{ top_story.date | date: "%Y" }}</span>
                    </span>
                    | 
                    <a title="{{top_story.title}}" href="{{ '/archivio/news-w3c.html' | prepend: site.baseurl }}">
                        Archivio
                    </a>
                </p>
            </div>
            <div class="description expand_description">
                {{ top_story.content }}
            </div>
        </div>
        <!-- FINE NEWS  -->
        
        <p class="noprint">
            <span class="more-news">
	   	    &hellip; altre news nell'
                <a href="{{ '/archivio/news-w3c.html' | prepend: site.baseurl }}">
                       archivio delle news tradotte
                </a> o direttamente 
                <a href="http://www.w3.org/" hreflang="en" title="News sito W3C">
                       sul sito W3C (in inglese)
                </a>
            </span>
        </p>
    </div>
</div>
<!-- FINE ELENCO NEWS -->

<!-- CONTENITORE EVENTI E TALKS -->
<div class="w3c_events_talks">
    <!-- MISTERIOSO DIV LINE -->
    <div class="line">
        
        <!-- RAGGRUPPATORE ELENCO TALKS -->
        <div class="unit size1on2">
            <!-- ELENCO TALKS -->
            <div id="w3c_home_talks" class="w3c_upcoming_talks">
                <!-- TITOLO RAGGRUPPATORE -->
                <h2 class="category">
              	    <a title="Altri Talks" href="{{ '/archivio/talks.html' | prepend: site.baseurl }}">
                	Talks
                        <img src="{{ '/assets/images/header-link' | prepend: site.baseurl }}" alt="Header link" width="13" height="13" class="header-link" />
                    </a>
                </h2>
                <!-- FINE TITOLO RAGGRUPPATORE -->
                
                {% capture nowunix %}{{'now' | date: '%s' }}{% endcapture %}
                {% assign nowunix = nowunix | plus: 0 %}
                <ul class="vevent_list">  <!-- EVENTO -->

                    {% for talk in site.data.talks %}
                    {% capture talk_date %}{{ talk.date | date: '%s' }}{% endcapture %}
                    {% assign talk_date = talk_date | plus: 0 %}
                    {% if talk_date >= nowunix %}
                    <li class="vevent">
                        <p class="date">
                            <span class="dtyear">{{ talk.date | date: "%Y" }}</span>
                            <span class="dtstart single">
                                <span class="dtstart single">
                                    {{talk.date | date: "%d" }}
                                    {% assign m = talk.date | date: "%-m" %}
                                    {% case m %}
                                    {% when '1' %}GEN
                                    {% when '2' %}FEB
                                    {% when '3' %}MAR
                                    {% when '4' %}APR
                                    {% when '5' %}MAG
                                    {% when '6' %}GIU
                                    {% when '7' %}LUG
                                    {% when '8' %}AGO
                                    {% when '9' %}SET
                                    {% when '10' %}OTT
                                    {% when '11' %}NOV
                                    {% when '12' %}DIC
                                    {% endcase %}
                                </span>
                            </span>
                        </p>
                        
                        <div class="info-wrap">
                            <p class="summary">
                                {% if talk.url %}
                                <a href="{{ talk.url | prepend: site.baseurl }}">{{ talk.title }}</a>
                                {% else %}
                                {{ talk.title }}
                                {% endif %}
                            </p>
                            <p class="source">
                                {{ talk.author }}
                            </p>
                            <p class="eventtitle">
                                <a href="{{ event.event_url }}" class="uri">
                                    {{ talk.conference }}
                                </a>
                            </p>
                            <p class="location">{{ talk.location }}</p>
                        </div>
                    </li>
                    {% endif %}
                    {% endfor %}
                </ul>                
            </div>
            <!-- FINE ELENCO TALKS -->
        </div>
        <!-- FINE RAGGRUPPATORE ELENCO TALKS -->
        
        <!-- RAGGRUPPATORE ELENCO EVENTI -->
        <div class="unit size1on2 lastUnit">
            <!-- ELENCO EVENTI -->
            <div id="w3c_home_upcoming_events" class="w3c_upcoming_events">
                <!-- TITOLO RAGGRUPPATORE -->
                <h2 class="category">
                    <a title="Altri Eventi" href="{{ '/archivio/eventi.html' | prepend: site.baseurl }}">
                	Eventi
                        <img src="{{ '/assets/images/header-link' | prepend: site.baseurl }}" alt="Header link" width="13" height="13" class="header-link" />
                    </a>
                </h2>
                <!-- FINE TITOLO RAGGRUPPATORE -->
            </div>

            <ul class="vevent_list">  <!-- EVENTO -->

                {% for event in site.categories.eventi %}
                {% capture event_date %}{{ event.date | date: '%s' }}{% endcapture %}
                {% assign event_date = event_date | plus: 0 %}
                {% if event_date >= nowunix %}
                <li class="vevent">
                    <p class="date">
                        <span class="dtyear">{{ event.date | date: "%Y" }}</span>
                        <span class="dtstart single">
                            <span class="dtstart single">
                                {{event.date | date: "%d" }}
                                {% assign m = event.date | date: "%-m" %}
                                {% case m %}
                                {% when '1' %}GEN
                                {% when '2' %}FEB
                                {% when '3' %}MAR
                                {% when '4' %}APR
                                {% when '5' %}MAG
                                {% when '6' %}GIU
                                {% when '7' %}LUG
                                {% when '8' %}AGO
                                {% when '9' %}SET
                                {% when '10' %}OTT
                                {% when '11' %}NOV
                                {% when '12' %}DIC
                                {% endcase %}
                            </span>
                        </span>
                    </p>
                
                    <div class="info-wrap">
                        <p class="summary">
                            <a href="{{ event.url | prepend: site.baseurl }}.html">{{ event.title }}</a>
                        </p>
                    </div>
                </li>
                {% endif %}
                {% endfor %}
            </ul>
        </div>
        <!-- FINE ELENCO EVENTI -->
    </div>
    <!-- FINE RAGGRUPPATORE ELENCO EVENTI -->
</div>
<!-- FINE CONTENITORE EVENTI E TALKS  -->
