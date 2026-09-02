Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A2C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36FC10F267;
	Wed,  2 Sep 2026 14:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOGkPemc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B5B10F267
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360901; x=1819896901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dRKKSv7TqgQvJ97n30o0q6R2DAVLlN1rs9qB0Zb7Fk=;
 b=MOGkPemckKSQrf3j1V6Z+6nyYJ92AsBdAdH2XnQ8jLZ+D823Fc4y09DT
 g18s7tla52cqtpTLx01bQxAc0liiOaagNrSD7LEtziRxPcT8Jg6EbKmpb
 94UhD3QXs2R7TYeyb5D3q3bbfALoiXEwnLrV0lhsqWEk1qSyW4kOhSh8+
 qyez9N6Yo7iTncFjYc2OZMUmWUWgXrmamazQYThXQFZzWx7VQmtpdutPc
 xCKnW92KAd6HfeeBw0Cj4p7ITPI9L43xgppcbRrroOvBuqt3QHTtvEcFA
 XmBx4aQHNeo7AnOem3YFhDj6EkBw6s7F0nunQHqPYU/a122LexnBV/som w==;
X-CSE-ConnectionGUID: U8PcrlJkSSa0NcQMkG7RtQ==
X-CSE-MsgGUID: DLNaUnEBSgCWPhyiDQs+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526013"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:01 -0700
X-CSE-ConnectionGUID: qstQ/WxaRZqpaDVpNJNUCw==
X-CSE-MsgGUID: Nc30u+0oQBaUw3SpktNrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260028"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V20 07/15] drm/xe/vram: Extract buddy allocation and free
 helpers
Date: Wed,  2 Sep 2026 20:23:50 +0530
Message-ID: <20260902145343.465686-24-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

This update includes a functional change: block->private now tracks the
owning ttm_resource instead of the tbo. Tracking the resource avoids
stale pointer bugs when TTM hands resources to a ghost object during
accelerated moves or pipelined gutting, ensuring the cached pointer
shares the exact lifetime of the blocks.

v2 (Matt B):
  - Pass and store ttm_resource pointer rather than tbo to avoid stale
    BO backpointers.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 90 ++++++++++++++++++----------
 1 file changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 51e983ee3bad..a5116dc05166 100644
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
-		block->private = tbo;
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

