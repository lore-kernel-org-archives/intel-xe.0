Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C93EC1E94
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 10:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E806A10E83C;
	Thu,  5 Feb 2026 10:22:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646FD10E834;
 Thu,  5 Feb 2026 10:22:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_Display_free_from_i9?=
 =?utf-8?q?15=5Freg=2Eh_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 10:22:19 -0000
Message-ID: <177028693939.228132.3304969367575720384@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205094341.1882816-1-uma.shankar@intel.com>
In-Reply-To: <20260205094341.1882816-1-uma.shankar@intel.com>
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

Series: Make Display free from i915_reg.h (rev4)
URL   : https://patchwork.freedesktop.org/series/159130/
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
commit 1a49bad26f5f6d30dde8e6d6203535feb05c1f7f
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Thu Feb 5 15:13:41 2026 +0530

    drm/{i915, xe}: Remove i915_reg.h from display
    
    Make display files free from including i915_reg.h.
    
    v2: Move pcode_regs.h out of i915_reg.h (Jani)
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 05230cfcdb1abc225c8e085cd4de470c4b97232f drm-intel
2a4826cf215a drm/i915: Extract display registers from i915_reg.h to display
-:36: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2030:
+#define   TRANS_CHICKEN2_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANS_CHICKEN2_FRAME_START_DELAY_MASK, (x)) /* 0-3 */

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
7d8a20e53a88 drm/i915: Extract South chicken registers from i915_reg.h to display
9ba16c81c230 drm/i915: Extract display interrupt definitions
6919da50353b drm/i915: Extract DSPCLK_GATE_D from i915_reg to display
79b340b75753 drm/{i915, xe}: Extract pcode definitions to common header
-:354: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#354: 
new file mode 100644

-:411: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#411: FILE: include/drm/intel/intel_pcode_regs.h:53:
+#define   DISPLAY_TO_PCODE_PIPE_COUNT(x)	REG_FIELD_PREP(DISPLAY_TO_PCODE_PIPE_COUNT_MASK, (x))

total: 0 errors, 2 warnings, 0 checks, 347 lines checked
6bc40b39b659 drm/i915: Remove i915_reg.h from intel_display_device.c
65512718ae06 drm/i915: Move GMD_ID and mask to intel_gt header
b2e99d1bfea6 drm/i915: Remove i915_reg.h from intel_dram.c
2586a24df58e drm/i915: Remove i915_reg.h from intel_display.c
3b912b0ccb0f drm/i915: Remove i915_reg.h from intel_overlay.c
-:153: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#153: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
365bc1a9a7c4 drm/i915: Remove i915_reg.h from g4x_dp.c
7ca91b3fe48b drm/i915: Remove i915_reg.h from i9xx_wm.c
-:199: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#199: 
new file mode 100644

-:218: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#218: FILE: include/drm/intel/intel_gmd_misc_regs.h:15:
+#define   INSTPM_AGPBUSY_INT_EN (1 << 11) /* gen3: when disabled, pending interrupts
+					will not assert AGPBUSY# and will only

-:219: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#219: FILE: include/drm/intel/intel_gmd_misc_regs.h:16:
+					be delivered when out of C3. */

total: 0 errors, 3 warnings, 0 checks, 141 lines checked
d2e95ff93f8a drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
ce831c672ba4 drm/i915: Remove i915_reg.h from intel_rom.c
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

-:23: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#23: FILE: drivers/gpu/drm/i915/display/intel_oprom_regs.h:1:
+/*

total: 0 errors, 2 warnings, 0 checks, 61 lines checked
3855b610a010 drm/i915: Remove i915_reg.h from intel_psr.c
f22b61f48ddf drm/i915: Remove i915_reg.h from intel_fifo_underrun.c
6926cc2c025c drm/i915: Remove i915_reg.h from intel_display_irq.c
a008bd9b978f drm/i915: Remove i915_reg.h from intel_display_power_well.c
338a78224354 drm/i915: Remove i915_reg.h from intel_modeset_setup.c
1a49bad26f5f drm/{i915, xe}: Remove i915_reg.h from display


