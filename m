Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E76C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 01:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9010810E9CA;
	Fri,  8 Dec 2023 01:11:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A778410E9CA;
 Fri,  8 Dec 2023 01:11:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A3E18A7DFF;
 Fri,  8 Dec 2023 01:11:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel=5Ffb=2Ec_refactorin?=
 =?utf-8?q?g_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Fri, 08 Dec 2023 01:11:51 -0000
Message-ID: <170199791166.7324.4399496324320411783@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
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

Series: Intel_fb.c refactoring (rev8)
URL   : https://patchwork.freedesktop.org/series/126505/
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
commit 10c37abd497768add32deaa8de6a902e461e236c
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Dec 7 17:58:15 2023 +0200

    fixup! drm/xe/display: Implement display support
    
    Add Xe specific code for intel_fb.c
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
52f7eecf7 Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '14d1d786caacdb3438d07ab86fabf2e36c8151cc', maybe rebased or not pulled?
#10: 
This reverts commit 14d1d786caacdb3438d07ab86fabf2e36c8151cc.

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
a4ff04769 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
a2f5c4fc1 drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
0b92fb6ce drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
7a4e263a8 drm/i915/display: Handle invalid fb_modifier in intel_fb_modifier_to_tiling
24101b86c drm/i915/display: Split i915 specific code away from intel_fb.c
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:177: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#177: 
new file mode 100644

-:182: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_fb_bo.c', please use '//' instead
#182: FILE: drivers/gpu/drm/i915/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

-:182: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#182: FILE: drivers/gpu/drm/i915/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

total: 0 errors, 3 warnings, 0 checks, 239 lines checked
91000d732 drm/i915/display: Add intel_fb_bo_framebuffer_fini
-:28: WARNING:BAD_SIGN_OFF: Duplicate signature
#28: 
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 121 lines checked
d6db4357b fixup! drm/xe/display: Implement display support
10c37abd4 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:33: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/display/intel_fb_bo.c', please use '//' instead
#33: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

-:33: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#33: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

total: 0 errors, 3 warnings, 0 checks, 105 lines checked


