Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951E7C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 19:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A7310FF7B;
	Wed, 27 Mar 2024 19:25:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74BD10F2E3;
 Wed, 27 Mar 2024 19:25:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I-test=2C1/8=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall=28?=
 =?utf-8?q?=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Mar 2024 19:25:43 -0000
Message-ID: <171156754381.1060333.15872018127803336158@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327190710.2359-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240327190710.2359-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [CI-test,1/8] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/131706/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c459a8b0337a1c8b9a90d71cebb5032f0254f684
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Mar 27 20:07:09 2024 +0100

    drm/xe/display: Re-use display vmas when possible
    
    i915 has this really nice, infrastructure where everything becomes
    complicated, GGTT needs eviction, etc..
    
    Lets not do that, and make the dumbest possible interface instead.
    Try to retrieve the VMA from old_plane_state, or intel_fbdev if kernel
    fb.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640 drm-intel
c25b49ebd032 drm: Add drm_vblank_work_flush_all().
-:33: WARNING:WAITQUEUE_ACTIVE: waitqueue_active without comment
#33: FILE: drivers/gpu/drm/drm_vblank_work.c:249:
+			    waitqueue_active(&vblank->work_wait_queue),

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
f448e1417cc9 drm/i915: Use vblank worker to unpin old legacy cursor fb safely
95bd1b08aea4 drm/i915: Use the same vblank worker for atomic unpin
-:107: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:641:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:110: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#110: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:644:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 98 lines checked
45344f253d94 drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
dc8993b3887a drm/xe/display: Preparations for preallocating dpt bo
7637975d6ba2 drm/xe: Use simple xchg to cache DPT
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
60e1cc7e94ab drm/xe/display: Prevent overwriting original GGTT when taking over initial FB.
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:126: CHECK:LINE_SPACING: Please don't use multiple blank lines
#126: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:436:
+
+

-:146: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#146: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 222 lines checked
c459a8b0337a drm/xe/display: Re-use display vmas when possible
-:180: ERROR:CODE_INDENT: code indent should use tabs where possible
#180: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:465:
+^I            sizeof(new_plane_state->view.gtt))) {$

total: 1 errors, 0 warnings, 0 checks, 162 lines checked


