Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFC0D64062
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 06:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31110E15C;
	Wed, 17 Dec 2025 06:46:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4CE10E092;
 Wed, 17 Dec 2025 06:46:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Make_Display_free_from_i?=
 =?utf-8?q?915=5Freg=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 06:46:34 -0000
Message-ID: <176595399436.96411.276880918874186512@a3b018990fe9>
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

+ trap cleanup EXIT
+ KERNEL=/kernel
+ MT=/root/linux/maintainer-tools
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
Cloning into '/root/linux/maintainer-tools'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ make -C /root/linux/maintainer-tools
make: Entering directory '/root/linux/maintainer-tools'
cc -O2 -g -Wextra -o remap-log remap-log.c
make: Leaving directory '/root/linux/maintainer-tools'
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ /root/linux/maintainer-tools/dim sparse --fast 2eb2f8746a879f1c0e4c56b715c179424dafd8e0
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/display/g4x_dp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/g4x_hdmi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/i9xx_wm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_combo_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_crt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_cx0_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_device.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_irq.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_display_power_map.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_power_well.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_hdcp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpio_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpll.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpll_mgr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_mst.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpt_common.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_test.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_drrs.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dsb.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dsi_vbt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dvo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fbc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_fifo_underrun.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_gmbus.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hdmi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lspcon.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_setup.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_overlay.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pch_display.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pch_refclk.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pfit.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pipe_crc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pmdemand.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_sdvo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_snps_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_tv.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vblank.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vrr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/skl_scaler.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/skl_universal_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/gt/intel_reset.c:1569:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:193:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_gpu_error.c:692:3: warning: symbol 'guc_hw_reg_state' was not declared. Should it be static?
+drivers/gpu/drm/i915/i915_irq.c:467:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:467:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:475:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:475:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:518:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:518:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:526:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:526:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:575:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:575:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:578:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:578:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:582:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:582:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/intel_uncore.c:1930:1: warning: context imbalance in 'fwtable_read8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1931:1: warning: context imbalance in 'fwtable_read16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1932:1: warning: context imbalance in 'fwtable_read32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1933:1: warning: context imbalance in 'fwtable_read64' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1998:1: warning: context imbalance in 'gen6_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1999:1: warning: context imbalance in 'gen6_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2000:1: warning: context imbalance in 'gen6_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2020:1: warning: context imbalance in 'fwtable_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2021:1: warning: context imbalance in 'fwtable_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2022:1: warning: context imbalance in 'fwtable_write32' - unexpected unlock
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


