Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB689C5CFE7
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9C810E713;
	Tue, 11 Aug 2026 12:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pg1kFxGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684410EB9A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786452045; x=1817988045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=38YInKl/i3O23n7m40bhyqJMhRdUZS9v5/QcOIN4exo=;
 b=Pg1kFxGMVkIVP14GuGezxnH67BAqTOGiYoVacHlj82k00XCCF1Q9i70F
 v26aN8WbK7j6XwcHMM12KI4H/oW3tAJnEReLECDZ54oJNo3fOWFR1VUc1
 yq3t2fi5PVa3EjtxhRMVqIwAlePFH4m4SsAohQR3do4Vs4tvvr8pzWyS7
 LmleebOgzs8DaqgWiLVKLGZxZtDFkeUHFEiYnxAa8YNqAnmKpFkEvy2h6
 Ao8q+NAv7Pz6lW+YNdJQUobalMUwUWs9pk75wbDNgJ2KQBeExk1l44LfH
 6qJCfnewxmyp18ctg+lhqcm3A/qpVuPFV51CSmoIaj1vbBMJnAfvPaddM w==;
X-CSE-ConnectionGUID: BVIbVTMCRRSZXUtHsIempg==
X-CSE-MsgGUID: tvbHYfrnT5OzM/xxcJAUig==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86913001"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86913001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:45 -0700
X-CSE-ConnectionGUID: 9mJO7ybFSLyQtPI7iwLxFw==
X-CSE-MsgGUID: tA0yfeY1RH2gid+t6r1Mdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="265329923"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V15 07/14] drm/xe/vram: Extract buddy alloc and free helpers
Date: Tue, 11 Aug 2026 18:10:11 +0530
Message-ID: <20260811124016.3614699-23-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
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
from xe_ttm_vram_mgr_new() and xe_ttm_vram_mgr_del(). These helpers
consolidate block allocation with visible-size tracking and
block->private tagging, making them reusable by the upcoming VRAM
page offline reservation path.

No functional change.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 82 +++++++++++++++++-----------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5ab5dfdb183c..49eeec90a470 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -46,6 +46,40 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
 	return true;
 }
 
+static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
+				   u64 end, u64 size, u64 min_page_size,
+				   struct list_head *blocks, unsigned long flags,
+				   void *priv, u64 *used_visible)
+{
+	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
+	int err;
+
+	err = gpu_buddy_alloc_blocks(mm, start, end, size, min_page_size, blocks, flags);
+	if (err)
+		return err;
+
+	list_for_each_entry(block, blocks, link)
+		block->private = priv;
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
@@ -54,7 +88,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
-	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -115,32 +148,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	err = gpu_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
-				     (u64)lpfn << PAGE_SHIFT, size,
-				     min_page_size, &vres->blocks, vres->flags);
+	err = xe_ttm_vram_buddy_alloc(mgr, (u64)place->fpfn << PAGE_SHIFT,
+				      (u64)lpfn << PAGE_SHIFT, size,
+				      min_page_size, &vres->blocks, vres->flags,
+				      tbo, &vres->used_visible_size);
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
@@ -172,20 +185,27 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
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

