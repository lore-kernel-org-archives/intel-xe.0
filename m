Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38C5CCFA1A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819510EB8E;
	Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlY2xS68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AE110EB7B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539210; x=1794075210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XTn3AB1FtmHP1+1tKFmx8JQL4UcTsKfwkwSwNi7IUuI=;
 b=ZlY2xS681o9fcr9F8WA04yJetgWg0H37CushF2XzdENmlYf8hI9KmoVS
 CMOpKGVcxb3qLjBRqLDgqGD75PY4jje7BwgJ9dsCL5MaVhYaTDs8cnCKp
 /702eX4LOyifNWvQ/xl9+/LhpVMHUwcZ/h6QagAd9E1pVhYjgbhIgPapv
 byluWCUo0qc/7xbLrSaWGhmpw6rw015xSDVntOVhYAR1U3uoVlVHkZ0Ir
 GS3ajNXl5GlMKCZgidW4k4cX7Dnr6wU/ehRw7FOpxlz77Et7PZXX3MLXZ
 J+DdOzLj7VOefH21aIArSA9cy31hXg3iSV9mxL2PNrbaacnk2h+hZbHuc Q==;
X-CSE-ConnectionGUID: fIMUcZD7RfGwjGky/KmeZg==
X-CSE-MsgGUID: uKxjNmFLQZGqlmfH91uPVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733146"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: BfxqosdxRLKy9eQp9o9rHA==
X-CSE-MsgGUID: 9cBqJCf5QeG2zR7kZ5aLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271185"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 13/33] drm/xe/mocs: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:29 -0800
Message-ID: <20251107181315.631642-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 13 +++----------
 drivers/gpu/drm/xe/xe_mocs.c       | 17 +++++------------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 611050d49d0b..16681a0f1f77 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -42,16 +42,13 @@ static void read_l3cc_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
 	struct kunit *test = kunit_get_current_test();
-	struct xe_force_wake_ref fw_ref;
 	u32 l3cc, l3cc_expected;
 	unsigned int i;
 	u32 reg_val;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_force_wake_put(fw_ref);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
-	}
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
@@ -75,14 +72,12 @@ static void read_l3cc_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
 				    "l3cc idx=%u has incorrect val.\n", i);
 	}
-	xe_force_wake_put(fw_ref);
 }
 
 static void read_mocs_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
 	struct kunit *test = kunit_get_current_test();
-	struct xe_force_wake_ref fw_ref;
 	u32 mocs, mocs_expected;
 	unsigned int i;
 	u32 reg_val;
@@ -90,7 +85,7 @@ static void read_mocs_table(struct xe_gt *gt,
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_NE_MSG(test, fw_ref.domains, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
@@ -108,8 +103,6 @@ static void read_mocs_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
 				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
-
-	xe_force_wake_put(fw_ref);
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 7b7b71ef82f1..1c590fe5eca3 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -811,27 +811,20 @@ int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	enum xe_force_wake_domains domain;
 	struct xe_mocs_info table;
-	struct xe_force_wake_ref fw_ref;
 	unsigned int flags;
-	int err = 0;
 
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
+	if (!xe_force_wake_ref_has_domain(fw_ref, domain))
+		return -ETIMEDOUT;
 
 	table.ops->dump(&table, flags, gt, p);
 
-err_fw:
-	xe_force_wake_put(fw_ref);
-	xe_pm_runtime_put(xe);
-	return err;
+	return 0;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-- 
2.51.1

