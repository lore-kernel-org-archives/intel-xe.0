Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48FBC61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 11:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F5F10E26F;
	Tue, 21 Nov 2023 11:56:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E44110E26F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700567804; x=1732103804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wxP+mMnShM9lni5GXL1AJdYaD9tlovSTw0BIFBTOumk=;
 b=lvs4uoeWuaKJ/8lhb3Z6b73ujBP7dFuUWUv72JNDgY0mTNcUKN4k8s5h
 +PnjhU+P8narzxYWxnVR31IwRx0hD5bbtNRgMMNtRHmDCcerH6pSq3Hqu
 Sx02AN9/zg46OSpBAA1cCkTD+CCY9tzsxaQOcdGO9hzpK/1ZsyM53AuYW
 59F0GpDraDd3miT0Sf5/6C/847kkEOO7NZq6SZx3dj9cqVV8wB5NjyyEZ
 BC87jXjyIjqLcO5Pqb8c5hLcbp+tvbHikCAR21STNqIHzoaD7W0iJddcM
 De9mYmQXyXufcw8FXl6ZOWYKIp/pmQEwHe9TZVln6BnqBEeUQsgfY08CE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="372000046"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="372000046"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 03:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="837030968"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="837030968"
Received: from aokavana-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.6.223])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 03:56:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:56:29 +0000
Message-ID: <20231121115626.151214-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115626.151214-5-matthew.auld@intel.com>
References: <20231121115626.151214-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 2/3] drm/xe/pat: annotate pat_index with
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Zhengguo Xu <zhengguo.xu@intel.com>, Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Future uapi needs to give userspace the ability to select the pat_index
for a given vm_bind. However we need to be able to extract the coherency
mode from the provided pat_index to ensure it's compatible with the
cpu_caching mode set at object creation. There are various security
reasons for why this matters.  However the pat_index itself is very
platform specific, so seems reasonable to annotate each platform
definition of the pat table.  On some older platforms there is no
explicit coherency mode, so we just pick whatever makes sense.

v2:
  - Simplify with COH_AT_LEAST_1_WAY
  - Add some kernel-doc
v3 (Matt Roper):
  - Some small tweaks
v4:
  - Rebase
v5:
  - Rebase on Xe2 PAT additions
v6:
  - Rebase on removal of coh_mode from uapi

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
Cc: Zhengguo Xu <zhengguo.xu@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 drivers/gpu/drm/xe/xe_pat.c          | 96 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pat.h          | 31 ++++++++-
 3 files changed, 88 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be11cadccbd4..dea96ce38701 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -359,7 +359,7 @@ struct xe_device {
 		/** Internal operations to abstract platforms */
 		const struct xe_pat_ops *ops;
 		/** PAT table to program in the HW */
-		const u32 *table;
+		const struct xe_pat_table_entry *table;
 		/** Number of PAT entries */
 		int n_entries;
 		u32 idx[__XE_CACHE_LEVEL_COUNT];
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 7c1078707aa0..1892ff81086f 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -5,6 +5,8 @@
 
 #include "xe_pat.h"
 
+#include <drm/xe_drm.h>
+
 #include "regs/xe_reg_defs.h"
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -46,35 +48,37 @@
 static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
 
 struct xe_pat_ops {
-	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
-	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
+	void (*program_graphics)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+				 int n_entries);
+	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			      int n_entries);
 	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
 };
 
