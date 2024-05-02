Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C35EC25B10
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 18:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C7610F11D;
	Thu,  2 May 2024 18:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Er7UEtmC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24E210F11D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714674788; x=1746210788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O1JkMEDOJHZTQvWfz9kSKicBTDgqlkiqYDuzx42PMZA=;
 b=Er7UEtmCJjj2k/8C5ZQ2dWmypoLhB40LhaoG8YaxvqqleoRzdLJhQm/3
 ONAkTXqJfU+QlcGVpjuTZjgYny/jbqy+kRr5THROju016Uu8OVtsR9jlz
 9hp/7ipsXre2fQnQe8gyl6auLhZthr2b9mU30d1rFyKxF/C+Qo/OqqhR3
 Yrh4B+68KKAPDMbxyL68QB5PNJ3JNysoH29yRehmQKJmDvOWlxuXEn4Ak
 DcGrlzYCtnQAIMJIFuNXNVEtSHifUMP9wCTIuFKutPVUHqpO4/zS6DmrH
 zebz5ceqmYIncjYUi1Ly8nc7GMer9oTLgbIqd/grWgX38kgHB6BEUHR23 A==;
X-CSE-ConnectionGUID: wDUm0umwRZOz2GqAwgI2JQ==
X-CSE-MsgGUID: 635iMhIISKiyQnzFl8rjAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10317856"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10317856"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 11:33:07 -0700
X-CSE-ConnectionGUID: 4yVEO7tqR8SQOIaj+RQiNA==
X-CSE-MsgGUID: eDg/LKxCRlqmep1U6BDoNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58099167"
Received: from antonvol-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.251.209.48])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 11:33:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Perform dma_map when moving system buffer objects
 to TT
Date: Thu,  2 May 2024 20:32:51 +0200
Message-ID: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Currently we dma_map on ttm_tt population and dma_unmap when
the pages are released in ttm_tt unpopulate.

Strictly, the dma_map is not needed until the bo is moved to the
XE_PL_TT placement, so perform the dma_mapping on such moves
instead, and remove the dma_mappig when moving to XE_PL_SYSTEM.

This is desired for the upcoming shrinker series where shrinking
of a ttm_tt might fail. That would lead to an odd construct where
we first dma_unmap, then shrink and if shrinking fails dma_map
again. If dma_mapping instead is performed on move like this,
shrinking does not need to care at all about dma mapping.

Finally, where a ttm_tt is destroyed while bound to a different
memory type than XE_PL_SYSTEM, we keep the dma_unmap in
unpopulate().

v2:
- Don't accidently unmap the dma-buf's sgtable.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
---
 drivers/gpu/drm/xe/xe_bo.c | 47 ++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bc1f794e3e61..52a16cb4e736 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -302,6 +302,18 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	return 0;
 }
 
+static void xe_tt_unmap_sg(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->sg) {
+		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
+				  DMA_BIDIRECTIONAL, 0);
+		sg_free_table(xe_tt->sg);
+		xe_tt->sg = NULL;
+	}
+}
+
 struct sg_table *xe_bo_sg(struct xe_bo *bo)
 {
 	struct ttm_tt *tt = bo->ttm.ttm;
@@ -377,27 +389,15 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	if (err)
 		return err;
 
-	/* A follow up may move this xe_bo_move when BO is moved to XE_PL_TT */
-	err = xe_tt_map_sg(tt);
-	if (err)
-		ttm_pool_free(&ttm_dev->pool, tt);
-
 	return err;
 }
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
-	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
-
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return;
 
-	if (xe_tt->sg) {
-		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
-				  DMA_BIDIRECTIONAL, 0);
-		sg_free_table(xe_tt->sg);
-		xe_tt->sg = NULL;
-	}
+	xe_tt_unmap_sg(tt);
 
 	return ttm_pool_free(&ttm_dev->pool, tt);
 }
@@ -628,17 +628,21 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
 	int ret = 0;
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
-		ttm_bo_move_null(ttm_bo, new_mem);
-		return 0;
+		if (new_mem->mem_type == XE_PL_TT)
+			ret = xe_tt_map_sg(ttm);
+		if (!ret)
+			ttm_bo_move_null(ttm_bo, new_mem);
+		goto out;
 	}
 
 	if (ttm_bo->type == ttm_bo_type_sg) {
 		ret = xe_bo_move_notify(bo, ctx);
 		if (!ret)
 			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
-		goto out;
+		return ret;
 	}
 
 	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
@@ -650,6 +654,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
 
+	if (new_mem->mem_type == XE_PL_TT) {
+		ret = xe_tt_map_sg(ttm);
+		if (ret)
+			goto out;
+	}
+
 	if ((move_lacks_source && !needs_clear)) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
@@ -786,8 +796,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_pm_runtime_put(xe);
 
 out:
-	return ret;
+	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
+	    ttm_bo->ttm)
+		xe_tt_unmap_sg(ttm_bo->ttm);
 
+	return ret;
 }
 
 /**
-- 
2.44.0

