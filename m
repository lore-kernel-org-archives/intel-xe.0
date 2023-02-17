Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA05C677F1
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B18D10E1AA;
	Fri, 17 Feb 2023 00:53:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24B610E3C1
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595186; x=1708131186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qpyb3b+ObNS9idp1TkhfG1xFQ1iZyfUBrRld7/RkNgU=;
 b=BPfC/gbF1FIXd4DCZ0DYmLLDZBhhsazkP/wesyQcoBkcZXOgema7h6Ra
 N9HnFZ9o9YwvTtMZ1ZXGd6+sKS/9uNxqLHRbPBdl9pi/naKBH8jcfsFbb
 ciBeHbJfuYkcKlPSxLcZqUb7j7PFixWByIhjdPyIf06lXdedUQHFc2wGg
 SWCWPrPW2YPj9n1w8Hp4LyH45lNsmICXkBRA/h2ss+f3hRM5j4DBLauK6
 2a4/7T/fxl/FDy9mC4IHLnG9AGHdOs4NwA3NPEZGYKIWHa6ZrL0ycThxg
 6pLIWMmG7IDu+rT9ds3ygtam31fBrK6vYmPnbsuC8RJUpcXMTVQxxyrkz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602211"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417806"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417806"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:26 -0800
Message-Id: <20230217005226.106499-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/11] drm/xe: Use relative includes for
 i915_reg_defs.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the goal of eliminating i915 includes from xe outside of the
display area, it's better to use relative includes for the only shared
header, i915_reg_defs.h.  With this the build system can be changed to
stop adding i915 as an include dir.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/Makefile      | 120 +++++++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h        |   2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h           |   2 +-
 drivers/gpu/drm/xe/xe_guc.c              |   2 -
 drivers/gpu/drm/xe/xe_guc_reg.h          |   2 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h     |   2 -
 drivers/gpu/drm/xe/xe_rtp.h              |   2 -
 drivers/gpu/drm/xe/xe_rtp_types.h        |   2 -
 10 files changed, 125 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/Makefile

