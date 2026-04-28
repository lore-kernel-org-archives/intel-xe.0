Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3CFF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491310EC7F;
	Tue, 28 Apr 2026 14:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VElnlbYw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D70010EBDB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386464; x=1808922464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTt2NlaU0qRbpDyU1vtlgFLpp4LHYbeHlUcLHZmExbM=;
 b=VElnlbYwyLDb9de69+1rSOZtFYMsSjrJOuc9xlgazJjduMPPVBPoZx1U
 5rDihDWlmond478G3MSISgAaYjLK1qEH+6hj1YNYSI6PijDPhsCNoFKVn
 hhIRrEmPo/kZL3Jy3BkdwhSzvp2tYdpr5/oLD2lHVdsZwdFafZLTzWFLQ
 9ZJKY02Jx7VweCleLoOk+e/5ftMh2RroaQ3t1Q4WPhMAFGT6rv0lBWFxH
 lad3Uq5baFMYXNLWnI0x+vSeftvCT8HD38dOY7Zt7sJBwg0GfEBdT/CaS
 YgpsMRinR0HIaXp3bz2I88QZ5LA/7n+VFBCI7+/TJY3nwI8Wk/u7knZz8 Q==;
X-CSE-ConnectionGUID: rLCJOn5eSDC3gMxZX4lS5Q==
X-CSE-MsgGUID: 8gggpqfXT0+Q7ibrGqSTEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862326"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:44 -0700
X-CSE-ConnectionGUID: bMq0Bp7mTHi5zT8X8zrZjA==
X-CSE-MsgGUID: hf0IJXg0R+m3dTM3RPFCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942363"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 06/13] drm/xe/kunit: Promote fake BO activation to test_init()
 helper
Date: Tue, 28 Apr 2026 16:27:13 +0200
Message-ID: <20260428142722.582-7-michal.wajdeczko@intel.com>
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

We already introduced a fake buffer object allocation stub in one
of our kunit tests. Move this stub activation to our test_init()
helper function for easier reuse and to avoid code duplication.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 33 -----------------
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 39 +++++++++++++++++++++
 2 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 0108316fa64a..a6439e991688 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -16,35 +16,6 @@
 #define DUT_GGTT_START		SZ_1M
 #define DUT_GGTT_SIZE		SZ_2M
 
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
-	}
-
-	return bo;
-}
-
 static int guc_buf_test_init(struct kunit *test)
 {
 	struct xe_pci_fake_data fake = {
@@ -61,10 +32,6 @@ static int guc_buf_test_init(struct kunit *test)
 
 	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, guc);
-
-	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
-				   replacement_xe_managed_bo_create_pin_map);
-
 	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
 
 	test->priv = &guc->buf;
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index e4495a453f80..8276cabc4820 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -9,9 +9,11 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
+#include <drm/drm_managed.h>
 
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_ggtt.h"
@@ -63,6 +65,40 @@ static void fake_device_init_ggtt(struct xe_device *xe, u64 start, u64 size)
 	}
 }
 
+static struct xe_bo *fake_xe_managed_bo_create_pin_map(struct xe_device *xe,
+						       struct xe_tile *tile,
+						       size_t size, u32 flags)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_bo *bo;
+	void *buf;
+
+	KUNIT_EXPECT_TRUE(test, flags & XE_BO_FLAG_SYSTEM);
+	buf = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+
+	bo = drmm_kzalloc(&xe->drm, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
+
+	bo->tile = tile;
+	bo->ttm.bdev = &xe->ttm;
+	bo->ttm.base.size = size;
+	iosys_map_set_vaddr(&bo->vmap, buf);
+
+	if (flags & XE_BO_FLAG_GGTT) {
+		struct xe_ggtt *ggtt = tile->mem.ggtt;
+		struct xe_ggtt_node *node;
+
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ggtt);
+		node = xe_ggtt_insert_node(ggtt, xe_bo_size(bo), SZ_4K);
+		if (IS_ERR(node))
+			return ERR_CAST(node);
+		bo->ggtt_node[tile->id] = node;
+	}
+
+	return bo;
+}
+
 /**
  * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
  * @test: the &kunit where this fake &xe_device will be used
@@ -106,6 +142,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 	if (data && data->ggtt_size)
 		fake_device_init_ggtt(xe, data->ggtt_start, data->ggtt_size);
 
+	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
+				   fake_xe_managed_bo_create_pin_map);
+
 	test->priv = xe;
 	return 0;
 }
-- 
2.47.1

