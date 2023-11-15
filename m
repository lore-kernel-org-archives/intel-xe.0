Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D76C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850010E4EA;
	Wed, 15 Nov 2023 06:52:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0823A10E4EA;
 Wed, 15 Nov 2023 06:52:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 05B9AAADF1;
 Wed, 15 Nov 2023 06:52:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 15 Nov 2023 06:52:55 -0000
Message-ID: <170003117502.647.11614323280375675095@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_In?=
 =?utf-8?q?tel=5Ffbdev=2Ec_refactoring_=28rev3=29?=
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

Series: Intel_fbdev.c refactoring (rev3)
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
commit 3c92ddc401310783abd31d3d986544903c246b76
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Nov 15 08:32:10 2023 +0200

    drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev
    
    We are preparing for Xe driver. I915 and Xe object implementation are
    differing. Do not use  i915_gem_object->base directly. Instead use
    intel_bo_to_drm_bo.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 2fe82053d916d09ffcc92bc27294c9eed4e4804b drm-intel
87e629ebd Revert "FIXME: drm/i915/display: Allow fbdev to allocate stolen memory"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a3cd4a944a2dcd58a46a7e62d834fbdbbd4e49ed', maybe rebased or not pulled?
#10: 
This reverts commit a3cd4a944a2dcd58a46a7e62d834fbdbbd4e49ed.

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
fe329badb fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
eb6ba154e drm/i915/display: split i915 specific code from intel_fbdev
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:151: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#151: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:192:
+		intel_fb = ifbdev->fb = fb;

-:208: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#208: 
new file mode 100644

-:333: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_fbdev_fb.h', please use '/*' instead
#333: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.h:1:
+// SPDX-License-Identifier: MIT

-:333: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#333: FILE: drivers/gpu/drm/i915/display/intel_fbdev_fb.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 1 checks, 307 lines checked
649be3ba6 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:36: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/display/intel_fbdev_fb.c', please use '//' instead
#36: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:1:
+/* SPDX-License-Identifier: MIT */

-:36: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#36: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:1:
+/* SPDX-License-Identifier: MIT */

-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:15:
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+			 struct drm_fb_helper_surface_size *sizes)

-:84: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#84: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:49:
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));

-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:53:
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
+					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |

-:89: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#89: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:54:
+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |

-:113: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#113: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:78:
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			      struct drm_i915_gem_object *obj, struct i915_vma *vma)

-:160: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#160: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.h:17:
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+			 struct drm_fb_helper_surface_size *sizes);

-:162: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#162: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.h:19:
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			      struct drm_i915_gem_object *obj, struct i915_vma *vma);

total: 0 errors, 5 warnings, 5 checks, 130 lines checked
4c6941e65 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
ab5486a21 fixup! drm/xe/display: Implement display support
-:38: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#38: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:1:
+#ifndef _I915_GEM_STOLEN_H_

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
dd1190cb2 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
eaa9115fe fixup! drm/xe/display: Implement display support
3c92ddc40 drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev


