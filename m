Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88053EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 07:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA2810E2D7;
	Tue, 18 Jul 2023 07:16:23 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7910E2D7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689664581; x=1721200581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rQ78LDP089TmXxfnxKDscjQZFdBTyr1EPHz1aYkwx+g=;
 b=DLR3Hwm3sZoWoMLlalLWFMb7n1cAV7lB5t0w3DwG3TYOcDjRy+/XfMIB
 wouBectK22h97qqueWXJIF0mLVLPVF30B+vlX5dmg79F0Z3Fc4Jjai6Mn
 5l0f3csD3wDnxMpBqCNjUbIIALdZ+SRVXY6s/m7pvRIitVoinxmB1fhyg
 n/aALdMeUjmJQIJFnrOHVwIqdUVbeLml+DY5HJXLKzikAZYwQKk7M78Qd
 GL6rpgv8QVczWXBbiAH5A8HHcQ1bi4N1x8WkOKOK+fLpldlpcbYCRDuFB
 ON4YoP9zq+sMgFKuFSc2APAgWvOvrCMx28kIW0DKcSTk/+rgWGYJ+x4DR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369686447"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="369686447"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 00:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723497101"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="723497101"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 00:16:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 00:16:12 -0700
Message-Id: <20230718071612.15929-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pvc: Disable FPU Residue
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

v2: Minor cleanups (Matt)

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c  |  3 ---
 drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 34 ++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d654f3311351..16405b16fddf 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -316,6 +316,7 @@
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
index 78a9fe9f0bd3..76458169ec62 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -25,7 +25,10 @@ enum xe_gt_type {
 };
 
 #define XE_MAX_DSS_FUSE_REGS	2
+#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
+
 #define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 21087f7a4609..10496ed09119 100644
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
+	struct xe_device *xe = gt_to_xe(gt);
+	u16 eu_count = 0;
+	u8 gt_id;
+
+	/* FPU disabling is required for PVC 0x0BD6 device */
+	if (xe->info.devid != 0x0BD6)
+		return false;
+
+	for_each_gt(gt, xe, gt_id) {
+		u16 n_dss = bitmap_weight(gt->fuse_topo.c_dss_mask,
+					  XE_MAX_DSS_FUSE_BITS);
+		u16 n_eu = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
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
+	 * Not a workaround, but for tuning power.
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

