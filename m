Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216FE71D58
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A8E10E144;
	Fri, 29 Sep 2023 21:36:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4133110E144
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696023389; x=1727559389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Jnlra2xCA4wmulCzc+HPj/WVHjYCNxzZ2xFNHUnp7c=;
 b=ZZ5EfiYMT4ZQHD6MdX8fHBjLhlS4mgRxDbWuQl/6X6XuzKH+zbp3DvMZ
 95lSRLTXu/aDgZ76Cr+Hw5rFpvRLl1eWHo3TWG0vigitQcPx7+aJ7BJNM
 QL/ZRIKzYl9x7NUnFDL9XVCxMmV9DRsj7Ah3C7UVklBCVBwiFE8mo80r5
 Mb/VfkvX8AYFV9YuDsieNmcLREGbxq7OaERPitySRuBRq3Y7HvUvcnRrU
 RIr+vdn8G76u60sKF7rpGlNMfqDg0rJdq0oUHCrSDL4tn0CKq2vkgC7Un
 KapSGmovGJCfyWCnNqHocJ6VD45V9KIIQgeKzLGfvA/mmBCgaJMD55hcE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367440742"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367440742"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726709912"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726709912"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 14:36:37 -0700
Message-Id: <20230929213640.3189912-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929213640.3189912-1-lucas.demarchi@intel.com>
References: <20230929213640.3189912-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] drm/xe: Adjust mocs field mask definitions
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

Instead of using xe_mocs_index_to_value(), simply define the bitmask
with the shift left applied. This will make it easier to adapt to new
platforms that simply use the index.

This also fixes PVC bug in emit_clear_link_copy() where the MOCS was
getting shifted both by PVC_MS_MOCS_INDEX_MASK definition and by the
xe_moc_index_to_value function.

Bspec: 44509
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c           |  6 +++---
 drivers/gpu/drm/xe/xe_mocs.h              | 12 ------------
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 12120dd37aa2..1ee8d46d92d9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -44,7 +44,7 @@
 #define   DST_ACCESS_TYPE_SHIFT		20
 #define   CCS_SIZE_MASK			0x3FF
 #define   CCS_SIZE_SHIFT		8
-#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
+#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
 #define   NUM_BYTES_PER_CCS_BYTE	256
 #define   NUM_CCS_BLKS_PER_XFER		1024
@@ -52,7 +52,7 @@
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
 #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
 #define   XY_FAST_COLOR_BLT_DW		16
-#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
+#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
 
 #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cd2e00008aab..1d1e4076b29d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -519,7 +519,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 {
 	u32 *cs = bb->cs + bb->len;
 	u32 num_ccs_blks;
-	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
+	u32 mocs = gt->mocs.uc_index;
 
 	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
 				    NUM_CCS_BYTES_PER_BLOCK);
@@ -806,7 +806,7 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 				 u32 size, u32 pitch)
 {
 	u32 *cs = bb->cs + bb->len;
-	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
+	u32 mocs = gt->mocs.uc_index;
 	u32 len = PVC_MEM_SET_CMD_LEN_DW;
 
 	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
@@ -828,7 +828,7 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
 	u32 len = XY_FAST_COLOR_BLT_DW;
-	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
+	u32 mocs = gt->mocs.uc_index;
 
 	if (GRAPHICS_VERx100(xe) < 1250)
 		len = 11;
diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index d0f1ec4b0336..053754c5a94e 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -14,16 +14,4 @@ struct xe_gt;
 void xe_mocs_init_early(struct xe_gt *gt);
 void xe_mocs_init(struct xe_gt *gt);
 
-/**
- * xe_mocs_index_to_value - Translate mocs index to the mocs value exected by
- * most blitter commands.
- * @mocs_index: index into the mocs tables
- *
- * Return: The corresponding mocs value to be programmed.
- */
-static inline u32 xe_mocs_index_to_value(u32 mocs_index)
-{
-	return mocs_index << 1;
-}
-
 #endif
-- 
2.40.1

