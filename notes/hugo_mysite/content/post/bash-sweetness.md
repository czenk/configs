+++
date = "2015-10-20T10:35:28+01:00"
draft = true
title = "bash sweetness"

+++

## Bash Sweetness

##### Intro
Schreib was über Lehre, Unix, VI und wie erstaunlich es ist, das diese Faktoren in der IT Formel 1 immer noch bestand haben. Dann

This morning was one of those little discoveries that do not seize to amaze me - and at the risk of embarrissing myself of wasting your time on something you know for a long time I want to share this with you - sharing is caring after all.

#### <CTRL> - R : Reverse-i-search (10 minutes)
You will long have discovered that you can navigate through your bash history with the arrow keys.
But you can do more with bash's history: Release a little 'reverse-i-search' magic by entering <CTRL>-R and your command prompt will change to

    (reverse-i-search)`':

Now start typing your search term and experience the power of the integrated search feature of bash.
Hit <CTRL>-R repeatedly to search backward in your bash history.

You can as well search forward again by using <CTRL>-S - or can you?
Unfortunatelly a conflict with the 'suspend' feature being bound to <CTRL>-S on most terminals is quite common.
Buth hey - this is Unix - so there must be a way around it: If you want to disable 'suspend' in favour of 'reverse-i-search' you can disable XON/XOFF by running

    stty -ixon

What is the obvious thing to do when discovering an old new feature? Find and RTFM. So here's the reference for your convenience:
<http://www.gnu.org/software/bash/manual/html_node/Searching.html>
