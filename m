Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7514DD73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 21:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02010E92A;
	Thu, 29 Jan 2026 21:07:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373E310E8E6;
 Thu, 29 Jan 2026 21:07:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_Display_free_from_i9?=
 =?utf-8?q?15=5Freg=2Eh_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 21:07:04 -0000
Message-ID: <176972082422.207735.7898115269405271359@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129211358.1240283-1-uma.shankar@intel.com>
In-Reply-To: <20260129211358.1240283-1-uma.shankar@intel.com>
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

Series: Make Display free from i915_reg.h (rev3)
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
commit 899c000b99cdda0365b2f6085d85a9329632faba
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Fri Jan 30 02:43:58 2026 +0530

    drm/{i915, xe}: Remove i915_reg.h from display
    
    Make display files free from including i915_reg.h.
    
    v2: Include modular per component headers (Jani)
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch bd9c2b8a3a5b7bd8c38108929bfabd7a40dc922b drm-intel
5fda81c2af1f drm/i915: Extract display registers from i915_reg.h to display
-:36: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2030:
+#define   TRANS_CHICKEN2_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANS_CHICKEN2_FRAME_START_DELAY_MASK, (x)) /* 0-3 */

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
0aecd5769cd7 drm/i915: Extract South chicken registers from i915_reg.h to display
8c53cb92ba4e drm/i915: Extract display interrupt definitions
0c70b3b905b6 drm/i915: Extract DSPCLK_GATE_D from i915_reg to display
6c0c48442ac5 drm/{i915, xe}: Extract pcode definitions to common header
-:152: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#152: 
new file mode 100644

-:209: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#209: FILE: include/drm/intel/intel_pcode.h:53:
+#define   DISPLAY_TO_PCODE_PIPE_COUNT(x)	REG_FIELD_PREP(DISPLAY_TO_PCODE_PIPE_COUNT_MASK, (x))

total: 0 errors, 2 warnings, 0 checks, 231 lines checked
eb932927e5c1 drm/i915: Remove i915_reg.h from intel_display_device.c
a57d529fa014 drm/i915: Remove i915_reg.h from intel_dram.c
a9bb8b7d1c87 drm/i915: Remove i915_reg.h from intel_display.c
f38f201602de drm/i915: Remove i915_reg.h from intel_overlay.c
-:150: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#150: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
101c0d55ecd3 drm/i915: Remove i915_reg.h from g4x_dp.c
b55f967f9b6a drm/i915: Remove i915_reg.h from i9xx_wm.c
-:104: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#104: 
new file mode 100644

-:123: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#123: FILE: include/drm/intel/intel_gmd_misc_regs.h:15:
+#define   INSTPM_AGPBUSY_INT_EN (1 << 11) /* gen3: when disabled, pending interrupts
+					will not assert AGPBUSY# and will only

-:124: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#124: FILE: include/drm/intel/intel_gmd_misc_regs.h:16:
+					be delivered when out of C3. */

total: 0 errors, 3 warnings, 0 checks, 91 lines checked
7ba3665c0e9c drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
18f52a56c7a5 drm/i915: Remove i915_reg.h from intel_rom.c
8cc5f02b26a6 drm/i915: Remove i915_reg.h from intel_psr.c
d6184898a4cd drm/i915: Remove i915_reg.h from intel_fifo_underrun.c
05530b931529 drm/i915: Remove i915_reg.h from intel_display_irq.c
d31faf5aa50c drm/i915: Remove i915_reg.h from intel_display_power_well.c
af6005da10dd drm/i915: Remove i915_reg.h from intel_modeset_setup.c
899c000b99cd drm/{i915, xe}: Remove i915_reg.h from display


