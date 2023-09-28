Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C33ECE7B19
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5465A10E601;
	Thu, 28 Sep 2023 10:06:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C342010E603
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695895558; x=1727431558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYN/O8xF88TEGqlGsZZoN0kQ9JstHW+rosbqYlK1Ot0=;
 b=imlhEF/YRZj+9G8MHYo54uUp1ZHh1E24FIjontq+QxZYMr9mXYsG4t6d
 LJLH3abwmq3BpTJp3e7NqdA1T6GRgWpcZLH+QBtb0itTo59MOdS66TxtE
 SYChL23IM3XgcB5GFXOgTvFRe0qJEHJQh8gbOl6xvn20ZLdpHJzCqczbk
 Cr4j3Dc8W843vdDdIS6helfdUsDVySqNy9Rqgzs2JFAF/8OooyRIE2TWt
 9ynb5CRgk2a3LExUI5RyGEWTrs7ERKBrtpHRaBSvD+o7ZpxybWBjyHp3/
 CWwK/5XhECrEurL/LYuK12S0TafUrXw8Bl7Ih4qwnvoFw2kt8HgzgFHvZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380901703"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="380901703"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819782260"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="819782260"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.108])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:05:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 11:05:42 +0100
Message-ID: <20230928100537.392675-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928100537.392675-7-matthew.auld@intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 4/5] drm/xe/pat: annotate pat_index with
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
v4:
  - Rebase

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
 drivers/gpu/drm/xe/xe_pat.c          | 64 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pat.h          | 28 ++++++++++++
 3 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0717839ae964..8b0ac0cf43ac 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -338,7 +338,7 @@ struct xe_device {
 		/** Internal operations to abstract platforms */
 		const struct xe_pat_ops *ops;
 		/** PAT table to program in the HW */
-		const u32 *table;
+		const struct xe_pat_table_entry *table;
 		/** Number of PAT entries */
 		int n_entries;
 		u32 idx[__XE_CACHE_LEVEL_COUNT];
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 36b79d675e54..3e9d253ac1ff 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -5,6 +5,8 @@
 
 #include "xe_pat.h"
 
+#include <drm/xe_drm.h>
+
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -33,51 +35,60 @@
 #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
 
 struct xe_pat_ops {
-	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
-	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
+	void (*program_graphics)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+				 int n_entries);
+	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			      int n_entries);
 };
 
-static const u32 xelp_pat_table[] = {
-	[0] = XELP_PAT_WB,
-	[1] = XELP_PAT_WC,
-	[2] = XELP_PAT_WT,
-	[3] = XELP_PAT_UC,
+static const struct xe_pat_table_entry xelp_pat_table[] = {
+	[0] = { XELP_PAT_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY },
+	[1] = { XELP_PAT_WC, DRM_XE_GEM_COH_NONE },
+	[2] = { XELP_PAT_WT, DRM_XE_GEM_COH_NONE },
+	[3] = { XELP_PAT_UC, DRM_XE_GEM_COH_NONE },
 };
 
-static const u32 xehpc_pat_table[] = {
-	[0] = XELP_PAT_UC,
-	[1] = XELP_PAT_WC,
-	[2] = XELP_PAT_WT,
-	[3] = XELP_PAT_WB,
-	[4] = XEHPC_PAT_CLOS(1) | XELP_PAT_WT,
-	[5] = XEHPC_PAT_CLOS(1) | XELP_PAT_WB,
-	[6] = XEHPC_PAT_CLOS(2) | XELP_PAT_WT,
-	[7] = XEHPC_PAT_CLOS(2) | XELP_PAT_WB,
+static const struct xe_pat_table_entry xehpc_pat_table[] = {
+	[0] = { XELP_PAT_UC, DRM_XE_GEM_COH_NONE },
+	[1] = { XELP_PAT_WC, DRM_XE_GEM_COH_NONE },
+	[2] = { XELP_PAT_WT, DRM_XE_GEM_COH_NONE },
+	[3] = { XELP_PAT_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY },
+	[4] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, DRM_XE_GEM_COH_NONE },
+	[5] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY },
+	[6] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, DRM_XE_GEM_COH_NONE },
+	[7] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY },
 };
 
-static const u32 xelpg_pat_table[] = {
-	[0] = XELPG_PAT_0_WB,
-	[1] = XELPG_PAT_1_WT,
-	[2] = XELPG_PAT_3_UC,
-	[3] = XELPG_PAT_0_WB | XELPG_2_COH_1W,
-	[4] = XELPG_PAT_0_WB | XELPG_3_COH_2W,
+static const struct xe_pat_table_entry xelpg_pat_table[] = {
+	[0] = { XELPG_PAT_0_WB, DRM_XE_GEM_COH_NONE },
+	[1] = { XELPG_PAT_1_WT, DRM_XE_GEM_COH_NONE },
+	[2] = { XELPG_PAT_3_UC, DRM_XE_GEM_COH_NONE },
+	[3] = { XELPG_PAT_0_WB | XELPG_2_COH_1W, DRM_XE_GEM_COH_AT_LEAST_1WAY },
+	[4] = { XELPG_PAT_0_WB | XELPG_3_COH_2W, DRM_XE_GEM_COH_AT_LEAST_1WAY },
 };
 
-static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+	return xe->pat.table[pat_index].coh_mode;
+}
+
+static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[], int n_entries)
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
 
@@ -126,6 +137,7 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WT] = 2;
 		xe->pat.idx[XE_CACHE_WB] = 0;
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
+		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
 		xe->pat.ops = &xelp_pat_ops;
 		xe->pat.table = xelp_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 168e80e63809..a4fe9d5466bc 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -6,9 +6,29 @@
 #ifndef _XE_PAT_H_
 #define _XE_PAT_H_
 
+#include <linux/types.h>
+
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
+	 * DRM_XE_GEM_COH_NONE or DRM_XE_GEM_COH_AT_LEAST_1WAY.
+	 */
+	u16 coh_mode;
+};
+
 /**
  * xe_pat_init_early - SW initialization, setting up data based on device
  * @xe: xe device
@@ -21,4 +41,12 @@ void xe_pat_init_early(struct xe_device *xe);
  */
 void xe_pat_init(struct xe_gt *gt);
 
+/**
+ * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
+ * pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ */
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
+
 #endif
-- 
2.41.0

