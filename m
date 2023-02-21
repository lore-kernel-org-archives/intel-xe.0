Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BA9C678DB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A9710E3A6;
	Tue, 21 Feb 2023 23:34:09 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00C610E391
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EsN13vDLfkAzqWKdQ9Sx7dZTaxs2DNRSO34sd5svXA=;
 b=iWfWpr/3MN7svvgQ7gjLhhfj5mHkPMi0db0qI4JqQ/LT9VMFRvKuoi4U
 b3PKuUpxItvfGJz7b0t0c5A6VoGCqJMEAsYA9joMynb9MJ5x/1cCBI4d3
 ebDej5Ix5pj/jAkng/t09tn7uTSfYM91FPFUXtPamSyURARuxDvSBeh81
 9i8Y0mqQSMta6e8UxKmaFngFEFxE27M54vYsi16O3pu1ZEDKVrz9zGIRQ
 CdSCQFILxKeaFZ/aokuxurgEt7jvXS93iD8tCCFJwFjOUmSoKzXpVR4D5
 +IiHmz6tGlHGXZhFLSMMAp2zbSuWZPKobWeqmPVlRvppBW3479j3LvA7C Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156250"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156250"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691839"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691839"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:45 -0800
Message-Id: <20230221233348.883897-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221233348.883897-1-lucas.demarchi@intel.com>
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe: Fix kunit integration due to missing
 prototypes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to avoid  -Werror=missing-prototypes, add the prototypes and
move the functions to the end of the file, surrounded by
`#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)`.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      | 54 +++++++++++++++------------
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +++
 3 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 87ac21cc8ca9..2c94ddaacda6 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -141,29 +141,6 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
 	xe_bo_put(bo);
 }
 
-static int ccs_test_run_device(struct xe_device *xe)
-{
-	struct kunit *test = xe_cur_kunit();
-	struct xe_gt *gt;
-	int id;
-
-	if (!xe_device_has_flat_ccs(xe)) {
-		kunit_info(test, "Skipping non-flat-ccs device.\n");
-		return 0;
-	}
-
-	for_each_gt(gt, xe, id)
-		ccs_test_run_gt(xe, gt, test);
-
-	return 0;
-}
-
-void xe_ccs_migrate_kunit(struct kunit *test)
-{
-	xe_call_for_each_device(ccs_test_run_device);
-}
-EXPORT_SYMBOL(xe_ccs_migrate_kunit);
-
 static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
 {
 	struct xe_bo *bo, *external;
@@ -278,6 +255,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+
 static int evict_test_run_device(struct xe_device *xe)
 {
 	struct kunit *test = xe_cur_kunit();
@@ -296,8 +275,37 @@ static int evict_test_run_device(struct xe_device *xe)
 	return 0;
 }
 
+void xe_bo_evict_kunit(struct kunit *test);
+
 void xe_bo_evict_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(evict_test_run_device);
 }
 EXPORT_SYMBOL(xe_bo_evict_kunit);
+
+static int ccs_test_run_device(struct xe_device *xe)
+{
+	struct kunit *test = xe_cur_kunit();
+	struct xe_gt *gt;
+	int id;
+
+	if (!xe_device_has_flat_ccs(xe)) {
+		kunit_info(test, "Skipping non-flat-ccs device.\n");
+		return 0;
+	}
+
+	for_each_gt(gt, xe, id)
+		ccs_test_run_gt(xe, gt, test);
+
+	return 0;
+}
+
+void xe_ccs_migrate_kunit(struct kunit *test);
+
+void xe_ccs_migrate_kunit(struct kunit *test)
+{
+	xe_call_for_each_device(ccs_test_run_device);
+}
+EXPORT_SYMBOL(xe_ccs_migrate_kunit);
+
+#endif
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 615d22e3f731..d8ad135d0e04 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -252,6 +252,8 @@ static int dma_buf_run_device(struct xe_device *xe)
 	return 0;
 }
 
+void xe_dma_buf_kunit(struct kunit *test);
+
 void xe_dma_buf_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(dma_buf_run_device);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 03a60d5b42f1..7be0c2543916 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -352,6 +352,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	xe_bo_vunmap(m->pt_bo);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+
 static int migrate_test_run_device(struct xe_device *xe)
 {
 	struct kunit *test = xe_cur_kunit();
@@ -371,8 +373,12 @@ static int migrate_test_run_device(struct xe_device *xe)
 	return 0;
 }
 
+void xe_migrate_sanity_kunit(struct kunit *test);
+
 void xe_migrate_sanity_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(migrate_test_run_device);
 }
 EXPORT_SYMBOL(xe_migrate_sanity_kunit);
+
+#endif
-- 
2.39.0

