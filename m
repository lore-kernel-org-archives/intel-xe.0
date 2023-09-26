Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AC9E7F147
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA2310E455;
	Tue, 26 Sep 2023 22:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C6A10E45E
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695767785; x=1727303785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xfIOFY+Iiw/Thdf+ODlcIUJguaAl4DVdR+ZpPmZVrk=;
 b=BBP9CmRD0IfkRv+Tsx9f222sm60kvZGbtKJfoXCcc4Q5qsxdGP4kCtbJ
 wI3ps904L3A9oUyL/hPP2TyhXNY5tVHhTu8YvH1YnQ2fDi7Q0Pj+oUx9E
 x36PqoRnrKAfmNHEcJfVHvUoBa2LS6eDGRdxjvbWox7B3jXC8i91TRdvN
 WiSWkKdij96VhOIA31P5ey5NvmA6LjUBw5OzD2LdExEhVhbiK3w2jYrl5
 1EqtO7Gwm9Lr0hSvT5JmmOO/nJXuVQIjWK5biBYA6N4oevheK99oN6rmn
 td/hHq058OfKperiSYFGrDBPWHHLQQfY18cpWsLPpLl6jB8t2hH/DE/Eq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412597212"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412597212"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752343382"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752343382"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 15:36:27 -0700
Message-Id: <20230926223631.2807873-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/11] drm/xe/pat: Prefer the arch/IP names
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
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Both DG2 and PVC are derived from XeHP, but DG2 should not really
re-use something introduced by PVC, so it's odd to have DG2 re-using the
PVC programming for PAT. Let's prefer using the architecture and/or IP
names.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 114 ++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 8418de44c646..234d0ccd97c9 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -14,57 +14,57 @@
 								   0x4800, 0x4804, \
 								   0x4848, 0x484c)
 
-#define MTL_L4_POLICY_MASK			REG_GENMASK(3, 2)
-#define MTL_PAT_3_UC				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 3)
-#define MTL_PAT_1_WT				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 1)
-#define MTL_PAT_0_WB				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 0)
-#define MTL_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
-#define MTL_3_COH_2W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 3)
-#define MTL_2_COH_1W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 2)
-#define MTL_0_COH_NON				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 0)
-
-#define PVC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
-#define PVC_PAT_CLOS(x)				REG_FIELD_PREP(PVC_CLOS_LEVEL_MASK, x)
-
-#define TGL_MEM_TYPE_MASK			REG_GENMASK(1, 0)
-#define TGL_PAT_WB				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 3)
-#define TGL_PAT_WT				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 2)
-#define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
-#define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
+#define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
+#define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
+#define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
+#define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
+#define XELPG_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
+#define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
+#define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
+#define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
+
+#define XEHPC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
+#define XEHPC_PAT_CLOS(x)			REG_FIELD_PREP(XEHPC_CLOS_LEVEL_MASK, x)
+
+#define XELP_MEM_TYPE_MASK			REG_GENMASK(1, 0)
+#define XELP_PAT_WB				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 3)
+#define XELP_PAT_WT				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 2)
+#define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
+#define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
 
 struct xe_pat_ops {
 	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
 	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
 };
 
