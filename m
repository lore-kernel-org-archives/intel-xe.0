Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF19C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 18:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA2110EA20;
	Thu, 22 Feb 2024 18:34:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4001710EA20;
 Thu, 22 Feb 2024 18:34:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Add_missing_?=
 =?utf-8?q?=3B_to_=5F=5Fassign=5Fstr=28=29_macros_in_tracepoint_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 18:34:02 -0000
Message-ID: <170862684226.217031.7231345440914516682@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222133057.2af72a19@gandalf.local.home>
In-Reply-To: <20240222133057.2af72a19@gandalf.local.home>
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

Series: drm/i915: Add missing ; to __assign_str() macros in tracepoint code
URL   : https://patchwork.freedesktop.org/series/130277/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7b8575024c5c3fceebb73a565cae265380bd1dad
Author: Steven Rostedt (Google) <rostedt@goodmis.org>
Date:   Thu Feb 22 13:30:57 2024 -0500

    drm/i915: Add missing ; to __assign_str() macros in tracepoint code
    
    I'm working on improving the __assign_str() and __string() macros to be
    more efficient, and removed some unneeded semicolons. This triggered a bug
    in the build as some of the __assign_str() macros in intel_display_trace
    was missing a terminating semicolon.
    
    Fixes: 2ceea5d88048b ("drm/i915: Print plane name in fbc tracepoints")
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+ /mt/dim checkpatch 5dfa3c2da4803652582408bfb3c529970735f594 drm-intel
7b8575024c5c drm/i915: Add missing ; to __assign_str() macros in tracepoint code
-:12: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 2ceea5d88048 ("drm/i915: Print plane name in fbc tracepoints")'
#12: 
Fixes: 2ceea5d88048b ("drm/i915: Print plane name in fbc tracepoints")

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


