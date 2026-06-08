Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953DDCD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ED210F76F;
	Mon,  8 Jun 2026 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGFhBRV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2515C10F765
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937699; x=1812473699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4cyc5ERXxq85EGIsw+1JK6J4GZJiNLc1IEg+ZqqL5NM=;
 b=MGFhBRV5n2Scx4C/7G925N8TtALUkJ/xzeY4rKOc6b27TYNizQs7Lu0D
 CpIgSILEec33SfUZFKjxOR4o3QRc2o1veKXSkO+ywYZCYwhOVcdy/utaU
 rBGyL5mOjeJ1rmNRZ5dBkRmPTB0PQWpLE9HaR2jfCLXIb5PxG0HqT6iYm
 xk6cmgV6MvmyRfuYkyP1DkBYYsnmZx1EvRYwYlMLA6Y27ZQdZc012BY89
 6W3KF046GzD0Yl8zVD61yNMtZgwXovDN9XXZTDOPmi3BUsam3tUyUlOYq
 PxzR9xhgvZZFbFov0ChRDypzF6DeiEEduMd+yYHIe+odZClXwuJtoFu/z Q==;
X-CSE-ConnectionGUID: geFZXm8NSn2mn3zuywc2Jw==
X-CSE-MsgGUID: SJUGJSuYRymIXiQErrDOKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744583"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:59 -0700
X-CSE-ConnectionGUID: WPrmqBzHSmWmZ+HmXMHJRA==
X-CSE-MsgGUID: d8hbhUQ4QriZc6fsIu3JuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467613"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 16/16] drm/xe/tests: Use regular xe_managed_bo_create_pin_map()
Date: Mon,  8 Jun 2026 18:54:29 +0200
Message-ID: <20260608165429.587-17-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

Instead of defining the stub for the xe_managed_bo_create_pin_map()
we can now just initialize more xe components, like we do on the
real device, and call regular function to use obtained xe_bo object
in more other functions without crashing.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 66 +++++++--------------
 1 file changed, 21 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 1e41bb4831d6..7be3597be059 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -8,54 +8,19 @@
 #include <kunit/test-bug.h>
 
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_guc_ct.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
+#include "xe_pm.h"
+#include "xe_tlb_inval.h"
+#include "xe_ttm_sys_mgr.h"
+#include "xe_wa.h"
 
 #define DUT_GGTT_START		SZ_8M /* more than WOPCM */
 #define DUT_GGTT_SIZE		SZ_2M
 
-static void remove_ggtt_node(void *arg)
-{
-	struct xe_ggtt_node *node = arg;
-
-	xe_ggtt_node_remove(node, false);
-}
-
-static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *xe,
-							      struct xe_tile *tile,
-							      size_t size, u32 flags)
-{
-	struct kunit *test = kunit_get_current_test();
-	struct xe_bo *bo;
-	void *buf;
-
-	bo = drmm_kzalloc(&xe->drm, sizeof(*bo), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
-
-	buf = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
-
-	bo->tile = tile;
-	bo->ttm.bdev = &xe->ttm;
-	bo->ttm.base.size = size;
-	iosys_map_set_vaddr(&bo->vmap, buf);
-
-	if (flags & XE_BO_FLAG_GGTT) {
-		struct xe_ggtt *ggtt = tile->mem.ggtt;
-
-		bo->ggtt_node[tile->id] = xe_ggtt_insert_node(ggtt, xe_bo_size(bo), SZ_4K);
-		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
-		KUNIT_ASSERT_EQ(test, 0,
-				devm_add_action_or_reset(xe->drm.dev,
-							 remove_ggtt_node,
-							 bo->ggtt_node[tile->id]));
-	}
-
-	return bo;
-}
-
 static int guc_buf_test_init(struct kunit *test)
 {
 	struct xe_pci_fake_data fake = {
@@ -65,17 +30,28 @@ static int guc_buf_test_init(struct kunit *test)
 		.ggtt.start = DUT_GGTT_START,
 		.ggtt.size = DUT_GGTT_SIZE,
 	};
+	struct xe_device *xe;
 	struct xe_guc *guc;
+	struct xe_gt *gt;
+	int id;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
 
-	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
+	xe = test->priv;
+	KUNIT_ASSERT_EQ(test, 0, xe_device_init_early(xe));
+	xe_wa_device_init(xe);
+	xe_wa_process_device_oob(xe);
+	KUNIT_ASSERT_EQ(test, 0, xe_ttm_sys_mgr_init(xe));
+
+	for_each_gt(gt, xe, id) {
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+		xe_gt_tlb_inval_init_early(gt);
+		xe_gt_mmio_init(gt);
+	}
+
+	guc = &xe_device_get_gt(xe, 0)->uc.guc;
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, guc);
-
-	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
-				   replacement_xe_managed_bo_create_pin_map);
-
 	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
 
 	test->priv = &guc->buf;
-- 
2.47.1

