Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE3C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 12:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FD810E395;
	Mon,  5 Jan 2026 12:41:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755710E330;
 Mon,  5 Jan 2026 12:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/display=3A_Fix_?=
 =?utf-8?q?the_SPDX_license_identifier_for_C_headers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Jan 2026 12:41:05 -0000
Message-ID: <176761686509.125838.6264369622181845212@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/display: Fix the SPDX license identifier for C headers
URL   : https://patchwork.freedesktop.org/series/159641/
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
+ /root/linux/maintainer-tools/dim sparse --fast f5136cded03e959ebb00a1160e5f00973c38007e
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
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
+drivers/gpu/drm/i915/display/intel_color_pipeline.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
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
+drivers/gpu/drm/i915/display/intel_display_params.c:102:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:102:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:105:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:105:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:108:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:108:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:111:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:111:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:114:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:114:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:118:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:118:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:123:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:123:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:126:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:126:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:132:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:132:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:137:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:137:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:35:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:35:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:39:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:39:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:42:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:42:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:46:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:46:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:50:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:50:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:54:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:54:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:59:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:59:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:62:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:62:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:65:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:65:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:68:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:68:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:71:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:71:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:75:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:75:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:77:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:77:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:85:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:85:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:90:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:90:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:94:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:94:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:98:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_params.c:98:1: error: bad constant expression
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
+drivers/gpu/drm/i915/display/intel_initial_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_link_bw.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_load_detect.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lspcon.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_lvds.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_setup.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_modeset_verify.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_opregion.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_overlay.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_panel.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pch_display.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pch_refclk.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pfit.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_pipe_crc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
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


