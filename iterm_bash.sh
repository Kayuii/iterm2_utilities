#!/usr/bin/env bash

# Set the titlebar text
function iterm2_set_titlebar_text() {
    echo -ne "\033]0;${1}\007"
}

# Set the "badge" (big text in the upper-right-corner of a window)
function iterm2_set_badge() {
    str=$1
    printf "\e]1337;SetBadgeFormat=%s\a" \
      $(echo -n $str | base64)
}


# post a growl message
function iterm2_growl() {
  local msg=$1
  printf "\e]9;${msg}\a"
}

# Put an annotation on the current line of the terminal; will
# follow it as you scroll, so you can find useful stuff later
# on.
function iterm2_annotate_line() {
   local msg=$1
   printf "\e]1337;AddAnnotation=${msg}\a"
}


# Change the background color. Takes
# rgb or rrggbb
function iterm2_bg_color() {
   local rgb=$1
   printf "\e]1337;SetColors=bg=${rgb}\a"
}

# Ditto for text color
function iterm2_fg_color() {
  local rgb=$1
  printf "\e]1337;SetColors=fg=${rgb}\a"
}

# Ditto for tab color
function iterm2_tab_color() {
  printf "\e]6;1;bg;red;brightness;$1\a"
  printf "\e]6;1;bg;green;brightness;$2\a"
  printf "\e]6;1;bg;blue;brightness;$3\a"
}
