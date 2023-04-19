Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6858BC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBDE10E972;
	Wed, 19 Apr 2023 12:40:02 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3DC10E972
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681907999; x=1713443999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbRBmJdW+TxMmgdPUH609tVEAawaEWUiayN9M8T6hx8=;
 b=TGxcyB/rgjMSKdPILc5yLZpbJkJ34BoVXUULgd/nxoKAFh69Bxm7RZEC
 bJYwlt53SPLoxokiLaVWlCa4o7zlUNvF3SG9n4VlgPUbzMYVIWI+G3b06
 v+/ROUCyWuEFiUe5Vw+ShGxJnLcQGTx5Fzs2gZk4U/S4J7lfmhVJkvM1W
 ghtmj9tGev7CPGa4a2ol5MzTy9NlSjiEge0WYWoVd5+fOBG+WIEusC/Vi
 LrIgsDYM+ABm/bTtSEZXa6SmxCH7CDiWPs1zEaSZEYjC+fEkf5Ayawpxf
 U6XMMkTm1+HqcfWH7e0dg1rvnkCS6t9FrMJ4+kN+GxvaM2Z6Q4EW5uhpj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189254"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189254"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802909744"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802909744"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:39:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:39 +0300
Message-Id: <20230419123947.543175-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/9] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Build the i915 display object files in i915-display sub-directory, to
increase clarity over what's coming from i915, and to simplify the rule
to build the object files.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 165 +++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index aceca651de57..9fa4aaad6b8f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -105,100 +105,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
 
-CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
+CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 
-$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
+# Rule to build display code shared with i915
+$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
-
-$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FORCE
-	$(call cmd,force_checksrc)
-	$(call if_changed_rule,cc_o_c)
-
-$(obj)/display/icl_dsi.o: $(srctree)/drivers/gpu/drm/i915/display/icl_dsi.c FORCE
-	$(call cmd,force_checksrc)
-	$(call if_changed_rule,cc_o_c)
-
-$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORCE
-	$(call cmd,force_checksrc)
-	$(call if_changed_rule,cc_o_c)
-
-# Display..
+# Display code specific to xe
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	xe_display.o \
-	display/icl_dsi.o \
-	display/intel_atomic.o \
-	display/intel_atomic_plane.o \
-	display/intel_audio.o \
-	display/intel_backlight.o \
-	display/intel_bios.o \
-	display/intel_bw.o \
-	display/intel_cdclk.o \
-	display/intel_color.o \
-	display/intel_combo_phy.o \
-	display/intel_connector.o \
-	display/intel_crtc_state_dump.o \
-	display/intel_crtc.o \
-	display/intel_cursor.o \
-	display/intel_ddi_buf_trans.o \
-	display/intel_ddi.o \
-	display/intel_display.o \
-	display/intel_display_debugfs.o \
-	display/intel_display_power.o \
-	display/intel_display_power_map.o \
-	display/intel_display_power_well.o \
-	display/intel_display_trace.o \
-	display/intel_dkl_phy.o \
-	display/intel_dmc.o \
-	display/intel_dp_aux_backlight.o \
-	display/intel_dp_aux.o \
-	display/intel_dp.o \
-	display/intel_dp_hdcp.o \
-	display/intel_dp_link_training.o \
-	display/intel_dp_mst.o \
-	display/intel_dpll.o \
-	display/intel_dpll_mgr.o \
-	display/intel_dpt.o \
-	display/intel_drrs.o \
-	display/intel_dsb.o \
-	display/intel_dsi.o \
-	display/intel_dsi_dcs_backlight.o \
-	display/intel_dsi_vbt.o \
-	display/intel_fb.o \
-	display/intel_fbc.o \
-	display/intel_fdi.o \
-	display/intel_fifo_underrun.o \
-	display/intel_frontbuffer.o \
-	display/intel_global_state.o \
-	display/intel_gmbus.o \
-	display/intel_hdcp.o \
-	display/intel_hdmi.o \
-	display/intel_hotplug.o \
-	display/intel_hti.o \
-	display/intel_lspcon.o \
-	display/intel_modeset_setup.o \
-	display/intel_modeset_verify.o \
-	display/intel_panel.o \
-	display/intel_pipe_crc.o \
-	display/intel_pps.o \
-	display/intel_psr.o \
-	display/intel_qp_tables.o \
-	display/intel_quirks.o \
-	display/intel_snps_phy.o \
-	display/intel_tc.o \
-	display/intel_vblank.o \
-	display/intel_vdsc.o \
-	display/intel_vga.o \
-	display/intel_vrr.o \
-	display/intel_wm.o \
 	display/xe_fb_pin.o \
 	display/xe_hdcp_gsc.o \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
