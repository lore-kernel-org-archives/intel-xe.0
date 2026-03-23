Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F144EEC01C8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 10:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5B010E03E;
	Mon, 23 Mar 2026 10:43:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241D010E03E;
 Mon, 23 Mar 2026 10:43:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/de=3A_Move_regis?=
 =?utf-8?q?ter_polling_into_display_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Mar 2026 10:43:23 -0000
Message-ID: <177426260313.384814.2844806602570133487@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260313111028.25159-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260313111028.25159-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/de: Move register polling into display code (rev2)
URL   : https://patchwork.freedesktop.org/series/163181/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4dd954e13cbef80bfe9eef6beda82accc82447d8
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Mar 23 11:43:04 2026 +0200

    drm/i915/de: Implement register polling in the display code
    
    The plan is to move all the mmio stuff into the display code itself.
    As a first step implement the register polling in intel_de.c.
    
    Currently i915 and xe implement this stuff in slightly different
    ways, so there are some functional changes here. Try to go for a
    reasonable middle ground between the i915 and xe implementations:
    - the exponential backoff limit is the simpler approach taken
      by i915 (== just clamp the max sleep duration to 1 ms)
    - the fast vs. slow timeout handling is similar to i915 where
      we first try the fast timeout and then again the slow timeout
      if the condition still isn't satisfied. xe just adds up the
      timeouts together, which is a bit weird.
    - the atomic wait variant uses udelay() like xe, whereas i915
      has no udelay()s in its atomic loop. As a compromise go for a
      fixed 1 usec delay  for short waits, instead of the somewhat
      peculiar xe behaviour where it effectively just does one
      iteration of the loop.
    - keep the "use udelay() for < 10 usec waits" logic (which
      more or less mirrors fsleep()), but include an explicit
      might_sleep() even for these short waits when called from
      a non-atomic intel_de_wait*() function. This should prevent
      people from calling the non-atomic functions from the wrong
      place.
    
    Eventually we may want to switch over to poll_timeout*(),
    but that lacks the exponential backoff, so a bit too
    radical to change in one go.
    
    v2: Initialize ret in intel_de_wait_for_register() to avoid a
        warning from the compiler. This is actually a false positive
        since we always have fast_timeout_us!=0 when slow_timeout_us!=0,
        but the compiler can't see that
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 5cb7d14d9bd2061386a0192a4649626a3e3a5ec3 drm-intel
7e1d60d2af49 drm/i915/de: Introduce intel_de.c and move intel_de_{read, write}8() there
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 77 lines checked
737b8f8cb250 drm/i915/de: Move intel_de_wait*() into intel_de.c
4dd954e13cbe drm/i915/de: Implement register polling in the display code