-static const u32 xelp_pat_table[] = {
-	[0] = XELP_PAT_WB,
-	[1] = XELP_PAT_WC,
-	[2] = XELP_PAT_WT,
-	[3] = XELP_PAT_UC,
+static const struct xe_pat_table_entry xelp_pat_table[] = {
+	[0] = { XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[1] = { XELP_PAT_WC, XE_COH_NONE },
+	[2] = { XELP_PAT_WT, XE_COH_NONE },
+	[3] = { XELP_PAT_UC, XE_COH_NONE },
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
+	[0] = { XELP_PAT_UC, XE_COH_NONE },
+	[1] = { XELP_PAT_WC, XE_COH_NONE },
+	[2] = { XELP_PAT_WT, XE_COH_NONE },
+	[3] = { XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[4] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, XE_COH_NONE },
+	[5] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[6] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, XE_COH_NONE },
+	[7] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
 };
 
-static const u32 xelpg_pat_table[] = {
-	[0] = XELPG_PAT_0_WB,
-	[1] = XELPG_PAT_1_WT,
-	[2] = XELPG_PAT_3_UC,
-	[3] = XELPG_PAT_0_WB | XELPG_2_COH_1W,
-	[4] = XELPG_PAT_0_WB | XELPG_3_COH_2W,
+static const struct xe_pat_table_entry xelpg_pat_table[] = {
+	[0] = { XELPG_PAT_0_WB, XE_COH_NONE },
+	[1] = { XELPG_PAT_1_WT, XE_COH_NONE },
+	[2] = { XELPG_PAT_3_UC, XE_COH_NONE },
+	[3] = { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_AT_LEAST_1WAY },
+	[4] = { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_AT_LEAST_1WAY },
 };
 
 /*
@@ -92,15 +96,18 @@ static const u32 xelpg_pat_table[] = {
  * coherency (which matches an all-0's encoding), so we can just omit them
  * in the table.
  */
-#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, coh_mode) \
-	(no_promote ? XE2_NO_PROMOTE : 0) | \
-	(comp_en ? XE2_COMP_EN : 0) | \
-	REG_FIELD_PREP(XE2_L3_CLOS, l3clos) | \
-	REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
-	REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
-	REG_FIELD_PREP(XE2_COH_MODE, coh_mode)
+#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
+	{ \
+		.value = (no_promote ? XE2_NO_PROMOTE : 0) | \
+			(comp_en ? XE2_COMP_EN : 0) | \
+			REG_FIELD_PREP(XE2_L3_CLOS, l3clos) | \
+			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
+			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
+			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
+		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
+	}
 
-static const u32 xe2_pat_table[] = {
+static const struct xe_pat_table_entry xe2_pat_table[] = {
 	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
 	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
 	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
@@ -133,23 +140,31 @@ static const u32 xe2_pat_table[] = {
 };
 
 /* Special PAT values programmed outside the main table */
-#define XE2_PAT_ATS	XE2_PAT( 0, 0, 0, 0, 3, 3 )
+static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
 
-static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+	return xe->pat.table[pat_index].coh_mode;
+}
+
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
 
@@ -289,16 +304,18 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 	.dump = xelpg_dump,
 };
 
-static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+static void xe2lpg_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			       int n_entries)
 {
 	program_pat_mcr(gt, table, n_entries);
-	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), XE2_PAT_ATS);
+	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe2_pat_ats.value);
 }
 
-static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			       int n_entries)
 {
 	program_pat(gt, table, n_entries);
-	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
+	xe_mmio_write32(gt, XE_REG(_PAT_ATS), xe2_pat_ats.value);
 }
 
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -396,6 +413,7 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WT] = 2;
 		xe->pat.idx[XE_CACHE_WB] = 0;
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
+		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
 		xe->pat.ops = &xelp_pat_ops;
 		xe->pat.table = xelp_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 09c491ab9f15..fa0dfbe525cd 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -6,9 +6,30 @@
 #ifndef _XE_PAT_H_
 #define _XE_PAT_H_
 
+#include <linux/types.h>
+
 struct drm_printer;
-struct xe_gt;
 struct xe_device;
+struct xe_gt;
+
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
+	 * @coh_mode: The GPU coherency mode that @value maps to.
+	 */
+#define XE_COH_NONE          1
+#define XE_COH_AT_LEAST_1WAY 2
+	u16 coh_mode;
+};
 
 /**
  * xe_pat_init_early - SW initialization, setting up data based on device
@@ -29,4 +50,12 @@ void xe_pat_init(struct xe_gt *gt);
  */
 void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
 
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
2.42.0

