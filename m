Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC6ECCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7435610E34B;
	Mon, 10 Nov 2025 23:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ark2whzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8D010E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816835; x=1794352835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VbXqKDe7RdAHY+KWxhnpDP0eGLPBQE3Bp7DXlfwz3sc=;
 b=ark2whzriJvcjE8OvC4zgvMlDQbUS0M0ZEoFRFolSph/LDnZtJcrOc9P
 zkVQfNBG9hbTCoQLjzyd1s9FmVy7seDsOEKfrWiEKm/kR9g72SiWml2dx
 aDizoFnOJmdAotgZIuk+bjG0sobC4gdBspdZv1CgR+g8HXfhnQLIetp4Z
 +U8cCKGlhEXXQV9P8/gj0kj5oIa6M4/ohqLhjqGER5maOZCGJsSiHD+AV
 wKkaSPDSpLyk4h6yoK7Gan/5DT/mUC+CgAOzGev6TghgeZoqzGVVc5LWn
 fNSgQA7R25qos6BcLWOWleKb4gu9koL+0yIp37vy92NLanfNq0yRU/N0S Q==;
X-CSE-ConnectionGUID: EADV4QouRVCv/nOqQGzGeg==
X-CSE-MsgGUID: 2QWTxe8IR7ufjEFFRtmN5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486466"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:33 -0800
X-CSE-ConnectionGUID: 3s7LB/2pS7KHrRybMTkhVg==
X-CSE-MsgGUID: CJF4PB3sQLWInXlsWt+2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244032"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 28/30] drm/xe/tests: Use scope-based runtime PM
Date: Mon, 10 Nov 2025 15:20:46 -0800
Message-ID: <20251110232017.1475869-60-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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
index 53a0c9c49f85..28cebbe4baed 100644
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

