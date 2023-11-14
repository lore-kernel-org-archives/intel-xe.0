Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80298C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 14:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441A910E3AF;
	Tue, 14 Nov 2023 14:30:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 189DF10E3AF;
 Tue, 14 Nov 2023 14:30:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F1559AADE8;
 Tue, 14 Nov 2023 14:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Tue, 14 Nov 2023 14:30:08 -0000
Message-ID: <169997220898.29256.12263379736072902630@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_In?=
 =?utf-8?q?tel=5Ffbdev=2Ec_refactoring_=28rev2=29?=
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

Series: Intel_fbdev.c refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/126390/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 100318088cb8d12c379deb2e2ab953bf75e9e077
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Nov 14 15:04:43 2023 +0200

    drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev
    
    We are preparing for Xe driver. I915 and Xe object implementation are
    differing. Do not use  i915_gem_object->base directly. Instead use
    intel_bo_to_drm_bo.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 7dc3dda9b2df5a5c8949532f254a0689de70f093 drm-intel
8d1b0f72c Revert "FIXME: drm/i915/display: Allow fbdev to allocate stolen memory"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a3cd4a944a2dcd58a46a7e62d834fbdbbd4e49ed', maybe rebased or not pulled?
#10: 
This reverts commit a3cd4a944a2dcd58a46a7e62d834fbdbbd4e49ed.

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
c0fb1469f fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
839c65cec drm/i915/display: split i915 specific code from intel_fbdev
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:149: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#149: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:192:
+		intel_fb = ifbdev->fb = fb;

-:206: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#206: 
new file mode 100644

-:333: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_fbdev_fb.h', please use '/*' instead
#333: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.h:1:
+// SPDX-License-Identifier: MIT

-:333: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#333: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 1 checks, 309 lines checked
6e7b2cb19 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:31: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#31: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:1:
+#include <drm/drm_fb_helper.h>

-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+			 struct drm_fb_helper_surface_size *sizes)

-:78: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#78: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:48:
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));

-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:52:
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
+					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |

-:83: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:53:
+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |

-:107: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#107: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:77:
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			      struct drm_i915_gem_object *obj, struct i915_vma *vma)

-:154: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#154: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.h:17:
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+			 struct drm_fb_helper_surface_size *sizes);

-:156: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#156: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.h:19:
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			      struct drm_i915_gem_object *obj, struct i915_vma *vma);

total: 0 errors, 4 warnings, 5 checks, 129 lines checked
62f9024d1 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
32acfaa39 fixup! drm/xe/display: Implement display support
-:37: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#37: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:1:
+#ifndef _I915_GEM_STOLEN_H_

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
0cc27db31 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
fd614bf56 fixup! drm/xe/display: Implement display support
100318088 drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev


