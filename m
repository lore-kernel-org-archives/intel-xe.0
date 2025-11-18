Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E8FCEE33D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AB610E504;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FV18AQbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B810E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484232; x=1795020232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I2isgpHpwMMEDv419of/mqczfu6RPxx6Iims+lTOULI=;
 b=FV18AQbm4uOHFMkOY8Wb/0fQ5osdMiPJHtyCrzpHuFxah3PemlfVXpg2
 mLs2kx7/Q0YovPKRdjDqzzzyI8F1Z2idJ19+srnNdEJUNiJv8hxY6zuRJ
 731Avi46thrltIn4kFalfiUoI7VkK257sem9D9BCS7cWRIYM7BON0azEO
 iIVzpzQEtz1FztuWxSKeB24cIFFx24TmazwY2Sjam12D7U0ZFgQhPUN36
 AVcquRheGv0gKdaObzT8JGT+uVMAP6ywRE21dFCzldfCQ0B4wjj9GO92j
 74sS3jJHdDhH7qBZO5Dm2armGCz6JRf05V8cvnJL99nzlAnkKFj0Y2pVd A==;
X-CSE-ConnectionGUID: ajgOL8gFQ/+tGizFo45cOQ==
X-CSE-MsgGUID: ChAHX+/GQRuPSMAeEAlkzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544792"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: zJMldMT3Sny6xUynWy1BdQ==
X-CSE-MsgGUID: vR8A9flzTgWrocb/EJ9fMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952274"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 25/27] drm/xe/tests: Use scope-based runtime PM
Date: Tue, 18 Nov 2025 08:44:04 -0800
Message-ID: <20251118164338.3572146-54-matthew.d.roper@intel.com>
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

Use scope-based handling of runtime PM in the kunit tests for
consistency with other parts of the driver.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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
index 28374330b894..daf3c6836c75 100644
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

