Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BDAC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E64B10EA54;
	Thu,  3 Apr 2025 18:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8p8t1VY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C810EA59
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743705660; x=1775241660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kAGgWYzptIfjVHmSk6WxvEG7qxgo+rheiMS+pv/1EJQ=;
 b=P8p8t1VYd2WN/dUQn5+omwp7o3ODr1qda6ZkPLlJIFQR2mzdKqAEKeQr
 jKi3PG9wF4C/cwiX72GrfpP8PFyAdPQok6dWvjyWt/2Zg8/5ipGSKr3+f
 a302HvswKwYfbdDQvDxEBrkdkt71DIpl4/w8+6QCEqmAMQArrV3WoI7LU
 nG2hcYCZ1Em3ukktSs4eoOG7UiPgjadQg8syk96N1yekM0eR8NxJ9c/4x
 AQOloufvimdPHPixVta1jLYss2IqkcU/zQfL78JugiETU0xQ2ZuMFKkeX
 nsrKmyL7zrDb2qRVkTkaUXOdWLTDNC9b9UfkPDXwNyBZwLt7y1rEsYy7S g==;
X-CSE-ConnectionGUID: r5OSeMovRR69MRduwxx1ag==
X-CSE-MsgGUID: hVOGOs64Tm6LuFU28WKGVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67604264"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="67604264"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:41:00 -0700
X-CSE-ConnectionGUID: H0fdkiZwTH6nViiIL5puuw==
X-CSE-MsgGUID: 15ervGiNQCu0fMNrcaJBNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132216397"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2025 11:40:58 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 1/4] drm/xe/vf: Divide GGTT ballooning into allocation and
 insertion
Date: Thu,  3 Apr 2025 20:40:52 +0200
Message-Id: <20250403184055.2317409-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403184055.2317409-1-tomasz.lis@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        |  11 +--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 102 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   2 +
 3 files changed, 82 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c13..769a8dc9be6e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -447,14 +447,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
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
@@ -477,16 +476,12 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 		return;
 
 	if (!drm_mm_node_allocated(&node->base))
-		goto free_node;
+		return;
 
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
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..c3ca33725161 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -560,35 +560,38 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
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
+	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
+		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
 
-	err = xe_ggtt_node_insert_balloon(node, start, end);
-	if (err) {
-		xe_ggtt_node_fini(node);
-		return ERR_PTR(err);
-	}
+	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1]))
+		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
 
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
@@ -611,33 +614,76 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
-		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
-			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[0], start, end);
+		if (err)
+			return err;
 	}
 
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
-		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
+		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[1], start, end);
+		if (err) {
 			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
-			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
+			return err;
 		}
 	}
 
 	return 0;
 }
 
-static void deballoon_ggtt(struct drm_device *drm, void *arg)
+static int vf_balloon_ggtt(struct xe_gt *gt)
 {
-	struct xe_tile *tile = arg;
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
+ * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes which limited used address renge.
+ * @gt: the &xe_gt struct instance
+ */
+void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	lockdep_assert_held(&tile->mem.ggtt->lock);
+
 	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
 	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
 }
 
+static void vf_deballoon_ggtt(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	mutex_lock(&tile->mem.ggtt->lock);
+	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
+	mutex_unlock(&tile->mem.ggtt->lock);
+}
+
+static void vf_balloon_fini(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
+}
+
+static void deballoon_and_fini_ggtt(struct drm_device *drm, void *arg)
+{
+	struct xe_tile *tile = arg;
+
+	vf_deballoon_ggtt(tile->primary_gt);
+	vf_balloon_fini(tile->primary_gt);
+}
+
 /**
  * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
  * @gt: the &xe_gt
@@ -655,11 +701,17 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return 0;
 
-	err = vf_balloon_ggtt(gt);
+	err = vf_init_ggtt_balloons(gt);
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
+	err = vf_balloon_ggtt(gt);
+	if (err) {
+		vf_balloon_fini(gt);
+		return err;
+	}
+
+	return drmm_add_action_or_reset(&xe->drm, deballoon_and_fini_ggtt, tile);
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

