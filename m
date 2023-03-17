Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430F0C76195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217D010E3CD;
	Fri, 17 Mar 2023 15:36:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D53410E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679067371; x=1710603371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=loz6O69xFbDwXkKcT9ApI1bkbZraKRv1bqWfc/8lCmk=;
 b=khyph4FS+mCTUGIXmPiz0jLxmDrDvZGEquSXPHolgrM2hP8pihUhML0l
 cXe2eGz6Kv03zyRxXZpWUcPPHB6LMA04seEyndea48yL4TPn1QkKmshgk
 ESjcGYhCqvB1HathKGs/RFTxc4RZn33yaH5hGxzGdMl1bH3bKKU1SmINw
 Hluf/9eUiI/HSYxe/mHGAoIvBcxVbHAOmrtMVWzPnPnQiXt3Q8j0xcX9k
 INbmPjvv1p8ZOAz/cszh4SQcaHQtQJ9uw09Q1lA/LFI/n0bKGuHiPXpr6
 ZB0T6mJuTt6s5nifwlcdJJHBorja7ivKvdsru7EEx6hPNkt9h+EFCT8+L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424557359"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="424557359"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926187028"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="926187028"
Received: from ambatirx-mobl2.gar.corp.intel.com (HELO
 bvivekan-mobl.fritz.box) ([10.215.117.35])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:35:53 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Mar 2023 21:05:31 +0530
Message-Id: <20230317153531.1011865-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
References: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Link copy engines doesn't support the XY_FAST_COLOR instruction.
Currently this instruction is used only at one place to clear a ttm
resource while migrating a BO.
A new device_info member is created to know if a platform has link copy
engine. If it supports, then instead of using XY_FAST_COLOR instruction,
MEM_SET is used which is available both in main and link copy engines.

BSpec: 68433

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
 drivers/gpu/drm/xe/xe_device_types.h      |  2 +
 drivers/gpu/drm/xe/xe_migrate.c           | 57 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c               |  4 ++
 4 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 288576035ce3..e60372a82723 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GPU_COMMANDS_H_
 #define _XE_GPU_COMMANDS_H_
 
+#include "regs/xe_reg_defs.h"
+
 #define INSTR_CLIENT_SHIFT      29
 #define   INSTR_MI_CLIENT       0x0
 #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
@@ -56,6 +58,13 @@
 #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
 #define   BLT_DEPTH_32			(3<<24)
 
+#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
+#define   PVC_MEM_SET_CMD_LEN_DW	7
+#define   PVC_MS_MATRIX			REG_BIT(17)
+#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
+/* Bspec lists field as [6:0], but index alone is from [6:1] */
+#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
+
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
 #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 034e0956f4ea..46cf37224090 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -95,6 +95,8 @@ struct xe_device {
 		bool has_4tile;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		bool has_range_tlb_invalidation;
+		/** @has_link_copy_engines: Whether the platform has link copy engines */
+		bool has_link_copy_engine;
 		/** @enable_display: display enabled */
 		bool enable_display;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fdcbab31a418..1316614bff20 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -746,14 +746,36 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
-static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
-		      u32 size, u32 pitch, bool is_vram)
+static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+				 u32 size, u32 pitch)
+{
+	u32 *cs = bb->cs + bb->len;
+	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
+	u32 len = PVC_MEM_SET_CMD_LEN_DW;
+
+	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
+	*cs++ = pitch - 1;
+	*cs++ = (size / pitch) - 1;
+	*cs++ = pitch - 1;
+	*cs++ = lower_32_bits(src_ofs);
+	*cs++ = upper_32_bits(src_ofs);
+	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
+
+	XE_BUG_ON(cs - bb->cs != len + bb->len);
+
+	bb->len += len;
+}
+
+static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
+				 u64 src_ofs, u32 size, u32 pitch, bool is_vram)
 {
 	u32 *cs = bb->cs + bb->len;
-	u32 len = XY_FAST_COLOR_BLT_DW;
+	u32 len;
 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
+	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(gt->xe) < 1250)
+	len = XY_FAST_COLOR_BLT_DW;
+	if (GRAPHICS_VERx100(xe) < 1250)
 		len = 11;
 
 	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
@@ -779,7 +801,31 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 	}
 
 	XE_BUG_ON(cs - bb->cs != len + bb->len);
+
 	bb->len += len;
+}
+
+static u32 emit_clear_cmd_len(struct xe_device *xe)
+{
+	if (xe->info.has_link_copy_engine)
+		return PVC_MEM_SET_CMD_LEN_DW;
+	else
+		return XY_FAST_COLOR_BLT_DW;
+}
+
+static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+		      u32 size, u32 pitch, bool is_vram)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.has_link_copy_engine) {
+		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
+
+	} else {
+		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
+				     is_vram);
+	}
+
 
 	return 0;
 }
@@ -834,7 +880,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					XY_FAST_COLOR_BLT_DW, 0, NUM_PT_PER_BLIT);
+					emit_clear_cmd_len(xe), 0,
+					NUM_PT_PER_BLIT);
 		if (xe_device_has_flat_ccs(xe) && clear_vram)
 			batch_size += EMIT_COPY_CCS_DW;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c4d9fd2e7b2b..e555f13395ab 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -72,6 +72,8 @@ struct xe_device_desc {
 	bool has_4tile;
 	bool has_range_tlb_invalidation;
 	bool has_asid;
+
+	bool has_link_copy_engine;
 };
 
 __diag_push();
@@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
 	.vm_max_level = 4,
 	.supports_usm = true,
 	.has_asid = true,
+	.has_link_copy_engine = true,
 };
 
 #define MTL_MEDIA_ENGINES \
@@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_4tile = desc->has_4tile;
 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
+	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
 
 	spd = subplatform_get(xe, desc);
 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
-- 
2.25.1

