Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F08C76196
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C2010E1AF;
	Fri, 24 Mar 2023 21:04:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57C510E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679691864; x=1711227864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KiWSo2pV4Ju1EQaAul9ry4w5+Skat+QLvNR5MdWHAzQ=;
 b=AJ3LaVzaEztgfX3lA3P9JtNCxBtj/HQdL6151O8p/zgg1c0jHgEDfeaV
 wmg+4yioGw+wTbectZOXanZCp9KGyS+5W0ma/wnlqiFL527+RjsDYXfjX
 SpDOnTiqyqt+uvMfClUkkBBj1mPfP8P7twUhrz15+SpuG+pK0vFPQjfn+
 FN0wlw0smc2nJpb4BUV51d5WAIyQXzBin7R4T7cb13qUN1yDRyVIMsqy4
 MpMgUD4bdQhVpk1Yj1C7U9DiblauJLJ0oSbWVVwSpS3E04SD0tra8Rt34
 p8rCz2rKXvuSeA2lTOmDUu2l82YE6ndnQtpEZNDApJjDyNVwRGBTaq8I/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341456105"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="341456105"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752022846"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="752022846"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Mar 2023 14:04:11 -0700
Message-Id: <20230324210415.2434992-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324210415.2434992-1-matthew.d.roper@intel.com>
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe/pat: Use table-based programming of
 PAT settings
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Provide per-platform tables of PAT values rather than per-platform
functions.  This will simplify the handling of unicast vs MCR registers
in the upcoming patches.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 77 +++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index bd64de956772..75d25e0c0b9a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -15,34 +15,27 @@
 #define GEN8_PPAT_UC			(0<<0)
 #define GEN12_PPAT_CLOS(x)              ((x)<<2)
 
-static void tgl_setup_private_ppat(struct xe_gt *gt)
-{
-	/* TGL doesn't support LLC or AGE settings */
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
-}
+const u32 tgl_pat_table[] = {
+	[0] = GEN8_PPAT_WB,
+	[1] = GEN8_PPAT_WC,
+	[2] = GEN8_PPAT_WT,
+	[3] = GEN8_PPAT_UC,
+	[4] = GEN8_PPAT_WB,
+	[5] = GEN8_PPAT_WB,
+	[6] = GEN8_PPAT_WB,
+	[7] = GEN8_PPAT_WB,
+};
 
-static void pvc_setup_private_ppat(struct xe_gt *gt)
-{
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
-			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
-			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
-			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
-			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
-}
+const u32 pvc_pat_table[] = {
+	[0] = GEN8_PPAT_UC,
+	[1] = GEN8_PPAT_WC,
+	[2] = GEN8_PPAT_WT,
+	[3] = GEN8_PPAT_WB,
+	[4] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT,
+	[5] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB,
+	[6] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT,
+	[7] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB,
+};
 
 #define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
 #define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
@@ -53,27 +46,27 @@ static void pvc_setup_private_ppat(struct xe_gt *gt)
 #define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
 #define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
 
-static void mtl_setup_private_ppat(struct xe_gt *gt)
-{
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
-			MTL_PPAT_1_WT | MTL_2_COH_1W);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
-			MTL_PPAT_3_UC | MTL_2_COH_1W);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
-			MTL_PPAT_0_WB | MTL_2_COH_1W);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
-			MTL_PPAT_0_WB | MTL_3_COH_2W);
-}
+const u32 mtl_pat_table[] = {
+	[0] = MTL_PPAT_0_WB,
+	[1] = MTL_PPAT_1_WT | MTL_2_COH_1W,
+	[2] = MTL_PPAT_3_UC | MTL_2_COH_1W,
+	[3] = MTL_PPAT_0_WB | MTL_2_COH_1W,
+	[4] = MTL_PPAT_0_WB | MTL_3_COH_2W,
+};
+
+#define PROGRAM_PAT_UNICAST(gt, table) do { \
+	for (int i = 0; i < ARRAY_SIZE(table); i++) \
+		xe_mmio_write32(gt, GEN12_PAT_INDEX(i).reg, table[i]); \
+} while (0)
 
 void xe_pat_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
 	if (xe->info.platform == XE_METEORLAKE)
-		mtl_setup_private_ppat(gt);
+		PROGRAM_PAT_UNICAST(gt, mtl_pat_table);
 	else if (xe->info.platform == XE_PVC)
-		pvc_setup_private_ppat(gt);
+		PROGRAM_PAT_UNICAST(gt, pvc_pat_table);
 	else
-		tgl_setup_private_ppat(gt);
+		PROGRAM_PAT_UNICAST(gt, tgl_pat_table);
 }
-- 
2.39.2

