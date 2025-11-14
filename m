Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75542CEACE9
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C52610EB46;
	Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+mtxYjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F2C10EB2D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156629; x=1794692629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZS8pMBOMFV9A9FuBLlE6+0OaavQTI+8QqRU08s9709c=;
 b=N+mtxYjCt++NSG0Tix9rHKnYK6doe7hpVIUcIOqt1cE3q54UxzRzk031
 HEAB1+yMTHQfp/mn+qjx20jpnTF39dD//xqxY2b16NXwBcHCN/9G+736r
 WHrRoYAnD10MyZ6+FQqp+/6isBNhSZLN/L6sdBhLvOiPeo74wUetIhiXx
 0+V9r8KIW35kqcXTVwcMNhEIR3cy/kfugW7ehRZQkltzaOX4Rq4MTfxsM
 D+pLSihmLZA+sCN70Zgf2dx+6U4vxigomeDGplI4LljPfqvqmPvlq8tct
 U2+8O9gu+64gbwrU2ChngjUOZ/irkebUzX+XMgd/4DCSzTBBUc5rF+tYs Q==;
X-CSE-ConnectionGUID: jFmB8vEuSqGyTLONCi1kjg==
X-CSE-MsgGUID: kkjDIjBlQO2SnmbI8LZIIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648309"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648309"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: xnsq6uzZRs6UIG+Ugh5/Zw==
X-CSE-MsgGUID: wIYmy4O9R9mEkDxklbj/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308294"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 07/27] drm/xe/mocs: Use scope-based cleanup
Date: Fri, 14 Nov 2025 13:43:43 -0800
Message-ID: <20251114214335.2388972-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Using scope-based cleanup for runtime PM and forcewake in the MOCS code
allows us to eliminate some goto-based error handling and simplify some
other functions.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 17 ++++++-----------
 drivers/gpu/drm/xe/xe_mocs.c       | 18 ++++++------------
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 6bb278167aaf..28374330b894 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -43,14 +43,12 @@ static void read_l3cc_table(struct xe_gt *gt,
 {
 	struct kunit *test = kunit_get_current_test();
 	u32 l3cc, l3cc_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
 		KUNIT_FAIL_AND_ABORT(test, "Forcewake Failed.\n");
-	}
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
@@ -74,7 +72,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
 				    "l3cc idx=%u has incorrect val.\n", i);
 	}
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -82,14 +79,14 @@ static void read_mocs_table(struct xe_gt *gt,
 {
 	struct kunit *test = kunit_get_current_test();
 	u32 mocs, mocs_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
 
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_NE_MSG(test, fw_ref.domains, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
@@ -106,8 +103,6 @@ static void read_mocs_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
 				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 6613d3b48a84..0b7225bd77e0 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -811,26 +811,20 @@ int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	enum xe_force_wake_domains domain;
 	struct xe_mocs_info table;
-	unsigned int fw_ref, flags;
-	int err = 0;
+	unsigned int flags;
 
 	flags = get_mocs_settings(xe, &table);
 
 	domain = flags & HAS_LNCF_MOCS ? XE_FORCEWAKE_ALL : XE_FW_GT;
-	xe_pm_runtime_get_noresume(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), domain);
 
-	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
-		err = -ETIMEDOUT;
-		goto err_fw;
-	}
+	guard(xe_pm_runtime_noresume)(xe);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), domain);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, domain))
+		return -ETIMEDOUT;
 
 	table.ops->dump(&table, flags, gt, p);
 
-err_fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_pm_runtime_put(xe);
-	return err;
+	return 0;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-- 
2.51.1

