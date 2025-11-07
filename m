Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE80CCFA1F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90A610EB86;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5wOSpBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4DD10EB7B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539212; x=1794075212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g0HpR/5Gg8R75GEzddAld/Duebecb6PJC1V0MfxmG88=;
 b=l5wOSpBUaJXUrxBTJ7tvEBNnBuMo9eLK1zRhZrx4CVlxc4SJhIQBSWJ/
 JbsHVlykn5qO0esZMXjn5GvNxggCNK6linOvxT7PCk4M07lG9IBs8h5UY
 E0PakYgJ0TSiXo1ot4Lqm5A+MmxwxSbbzz037NKpVrzIeBQTDl6/zp4xf
 3BVgilCD8fYZmXD1ysC6PxB9TFrkVX/5yZLlSZEvhm5I3GJHtEwSOT0Ur
 KBtt3XI0AaTWQ9iofMIEvLkl2ItnQljuKawUqmr4O3L5H+Bwq0kOqre6A
 VbMK9mNGCQbr/UJWdOmSaeJmzkzdhL+oHwVUZjlroQm++4CH6vCxoYPrR A==;
X-CSE-ConnectionGUID: /kYMJ/O9Rd6Ti0DZSC4sGQ==
X-CSE-MsgGUID: kJkiB1ltSwSdxOCOP7s7Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733166"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:32 -0800
X-CSE-ConnectionGUID: JL1dHl4NSGyWezCgs/3gWQ==
X-CSE-MsgGUID: FkuWZ3kBTL2tQTZw0dSAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271247"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 31/33] drm/xe/tests: Use scope-based runtime PM
Date: Fri,  7 Nov 2025 10:13:47 -0800
Message-ID: <20251107181315.631642-66-matthew.d.roper@intel.com>
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

Use scope-based handling of runtime PM in the kunit tests for
consistency with other parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      | 10 ++--------
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |  3 +--
 drivers/gpu/drm/xe/tests/xe_migrate.c | 10 ++--------
 drivers/gpu/drm/xe/tests/xe_mocs.c    | 10 ++--------
 4 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 2294cf89f3e1..2278e589a493 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -185,8 +185,7 @@ static int ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_tile(tile, xe, id) {
 		/* For igfx run only for primary tile */
 		if (!IS_DGFX(xe) && id > 0)
@@ -194,8 +193,6 @@ static int ccs_test_run_device(struct xe_device *xe)
 		ccs_test_run_tile(xe, tile, test);
 	}
 
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
@@ -356,13 +353,10 @@ static int evict_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_tile(tile, xe, id)
 		evict_test_run_tile(xe, tile, test);
 
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 5df98de5ba3c..954b6b911ea0 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -266,7 +266,7 @@ static int dma_buf_run_device(struct xe_device *xe)
 	const struct dma_buf_test_params *params;
 	struct kunit *test = kunit_get_current_test();
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	for (params = test_params; params->mem_mask; ++params) {
 		struct dma_buf_test_params p = *params;
 
@@ -274,7 +274,6 @@ static int dma_buf_run_device(struct xe_device *xe)
 		test->priv = &p;
 		xe_test_dmabuf_import_same_driver(xe);
 	}
-	xe_pm_runtime_put(xe);
 
 	/* A non-zero return would halt iteration over driver devices */
 	return 0;
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 5904d658d1f2..34e2f0f4631f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -344,8 +344,7 @@ static int migrate_test_run_device(struct xe_device *xe)
 	struct xe_tile *tile;
 	int id;
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_tile(tile, xe, id) {
 		struct xe_migrate *m = tile->migrate;
 		struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
@@ -356,8 +355,6 @@ static int migrate_test_run_device(struct xe_device *xe)
 		xe_vm_unlock(m->q->vm);
 	}
 
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
@@ -759,13 +756,10 @@ static int validate_ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_tile(tile, xe, id)
 		validate_ccs_test_run_tile(xe, tile, test);
 
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 16681a0f1f77..fe6eabaa4812 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -115,8 +115,7 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 	unsigned int flags;
 	int id;
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		if (flags & HAS_GLOBAL_MOCS)
@@ -125,8 +124,6 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 			read_l3cc_table(gt, &mocs.table);
 	}
 
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
@@ -150,8 +147,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 	int id;
 	struct kunit *test = kunit_get_current_test();
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		kunit_info(test, "mocs_reset_test before reset\n");
@@ -169,8 +165,6 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 			read_l3cc_table(gt, &mocs.table);
 	}
 
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
-- 
2.51.1

