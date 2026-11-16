Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD2D606A329
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=XNh9qrOz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFDC10F04C;
	Mon, 16 Nov 2026 12:27:29 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546CE10EFD5
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794832042;
 bh=M4OGogYSBYSi+KS5PdGLC6liIKyu+OIAnImvZdT/v8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XNh9qrOz2xn/m3tkO11rYvhL3H6XV4ZTmx3PPszanOlSQhyvJYRB/47UUTb/C70Or
 PHOjcX1OTWr9lb6jL4jI4st4hCm4c1cykKqpWWja+OZybV2I7lfEKc7agISsfeEGx5
 YmwEgv4LZYE9JlVvLvho0s6zJ0YKZEB4d7uiCrLyRjpsIzr3Xjm5y04V6nFOzwmcu4
 hJw3jYjnRJTBP5aHPQ6eZBPXqOQgUzhsvhU2N690SkmJMisNjohC/agAMyFRbe4RT5
 VUE/SRbQ1111V50hKLy4hNm1XoEd5S0xkKgPzWZ1kssTdx1aS9l1OpzvW9w5T1g2Ug
 fBKHG8sXBZ3YQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 2/6] drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
Date: Mon, 16 Nov 2026 13:28:31 +0100
Message-ID: <20261116122828.266113-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116122828.266113-8-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index ca38d51f41441..d7486dd545a26 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -475,18 +475,18 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
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
-	if (bound && node->invalidate_on_remove) {
+	if (clear && node->invalidate_on_remove) {
 		xe_ggtt_invalidate(ggtt);
 		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
 		xe_ggtt_invalidate_engine(ggtt);
@@ -496,6 +496,22 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
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
@@ -503,7 +519,7 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
 	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
 
 	guard(xe_pm_runtime)(xe);
-	ggtt_node_remove(node);
+	ggtt_node_remove(node, true);
 }
 
 /**
@@ -525,7 +541,7 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
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
2.55.0

