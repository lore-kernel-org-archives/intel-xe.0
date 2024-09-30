Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B0CDD1D6
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D7F10E59D;
	Mon, 30 Sep 2024 19:58:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFC210E59B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:57:48 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 10/15] drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
Date: Mon, 30 Sep 2024 21:57:44 +0200
Message-ID: <20240930195749.318998-11-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
References: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
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

This is the only user of the ggtt struct still there, add
some calls to lock/unlock ggtt and remove other dereferencing.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_ggtt.c           | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h           | 10 ++++++----
 3 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 0ae5d917f20fe..fcd9a519183b5 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -198,13 +198,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
-	ret = mutex_lock_interruptible(&ggtt->lock);
+	xe_pm_runtime_get_noresume(xe);
+	ret = xe_ggtt_lock_interruptible(ggtt);
 	if (ret)
 		goto out;
 
 	align = XE_PAGE_SIZE;
-	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
+	if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		align = max_t(u32, align, SZ_64K);
 
 	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
@@ -261,9 +261,9 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	}
 
 out_unlock:
-	mutex_unlock(&ggtt->lock);
+	xe_ggtt_unlock(ggtt);
 out:
-	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d259b44dc0fcf..a2be883c67e88 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -868,6 +868,30 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 	return total;
 }
 
+/**
+ * xe_ggtt_lock_interruptible - Lock GGTT for display updates
+ * @ggtt: &xe_ggtt
+ *
+ * There's no reason to want this outside of display, and that is only
+ * there because moving to here would be a layering violation.
+ */
+int xe_ggtt_lock_interruptible(struct xe_ggtt *ggtt)
+{
+	return mutex_lock_interruptible(&ggtt->lock);
+}
+
+/**
+ * xe_ggtt_unlock - Unlock GGTT after display updates
+ * @ggtt: &xe_ggtt
+ *
+ * There's no reason to want this outside of display, and that is only
+ * there because moving to here would be a layering violation.
+ */
+void xe_ggtt_unlock(struct xe_ggtt *ggtt)
+{
+	mutex_unlock(&ggtt->lock);
+}
+
 /**
  * xe_ggtt_read_pte - Read a PTE from the GGTT
  * @ggtt: &xe_ggtt
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 0c63cfa083c03..09bb1c9c0a743 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -22,8 +22,6 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
-int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
-			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
@@ -47,9 +45,13 @@ static inline void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 #endif
 
-u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
-
+/* Display specific function calls, don't use outside of xe/display */
+int xe_ggtt_lock_interruptible(struct xe_ggtt *ggtt);
+void xe_ggtt_unlock(struct xe_ggtt *ggtt);
+int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags);
 xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt);
+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
 void xe_ggtt_write_pte(struct xe_ggtt *ggtt, u64 offset, u64 pte);
 
 #endif
-- 
2.45.2

