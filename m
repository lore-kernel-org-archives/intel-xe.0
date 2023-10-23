Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E64C25B46
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 20:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2A810E257;
	Mon, 23 Oct 2023 20:41:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D05410E257
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698093693; x=1729629693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cEFV5aHUbH2KvspAGlHrHGlZqzi9AzDxTj4KuRCRBqc=;
 b=VSKJ0CIl4Vt5KuP7UNhYwM+/7J0f8ZBoh9aYnoUpqder15V/hVzPkmo+
 BbIl7gxI+IcDbpAM/LfOLykDxFI6emzx2wKazxYhsFE5PPsheR2F5RKp0
 OGiHiCsa6vqfqvorGnCiUPn3cbumNSHw+t8jEAVBt+x/6h9jiLOG90tj2
 J36WNXzQGrbR5ogKMH6zF2S6ymlliHol62MvPo8Wgub7xLqpjMTUbNZl1
 8VOsxk9R4aVZvRHQt7jOVIIsBTzVImaXF+C2Vf1AJ7cvIGh33E/BjK2/D
 8o40W1IGKGdIo3RB00BHyq6iPprsf7LYLAlDx6n74iC6M2m5p6aR7mFpT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377301806"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="377301806"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 13:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="901925156"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="901925156"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 13:39:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 13:41:13 -0700
Message-ID: <20231023204112.2856331-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mocs: MOCS registers are multicast on
 Xe_HP and beyond
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
Cc: matthew.d.roper@intel.com,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The MOCS registers should be written in an MCR-specific manner on Xe_HP
and beyond to prevent any other driver threads or external firmware from
putting the hardware into unicast mode while we initialize the MOCS
table.

Bspec: 66534, 67609, 71185
Cc: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++--
 drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
 drivers/gpu/drm/xe/xe_mocs.c         | 23 +++++++++++++++--------
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd1821d96a5d..397e134a4f79 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -43,7 +43,8 @@
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
 /* L3 Cache Control */
-#define LNCFCMOCS(i)				XE_REG(0xb020 + (i) * 4)
+#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
+#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
 #define LNCFCMOCS_REG_COUNT			32
 
 #define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
@@ -79,7 +80,8 @@
 #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
 #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
 
-#define GLOBAL_MOCS(i)				XE_REG(0x4000 + (i) * 4) /* Global MOCS regs */
+#define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
+#define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000 + (i) * 4)
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index efa4d25424b8..88789826e781 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -473,7 +473,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
 		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
 			guc_mmio_regset_write_one(ads, regset_map,
-						  LNCFCMOCS(i), count++);
+						  XELP_LNCFCMOCS(i), count++);
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 19a8146ded9a..21972bbef8fd 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -10,6 +10,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
@@ -491,8 +492,7 @@ static u32 get_entry_control(const struct xe_mocs_info *info,
 }
 
 static void __init_mocs_table(struct xe_gt *gt,
-			      const struct xe_mocs_info *info,
-			      u32 addr)
+			      const struct xe_mocs_info *info)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -505,10 +505,13 @@ static void __init_mocs_table(struct xe_gt *gt,
 	for (i = 0;
 	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
 	     i++) {
-		struct xe_reg reg = XE_REG(addr + i * 4);
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i,
+			 XELP_GLOBAL_MOCS(i).addr, mocs);
 
-		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
-		xe_mmio_write32(gt, reg, mocs);
+		if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250)
+			xe_gt_mcr_multicast_write(gt, XEHP_GLOBAL_MOCS(i), mocs);
+		else
+			xe_mmio_write32(gt, XELP_GLOBAL_MOCS(i), mocs);
 	}
 }
 
@@ -542,9 +545,13 @@ static void init_l3cc_table(struct xe_gt *gt,
 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
 	     i++) {
-		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr,
 			 l3cc);
-		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
+
+		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
+		else
+			xe_mmio_write32(gt, XELP_LNCFCMOCS(i), l3cc);
 	}
 }
 
@@ -569,7 +576,7 @@ void xe_mocs_init(struct xe_gt *gt)
 	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
 
 	if (flags & HAS_GLOBAL_MOCS)
-		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
+		__init_mocs_table(gt, &table);
 
 	/*
 	 * Initialize the L3CC table as part of mocs initalization to make
-- 
2.41.0

