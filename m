Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC5CEDDA4
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71010E4F6;
	Tue, 18 Nov 2025 16:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaJy6ki5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCA710E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484230; x=1795020230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZS8pMBOMFV9A9FuBLlE6+0OaavQTI+8QqRU08s9709c=;
 b=IaJy6ki5701lcbh5F/bq+b9ei2JalljvfiJ3pKyJdlGErJ5M32NvuU3N
 szt/RGn3elWr7S4rSHuj3OoQ4J3vncfQCs3SYakohaEkDvE5E6AxfCehC
 nsVMzWvv9zBx4krjoNxsJtE3VQTjCcU9E71Mtry+wS5fw8Ucz7FOOuQXg
 itkfyf4Xy3enbn7h0p6IpQSIwfma+HNQ9AU9hpaqZYL0y2zS81Wb0ujIM
 ZloCjB635FkOSRyVscCV1jFCQD1JLTJ35ZE7u7SQJmT2pVevb6331774l
 LH++yw84PrHgpHj0+v3VRKjNYPA8SXmNBPOQXkq2rfSCwysndUtxNEm66 w==;
X-CSE-ConnectionGUID: JuJ3bFLtSMegqhsYITf1JA==
X-CSE-MsgGUID: 6EELhsOPTJKrVDXKIEMPFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544765"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
X-CSE-ConnectionGUID: XbF5boBdT4+8C5qphGPGWg==
X-CSE-MsgGUID: RGPnlkiFSc6Ld2Hn+mhH2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952215"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 07/27] drm/xe/mocs: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:46 -0800
Message-ID: <20251118164338.3572146-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