-static const u32 tgl_pat_table[] = {
-	[0] = TGL_PAT_WB,
-	[1] = TGL_PAT_WC,
-	[2] = TGL_PAT_WT,
-	[3] = TGL_PAT_UC,
-	[4] = TGL_PAT_WB,
-	[5] = TGL_PAT_WB,
-	[6] = TGL_PAT_WB,
-	[7] = TGL_PAT_WB,
+static const u32 xelp_pat_table[] = {
+	[0] = XELP_PAT_WB,
+	[1] = XELP_PAT_WC,
+	[2] = XELP_PAT_WT,
+	[3] = XELP_PAT_UC,
+	[4] = XELP_PAT_WB,
+	[5] = XELP_PAT_WB,
+	[6] = XELP_PAT_WB,
+	[7] = XELP_PAT_WB,
 };
 
-static const u32 pvc_pat_table[] = {
-	[0] = TGL_PAT_UC,
-	[1] = TGL_PAT_WC,
-	[2] = TGL_PAT_WT,
-	[3] = TGL_PAT_WB,
-	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
-	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
-	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
-	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
+static const u32 xehpc_pat_table[] = {
+	[0] = XELP_PAT_UC,
+	[1] = XELP_PAT_WC,
+	[2] = XELP_PAT_WT,
+	[3] = XELP_PAT_WB,
+	[4] = XEHPC_PAT_CLOS(1) | XELP_PAT_WT,
+	[5] = XEHPC_PAT_CLOS(1) | XELP_PAT_WB,
+	[6] = XEHPC_PAT_CLOS(2) | XELP_PAT_WT,
+	[7] = XEHPC_PAT_CLOS(2) | XELP_PAT_WB,
 };
 
-static const u32 mtl_pat_table[] = {
-	[0] = MTL_PAT_0_WB,
-	[1] = MTL_PAT_1_WT,
-	[2] = MTL_PAT_3_UC,
-	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
-	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
+static const u32 xelpg_pat_table[] = {
+	[0] = XELPG_PAT_0_WB,
+	[1] = XELPG_PAT_1_WT,
+	[2] = XELPG_PAT_3_UC,
+	[3] = XELPG_PAT_0_WB | XELPG_2_COH_1W,
+	[4] = XELPG_PAT_0_WB | XELPG_3_COH_2W,
 };
 
 static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
@@ -85,11 +85,11 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
 	}
 }
 
-static const struct xe_pat_ops tgl_pat_ops = {
+static const struct xe_pat_ops xelp_pat_ops = {
 	.program_graphics = program_pat,
 };
 
-static const struct xe_pat_ops pvc_pat_ops = {
+static const struct xe_pat_ops xehp_pat_ops = {
 	.program_graphics = program_pat_mcr,
 };
 
@@ -97,7 +97,7 @@ static const struct xe_pat_ops pvc_pat_ops = {
  * SAMedia register offsets are adjusted by the write methods and they target
  * registers that are not MCR, while for normal GT they are MCR
  */
-static const struct xe_pat_ops mtl_pat_ops = {
+static const struct xe_pat_ops xelpg_pat_ops = {
 	.program_graphics = program_pat,
 	.program_media = program_pat_mcr,
 };
@@ -105,24 +105,24 @@ static const struct xe_pat_ops mtl_pat_ops = {
 void xe_pat_init_early(struct xe_device *xe)
 {
 	if (xe->info.platform == XE_METEORLAKE) {
-		xe->pat.ops = &mtl_pat_ops;
-		xe->pat.table = mtl_pat_table;
-		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
+		xe->pat.ops = &xelpg_pat_ops;
+		xe->pat.table = xelpg_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(xelpg_pat_table);
 	} else if (xe->info.platform == XE_PVC) {
-		xe->pat.ops = &pvc_pat_ops;
-		xe->pat.table = pvc_pat_table;
-		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
+		xe->pat.ops = &xehp_pat_ops;
+		xe->pat.table = xehpc_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
 	} else if (xe->info.platform == XE_DG2) {
 		/*
-		 * Programming is like PVC, but same table as previous platforms
+		 * Programming like XeHP, but same table as previous platforms
 		 */
-		xe->pat.ops = &pvc_pat_ops;
-		xe->pat.table = tgl_pat_table;
-		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
+		xe->pat.ops = &xehp_pat_ops;
+		xe->pat.table = xelp_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
-		xe->pat.ops = &tgl_pat_ops;
-		xe->pat.table = tgl_pat_table;
-		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
+		xe->pat.ops = &xelp_pat_ops;
+		xe->pat.table = xelp_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
 	} else {
 		/*
 		 * Going forward we expect to need new PAT settings for most
-- 
2.40.1

