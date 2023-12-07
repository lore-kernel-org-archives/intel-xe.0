Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C73C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FA810E7DE;
	Thu,  7 Dec 2023 05:26:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61B8D10E7E2;
 Thu,  7 Dec 2023 05:26:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5E9D2AADEA;
 Thu,  7 Dec 2023 05:26:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Thu, 07 Dec 2023 05:26:11 -0000
Message-ID: <170192677138.28721.8425565221716206086@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207052252.2092191-1-jouni.hogander@intel.com>
In-Reply-To: <20231207052252.2092191-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_In?=
 =?utf-8?q?tel=5Ffb=2Ec_refactoring_=28rev7=29?=
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

Series: Intel_fb.c refactoring (rev7)
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
commit 4f45bfb3bb0cde71ef8c3f36366881b716a8150c
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Dec 7 07:22:52 2023 +0200

    fixup! drm/xe/display: Implement display support
    
    Add Xe specific code for intel_fb.c
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 668d13abebbbc3812de86be1f8477475e1d90728 drm-intel
9017fcf73 Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '14d1d786caacdb3438d07ab86fabf2e36c8151cc', maybe rebased or not pulled?
#10: 
This reverts commit 14d1d786caacdb3438d07ab86fabf2e36c8151cc.

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
06c2084d9 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
11cce8f2c drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
30cfda290 drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
62c04f6a8 drm/i915/display: Handle invalid fb_modifier in intel_fb_modifier_to_tiling
39dd47ebd drm/i915/display: Split i915 specific code away from intel_fb.c
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:175: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#175: 
new file mode 100644

-:180: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_fb_bo.c', please use '//' instead
#180: FILE: drivers/gpu/drm/i915/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

-:180: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#180: FILE: drivers/gpu/drm/i915/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

total: 0 errors, 3 warnings, 0 checks, 239 lines checked
744e7938a drm/i915/display: Add intel_fb_bo_framebuffer_fini
16c8f4126 fixup! drm/xe/display: Implement display support
4f45bfb3b fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:31: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/display/intel_fb_bo.c', please use '//' instead
#31: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

-:31: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#31: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:1:
+/* SPDX-License-Identifier: MIT */

total: 0 errors, 3 warnings, 0 checks, 105 lines checked


