Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03BFCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 10:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9652310E18D;
	Thu,  2 Oct 2025 10:46:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5462D10E18D;
 Thu,  2 Oct 2025 10:46:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/panic=3A_fix_pan?=
 =?utf-8?q?ic_structure_allocation_memory_leak?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 10:46:53 -0000
Message-ID: <175940201334.386273.15027024126633570868@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251002101756.2700320-1-jani.nikula@intel.com>
In-Reply-To: <20251002101756.2700320-1-jani.nikula@intel.com>
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

Series: drm/i915/panic: fix panic structure allocation memory leak
URL   : https://patchwork.freedesktop.org/series/155330/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d03d14190bc605f4b52cfa48c9b1b2bc6a23b171
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Oct 2 13:17:56 2025 +0300

    drm/i915/panic: fix panic structure allocation memory leak
    
    Separating the panic allocation from framebuffer allocation in commit
    729c5f7ffa83 ("drm/{i915,xe}/panic: move framebuffer allocation where it
    belongs") failed to deallocate the panic structure anywhere.
    
    The fix is two-fold. First, free the panic structure in
    intel_user_framebuffer_destroy() in the general case. Second, move the
    panic allocation later to intel_framebuffer_init() to not leak the panic
    structure in error paths (if any, now or later) between
    intel_framebuffer_alloc() and intel_framebuffer_init().
    
    Fixes: 729c5f7ffa83 ("drm/{i915,xe}/panic: move framebuffer allocation where it belongs")
    Cc: Jocelyn Falempe <jfalempe@redhat.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Reported-by: Michał Grzelak <michal.grzelak@intel.com>
    Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 880468a295fb4db7bf44eec3541bfc24d42d9656 drm-intel
d03d14190bc6 drm/i915/panic: fix panic structure allocation memory leak
-:9: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 729c5f7ffa83 ("drm/{i915,xe}/panic: move framebuffer allocation where it belongs")'
#9: 
Separating the panic allocation from framebuffer allocation in commit

-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#22: 
Reported-by: Michał Grzelak <michal.grzelak@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

total: 1 errors, 1 warnings, 0 checks, 54 lines checked


