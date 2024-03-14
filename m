Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121CAC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 19:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02B110EF6F;
	Thu, 14 Mar 2024 19:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZIhcCV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD4E10FD3C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710446314; x=1741982314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzv56j370BtnS98hPIti5Jq5W7F801qdYslF3pt4ht4=;
 b=aZIhcCV5Qi2Gw9AainmNKrrkrcbnNMT7NEfpbptXUYxf4n1dBZfF4z3b
 PZgdrgIyRbyF6kAUj+MIwJim13oCoLhw/fXdKCTdU9/WlsxI6j0y+ooQ+
 q1xcWnTe5R17Ta7iQ6dBe0K2wCjuVencm/6GCXM4R9uw0b0UxIKifQ6XF
 1nfRaLobtibSSJ3tLa1Pz1uu4yQenfQ8/A51ZRwd3o4buk9AFBy4r1D93
 XAgzTAmh3sf5yxYpmOKlwDk195vlxuQa15PDshQU37FImiVN+NGOQ1r4j
 DYVx8/5vPPj8iZjaXLI8fQ6vP7AxXI+5pVZoK7R4P69o0hS87DBQdeOXp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5422612"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5422612"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 12:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12309190"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 12:58:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe/mocs: Clarify which GT is being operated on
Date: Thu, 14 Mar 2024 12:58:27 -0700
Message-ID: <20240314195825.3226856-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314195825.3226856-3-matthew.d.roper@intel.com>
References: <20240314195825.3226856-3-matthew.d.roper@intel.com>
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

Switch the MOCS-related debug messages to use a GT-specific logging
function and add ID/type output to the beginning of the MOCS kunit test
to assist with debug when problems arise.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_mocs.c       | 20 +++++++++-----------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 7fd99ba96a12..1b8617075b37 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -29,6 +29,8 @@ static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
 
 	flags = get_mocs_settings(gt_to_xe(gt), &arg->table);
 
+	kunit_info(test, "gt %d", gt->info.id);
+	kunit_info(test, "gt type %d", gt->info.type);
 	kunit_info(test, "table size %d", arg->table.size);
 	kunit_info(test, "table uc_index %d", arg->table.uc_index);
 	kunit_info(test, "table n_entries %d", arg->table.n_entries);
@@ -40,7 +42,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
 	struct kunit *test = xe_cur_kunit();
-	struct xe_device *xe = gt_to_xe(gt);
 	u32 l3cc, l3cc_expected;
 	unsigned int i;
 	u32 reg_val;
@@ -56,7 +57,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 			else
 				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
 
-			mocs_dbg(&xe->drm, "reg_val=0x%x\n", reg_val);
+			mocs_dbg(gt, "reg_val=0x%x\n", reg_val);
 		} else {
 			/* Just re-use value read on previous iteration */
 			reg_val >>= 16;
@@ -65,7 +66,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 		l3cc_expected = get_entry_l3cc(info, i);
 		l3cc = reg_val & 0xffff;
 
-		mocs_dbg(&xe->drm, "[%u] expected=0x%x actual=0x%x\n",
+		mocs_dbg(gt, "[%u] expected=0x%x actual=0x%x\n",
 			 i, l3cc_expected, l3cc);
 
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
@@ -78,7 +79,6 @@ static void read_mocs_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
 	struct kunit *test = xe_cur_kunit();
-	struct xe_device *xe = gt_to_xe(gt);
 	u32 mocs, mocs_expected;
 	unsigned int i;
 	u32 reg_val;
@@ -99,7 +99,7 @@ static void read_mocs_table(struct xe_gt *gt,
 		mocs_expected = get_entry_control(info, i);
 		mocs = reg_val;
 
-		mocs_dbg(&xe->drm, "[%u] expected=0x%x actual=0x%x\n",
+		mocs_dbg(gt, "[%u] expected=0x%x actual=0x%x\n",
 			 i, mocs_expected, mocs);
 
 		KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 35ccd4ac00d2..bff659d20062 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -17,10 +17,10 @@
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define mocs_dbg drm_dbg
+#define mocs_dbg xe_gt_dbg
 #else
 __printf(2, 3)
-static inline void mocs_dbg(const struct drm_device *dev,
+static inline void mocs_dbg(const struct xe_gt *gt,
 			    const char *format, ...)
 { /* noop */ }
 #endif
@@ -479,20 +479,18 @@ static bool regs_are_mcr(struct xe_gt *gt)
 static void __init_mocs_table(struct xe_gt *gt,
 			      const struct xe_mocs_info *info)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
 	unsigned int i;
 	u32 mocs;
 
-	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
-		      "Unused entries index should have been defined\n");
+	xe_gt_WARN_ONCE(gt, !info->unused_entries_index,
+			"Unused entries index should have been defined\n");
 
-	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
+	mocs_dbg(gt, "mocs entries: %d\n", info->n_entries);
 
 	for (i = 0; i < info->n_entries; i++) {
 		mocs = get_entry_control(info, i);
 
-		mocs_dbg(&gt_to_xe(gt)->drm, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
+		mocs_dbg(gt, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_GLOBAL_MOCS(i).addr, mocs);
 
 		if (regs_are_mcr(gt))
@@ -526,13 +524,13 @@ static void init_l3cc_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 l3cc;
 
-	mocs_dbg(&gt_to_xe(gt)->drm, "l3cc entries: %d\n", info->n_entries);
+	mocs_dbg(gt, "l3cc entries: %d\n", info->n_entries);
 
 	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
 		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
 				    get_entry_l3cc(info, 2 * i + 1));
 
-		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
+		mocs_dbg(gt, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_LNCFCMOCS(i).addr, l3cc);
 
 		if (regs_are_mcr(gt))
@@ -568,7 +566,7 @@ void xe_mocs_init(struct xe_gt *gt)
 	 * performed by the GuC.
 	 */
 	flags = get_mocs_settings(gt_to_xe(gt), &table);
-	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
+	mocs_dbg(gt, "flag:0x%x\n", flags);
 
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt, &table);
-- 
2.43.0

