Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26202CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 13:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BA510E24F;
	Mon, 25 Sep 2023 13:21:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEEC10E255
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648092; x=1727184092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VzxMJ79CnEFu7wRisTErVYpPR8g+zqcJDAGo8zZFgHE=;
 b=efCBP55EQ6wozRORuhi3A9K7pxszifAJYOs4Bn3172PY//dKbXZXINMY
 YNMb4B2xbNaQd3U8ALJFoVAfROEfWgDIJmR6DVvnO4tA1xo3+Wbh5ALoY
 +2IKC7ZF0E/GgEcp0AemrAUu9efK9lOyxG858UJkRMncK9DXHolTR3tKv
 lomWDgH1yNFKjBc6sUSPbuzDcnY/Os9T/wL7W9wCrG8n+XMWRZ6BzrCPb
 w262vZQgfPufObZfoFPV0GeMCRkzhRygrMXvahdg2ABhP6ozhJX/gheni
 9pEaE10wazKI6z7IM/MyyMBYCFCdYGinmh+CyAu8dHPhDDjQUD2CrAfzy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378521518"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378521518"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751679130"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751679130"
Received: from ngorb-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.27.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 14:21:17 +0100
Message-ID: <20230925132113.59900-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925132113.59900-9-matthew.auld@intel.com>
References: <20230925132113.59900-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/7] drm/xe/pat: annotate pat_index with
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Future uapi needs to give userspace the ability to select the pat_index
for a given vm_bind. However we need to be able to extract the coherency
mode from the provided pat_index to ensure it matches the coherency mode
set at object creation. There are various security reasons for why this
matters.  However the pat_index itself is very platform specific, so
seems reasonable to annotate each platform definition of the pat table.
On some older platforms there is no explicit coherency mode, so we just
pick whatever makes sense.

v2:
  - Simplify with COH_AT_LEAST_1_WAY
  - Add some kernel-doc
v3 (Matt Roper):
  - Some small tweaks

Bspec: 45101, 44235 #xe
Bspec: 70552, 71582, 59400 #xe2
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pat.h          | 19 +++++++++
 3 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cf941d56a6c9..0118b20416fa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -248,7 +248,7 @@ struct xe_device {
 			 * @table: The PAT table encoding for every pat_index
 			 * supported by the platform.
 			 */
-			const u32 *table;
+			const struct xe_pat_table_entry *table;
 
 			/** @n_entries: The number of entries in the @table */
 			int n_entries;
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index fb490982fd99..f4fceb3fa086 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -4,6 +4,8 @@
  */
 
 
+#include <drm/xe_drm.h>
+
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -33,30 +35,30 @@
 #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
 #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
 
-static const u32 tgl_pat_table[] = {
-	[0] = TGL_PAT_WB,
-	[1] = TGL_PAT_WC,
-	[2] = TGL_PAT_WT,
-	[3] = TGL_PAT_UC,
+static const struct xe_pat_table_entry tgl_pat_table[] = {
+	[0] = { TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
+	[1] = { TGL_PAT_WC, XE_GEM_COH_NONE },
+	[2] = { TGL_PAT_WT, XE_GEM_COH_NONE },
+	[3] = { TGL_PAT_UC, XE_GEM_COH_NONE },
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
+static const struct xe_pat_table_entry pvc_pat_table[] = {
+	[0] = { TGL_PAT_UC, XE_GEM_COH_NONE },
+	[1] = { TGL_PAT_WC, XE_GEM_COH_NONE },
+	[2] = { TGL_PAT_WT, XE_GEM_COH_NONE },
+	[3] = { TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
+	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COH_NONE },
+	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
+	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COH_NONE },
+	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
 };
 
-static const u32 mtl_pat_table[] = {
-	[0] = MTL_PAT_0_WB,
-	[1] = MTL_PAT_1_WT,
-	[2] = MTL_PAT_3_UC,
-	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
-	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
+static const struct xe_pat_table_entry mtl_pat_table[] = {
+	[0] = { MTL_PAT_0_WB, XE_GEM_COH_NONE },
+	[1] = { MTL_PAT_1_WT, XE_GEM_COH_NONE },
+	[2] = { MTL_PAT_3_UC, XE_GEM_COH_NONE },
+	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COH_AT_LEAST_1WAY },
+	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COH_AT_LEAST_1WAY },
 };
 
 static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
@@ -78,27 +80,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
 	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
 };
 
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->info.pat.n_entries);
+	return xe->info.pat.table[pat_index].coh_mode;
+}
+
 unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
 {
 	WARN_ON(cache >= XE_CACHE_LAST);
 	return (xe->pat_table).pte_pat_table[cache];
 }
 
-static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			int n_entries)
 {
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
 
-		xe_mmio_write32(gt, reg, table[i]);
+		xe_mmio_write32(gt, reg, table[i].value);
 	}
 }
 
-static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
+static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			    int n_entries)
 {
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
 
-		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
+		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
 	}
 }
 
@@ -111,6 +121,7 @@ int xe_pat_init_early(struct xe_device *xe)
 		xe->info.pat.table = pvc_pat_table;
 		xe->info.pat.n_entries = ARRAY_SIZE(pvc_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
+		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
 		xe->info.pat.table = tgl_pat_table;
 		xe->info.pat.n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 2f89503233b9..e90653088709 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -28,9 +28,28 @@
 struct xe_gt;
 struct xe_device;
 
+/**
+ * struct xe_pat_table_entry - The pat_index encoding and other meta information.
+ */
+struct xe_pat_table_entry {
+	/**
+	 * @value: The platform specific value encoding the various memory
+	 * attributes (this maps to some fixed pat_index). So things like
+	 * caching, coherency, compression etc can be encoded here.
+	 */
+	u32 value;
+
+	/**
+	 * @coh_mode: The GPU coherency mode that @value maps to. Either
+	 * XE_GEM_COH_NONE or XE_GEM_COH_AT_LEAST_1WAY.
+	 */
+	u16 coh_mode;
+};
+
 int xe_pat_init_early(struct xe_device *xe);
 void xe_pat_init(struct xe_gt *gt);
 void xe_pte_pat_init(struct xe_device *xe);
 unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
 #endif
-- 
2.41.0

