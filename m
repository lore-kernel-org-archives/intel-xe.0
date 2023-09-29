Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECD4E743E9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 04:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84310E6B9;
	Fri, 29 Sep 2023 04:44:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0F210E6B2
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 04:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695962654; x=1727498654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7KZstMt3j7oL12DiywNHIl+XmVBrKnTTcBnOTh20hw0=;
 b=PAqRwzYCwMeAJlih0RLQ6J2xdgRI/cIK6C8/jEJbKQk91Dx5yRhoe6br
 RpC2CdHP358XUy9a2Zrb5Tnb6YcpDE3tchpVaRuUB1gik3cQFkGCiEtyr
 TxRrBt01waS/VYACVyshQDYe5xCZODxs4T3NRTTo/rj4KnyInuu8nW9gI
 4QZy6VWuRPHPpzUWF+mgaO82dg/r8y4ryzeVZiRtYm2+PEQ22p06+JH/L
 Jt0YCZkY3yN8LLccIT/2/iHlFiQTwHQ0Nxoi3ln2sv6CxHLaq/6IwQ4Xk
 EA0Gy5RZ2noPQPZsqtRhzePWNRJe913GKuT5GgqNtNYr1WcaicN9vonJ/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361608393"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="361608393"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923503057"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923503057"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 21:43:51 -0700
Message-Id: <20230929044351.3145468-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929044351.3145468-1-lucas.demarchi@intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/xe2: Update MOCS fields in blitter
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
Modify the code to deal with the new location.

Bspec: 57567,57566,57565,57562
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++
 drivers/gpu/drm/xe/xe_migrate.c           | 47 +++++++++++++++--------
 2 files changed, 34 insertions(+), 17 deletions(-)

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
index b682d34bc1e5..1b4afa8c0560 100644
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
@@ -544,24 +549,26 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      unsigned int pitch)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	u32 mocs = 0;
+	u32 tile_y = 0;
 
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
 	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
 	xe_gt_assert(gt, pitch <= U16_MAX);
 
+	if (GRAPHICS_VERx100(xe) >= 2000) {
+		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
+		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
+	}
+
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
-	if (GRAPHICS_VER(xe) >= 20)
-		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
-				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
-				    XY_FAST_COPY_BLT_D1_DST_TILE4;
-	else
-		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
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
@@ -812,8 +819,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
-	u32 mocs = gt->mocs.uc_index;
 	u32 len = PVC_MEM_SET_CMD_LEN_DW;
 
 	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
@@ -822,7 +829,10 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	*cs++ = pitch - 1;
 	*cs++ = lower_32_bits(src_ofs);
 	*cs++ = upper_32_bits(src_ofs);
-	*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, mocs);
+	if (GRAPHICS_VERx100(xe) >= 2000)
+		*cs++ = FIELD_PREP(XE2_MEM_SET_MOCS_INDEX_MASK, gt->mocs.uc_index);
+	else
+		*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, gt->mocs.uc_index);
 
 	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
 
@@ -835,15 +845,18 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
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

