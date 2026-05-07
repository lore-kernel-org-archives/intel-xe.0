Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C12FCD343B
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 06:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83DB10EF7D;
	Thu,  7 May 2026 06:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpegH/Ry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4E810EF7B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778135856; x=1809671856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6k2R5TmxFZdjem7jAxIF12E4GtAr0FokaivYfl+2eIA=;
 b=EpegH/Ry1lmC/mfhzrNDv/7CPrDbmblqZmy+HVT/zZeEKZ0qbeqW9ERB
 bKqKBRBFpYySWrOBSH41alwCRXLGce30oJkdTOZZA/S2OMVE7LP216n9z
 vxhP7TunBZTLkEpoWzg4J+SGxYvs/mVsKLUSN8BNsIkP7s/GpHZShv5Gc
 aVTiEgmSyD5CyGcSHSXMAo9W0mHLR2N6aIJnBil+X+M8RxPtk2lPgUh5q
 JaFQOgHJgapORJgsVkYQISZcVsHFbViLZS3vO90luFkoUXcXr/2yGIFau
 IKFMYT2/oAgx13gSdJ8/u0kn4zdvb4pvtx7PfcxmYhs9OIGFvSEDC5Vc8 w==;
X-CSE-ConnectionGUID: zWgx9NKxQLawBnFlr10khg==
X-CSE-MsgGUID: cfI4B+arTJ++OHgMEOQNJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101752644"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="101752644"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:36 -0700
X-CSE-ConnectionGUID: A+6ZlcE3Ql+rpcO6XyMunA==
X-CSE-MsgGUID: hkWTSMvcRsy4ZqMv5FHH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="229984808"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:34 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 3/3] drm/xe: Refactor emit_xy_fast_copy and emit_mem_copy
 functions
Date: Thu,  7 May 2026 12:12:33 +0530
Message-ID: <20260507064229.397673-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
References: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To perform copy, based on whether the platform supports service copy
engines, either MEM_COPY or XY_FAST_COPY_BLT instruction is used.
Length of both the instructions is same today and so they use a common
define EMIT_COPY_DW.
This is not true for the future platforms. Implement separate functions
which return the length of the instruction to help in preparing for it.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  4 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 32 +++++++++++++++----
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 082f2926feab..f1a4a99b4d1a 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -26,12 +26,14 @@
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
 
 #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
+#define   XY_FAST_COPY_BLT_LEN_DW	10
 #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
 #define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
 #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
 #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
 
-#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
+#define MEM_COPY_CMD (2 << 29 | 0x5a << 22)
+#define   MEM_COPY_CMD_LEN_DW		10
 #define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
 #define   MEM_COPY_MATRIX_COPY REG_BIT(17)
 #define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 34e2f0f4631f..4540ed75f963 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -420,7 +420,7 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
 					      avail_pts, avail_pts);
 
 		/* Add copy commands size here */
-		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
+		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((xe_device_has_flat_ccs(xe) && copy_only_ccs) ? EMIT_COPY_CCS_DW : 0);
 
 		bb = xe_bb_new(gt, batch_size, xe->info.has_usm);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index dfcbab38c222..719751b4da17 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -702,7 +702,22 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 	bb->len = cs - bb->cs;
 }
 
-#define EMIT_COPY_DW 10
+static u32 blt_fast_copy_cmd_len(struct xe_device *xe)
+{
+	return XY_FAST_COPY_BLT_LEN_DW;
+}
+
+static u32 blt_mem_copy_cmd_len(struct xe_device *xe)
+{
+	return MEM_COPY_CMD_LEN_DW;
+}
+
+static u32 emit_copy_cmd_len(struct xe_device *xe)
+{
+	return (xe->info.has_mem_copy_instr) ? blt_mem_copy_cmd_len(xe) :
+		  blt_fast_copy_cmd_len(xe);
+}
+
 static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 			      u64 dst_ofs, unsigned int size,
 			      unsigned int pitch)
@@ -710,6 +725,7 @@ static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 mocs = 0;
 	u32 tile_y = 0;
+	u32 len;
 
 	xe_gt_assert(gt, !(pitch & 3));
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
@@ -722,7 +738,8 @@ static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 	if (GRAPHICS_VERx100(xe) >= 1250)
 		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
 
-	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
+	len = blt_fast_copy_cmd_len(xe);
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (len - 2);
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
@@ -739,6 +756,7 @@ static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 			  u64 dst_ofs, unsigned int size, unsigned int pitch)
 {
 	u32 mode, copy_type, width;
+	u32 len;
 
 	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
 	xe_gt_assert(gt, pitch <= U16_MAX);
@@ -764,7 +782,9 @@ static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 
 	xe_gt_assert(gt, width <= U16_MAX);
 
-	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
+	len = blt_mem_copy_cmd_len(gt_to_xe(gt));
+
+	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type | (len - 2);
 	bb->cs[bb->len++] = width - 1;
 	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page-copy/linear above */
 	bb->cs[bb->len++] = pitch - 1;
@@ -952,7 +972,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		/* Add copy commands size here */
-		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
+		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
@@ -1331,7 +1351,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 
 		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
 					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
-		batch_size += EMIT_COPY_DW;
+		batch_size += emit_copy_cmd_len(xe);
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -2155,7 +2175,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
 
 	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
-	batch_size += EMIT_COPY_DW;
+	batch_size += emit_copy_cmd_len(xe);
 
 	bb = xe_bb_new(gt, batch_size, use_usm_batch);
 	if (IS_ERR(bb)) {
-- 
2.43.0

