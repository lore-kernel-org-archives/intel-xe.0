Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2895DEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 02:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB29810E5CE;
	Fri, 23 Jun 2023 02:56:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D0510E5CE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 02:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687488960; x=1719024960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d3/tMwSXklKC0mKmhxiXDK3JRPFFtaPIX5E+XndbyAM=;
 b=BAcGyXI/WPP/EsvAAFX0Ee3rUd++FPu0d9tMpZm+F+3BgXEVZhcS+7yq
 JolGrOHURobaJH7vatGPDEolU/7SBfB+eVhgnkMpeVJPgo9fd6SwB2Uhf
 X/K/KGtXaXUOqz613thEwOHI1doMzQzwErmPx84KQr+HLIQgIyFeN3hfM
 BfRIRYZybiJC7eE+cREgIeyGwwjP7Q4hD1pDrIzwiaomNni36SNDqnesq
 yZIZn8Vsb1X+gnKJBCFgIFifamGNSpxjcaqvQ7KPa5IGe2nAgPXt80ETO
 oZlQi/QR958vZKVBYJSomMn4RoWOZ5AqXCNVRGEJWrqhDTozyeD/ZXLWv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390563818"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="390563818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 19:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="665323638"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="665323638"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 19:55:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 19:55:47 -0700
Message-Id: <20230623025547.31281-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe/pvc: Disable FPU Residue
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To reduce the power consumption disable FPU residue on some specific
devices if total EUs are 1024.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c  |  3 ---
 drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 34 ++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3f664011eaea..01f41f999c70 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -311,6 +311,7 @@
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
+#define   FPU_RESIDUE_DISABLE			REG_BIT(14)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index d4bbd0a835c2..a2da443160ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -11,9 +11,6 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
-#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
-
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 99ab7ec99ccd..327f2d938f7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,7 +24,10 @@ enum xe_gt_type {
 };
 
 #define XE_MAX_DSS_FUSE_REGS	2
+#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
+
 #define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5eaa9bed9d12..2852eaef6043 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -13,6 +13,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -256,6 +257,29 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	{}
 };
 
+static bool xe_wa_match_fpu_disable(const struct xe_gt *gt,
+				    const struct xe_hw_engine *hwe)
+{
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+	struct xe_gt *gti;
+	u16 eu_count = 0;
+	u8 gt_id;
+
+	if (xe->info.devid != 0x0bd6)
+		return false;
+
+	for_each_gt(gti, xe, gt_id) {
+		u16 n_dss = bitmap_weight(gti->fuse_topo.c_dss_mask,
+					  XE_MAX_DSS_FUSE_BITS);
+		u16 n_eu = bitmap_weight(gti->fuse_topo.eu_mask_per_dss,
+					 XE_MAX_EU_FUSE_BITS);
+
+		eu_count += n_dss * n_eu;
+	}
+
+	return eu_count == 1024;
+}
+
 static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
@@ -518,6 +542,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       GRAPHICS_STEP(B0, C0)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
 	},
+	/*
+	 * Not a workaournd, but for tuning power.
+	 * FPU residue disable will lower the power consumption.
+	 */
+	{ XE_RTP_NAME("WaFPUResidueDisable"),
+	  XE_RTP_RULES(PLATFORM(PVC),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_wa_match_fpu_disable)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, FPU_RESIDUE_DISABLE)),
+	},
 
 	/* Xe_LPG */
 	{ XE_RTP_NAME("14017856879"),
-- 
2.21.0.rc0.32.g243a4c7e27