diff --git a/drivers/gpu/drm/xe/display/Makefile b/drivers/gpu/drm/xe/display/Makefile
new file mode 100644
index 000000000000..eee576972427
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/Makefile
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -I$(srctree)/$(src)
+
+# i915 Display compat #defines and #includes
+subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
+	-I$(srctree)/drivers/gpu/drm/xe/display/ \
+	-I$(srctree)/drivers/gpu/drm/i915/display/ \
+	-I$(srctree)/drivers/gpu/drm/i915/ \
+	-DBUILD_FOR_XE=1 \
+	-Ddrm_i915_gem_object=xe_bo \
+	-Ddrm_i915_private=xe_device
+
+CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
+
+$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/display/icl_dsi.o: $(srctree)/drivers/gpu/drm/i915/display/icl_dsi.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
+# Display..
+xe-$(CONFIG_DRM_XE_DISPLAY) += \
+	xe_display.o \
+	display/icl_dsi.o \
+	display/intel_atomic.o \
+	display/intel_atomic_plane.o \
+	display/intel_audio.o \
+	display/intel_backlight.o \
+	display/intel_bios.o \
+	display/intel_bw.o \
+	display/intel_cdclk.o \
+	display/intel_color.o \
+	display/intel_combo_phy.o \
+	display/intel_connector.o \
+	display/intel_crtc_state_dump.o \
+	display/intel_crtc.o \
+	display/intel_cursor.o \
+	display/intel_ddi_buf_trans.o \
+	display/intel_ddi.o \
+	display/intel_display.o \
+	display/intel_display_debugfs.o \
+	display/intel_display_power.o \
+	display/intel_display_power_map.o \
+	display/intel_display_power_well.o \
+	display/intel_display_trace.o \
+	display/intel_dkl_phy.o \
+	display/intel_dmc.o \
+	display/intel_dp_aux_backlight.o \
+	display/intel_dp_aux.o \
+	display/intel_dp.o \
+	display/intel_dp_hdcp.o \
+	display/intel_dp_link_training.o \
+	display/intel_dpll.o \
+	display/intel_dpll_mgr.o \
+	display/intel_dp_mst.o \
+	display/intel_drrs.o \
+	display/intel_dsb.o \
+	display/intel_dsi.o \
+	display/intel_dsi_dcs_backlight.o \
+	display/intel_dsi_vbt.o \
+	display/intel_fb.o \
+	display/intel_fbc.o \
+	display/intel_fdi.o \
+	display/intel_fifo_underrun.o \
+	display/intel_frontbuffer.o \
+	display/intel_global_state.o \
+	display/intel_gmbus.o \
+	display/intel_hdcp.o \
+	display/intel_hdmi.o \
+	display/intel_hotplug.o \
+	display/intel_hti.o \
+	display/intel_lspcon.o \
+	display/intel_lvds.o \
+	display/intel_modeset_setup.o \
+	display/intel_modeset_verify.o \
+	display/intel_panel.o \
+	display/intel_pipe_crc.o \
+	display/intel_pps.o \
+	display/intel_psr.o \
+	display/intel_qp_tables.o \
+	display/intel_quirks.o \
+	display/intel_snps_phy.o \
+	display/intel_sprite.o \
+	display/intel_tc.o \
+	display/intel_vdsc.o \
+	display/intel_vga.o \
+	display/intel_vrr.o \
+	display/xe_fb_pin.o \
+	display/xe_plane_initial.o \
+	display/skl_scaler.o \
+	display/skl_universal_plane.o \
+	display/skl_watermark.o \
+	display/ext/i915_irq.o \
+	display/ext/intel_device_info.o \
+	display/ext/intel_dram.o \
+	display/ext/intel_pch.o \
+	display/ext/intel_pm.o
+
+ifeq ($(CONFIG_ACPI),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += \
+		display/intel_acpi.o \
+		display/intel_opregion.o
+endif
+
+ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
+endif
+
+
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 6dfa3cf2fd43..a8f48a43b854 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -8,7 +8,7 @@
 
 #include <asm/page.h>
 
-#include "i915_reg_defs.h"
+#include "../../i915/i915_reg_defs.h"
 
 #define RING_TAIL(base)				_MMIO((base) + 0x30)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ab8c9e51f62e..2a2ebc7baeda 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GT_REGS_H_
 #define _XE_GT_REGS_H_
 
-#include "i915_reg_defs.h"
+#include "../../i915/i915_reg_defs.h"
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 53f1ed54fb1c..f81f537c1ec1 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -5,7 +5,7 @@
 #ifndef _XE_REGS_H_
 #define _XE_REGS_H_
 
-#include "i915_reg_defs.h"
+#include "../../i915/i915_reg_defs.h"
 
 #define GU_CNTL					_MMIO(0x101010)
 #define   LMEM_INIT				REG_BIT(7)
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index c31987d2177c..3f76233f88c3 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GT_MCR_H_
 #define _XE_GT_MCR_H_
 
-#include "i915_reg_defs.h"
+#include "../i915/i915_reg_defs.h"
 
 struct drm_printer;
 struct xe_gt;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index a2a124a7fc0b..6eefefd80ff9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -21,8 +21,6 @@
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
-#include "i915_reg_defs.h"
-
 /* TODO: move to common file */
 #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
 #define PVC_MOCS_UC_INDEX		1
diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
index 513a7e0c8a5a..234236833239 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/xe_guc_reg.h
@@ -9,7 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
+#include "../i915/i915_reg_defs.h"
 
 /* Definitions of GuC H/W registers, bits, etc */
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index 2fa7ff3966ba..8a317ce428a4 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -9,8 +9,6 @@
 #include <linux/xarray.h>
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
-
 struct xe_reg_sr_entry {
 	u32		clr_bits;
 	u32		set_bits;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 1ac3fd1c0734..099047af89b4 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -11,8 +11,6 @@
 
 #include "xe_rtp_types.h"
 
-#include "i915_reg_defs.h"
-
 /*
  * Register table poke infrastructure
  */
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index fac0bd6d5b1e..e87f1b280d96 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -8,8 +8,6 @@
 
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
-
 struct xe_hw_engine;
 struct xe_gt;
 
-- 
2.39.0

