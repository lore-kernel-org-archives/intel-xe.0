Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91975FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DD510EBC5;
	Tue, 28 Apr 2026 14:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcI5CkMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06A610EBC4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386463; x=1808922463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9CHCosqUhBmgjWPSb7znADUOBi9tWWXmGxpZXpH2JsU=;
 b=dcI5CkMZbts/b8QctJlEQSaRM2/d2FAX20uAqa+gbdxhd8JLsccHWoyH
 QvJwgEhfX/t2hJ9KtguNdmX6AnLaWN5oNblx7UA6uVHHl0wGCh53oEuuH
 TQBAqGXB24Jk8UxQHdD2/K09yhLqGzRI7PAVlHxllfNZKDJMF6nzf4v0M
 XgM5cGI4lSXeyvsqHhxYY7j139Y9lcv7DZsrsOi8E9SRFlfMGY9m7MqWM
 qamSXkiB0ep3yB32S4voC0kyyXii968DsTQHNf9/2gl34k37ZRa8i1zPb
 wOqLYSLf4NyczYdPfDX6JGkeRynE+hqKRmQrmIemHCfNj+Vi5MQTc8ErV A==;
X-CSE-ConnectionGUID: 9K7u266HQMCjhWr2sOPy4w==
X-CSE-MsgGUID: 8mI/E9CYS6CL/+/6WDksRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862324"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:43 -0700
X-CSE-ConnectionGUID: IrI+2BNNSAiTivdO/gZmNw==
X-CSE-MsgGUID: nzyP5WjeSbO2ARM4c8ojWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942360"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 05/13] drm/xe/kunit: Promote GGTT initialization to
 test_init() helper
Date: Tue, 28 Apr 2026 16:27:12 +0200
Message-ID: <20260428142722.582-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

Our test_init() helper already do a minimal initialization of the
kunit fake xe_device, including basic setup of main components like
xe_tile and xe_gt, but some other main components, like xe_ggtt or
xe_mmio, were completely untouched. Move basic GGTT initialization
to the test_init() helper function, as it does not require much
work, and allows to simplify other tests init functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  9 +++------
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 51e1e04001ac..0108316fa64a 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -51,19 +51,16 @@ static int guc_buf_test_init(struct kunit *test)
 		.sriov_mode = XE_SRIOV_MODE_PF,
 		.platform = XE_TIGERLAKE, /* some random platform */
 		.subplatform = XE_SUBPLATFORM_NONE,
+		.ggtt_start = DUT_GGTT_START,
+		.ggtt_size = DUT_GGTT_SIZE,
 	};
-	struct xe_ggtt *ggtt;
 	struct xe_guc *guc;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
 
-	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
 	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
-
-	KUNIT_ASSERT_EQ(test, 0,
-			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
-					   DUT_GGTT_SIZE));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, guc);
 
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..e4495a453f80 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -14,6 +14,7 @@
 #include "tests/xe_pci_test.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_ggtt.h"
 #include "xe_pm.h"
 
 /**
@@ -50,6 +51,18 @@ static void kunit_action_restore_priv(void *priv)
 	test->priv = priv;
 }
 
+static void fake_device_init_ggtt(struct xe_device *xe, u64 start, u64 size)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_tile *tile;
+	unsigned int id;
+
+	for_each_tile(tile, xe, id) {
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tile->mem.ggtt);
+		KUNIT_EXPECT_EQ(test, xe_ggtt_init_kunit(tile->mem.ggtt, start, size), 0);
+	}
+}
+
 /**
  * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
  * @test: the &kunit where this fake &xe_device will be used
@@ -64,12 +77,16 @@ static void kunit_action_restore_priv(void *priv)
  * in &kunit.priv pointer to the struct xe_pci_fake_data supplemented with
  * desired parameters prior to calling this function.
  *
+ * If xe_pci_fake_data->ggtt_size is set then this function will also do
+ * a minimal GGTT initialization.
+ *
  * This function uses KUNIT_ASSERT to detect any failures.
  *
  * Return: Always 0.
  */
 int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 {
+	struct xe_pci_fake_data *data = test->priv;
 	struct xe_device *xe;
 	struct device *dev;
 	int err;
@@ -86,6 +103,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 	err = kunit_add_action_or_reset(test, kunit_action_restore_priv, test->priv);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
+	if (data && data->ggtt_size)
+		fake_device_init_ggtt(xe, data->ggtt_start, data->ggtt_size);
+
 	test->priv = xe;
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 30505d1cbefc..e807585b88c2 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -22,6 +22,8 @@ struct xe_pci_fake_data {
 	struct xe_step_info step;
 	u32 graphics_verx100;
 	u32 media_verx100;
+	u64 ggtt_start;
+	u64 ggtt_size;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
-- 
2.47.1

