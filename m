Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82A7C77B6C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB25D10E9D7;
	Wed, 12 Apr 2023 22:53:04 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E5A10E9E3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681339976; x=1712875976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46ABOACrBEx0auBej4OU4rQ4RsTTTX81JNiadBkQeBY=;
 b=N+F4ge8M+8a1vr1bWK/Egs6ybKuy+KDyi9w0qwlVfbW+UfVbXxoEse9N
 3i7H3ggidI8bg9c4kii+dqAThcYTGDrTRpi6s6Nk1Ih2i6mzpgnRWCtLj
 CkLkr/XiYlD6y9UNJSOn+VDdpFR+RlNnj61/A/VaxHEObPHxoxIqCVYiP
 SH5PE8+OF2aFR7JgitCWHbp4Bn7sq4uNLi+aWWTwA+QtRRFNTrTsSWqvb
 3LymKrRgEblrwUMTZjOZrNzXZkEtSEOwj2az9Y9WwehEmBERnjfWP44qz
 MNdeF3VCZ+4VfIbT0lNNLWtILrGPc4PJzmjLioNWZCh+1IdOWducWE0Jq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344038897"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344038897"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721757092"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721757092"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 15:52:47 -0700
Message-Id: <20230412225248.3229571-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/8] drm/xe: Invalidate TLB on all affected
 GTs during GGTT updates
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Platforms with a standalone media GT share a single GGTT between the
primary and media GTs.  However each of these GTs has its own TLBs
caching the page table, and each needs to be invalidated separately.
Convert ggtt->gt into a list of GTs so that we can iterate and
invalidate them all.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 15 +++++++++++----
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  4 ++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  2 ++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0ae373b604f6..374830a7a0cf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -98,7 +98,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
-	ggtt->gt = gt;
+	list_add_tail(&gt->mem.ggtt_link, &ggtt->gt_list);
 
 	gsm_size = probe_gsm_size(pdev);
 	if (gsm_size == 0) {
@@ -139,6 +139,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
 	struct drm_mm_node *hole;
+	struct xe_gt *gt;
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
@@ -146,7 +147,8 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
-	xe_ggtt_invalidate(ggtt->gt);
+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
+		xe_ggtt_invalidate(gt);
 	mutex_unlock(&ggtt->lock);
 }
 
@@ -263,6 +265,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
+	struct xe_gt *gt;
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
@@ -271,7 +274,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	xe_ggtt_invalidate(ggtt->gt);
+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
+		xe_ggtt_invalidate(gt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -316,13 +320,16 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
+	struct xe_gt *gt;
+
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	xe_ggtt_invalidate(ggtt->gt);
+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
+		xe_ggtt_invalidate(gt);
 
 	mutex_unlock(&ggtt->lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index ea70aaef4b31..fd527179f81b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -12,7 +12,7 @@ struct xe_bo;
 struct xe_gt;
 
 struct xe_ggtt {
-	struct xe_gt *gt;
+	struct list_head gt_list;
 
 	u64 size;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4186f7f0d42f..a07d17af3db0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -71,6 +71,8 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 		if (!gt->mem.ggtt)
 			return -ENOMEM;
 
+		INIT_LIST_HEAD(&gt->mem.ggtt->gt_list);
+
 		gt->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.vram_mgr),
 						GFP_KERNEL);
 		if (!gt->mem.vram_mgr)
@@ -81,6 +83,8 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 
 		gt->mem.ggtt = full_gt->mem.ggtt;
 		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
+
+		list_add_tail(&gt->mem.ggtt_link, &full_gt->mem.ggtt->gt_list);
 	}
 
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..1eff57f43731 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -164,6 +164,8 @@ struct xe_gt {
 		struct xe_ttm_vram_mgr *vram_mgr;
 		/** @ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
+		/** @ggtt_link: node in GGTT's GT list */
+		struct list_head ggtt_link;
 	} mem;
 
 	/** @reset: state for GT resets */
-- 
2.39.2

