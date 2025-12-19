Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DA2D74961
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 07:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA27210ED35;
	Fri, 19 Dec 2025 07:36:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FC710ECBE;
 Fri, 19 Dec 2025 07:35:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm=3A_Color_pipeline_te?=
 =?utf-8?q?ardown_and_follow-up_fixes/improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 07:35:59 -0000
Message-ID: <176612975948.104675.3461671667863381077@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

Series: drm: Color pipeline teardown and follow-up fixes/improvements
URL   : https://patchwork.freedesktop.org/series/159263/
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
+ /root/linux/maintainer-tools/dim sparse --fast 515e6667d13b3a1ea3192f275982df95854ac89b
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/display/drm_dp_helper.c:1979:1: error: bad constant expression
+drivers/gpu/drm/display/drm_dp_helper.c:1980:1: error: bad constant expression
+drivers/gpu/drm/display/drm_dp_helper.c:2144:1: error: bad constant expression
+drivers/gpu/drm/display/drm_dp_helper.c:2145:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1604:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1605:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1606:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1606:1: error: bad constant expression
+drivers/gpu/drm/drm_drv.c:60:1: error: bad constant expression
+drivers/gpu/drm/drm_drv.c:61:1: error: bad constant expression
+drivers/gpu/drm/drm_drv.c:62:1: error: bad constant expression
+drivers/gpu/drm/drm_drv.c:62:1: error: bad constant expression
+drivers/gpu/drm/drm_probe_helper.c:68:1: error: bad constant expression
+drivers/gpu/drm/drm_simple_kms_helper.c:457:1: error: bad constant expression
+drivers/gpu/drm/drm_simple_kms_helper.c:458:1: error: bad constant expression
+drivers/gpu/drm/drm_simple_kms_helper.c:458:1: error: bad constant expression
+drivers/gpu/drm/i915/display/dvo_ch7017.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/dvo_ch7xxx.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/dvo_ivch.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/dvo_ns2501.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/dvo_sil164.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/dvo_tfp410.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/g4x_dp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/g4x_hdmi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/hsw_ips.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/i9xx_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/i9xx_wm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/icl_dsi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_dsi.h):
+drivers/gpu/drm/i915/display/intel_acpi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_atomic.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_audio.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_backlight.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_bios.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_bw.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_casf.c:147:21: error: too long token expansion
+drivers/gpu/drm/i915/display/intel_casf.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_color.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_colorop.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_colorop.h):
+drivers/gpu/drm/i915/display/intel_combo_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_connector.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_crtc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_crt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_crtc_state_dump.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_cursor.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_cx0_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dbuf_bw.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_debugfs.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_device.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_driver.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_irq.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_display_power.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_power_map.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_power_well.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_reset.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dmc.c:131:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:134:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:137:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:140:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:143:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:146:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:149:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:153:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:154:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:157:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:160:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:163:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:166:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:170:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:174:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:178:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:182:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c:186:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_dmc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_aux.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_hdcp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpio_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_link_training.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpll.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpll_mgr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_mst.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpt_common.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dp_test.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_drrs.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dsb.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dsi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_dsi.h):
+drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dsi_vbt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dvo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_encoder.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fb_bo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fbc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_fb.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fb_pin.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fdi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fifo_underrun.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_flipq.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_frontbuffer.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_global_state.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_gmbus.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hdmi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hotplug.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_hotplug_irq.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_link_bw.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_load_detect.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lspcon.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lt_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lvds.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_lock.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_setup.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_verify.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_opregion.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_overlay.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_panel.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pch_display.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pch_refclk.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pfit.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pipe_crc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_colorop.h):
+drivers/gpu/drm/i915/display/intel_plane_initial.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pmdemand.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_quirks.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_sdvo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_snps_phy.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_sprite.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_sprite_uapi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_tc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_tv.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vblank.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vdsc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vga.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_vrr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_wm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/skl_prefill.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/skl_scaler.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/skl_universal_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/skl_watermark.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/vlv_clock.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/vlv_dsi.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/vlv_dsi_pll.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/vlv_sideband.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/gem/i915_gem_pages.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/i915_panic.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/virtio/virtgpu_drv.c:217:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:218:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:218:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:219:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:220:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:221:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:52:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:53:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_object.c:34:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_prime.c:30:1: error: bad constant expression
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


