Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C82E7F154
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1710E1AB;
	Fri, 29 Sep 2023 21:36:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F6610E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696023389; x=1727559389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hJnwfr24wJR5KNOa5/jbzHNIWKkWr+3PpVaCues9XiM=;
 b=CipCn7KjvcsXPEwvk9YIPhK1Kq1baKq8eTH0cEeBINKdFFJdS1QN9CLN
 wzRJFiBw8hJmW2ihdgW2RMk37vrmk8ZpjR5NOzlXk+mWTaTNv3xUqn4iv
 pGENcH5hdMDHy5pUCWWXkJFs4JLe9b1cytUqOTxAHyOMK/pxYU60FdnBe
 V1qwtEJXZgB3rkWMBAwWWEMfoc+jjGbmxAlZ9k1skY+WI1rKasZzF+kRs
 lItpEdsS9Lx2bwU5XONJe/0ARhpPgoOv1ofAM5Bm+XvsgfpCnQkxs0s4i
 LU0lsxrVOLWAnwKjPq+2dXlFpANZF9UuekY807N0x0+lNfnQ5RPpckXAV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367440745"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367440745"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726709921"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726709921"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 14:36:40 -0700
Message-Id: <20230929213640.3189912-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929213640.3189912-1-lucas.demarchi@intel.com>
References: <20230929213640.3189912-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] drm/xe/xe2: Update MOCS fields in blitter
 instructions
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
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

Xe2 changes or adds bits for mocs in a few BLT instructions:
XY_CTRL_SURF_COPY_BLT, XY_FAST_COLOR_BLT, XY_FAST_COPY_BLT, and MEM_SET.
Modify the code to deal with the new location. Unlike Xe1, the MOCS
field in those instructions is only the MOCS index and not the
Structure_MEMORY_OBJECT_CONTROL_STATE anymore. The pxp bit is now
explicitly documented separately.

Bspec: 57567,57566,57565,57562
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++
 drivers/gpu/drm/xe/xe_migrate.c           | 48 +++++++++++++++--------
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index cc7b56763f10..21738281bdd0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -45,6 +45,7 @@
 #define   CCS_SIZE_MASK			0x3FF
 #define   CCS_SIZE_SHIFT		8
 #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
+#define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
 #define   NUM_BYTES_PER_CCS_BYTE	256
 #define   NUM_CCS_BLKS_PER_XFER		1024
@@ -53,12 +54,14 @@
 #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
 #define   XY_FAST_COLOR_BLT_DW		16
 #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
+#define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
 
 #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
 #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
 #define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
 #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
+#define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
 
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
@@ -66,6 +69,7 @@
 #define   PVC_MEM_SET_DATA_FIELD	GENMASK(31, 24)
 /* Bspec lists field as [6:0], but index alone is from [6:1] */
 #define   PVC_MEM_SET_MOCS_INDEX_MASK	GENMASK(6, 1)
+#define   XE2_MEM_SET_MOCS_INDEX_MASK	GENMASK(6, 3)
 
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 316773e924e0..15f091a7bba3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -517,23 +517,28 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 			  u64 src_ofs, bool src_is_indirect,
 			  u32 size)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
 	u32 num_ccs_blks;
-	u32 mocs = gt->mocs.uc_index;
+	u32 mocs;
 
 	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
 				    NUM_CCS_BYTES_PER_BLOCK);
 	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
+
+	if (GRAPHICS_VERx100(xe) >= 2000)
+		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
+	else
+		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
+
 	*cs++ = XY_CTRL_SURF_COPY_BLT |
 		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
 		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
 		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
 	*cs++ = lower_32_bits(src_ofs);
-	*cs++ = upper_32_bits(src_ofs) |
-		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
+	*cs++ = upper_32_bits(src_ofs) | mocs;
 	*cs++ = lower_32_bits(dst_ofs);
-	*cs++ = upper_32_bits(dst_ofs) |
-		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
+	*cs++ = upper_32_bits(dst_ofs) | mocs;
 
 	bb->len = cs - bb->cs;
 }
@@ -544,24 +549,27 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      unsigned int pitch)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	u32 mocs = 0;
+	u32 tile_y = 0;
 
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
 	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
 	xe_gt_assert(gt, pitch <= U16_MAX);
 
-	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
+	if (GRAPHICS_VER(xe) >= 20)
+		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
+
 	if (GRAPHICS_VERx100(xe) >= 1250)
-		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
-				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
-				    XY_FAST_COPY_BLT_D1_DST_TILE4;
-	else
-		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
+		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
+
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
 	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
 	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
 	bb->cs[bb->len++] = 0;
-	bb->cs[bb->len++] = pitch;
+	bb->cs[bb->len++] = pitch | mocs;
 	bb->cs[bb->len++] = lower_32_bits(src_ofs);
 	bb->cs[bb->len++] = upper_32_bits(src_ofs);
 }
@@ -812,8 +820,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
-	u32 mocs = gt->mocs.uc_index;
 	u32 len = PVC_MEM_SET_CMD_LEN_DW;
 
 	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
@@ -822,7 +830,10 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	*cs++ = pitch - 1;
 	*cs++ = lower_32_bits(src_ofs);
 	*cs++ = upper_32_bits(src_ofs);
-	*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, mocs);
+	if (GRAPHICS_VERx100(xe) >= 2000)
+		*cs++ = FIELD_PREP(XE2_MEM_SET_MOCS_INDEX_MASK, gt->mocs.uc_index);
+	else
+		*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, gt->mocs.uc_index);
 
 	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
 
@@ -835,15 +846,18 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
 	u32 len = XY_FAST_COLOR_BLT_DW;
-	u32 mocs = gt->mocs.uc_index;
 
 	if (GRAPHICS_VERx100(xe) < 1250)
 		len = 11;
 
 	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
 		(len - 2);
-	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
-		(pitch - 1);
+	if (GRAPHICS_VERx100(xe) >= 2000)
+		*cs++ = FIELD_PREP(XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index) |
+			(pitch - 1);
+	else
+		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, gt->mocs.uc_index) |
+			(pitch - 1);
 	*cs++ = 0;
 	*cs++ = (size / pitch) << 16 | pitch / 4;
 	*cs++ = lower_32_bits(src_ofs);
-- 
2.40.1

