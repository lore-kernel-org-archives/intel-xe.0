Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2FC6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583E610E55F;
	Fri, 24 Mar 2023 21:04:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CFD10EC7F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679691865; x=1711227865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p76kY+rO3UIbLUfQeoeZl+oPbPC2yjklUfXiFrEipbc=;
 b=WWDzcUovT4tTKdT3cD0y9yGSQzG4f9/rRJ3fnst71c8QxlDPevmZUrC/
 qyd0yyNEDkVqYawcx4mSazqPseO0PEJ0JFfgZyNbYX5RV5l1e5xy9BhPZ
 9yxDNAdLh5LvweSf/hLm7l0KgNY+JJ2mWJZ+9TOMP0EwNDdAmVqe0m+F4
 +ltYirgKLWmuYL5c6LCA7Rdwa8TPIDfBVzyPFcJBFfhGSiOoFqfRWhZB/
 PyMD3yEEpLKVGdDSVIedUhkQqMUe1sxJM5yi0w8mBYkumZGcPs9953EiG
 VcwPSjbeFtu7LfAlnp7s+O2ZGm7pZotJSVzC+y/owAH2QTBdU/mC3qqOU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341456110"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="341456110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752022852"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="752022852"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Mar 2023 14:04:13 -0700
Message-Id: <20230324210415.2434992-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324210415.2434992-1-matthew.d.roper@intel.com>
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe/pat: Clean up PAT register definitions
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

Replace the deprecated "GEN" terminology in the PAT definitions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 73 +++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index f511d9a54358..142cf11b5914 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -10,49 +10,52 @@
 
 #define _PAT_INDEX(index)			(0x4800 + (index) * 4)
 
-#define GEN8_PPAT_WB			(3<<0)
-#define GEN8_PPAT_WT			(2<<0)
-#define GEN8_PPAT_WC			(1<<0)
-#define GEN8_PPAT_UC			(0<<0)
-#define GEN12_PPAT_CLOS(x)              ((x)<<2)
+#define MTL_L4_POLICY_MASK			REG_GENMASK(3, 2)
+#define MTL_PAT_3_UC				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 3)
+#define MTL_PAT_1_WT				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 1)
+#define MTL_PAT_0_WB				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 0)
+#define MTL_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
+#define MTL_3_COH_2W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 3)
+#define MTL_2_COH_1W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 2)
+#define MTL_0_COH_NON				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 0)
+
+#define PVC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
+#define PVC_PAT_CLOS(x)				REG_FIELD_PREP(PVC_CLOS_LEVEL_MASK, x)
+
+#define TGL_MEM_TYPE_MASK			REG_GENMASK(1, 0)
+#define TGL_PAT_WB				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 3)
+#define TGL_PAT_WT				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 2)
+#define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
+#define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
 
 const u32 tgl_pat_table[] = {
-	[0] = GEN8_PPAT_WB,
-	[1] = GEN8_PPAT_WC,
-	[2] = GEN8_PPAT_WT,
-	[3] = GEN8_PPAT_UC,
-	[4] = GEN8_PPAT_WB,
-	[5] = GEN8_PPAT_WB,
-	[6] = GEN8_PPAT_WB,
-	[7] = GEN8_PPAT_WB,
+	[0] = TGL_PAT_WB,
+	[1] = TGL_PAT_WC,
+	[2] = TGL_PAT_WT,
+	[3] = TGL_PAT_UC,
+	[4] = TGL_PAT_WB,
+	[5] = TGL_PAT_WB,
+	[6] = TGL_PAT_WB,
+	[7] = TGL_PAT_WB,
 };
 
 const u32 pvc_pat_table[] = {
-	[0] = GEN8_PPAT_UC,
-	[1] = GEN8_PPAT_WC,
-	[2] = GEN8_PPAT_WT,
-	[3] = GEN8_PPAT_WB,
-	[4] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT,
-	[5] = GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB,
-	[6] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT,
-	[7] = GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB,
+	[0] = TGL_PAT_UC,
+	[1] = TGL_PAT_WC,
+	[2] = TGL_PAT_WT,
+	[3] = TGL_PAT_WB,
+	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
+	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
+	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
+	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
 };
 
-#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
-#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
-#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
-#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
-#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
-#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
-#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
-#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
-
 const u32 mtl_pat_table[] = {
-	[0] = MTL_PPAT_0_WB,
-	[1] = MTL_PPAT_1_WT | MTL_2_COH_1W,
-	[2] = MTL_PPAT_3_UC | MTL_2_COH_1W,
-	[3] = MTL_PPAT_0_WB | MTL_2_COH_1W,
-	[4] = MTL_PPAT_0_WB | MTL_3_COH_2W,
+	[0] = MTL_PAT_0_WB,
+	[1] = MTL_PAT_1_WT | MTL_2_COH_1W,
+	[2] = MTL_PAT_3_UC | MTL_2_COH_1W,
+	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
+	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
 };
 
 #define PROGRAM_PAT_UNICAST(gt, table) do { \
-- 
2.39.2

