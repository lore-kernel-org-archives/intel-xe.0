Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C16C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 12:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E6C1124F0;
	Mon, 15 Apr 2024 12:15:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF611124F0;
 Mon, 15 Apr 2024 12:15:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I-only=2C1/8=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall=28?=
 =?utf-8?q?=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 12:15:01 -0000
Message-ID: <171318330184.1404431.8807113514981210184@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412130946.13148-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240412130946.13148-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [CI-only,1/8] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/132373/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
04432599dcb1becb52633b02487fe3c638ba5915
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c1e459c135d8e7c1335532258a7e2eaee587c184
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Apr 12 15:09:44 2024 +0200

    drm/xe/display: Re-use display vmas when possible
    
    i915 has this really nice, infrastructure where everything becomes
    complicated, GGTT needs eviction, etc..
    
    Lets not do that, and make the dumbest possible interface instead.
    Try to retrieve the VMA from old_plane_state, or intel_fbdev if kernel
    fb.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 85eef611f85be84edeabab83debdbb1fabeba066 drm-intel
4cbc0cec77e5 drm: Add drm_vblank_work_flush_all().
-:33: WARNING:WAITQUEUE_ACTIVE: waitqueue_active without comment
#33: FILE: drivers/gpu/drm/drm_vblank_work.c:249:
+			    !waitqueue_active(&vblank->work_wait_queue),

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
866d817d65e0 drm/i915: Use vblank worker to unpin old legacy cursor fb safely
8c4981135fa2 drm/i915: Use the same vblank worker for atomic unpin
-:107: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:641:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:110: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#110: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:644:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 98 lines checked
3c7384a75a77 drm/xe/display: Preparations for preallocating dpt bo
ea2c23d75143 drm/xe: Remove safety check from __xe_ttm_stolen_io_mem_reserve_stolen
8d79da18bf26 drm/xe: Use simple xchg to cache DPT
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
1d6e883b6965 drm/xe/display: Prevent overwriting original GGTT when taking over initial FB.
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:126: CHECK:LINE_SPACING: Please don't use multiple blank lines
#126: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:439:
+
+

-:146: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#146: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 222 lines checked
c1e459c135d8 drm/xe/display: Re-use display vmas when possible
-:180: ERROR:CODE_INDENT: code indent should use tabs where possible
#180: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:468:
+^I            sizeof(new_plane_state->view.gtt))) {$

total: 1 errors, 0 warnings, 0 checks, 162 lines checked


