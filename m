Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FC8C3ABCD
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 11:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847010E395;
	Mon, 12 May 2025 11:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHH8nxem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC5B10E183
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747050022; x=1778586022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zUfO2thh5Dkp1QcevljS7KMWMorZHdf8uEl1BWs7MUc=;
 b=CHH8nxem5+3EcL3sAtv7vrdc2GF5tNr0umB01QnoT9IugDYOFsQCGLHs
 WR9kIrAeOVgcIIpvVtxVGCzgSWdMDgFkn5PAmTTw1WS/88LWE5eiUVbng
 jnflAGnrUfpEJqNhIcPSo86JURIpq5W5a/G7t7kVFyyFzSSa8RvHMYzGO
 fciR/ONu2Bp/fVAzd7rn/vh1k09NL0lEaNa4Al1DkwfJTzCvrLj/oI1Av
 mBAmVMuekjAZlStWi56RXmIHvA4w+CmWE69h9wVT162J2vpY/V1DDixnv
 4MfLYl1chxfZN6xkt6804DdJUHWWIQIqRCGKR5zUBBke7ulItglQ8PYoe Q==;
X-CSE-ConnectionGUID: O6K8Q04pTvSmhdHKjwG/4w==
X-CSE-MsgGUID: gKy7jUiJRjmHYJc1ZEMyyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66250686"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66250686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 04:40:22 -0700
X-CSE-ConnectionGUID: rRBlX83sQTq3sEtUj4OyeQ==
X-CSE-MsgGUID: wbQL926hRSGImbe1oQRCHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142241184"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 04:40:20 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v14 1/4] drm/xe/vf: Divide GGTT ballooning into allocation and
 insertion
Date: Mon, 12 May 2025 13:40:15 +0200
Message-Id: <20250512114018.361843-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250512114018.361843-1-tomasz.lis@intel.com>
References: <20250512114018.361843-1-tomasz.lis@intel.com>
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

The balloon nodes, which are used to fill areas of GGTT inaccessible
for a specific VF, were allocated and inserted into GGTT within one
function. To be able to re-use that insertion code during VF
migration recovery, we need to split it.

This patch separates allocation (init/fini functs) from the insertion
of balloons (balloon/deballoon functs). Locks are also moved to ensure
calls from post-migration recovery worker will not cause a deadlock.

v2: Moved declarations to proper header
v3: Rephrased description, introduced "_locked" versions of some
  functs, more lockdep checks, some functions renamed, altered error
  handling, added missing kerneldocs.
v4: Suffixed more functs with `_locked`, moved lockdep asserts,
  fixed finalization in error path, added asserts
v5: Renamed another few functs, used xe_ggtt_node_allocated(),
  moved lockdep back again to avoid null dereference, added
  asserts, improved comments
v6: Changed params of cleanup_ggtt()

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        |  35 ++++-----
 drivers/gpu/drm/xe/xe_ggtt.h        |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 114 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   2 +
 4 files changed, 107 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7062115909f2..5a37233f2420 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -429,16 +429,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  *
- * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
+ * To be used in cases where ggtt->lock is already taken.
+ * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
+int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
 	int err;
@@ -447,14 +448,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
+	lockdep_assert_held(&ggtt->lock);
 
 	node->base.color = 0;
 	node->base.start = start;
 	node->base.size = end - start;
 
-	mutex_lock(&ggtt->lock);
 	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
-	mutex_unlock(&ggtt->lock);
 
 	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
 		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
@@ -466,27 +466,22 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 }
 
 /**
- * xe_ggtt_node_remove_balloon - release a reserved GGTT region
+ * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * See xe_ggtt_node_insert_balloon() for details.
+ * To be used in cases where ggtt->lock is already taken.
+ * See xe_ggtt_node_insert_balloon_locked() for details.
  */
