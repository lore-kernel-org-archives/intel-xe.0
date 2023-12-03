Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE0C4167B
	for <intel-xe@archiver.kernel.org>; Sun,  3 Dec 2023 11:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBBB10E2C1;
	Sun,  3 Dec 2023 11:58:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0C5910E2BE;
 Sun,  3 Dec 2023 11:57:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 65539AA917;
 Sun,  3 Dec 2023 11:57:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Sun, 03 Dec 2023 11:57:37 -0000
Message-ID: <170160465741.25280.4345368873923007380@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231201153923.3433110-1-jouni.hogander@intel.com>
In-Reply-To: <20231201153923.3433110-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ba?=
 =?utf-8?q?ckport_fbdev_Xe_preparation_patches_from_drm-tip_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Backport fbdev Xe preparation patches from drm-tip (rev2)
URL   : https://patchwork.freedesktop.org/series/127203/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7bfd4f02e014824d6b434a45210fa6a39584fa44
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Dec 1 17:39:23 2023 +0200

    drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev
    
    We are preparing for Xe driver. I915 and Xe object implementation are
    differing. Do not use  i915_gem_object->base directly. Instead use
    intel_bo_to_drm_bo.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20231115090719.3210079-3-jouni.hogander@intel.com
    (cherry picked from commit c952bf11ace50b03fce14dbc15a092fdc9a6d2c8)
+ /mt/dim checkpatch 38dc2e0d8c28a817f2c727402e2638f3ea2accb4 drm-intel
7f41ac428 Revert "drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '866520a50df6c22a2af9254e39770517cb874495', maybe rebased or not pulled?
#10: 
This reverts commit 866520a50df6c22a2af9254e39770517cb874495.

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
c9872971d Revert "drm/i915/display: split i915 specific code from intel_fbdev"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3e093151b1d4a8fb8ea066980920e180746c0ade', maybe rebased or not pulled?
#10: 
This reverts commit 3e093151b1d4a8fb8ea066980920e180746c0ade.

-:206: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#206: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 172 lines checked
26958e710 drm/i915/display: split i915 specific code from intel_fbdev
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:150: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#150: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:192:
+		intel_fb = ifbdev->fb = to_intel_framebuffer(fb);

-:207: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#207: 
new file mode 100644

-:212: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_fbdev_fb.c', please use '//' instead
#212: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.c:1:
+/* SPDX-License-Identifier: MIT */

-:212: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#212: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.c:1:
+/* SPDX-License-Identifier: MIT */

total: 0 errors, 3 warnings, 1 checks, 308 lines checked
7bfd4f02e drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev


