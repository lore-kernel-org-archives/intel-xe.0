Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63211CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7010E73E;
	Mon, 11 May 2026 12:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRa0jLvj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5410E742
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502761; x=1810038761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vU+5mudvU5qI0oA3TU1hKepXLswo4ht7oAvor7Yu7Hs=;
 b=GRa0jLvjNNixLHG4d4AEi9p45zxEJyM4DtNJAd+QDRmuJKXwUSaYnQu+
 OUzzvQUD/G37hCAImcVqohpsImfr/st5/APgsXDhnQifz9y1EohodUjey
 y6uBxwRsPl4f87XAoQ1kYTWcRuJQo1uB9615Ot1kqZn5gRXigTyvSqr4f
 IyFwHxB+oxuAbGWQDOhGxHPCCHpqjFbMKjLXpV+9JCFrgw4zMRRx5J2tQ
 Tpt1Ibd6W0a04xyvtmzdDuODaSURUo3LJ8wubkIdMRsa6DpEKGhfh9Xzc
 FO2O5g8t4UWGME6yrqbfnUKNC/8e8qco+1pIwEAgQ918T4xIBz+t27iYo Q==;
X-CSE-ConnectionGUID: i2pfixzfRu65xdbzpguwcQ==
X-CSE-MsgGUID: cyK01TqnQj6SUhk9wxsHTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83000047"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83000047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:41 -0700
X-CSE-ConnectionGUID: tsM+5Q67SJSGnVuF06A0Sw==
X-CSE-MsgGUID: qdy4svZMSYidk++ECmqYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275571624"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:40 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Refactor emit_xy_fast_copy and emit_mem_copy
 functions
Date: Mon, 11 May 2026 18:07:50 +0530
Message-ID: <20260511123746.616662-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
References: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
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
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 32 +++++++++++++++----
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index edd204b8dfe5..18d0fde8c98f 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -30,7 +30,7 @@
 #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
 #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
 
-#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
+#define MEM_COPY_CMD (2 << 29 | 0x5a << 22)
 #define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
 #define   MEM_COPY_MATRIX_COPY REG_BIT(17)
 #define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 50a97705e0ac..3c1be809be82 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -421,7 +421,7 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
 					      avail_pts, avail_pts);
 
 		/* Add copy commands size here */
-		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
+		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((xe_device_has_flat_ccs(xe) && copy_only_ccs) ? EMIT_COPY_CCS_DW : 0);
 
 		bb = xe_bb_new(gt, batch_size, xe->info.has_usm);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4f9be41b2f64..9428dd5e7760 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -728,7 +728,22 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 	bb->len = cs - bb->cs;
 }
 
-#define EMIT_COPY_DW 10
+static u32 blt_fast_copy_cmd_len(struct xe_device *xe)
+{
+	return 10;
+}
+
+static u32 blt_mem_copy_cmd_len(struct xe_device *xe)
+{
+	return 10;
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
@@ -736,6 +751,7 @@ static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 mocs = 0;
 	u32 tile_y = 0;
+	u32 len;
 
 	xe_gt_assert(gt, !(pitch & 3));
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
@@ -748,7 +764,8 @@ static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 	if (GRAPHICS_VERx100(xe) >= 1250)
 		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
 
-	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
+	len = blt_fast_copy_cmd_len(xe);
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (len - 2);
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
@@ -765,6 +782,7 @@ static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 			  u64 dst_ofs, unsigned int size, unsigned int pitch)
 {
 	u32 mode, copy_type, width;
+	u32 len;
 
 	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
 	xe_gt_assert(gt, pitch <= U16_MAX);
@@ -790,7 +808,9 @@ static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 
 	xe_gt_assert(gt, width <= U16_MAX);
 
-	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
+	len = blt_mem_copy_cmd_len(gt_to_xe(gt));
+
+	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type | (len - 2);
 	bb->cs[bb->len++] = width - 1;
 	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page-copy/linear above */
 	bb->cs[bb->len++] = pitch - 1;
@@ -967,7 +987,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		/* Add copy commands size here */
-		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
+		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
@@ -1406,7 +1426,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 
 		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
 					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
-		batch_size += EMIT_COPY_DW;
+		batch_size += emit_copy_cmd_len(xe);
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -2216,7 +2236,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
 
 	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
-	batch_size += EMIT_COPY_DW;
+	batch_size += emit_copy_cmd_len(xe);
 
 	bb = xe_bb_new(gt, batch_size, use_usm_batch);
 	if (IS_ERR(bb)) {
-- 
2.43.0

