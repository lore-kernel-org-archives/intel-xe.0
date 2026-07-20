Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AFBC44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CA810E9D9;
	Mon, 20 Jul 2026 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Ef+Q6Dez";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC6A10E9D3;
 Mon, 20 Jul 2026 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564040;
 bh=J+dO8qqHWc64WGG6JZVa7qd8cRI/2zZRat+e2Y2DYhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ef+Q6Dezm+m08P8xcRwdR70i1NOMf97VGrHYy2ubT+FpBzZRfJxWgYnW3/vc7zeEc
 nn7eG/5O6IPmPo99HYG9X2Z1kwziUjvw4AZmMl3dnvNxezI2NlQn6zdiUq1M3FDZne
 SOUS/YeuEl7Cb+Ril485COTUoFZ0oESvZiMkmrYHSaCL3YE6MJwUr6zrd9hhSfqN0G
 /fXbwa9LrFloOgMhb6DFSBLEZQV772pZV4zsRPnbYjLQcH5bKw9G/Ru+vBQLQHhOMo
 39MFY5J3zsKCVKQ0EaGDIjg1BmjQwrrpDTFY8DIzD9dpX/lPjOobKq0Zjo7AmqrnCf
 NAbfVtEo0sUsQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [DO NOT REVIEW 02/11] drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
Date: Mon, 20 Jul 2026 18:14:54 +0200
Message-ID: <20260720161451.384968-15-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The last bit required for handling fb takeover is
ensuring we can release the old live framebuffer
without keeping track. The display code can then
safely perform the flip.

It's unfortunately a workaround for how display
is structured through callbacks instead of being
a midlayer.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 30 +++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ggtt.h |  1 +
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 50e5b174c7960..225e6378b2bfc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -470,24 +470,40 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-static void ggtt_node_remove(struct xe_ggtt_node *node)
+static void ggtt_node_remove(struct xe_ggtt_node *node, bool clear)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
-	bool bound;
 
 	mutex_lock(&ggtt->lock);
-	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
-	if (bound)
+	if (clear)
+		clear = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
+	if (clear)
 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
-	if (bound && node->invalidate_on_remove)
+	if (clear && node->invalidate_on_remove)
 		xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
 
 	ggtt_node_fini(node);
 }
 
+/**
+ * xe_ggtt_node_remove_noclear - Remove a &xe_ggtt_node from the GGTT without clearing entries
+ * @node: the &xe_ggtt_node to be removed
+ *
+ * This function is similar to xe_ggtt_node_remove(), but doesn't clear
+ * the entries. It's used to release the live FB mapping without
+ * clearing it.
+ *
+ * This function should only be called before xe_ggtt_init() in
+ * the bios FB takeover code.
+ */
+void xe_ggtt_node_remove_noclear(struct xe_ggtt_node *node)
+{
+	ggtt_node_remove(node, false);
+}
+
 static void ggtt_node_remove_work_func(struct work_struct *work)
 {
 	struct xe_ggtt_node *node = container_of(work, typeof(*node),
@@ -495,7 +511,7 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
 	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
 
 	guard(xe_pm_runtime)(xe);
-	ggtt_node_remove(node);
+	ggtt_node_remove(node, true);
 }
 
 /**
@@ -517,7 +533,7 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 	node->invalidate_on_remove = invalidate;
 
 	if (xe_pm_runtime_get_if_active(xe)) {
-		ggtt_node_remove(node);
+		ggtt_node_remove(node, true);
 		xe_pm_runtime_put(xe);
 	} else {
 		queue_work(ggtt->wq, &node->delayed_removal_work);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 15e62ecec2287..7cd8b45ed5cd8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -32,6 +32,7 @@ xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      u64 size, u32 align,
 			      xe_ggtt_transform_cb transform, void *arg);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
+void xe_ggtt_node_remove_noclear(struct xe_ggtt_node *node);
 size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
-- 
2.53.0

