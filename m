Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EB3C44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555810E8A0;
	Wed, 21 Jan 2026 23:56:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA4810E8A0;
 Wed, 21 Jan 2026 23:56:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_Display_free_from_i9?=
 =?utf-8?q?15=5Freg=2Eh_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 23:56:52 -0000
Message-ID: <176903981265.180247.9172497753471139254@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121232414.707192-1-uma.shankar@intel.com>
In-Reply-To: <20260121232414.707192-1-uma.shankar@intel.com>
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

Series: Make Display free from i915_reg.h (rev2)
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
commit 61042b4f7b8e895433d620cf513360872c08ecdc
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Thu Jan 22 04:54:14 2026 +0530

    drm/{i915, xe}: Remove i915_reg.h from display
    
    Make display files free from including i915_reg.h.
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch ad2a046603cba140214aed34015ed5027441e85a drm-intel
0675804ceab4 drm/{i915, xe}: Extract display registers from i915_reg.h to display
-:32: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2030:
+#define   TRANS_CHICKEN2_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANS_CHICKEN2_FRAME_START_DELAY_MASK, (x)) /* 0-3 */

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
e419f0f65808 drm/{i915, xe}: Extract South chicken registers from i915_reg.h to display
c800a061bf31 drm/{i915, xe}: Extract display interrupt definitions
-:52: CHECK:LINE_SPACING: Please don't use multiple blank lines
#52: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1369:
+
+

total: 0 errors, 0 warnings, 1 checks, 88 lines checked
9d06eb81fff4 drm/{i915, xe}: Extract DSPCLK_GATE_D from i915_reg to display
8cdf78ea11f5 drm/{i915, xe}: Extract pcode definitions to common header
-:150: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#150: 
new file mode 100644

-:207: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#207: FILE: include/drm/intel/intel_gmd_common_regs.h:53:
+#define   DISPLAY_TO_PCODE_PIPE_COUNT(x)	REG_FIELD_PREP(DISPLAY_TO_PCODE_PIPE_COUNT_MASK, (x))

total: 0 errors, 2 warnings, 0 checks, 231 lines checked
34b6f3381439 drm/{i915, xe}: Remove i915_reg.h from intel_display_device.c
b450da3f4328 drm/{i915, xe}: Remove i915_reg.h from intel_dram.c
9959e6d10976 drm/{i915, xe}: Removed i915_reg.h from intel_display.c
5994ff8d2122 drm/{i915, xe}: Remove i915_reg.h from intel_overlay.c
596963c79c89 drm/{i915, xe}: Remove i915_reg.h from g4x_dp.c
a83d323eb3a8 drm/{i915, xe}: Remove i915_reg.h from i9xx_wm.c
-:98: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#98: FILE: include/drm/intel/intel_gmd_common_regs.h:166:
+#define   INSTPM_AGPBUSY_INT_EN (1 << 11) /* gen3: when disabled, pending interrupts
+					will not assert AGPBUSY# and will only

-:99: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#99: FILE: include/drm/intel/intel_gmd_common_regs.h:167:
+					be delivered when out of C3. */

total: 0 errors, 2 warnings, 0 checks, 73 lines checked
021bba3cdf84 drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
261ade0a4f2b drm/{i915, xe}: Remove i915_reg.h from intel_rom.c
216d06fda909 drm/{i915, xe}: Remove i915_reg.h from intel_psr.c
47ebbb5664f8 drm/{i915, xe}: Remove i915_reg.h from intel_fifo_underrun.c
a9f979136fc9 drm/{i915, xe}: Remove i915_reg.h from intel_display_irq.c
-:204: CHECK:LINE_SPACING: Please don't use multiple blank lines
#204: FILE: include/drm/intel/intel_gmd_common_regs.h:224:
+
+

total: 0 errors, 0 warnings, 1 checks, 193 lines checked
513c37c47cb3 drm/{i915, xe}: Remove i915_reg.h from intel_display_power_well.c
2c5ec47e0704 drm/{i915, xe}: Remove i915_reg.h from intel_modeset_setup.c
61042b4f7b8e drm/{i915, xe}: Remove i915_reg.h from display


