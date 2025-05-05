Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94236C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 12:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4190B10E3E0;
	Mon,  5 May 2025 12:20:12 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442C210E3E7
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 12:20:11 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 10/10] drm/xe: Do not rely on GGTT internals in xe_guc_buf
 kunit tests
Date: Mon,  5 May 2025 14:19:23 +0200
Message-ID: <20250505121924.921544-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505121924.921544-1-dev@lankhorst.se>
References: <20250505121924.921544-1-dev@lankhorst.se>
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

Add a function to init ggtt for kunit, and use the GGTT function for
initialising the GGTT node without populating it. This
prevents the test from ever knowing about struct xe_ggtt.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 11 +++++-----
 drivers/gpu/drm/xe/xe_ggtt.c                | 23 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h                |  1 +
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 6faffcd748694..537766cdd882e 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -42,10 +42,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
 
 		KUNIT_ASSERT_EQ(test, 0,
-				drm_mm_insert_node_in_range(&ggtt->mm,
-							    &bo->ggtt_node[tile->id]->base,
-							    bo->size, SZ_4K,
-							    0, 0, U64_MAX, 0));
+				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
+						    bo->size, SZ_4K));
 	}
 
 	return bo;
@@ -67,8 +65,9 @@ static int guc_buf_test_init(struct kunit *test)
 	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
 	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
 
-	drm_mm_init(&ggtt->mm, DUT_GGTT_START, DUT_GGTT_SIZE);
-	mutex_init(&ggtt->lock);
+	KUNIT_ASSERT_EQ(test, 0,
+			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
+					   DUT_GGTT_START + DUT_GGTT_SIZE));
 
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2316f3a74d9c3..d019466649881 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
@@ -221,6 +222,22 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
+{
+	drm_mm_init(&ggtt->mm, reserved,
+		    ggtt->size - reserved);
+	mutex_init(&ggtt->lock);
+	primelockdep(ggtt);
+}
+
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
+{
+	ggtt->size = size;
+	__xe_ggtt_init_early(ggtt, reserved);
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
+
 /**
  * xe_ggtt_init_early - Early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -267,11 +284,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt->pt_ops = &xelp_pt_ops;
 
 	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
-
-	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
-		    ggtt->size - xe_wopcm_size(xe));
-	mutex_init(&ggtt->lock);
-	primelockdep(ggtt);
+	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 600a76526cf34..9a11872e16d80 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,6 +13,7 @@ struct xe_tile;
 
 struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
-- 
2.45.2

