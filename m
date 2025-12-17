Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D9FD64077
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 06:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882AB10E19C;
	Wed, 17 Dec 2025 06:26:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CC210EB5B;
 Wed, 17 Dec 2025 06:26:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_Display_free_from_i9?=
 =?utf-8?q?15=5Freg=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 06:26:24 -0000
Message-ID: <176595278439.96412.15926656077356361969@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217062209.852324-1-uma.shankar@intel.com>
In-Reply-To: <20251217062209.852324-1-uma.shankar@intel.com>
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

Series: Make Display free from i915_reg.h
URL   : https://patchwork.freedesktop.org/series/159130/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f183716025ad09ab677d08b46ac3f748049b691c
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Wed Dec 17 11:52:09 2025 +0530

    drm/{i915, xe}: Removed i915_reg.h from display
    
    Make display files free from including i915_reg.h.
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 2eb2f8746a879f1c0e4c56b715c179424dafd8e0 drm-intel
9ad12c7fa9d3 drm/{i915, xe}: Extract common registers into a separate file
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

-:74: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#74: FILE: include/drm/intel/intel_gmd_common_regs.h:13:
+#define   TRANS_CHICKEN2_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANS_CHICKEN2_FRAME_START_DELAY_MASK, (x)) /* 0-3 */

total: 0 errors, 2 warnings, 0 checks, 50 lines checked
753edd94e038 drm/{i915, xe}: Extract South chicken registers
cbd55bb40782 drm/{i915, xe}: Extract display interrupt definitions
-:52: CHECK:LINE_SPACING: Please don't use multiple blank lines
#52: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1369:
+
+

total: 0 errors, 0 warnings, 1 checks, 88 lines checked
7b1300b97fe1 drm/{i915, xe}: Extract DSPCLK_GATE_D
c36489116648 drm/{i915, xe}: Extract pcode definitions
-:191: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#191: FILE: include/drm/intel/intel_gmd_common_regs.h:139:
+#define   DISPLAY_TO_PCODE_PIPE_COUNT(x)	REG_FIELD_PREP(DISPLAY_TO_PCODE_PIPE_COUNT_MASK, (x))

-:219: ERROR:CODE_INDENT: code indent should use tabs where possible
#219: FILE: include/drm/intel/intel_gmd_common_regs.h:167:
+            /* See also IPS_CTL */$

total: 1 errors, 1 warnings, 0 checks, 221 lines checked
b0c38f023894 drm/{i915, xe}: Remove i915_reg.h from intel_display_device.c
84db1ed76918 drm/{i915, xe}: Remove i915_reg.h from intel_dram.c
66fdc87f7e27 drm/{i915, xe}: Removed i915_reg.h from intel_display.c
3ad63a27f4fe drm/{i915, xe}: Remove i915_reg.h from intel_overlay.c
5868b3e36460 drm/{i915, xe}: Remove i915_reg.h from g4x_dp.c
00187d159475 drm/{i915, xe}: Remove i915_reg.h from i9xx_wm.c
-:99: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#99: FILE: include/drm/intel/intel_gmd_common_regs.h:275:
+#define   INSTPM_AGPBUSY_INT_EN (1 << 11) /* gen3: when disabled, pending interrupts
+					will not assert AGPBUSY# and will only

-:100: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#100: FILE: include/drm/intel/intel_gmd_common_regs.h:276:
+					be delivered when out of C3. */

total: 0 errors, 2 warnings, 0 checks, 74 lines checked
cdf3d85164be drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
ac94949407c3 drm/{i915, xe}: Remove i915_reg.h from intel_rom.c
1bf5225d739c drm/{i915, xe}: Remove i915_reg.h from intel_psr.c
76cf1faf87ba drm/{i915, xe}: Remove i915_reg.h from intel_fifo_underrun.c
e3727aaae98d drm/{i915, xe}: Remove i915_reg.h from intel_display_irq.c
-:205: CHECK:LINE_SPACING: Please don't use multiple blank lines
#205: FILE: include/drm/intel/intel_gmd_common_regs.h:381:
+
+

total: 0 errors, 0 warnings, 1 checks, 194 lines checked
04349bae6aa4 drm/{i915, xe}: Remove i915_reg.h from intel_display_power_well.c
fd6451b235b7 drm/{i915, xe}: Remove i915_reg.h from intel_modeset_setup.c
f183716025ad drm/{i915, xe}: Removed i915_reg.h from display


