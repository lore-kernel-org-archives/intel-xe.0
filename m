Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E7CC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EAD10E148;
	Thu,  3 Sep 2026 16:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUvYs3aq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F3210E148
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452188; x=1819988188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6zU9HeVnXtZAdICrsvn/c555qgcnQISNYaaRDBVUV1o=;
 b=DUvYs3aqFYy20D/aM0hcjLn5jFpxE/LiuzUnI7gi9LPfY8EhCjJHkrHM
 OChNxfsKNGqXrhf0W03jS1Qk4xbq3uEydRxfS9Y8ZsybJbZZ/AC0PeSEU
 7Kn2DlPu8GzYKxpdPYzEXdaLnM+ARNqF84hAVGYmF/U0uKCy6Dl28ZVIN
 9sOGBNGIbXS299s7DXfm/7i68SFrZVvkcN7QzT4qrz2oX0hHf/1piviu/
 LfbwUg0gu6v2Ifg8v6O+4UsamCZ2d+qFdQwj4ZGsnoEdPAgGkQUjNykDX
 rnAP0F1OW5pKzcxcpIkAFWztHWNmKmeD231M0A3ybL643MPcc5eIHg3ue A==;
X-CSE-ConnectionGUID: KT98gxj4SvenDk8MqaxT7w==
X-CSE-MsgGUID: BBoV1RaJQmiRaizQxHDSuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114487027"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114487027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:28 -0700
X-CSE-ConnectionGUID: EA3J9XEiRX2BENwrbeqmOA==
X-CSE-MsgGUID: x9REAtzlS1+63ph5hOSMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461493"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V21 07/15] drm/xe/vram: Extract buddy allocation and free
 helpers
Date: Thu,  3 Sep 2026 21:46:00 +0530
Message-ID: <20260903161553.528932-24-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

Factor out xe_ttm_vram_buddy_alloc() and xe_ttm_vram_buddy_free()
from xe_ttm_vram_mgr_new() and xe_ttm_vram_mgr_del().

These new helpers consolidate block allocation/deallocation with
visible-size tracking. This modularization makes the logic reusable by
the upcoming VRAM page offlining reservation path.

No functional change.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 90 ++++++++++++++++++----------
 1 file changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 0f9cf1c3a576..a5116dc05166 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -49,6 +49,48 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
 	return true;
 }
 
+static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
+				   u64 end, u64 size, u64 min_page_size,
+				   struct list_head *blocks, unsigned long flags,
+				   struct ttm_resource *res, u64 *used_visible)
+{
+	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
+	int err;
+
+	err = gpu_buddy_alloc_blocks(mm, start, end, size, min_page_size, blocks, flags);
+	if (err)
+		return err;
+
+	/*
+	 * Track the owning resource, never the owning BO. A BO backpointer
+	 * cached here goes stale the moment TTM hands the resource to a ghost
+	 * object (ttm_buffer_object_transfer()), which happens on every
+	 * accelerated move and on pipelined gutting. The resource, in
+	 * contrast, has exactly the same lifetime as these blocks and TTM
+	 * keeps &ttm_resource.bo pointing at the current owner for us.
+	 */
+	list_for_each_entry(block, blocks, link)
+		block->private = res;
+
+	if (end <= mgr->visible_size) {
+		*used_visible = size;
+	} else {
+		list_for_each_entry(block, blocks, link) {
+			u64 blk_start = gpu_buddy_block_offset(block);
+
+			if (blk_start < mgr->visible_size) {
+				u64 blk_end = blk_start + gpu_buddy_block_size(mm, block);
+
+				*used_visible += min(blk_end, mgr->visible_size) - blk_start;
+			}
+		}
+	}
+
+	mgr->visible_avail -= *used_visible;
+	return 0;
+}
+
 static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 			       struct ttm_buffer_object *tbo,
 			       const struct ttm_place *place,
@@ -57,7 +99,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
-	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -118,32 +159,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	err = gpu_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
-				     (u64)lpfn << PAGE_SHIFT, size,
-				     min_page_size, &vres->blocks, vres->flags);
+	err = xe_ttm_vram_buddy_alloc(mgr, (u64)place->fpfn << PAGE_SHIFT,
+				      (u64)lpfn << PAGE_SHIFT, size,
+				      min_page_size, &vres->blocks, vres->flags,
+				      &vres->base, &vres->used_visible_size);
 	if (err)
 		goto error_unlock;
-
-	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
-		vres->used_visible_size = size;
-	} else {
-		struct gpu_buddy_block *block;
-
-		list_for_each_entry(block, &vres->blocks, link) {
-			u64 start = gpu_buddy_block_offset(block);
-
-			if (start < mgr->visible_size) {
-				u64 end = start + gpu_buddy_block_size(mm, block);
-
-				vres->used_visible_size +=
-					min(end, mgr->visible_size) - start;
-			}
-		}
-	}
-
-	mgr->visible_avail -= vres->used_visible_size;
-	list_for_each_entry(block, &vres->blocks, link)
-		block->private = &vres->base;
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
@@ -175,20 +196,27 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	return err;
 }
 
+static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
+				   struct list_head *blocks,
+				   u64 used_visible)
+{
+	struct gpu_buddy_block *block;
+
+	list_for_each_entry(block, blocks, link)
+		block->private = NULL;
+	gpu_buddy_free_list(&mgr->mm, blocks, 0);
+	mgr->visible_avail += used_visible;
+}
+
 static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
 	struct xe_ttm_vram_mgr_resource *vres =
 		to_xe_ttm_vram_mgr_resource(res);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
-	struct gpu_buddy *mm = &mgr->mm;
-	struct gpu_buddy_block *block;
 
 	mutex_lock(&mgr->lock);
-	list_for_each_entry(block, &vres->blocks, link)
-		block->private = NULL;
-	gpu_buddy_free_list(mm, &vres->blocks, 0);
-	mgr->visible_avail += vres->used_visible_size;
+	xe_ttm_vram_buddy_free(mgr, &vres->blocks, vres->used_visible_size);
 	mutex_unlock(&mgr->lock);
 
 	ttm_resource_fini(man, res);
-- 
2.52.0