-void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
+void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
 {
-	if (!node || !node->ggtt)
+	if (!xe_ggtt_node_allocated(node))
 		return;
 
-	if (!drm_mm_node_allocated(&node->base))
-		goto free_node;
+	lockdep_assert_held(&node->ggtt->lock);
 
 	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
 
-	mutex_lock(&node->ggtt->lock);
 	drm_mm_remove_node(&node->base);
-	mutex_unlock(&node->ggtt->lock);
-
-free_node:
-	xe_ggtt_node_fini(node);
 }
 
 /**
@@ -537,12 +532,12 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
  * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
  *
- * This function will allocated the struct %xe_ggtt_node and return it's pointer.
+ * This function will allocate the struct %xe_ggtt_node and return its pointer.
  * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
- * or xe_ggtt_node_remove_balloon().
+ * or xe_ggtt_node_remove_balloon_locked().
  * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
  * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
+ * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
@@ -564,7 +559,7 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
  * @node: the &xe_ggtt_node to be freed
  *
  * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * or xe_ggtt_node_insert_balloon(); and this @node is not going to be reused, then,
+ * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
  * this function needs to be called to free the %xe_ggtt_node struct
  **/
 void xe_ggtt_node_fini(struct xe_ggtt_node *node)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..d468af96b465 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -15,9 +15,9 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
-int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
-				u64 start, u64 size);
-void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
+				       u64 start, u64 size);
+void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..f82ddff79b3b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -560,35 +560,43 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
-static struct xe_ggtt_node *
-vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
+static int vf_init_ggtt_balloons(struct xe_gt *gt)
 {
-	struct xe_ggtt_node *node;
-	int err;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	node = xe_ggtt_node_init(ggtt);
-	if (IS_ERR(node))
-		return node;
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	err = xe_ggtt_node_insert_balloon(node, start, end);
-	if (err) {
-		xe_ggtt_node_fini(node);
-		return ERR_PTR(err);
+	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
+		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
+
+	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
+		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
+		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
 	}
 
-	return node;
+	return 0;
 }
 
-static int vf_balloon_ggtt(struct xe_gt *gt)
+/**
+ * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
+ * @gt: the &xe_gt struct instance
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 start, end;
+	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	lockdep_assert_held(&tile->mem.ggtt->lock);
 
 	if (!config->ggtt_size)
 		return -ENODATA;
@@ -611,31 +619,77 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
-		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
-			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
+							 start, end);
+		if (err)
+			return err;
 	}
 
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
-		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
-			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
-			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
+							 start, end);
+		if (err) {
+			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
+			return err;
 		}
 	}
 
 	return 0;
 }
 
-static void deballoon_ggtt(struct drm_device *drm, void *arg)
+static int vf_balloon_ggtt(struct xe_gt *gt)
+{
+	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
+	int err;
+
+	mutex_lock(&ggtt->lock);
+	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
+	mutex_unlock(&ggtt->lock);
+
+	return err;
+}
+
+/**
+ * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
+ * @gt: the &xe_gt struct instance
+ */
+void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
 {
-	struct xe_tile *tile = arg;
+	struct xe_tile *tile = gt_to_tile(gt);
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
+}
+
+static void vf_deballoon_ggtt(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	mutex_lock(&tile->mem.ggtt->lock);
+	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
+	mutex_unlock(&tile->mem.ggtt->lock);
+}
+
+static void vf_fini_ggtt_balloons(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+
+	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
+}
+
+static void cleanup_ggtt(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	vf_deballoon_ggtt(gt);
+	vf_fini_ggtt_balloons(gt);
 }
 
 /**
@@ -655,11 +709,17 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return 0;
 
-	err = vf_balloon_ggtt(gt);
+	err = vf_init_ggtt_balloons(gt);
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
+	err = vf_balloon_ggtt(gt);
+	if (err) {
+		vf_fini_ggtt_balloons(gt);
+		return err;
+	}
+
+	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, gt);
 }
 
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ba6c5d74e326..d717deb8af91 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
+void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
-- 
2.25.1