-	display/skl_scaler.o \
-	display/skl_universal_plane.o \
-	display/skl_watermark.o \
 	display/ext/i915_irq.o \
 	display/ext/i9xx_wm.o \
 	display/ext/intel_device_info.o \
@@ -206,14 +126,85 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/ext/intel_pch.o \
 	display/ext/intel_pm.o
 
+# Display code shared with i915
+xe-$(CONFIG_DRM_XE_DISPLAY) += \
+	i915-display/icl_dsi.o \
+	i915-display/intel_atomic.o \
+	i915-display/intel_atomic_plane.o \
+	i915-display/intel_audio.o \
+	i915-display/intel_backlight.o \
+	i915-display/intel_bios.o \
+	i915-display/intel_bw.o \
+	i915-display/intel_cdclk.o \
+	i915-display/intel_color.o \
+	i915-display/intel_combo_phy.o \
+	i915-display/intel_connector.o \
+	i915-display/intel_crtc.o \
+	i915-display/intel_crtc_state_dump.o \
+	i915-display/intel_cursor.o \
+	i915-display/intel_ddi.o \
+	i915-display/intel_ddi_buf_trans.o \
+	i915-display/intel_display.o \
+	i915-display/intel_display_debugfs.o \
+	i915-display/intel_display_power.o \
+	i915-display/intel_display_power_map.o \
+	i915-display/intel_display_power_well.o \
+	i915-display/intel_display_trace.o \
+	i915-display/intel_dkl_phy.o \
+	i915-display/intel_dmc.o \
+	i915-display/intel_dp.o \
+	i915-display/intel_dp_aux.o \
+	i915-display/intel_dp_aux_backlight.o \
+	i915-display/intel_dp_hdcp.o \
+	i915-display/intel_dp_link_training.o \
+	i915-display/intel_dp_mst.o \
+	i915-display/intel_dpll.o \
+	i915-display/intel_dpll_mgr.o \
+	i915-display/intel_dpt.o \
+	i915-display/intel_drrs.o \
+	i915-display/intel_dsb.o \
+	i915-display/intel_dsi.o \
+	i915-display/intel_dsi_dcs_backlight.o \
+	i915-display/intel_dsi_vbt.o \
+	i915-display/intel_fb.o \
+	i915-display/intel_fbc.o \
+	i915-display/intel_fdi.o \
+	i915-display/intel_fifo_underrun.o \
+	i915-display/intel_frontbuffer.o \
+	i915-display/intel_global_state.o \
+	i915-display/intel_gmbus.o \
+	i915-display/intel_hdcp.o \
+	i915-display/intel_hdmi.o \
+	i915-display/intel_hotplug.o \
+	i915-display/intel_hti.o \
+	i915-display/intel_lspcon.o \
+	i915-display/intel_modeset_setup.o \
+	i915-display/intel_modeset_verify.o \
+	i915-display/intel_panel.o \
+	i915-display/intel_pipe_crc.o \
+	i915-display/intel_pps.o \
+	i915-display/intel_psr.o \
+	i915-display/intel_qp_tables.o \
+	i915-display/intel_quirks.o \
+	i915-display/intel_snps_phy.o \
+	i915-display/intel_tc.o \
+	i915-display/intel_vblank.o \
+	i915-display/intel_vdsc.o \
+	i915-display/intel_vga.o \
+	i915-display/intel_vrr.o \
+	i915-display/intel_wm.o \
+	i915-display/skl_scaler.o \
+	i915-display/skl_universal_plane.o \
+	i915-display/skl_watermark.o
+
 ifeq ($(CONFIG_ACPI),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
-		display/intel_acpi.o \
-		display/intel_opregion.o
+		i915-display/intel_acpi.o \
+		i915-display/intel_opregion.o
 endif
 
 ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
-	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
+	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
 endif
 
 obj-$(CONFIG_DRM_XE) += xe.o
-- 
2.39.2

