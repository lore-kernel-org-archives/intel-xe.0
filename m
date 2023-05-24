Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05EFC7EE31
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122510E5E0;
	Wed, 24 May 2023 17:57:45 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E1410E292
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951052; x=1716487052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=272RsjskSbIk7FjvhyOb7yzbcktvAjnlL4SpJlZwwXE=;
 b=RRY1n9S+2sWeyGkhJ8RZhbYHguoOzukZx8eeFoj+2GEmmgNcDx5T/lAn
 BVFKHSzyti0/vyWWI6robRMZkoUJ/vMDR8k5IymU5oGAUAotuAZ2uOPV7
 GcLVsZJpg1yt3LvWm+L1npoyu7zOgqL/BBpqKK4r2gSljxQjszn2/GW2a
 ToZWIWmR6qfzWsmt0khW+8nmKwb5+D5ogUU8vwEvg7GXQzKVOBbOBvA5D
 rgceql5qo7qYdfN/FtcDoRicmTF8ig7BVlxzNI+DdbvDfOO7I8SKG+1iK
 76zL3fJQGWFEIIaZ1XyG0M8L01sn+rc3hobjLa9CMMPc54VU+gjFHyV8c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333266921"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333266921"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698629012"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698629012"
Received: from cannonro-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:54 +0100
Message-Id: <20230524175701.320653-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
References: <20230524175701.320653-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 2/9] drm/xe: keep pulling mem_access_get
 further back
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lockdep is unhappy about ggtt->lock -> runtime_pm, where it seems
to think this can somehow get inverted. The ggtt->lock looks like a
potentially sensitive driver lock, so likely a sensible move to never
call the runtime_pm routines while holding it. Actually it looks like
d3cold wants to grab this, so perhaps this can indeed deadlock.

v2:
 - Don't forget about xe_gt_tlb_invalidation_vma(), which now needs
   explicit access_get.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 12 +++++++-----
 drivers/gpu/drm/xe/xe_ggtt.c                |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 10 ++++++----
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c7c4df18e439..d140eee6473d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -130,9 +130,10 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
+	xe_device_mem_access_get(ggtt->gt->xe);
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
-		return ret;
+		goto out;
 
 	align = XE_PAGE_SIZE;
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -146,7 +147,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
 							 align, 0);
 		if (ret)
-			goto out;
+			goto out_unlock;
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE)
 			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
@@ -160,7 +161,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
 							 align, 0);
 		if (ret)
-			goto out;
+			goto out_unlock;
 
 		ggtt_ofs = vma->node.start;
 
@@ -174,9 +175,10 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	}
 
 	xe_ggtt_invalidate(to_gt(xe));
-
-out:
+out_unlock:
 	mutex_unlock(&ggtt->lock);
+out:
+	xe_device_mem_access_put(ggtt->gt->xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 546240261e0a..f986e8218820 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -142,12 +142,14 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
+	xe_device_mem_access_get(ggtt->gt->xe);
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt->gt);
 	mutex_unlock(&ggtt->lock);
+	xe_device_mem_access_put(ggtt->gt->xe);
 }
 
 int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
@@ -288,12 +290,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
+	xe_device_mem_access_get(ggtt->gt->xe);
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
+	xe_device_mem_access_put(ggtt->gt->xe);
 
 	return err;
 }
@@ -311,6 +315,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
+	xe_device_mem_access_get(ggtt->gt->xe);
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -320,6 +325,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	xe_ggtt_invalidate(ggtt->gt);
 
 	mutex_unlock(&ggtt->lock);
+	xe_device_mem_access_put(ggtt->gt->xe);
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 20f8f0aae6b4..44e442bf306c 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -114,7 +114,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	xe_device_mem_access_get(gt->xe);
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
@@ -143,7 +142,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	if (ret < 0 && fence)
 		invalidation_fence_signal(fence);
 	mutex_unlock(&guc->ct.lock);
-	xe_device_mem_access_put(gt->xe);
 
 	return ret;
 }
@@ -196,7 +194,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
-	int len = 0;
+	int len = 0, ret;
 
 	XE_BUG_ON(!vma);
 
@@ -250,7 +248,11 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 
 	XE_BUG_ON(len > MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+	xe_device_mem_access_get(gt->xe);
+	ret = send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+	xe_device_mem_access_put(gt->xe);
+
+	return ret;
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
-- 
2.40.1

