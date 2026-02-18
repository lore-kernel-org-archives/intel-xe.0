Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21E5E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 18:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD6C10E053;
	Wed, 18 Feb 2026 18:26:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ADC10E053;
 Wed, 18 Feb 2026 18:26:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/overlay=3A_Conv?=
 =?utf-8?q?ert_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 18:26:58 -0000
Message-ID: <177143921801.262680.12087292913120771255@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/overlay: Convert to parent interface
URL   : https://patchwork.freedesktop.org/series/161766/
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
+ /root/linux/maintainer-tools/dim sparse --fast 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/display/g4x_dp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/g4x_hdmi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/i9xx_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/i9xx_wm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/icl_dsi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_dsi.h):
+drivers/gpu/drm/i915/display/intel_backlight.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_casf.c:152:21: error: too long token expansion
+drivers/gpu/drm/i915/display/intel_casf.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_combo_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_crt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_cx0_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_debugfs.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_device.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_power_map.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dmc.c:130:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:133:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:136:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:139:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:142:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:145:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:148:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:152:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:153:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:156:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:159:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:162:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:165:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:169:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:173:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:177:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:181:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:185:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_hdcp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpio_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpll.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpll_mgr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_mst.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpt_common.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_test.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_drrs.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dsi_vbt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dvo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fb_bo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fb_pin.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fdi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fifo_underrun.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_hdmi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hotplug_irq.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lspcon.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_setup.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_parent.c:128:31:    expected void [noderef] __iomem *
+drivers/gpu/drm/i915/display/intel_parent.c:128:31:    got void *
+drivers/gpu/drm/i915/display/intel_parent.c:128:31: warning: incorrect type in return expression (different address spaces)
+drivers/gpu/drm/i915/display/intel_pch_display.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pch_refclk.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pfit.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pmdemand.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_sdvo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_snps_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_tc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_tv.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vblank.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vrr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/skl_scaler.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/vlv_dsi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:18:1: error: bad constant expression
+drivers/gpu/drm/i915/gem/i915_gem_pages.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/gt/intel_sseu.c:600:17: error: too long token expansion
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
+drivers/gpu/drm/i915/i915_active.c:1062:16: warning: context imbalance in '__i915_active_fence_set' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    expected struct list_head const *list
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    got struct list_head [noderef] __rcu *pos
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/i915_mitigations.c:133:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:125:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:126:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:128:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:129:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:129:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_overlay.c:459:31:    expected void [noderef] __iomem *
+drivers/gpu/drm/i915/i915_overlay.c:459:31:    got void *
+drivers/gpu/drm/i915/i915_overlay.c:459:31: warning: incorrect type in return expression (different address spaces)
+drivers/gpu/drm/i915/i915_overlay.c:463:31:    expected void [noderef] __iomem *
+drivers/gpu/drm/i915/i915_overlay.c:463:31:    got void *
+drivers/gpu/drm/i915/i915_overlay.c:463:31: warning: incorrect type in return expression (different address spaces)
+drivers/gpu/drm/i915/i915_overlay.c:474:31:    expected void [noderef] __iomem *
+drivers/gpu/drm/i915/i915_overlay.c:474:31:    got void *
+drivers/gpu/drm/i915/i915_overlay.c:474:31: warning: incorrect type in return expression (different address spaces)
+drivers/gpu/drm/i915/i915_params.c:100:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:100:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:104:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:104:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:107:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:107:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:110:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:110:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:119:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:119:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:123:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:123:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:125:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:125:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:66:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:66:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:69:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:69:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:73:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:73:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:79:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:79:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:84:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:84:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:88:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:88:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:91:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:91:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:95:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:95:1: error: bad constant expression
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
+drivers/gpu/drm/i915/intel_wakeref.c:148:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock
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
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


