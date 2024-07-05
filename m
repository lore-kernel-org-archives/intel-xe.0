Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D8DC3271E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 19:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6660810E26D;
	Fri,  5 Jul 2024 19:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ynmk3jKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A5610E1AD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jul 2024 19:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720206669; x=1751742669;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sErtj9+1BVYyWlrRZTOfYkn60ZJPFDVap2FzHTfuF0M=;
 b=Ynmk3jKny7HKqbALvjYuu8DEymt17KxbC/EIX7GjGSL4tod7wv5eiTYh
 kykLbOj2tunDjPvO3kUouD2WZ/fY8nOfeO+2HWnPNq70yUz1xGG0XLJNt
 lmYPj66D4XjMoufrXBIcsL5GcIvkZcWgyDMn2pa3v0byDp8f9+kUMta37
 6A8xTJ/UKJhL92dul6NwY+CFLLwP+hLlvZDGIhyHSUEs190SU+RfPpCjv
 D+udI9WiRWXJua9879HOYEgJC9++dUuI7b0J7jCwFYUU9pg3cOPk4w1jD
 4SpvCQXu8BSKvqndZMUlWJnqiDD747DU++k7lug6CLzuBSs3kfdmf3RH1 A==;
X-CSE-ConnectionGUID: yGLeepydTzGFf2fcnz2FNQ==
X-CSE-MsgGUID: 70xpmxgFQbWngqdbv7BvMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17644040"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17644040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:11:09 -0700
X-CSE-ConnectionGUID: B0L7+8MvTuC0v4nPZoCC9w==
X-CSE-MsgGUID: Bpu1RYtWSi2F0vITGnM1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="51781483"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:11:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/kunit: Kill xe_cur_kunit()
Date: Fri,  5 Jul 2024 21:10:56 +0200
Message-Id: <20240705191057.1110-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240705191057.1110-1-michal.wajdeczko@intel.com>
References: <20240705191057.1110-1-michal.wajdeczko@intel.com>
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

We shouldn't use custom helper if there is a official one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c       | 4 ++--
 drivers/gpu/drm/xe/tests/xe_dma_buf.c  | 4 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c  | 2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c     | 8 ++++----
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 4 ++--
 drivers/gpu/drm/xe/tests/xe_test.h     | 8 +++-----
 6 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..263e0afa8de0 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -154,7 +154,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 static int ccs_test_run_device(struct xe_device *xe)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	struct xe_tile *tile;
 	int id;
 
@@ -325,7 +325,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 static int evict_test_run_device(struct xe_device *xe)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	struct xe_tile *tile;
 	int id;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index e7f9b531c465..b56013963911 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -107,7 +107,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 
 static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
 	struct drm_gem_object *import;
 	struct dma_buf *dmabuf;
@@ -258,7 +258,7 @@ static const struct dma_buf_test_params test_params[] = {
 static int dma_buf_run_device(struct xe_device *xe)
 {
 	const struct dma_buf_test_params *params;
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 
 	xe_pm_runtime_get(xe);
 	for (params = test_params; params->mem_mask; ++params) {
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 962f6438e219..d277a21ccf91 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -334,7 +334,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 static int migrate_test_run_device(struct xe_device *xe)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	struct xe_tile *tile;
 	int id;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 67c65e88c384..4fff5de92dea 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -23,7 +23,7 @@ struct live_mocs {
 static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
 {
 	unsigned int flags;
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 
 	memset(arg, 0, sizeof(*arg));
 
@@ -41,7 +41,7 @@ static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
 static void read_l3cc_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	u32 l3cc, l3cc_expected;
 	unsigned int i;
 	u32 reg_val;
@@ -78,7 +78,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 static void read_mocs_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	u32 mocs, mocs_expected;
 	unsigned int i;
 	u32 reg_val;
@@ -148,7 +148,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 	struct xe_gt *gt;
 	unsigned int flags;
 	int id;
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 
 	xe_pm_runtime_get(xe);
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index a6705a536391..744a37583d2d 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -16,7 +16,7 @@
 
 static void check_graphics_ip(const struct xe_graphics_desc *graphics)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	u64 mask = graphics->hw_engine_mask;
 
 	/* RCS, CCS, and BCS engines are allowed on the graphics IP */
@@ -30,7 +30,7 @@ static void check_graphics_ip(const struct xe_graphics_desc *graphics)
 
 static void check_media_ip(const struct xe_media_desc *media)
 {
-	struct kunit *test = xe_cur_kunit();
+	struct kunit *test = kunit_get_current_test();
 	u64 mask = media->hw_engine_mask;
 
 	/* VCS, VECS and GSCCS engines are allowed on the media IP */
diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index 7a1ae213e750..55e5b5bedccc 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -9,8 +9,8 @@
 #include <linux/types.h>
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-#include <linux/sched.h>
 #include <kunit/test.h>
+#include <kunit/test-bug.h>
 
 /*
  * Each test that provides a kunit private test structure, place a test id
@@ -32,7 +32,6 @@ struct xe_test_priv {
 #define XE_TEST_DECLARE(x) x
 #define XE_TEST_ONLY(x) unlikely(x)
 #define XE_TEST_EXPORT
-#define xe_cur_kunit() current->kunit_test
 
 /**
  * xe_cur_kunit_priv - Obtain the struct xe_test_priv pointed to by
@@ -48,10 +47,10 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
 {
 	struct xe_test_priv *priv;
 
-	if (!xe_cur_kunit())
+	if (!kunit_get_current_test())
 		return NULL;
 
-	priv = xe_cur_kunit()->priv;
+	priv = kunit_get_current_test()->priv;
 	return priv->id == id ? priv : NULL;
 }
 
@@ -60,7 +59,6 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
 #define XE_TEST_DECLARE(x)
 #define XE_TEST_ONLY(x) 0
 #define XE_TEST_EXPORT static
-#define xe_cur_kunit() NULL
 #define xe_cur_kunit_priv(_id) NULL
 
 #endif
-- 
2.43.0

