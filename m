Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E91EC0015E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 18:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC1110E23F;
	Mon, 26 Jun 2023 18:18:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDAC10E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 18:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687803479; x=1719339479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4HQygwhHa2oQvyosyIZKCUQG1m+FRbyYRB5HArTbgw=;
 b=bIlGk4nhLW+81Y+znie+F8DkxOHduf54Do+dXBV87hZmaOMvJ3wOuzf1
 DTpQvbJ8f4tOEELsxJHQWM/ysJqgDIxV4E0ZM7adYe8zya/OSeLoVGDpF
 P1b1wK/0ioXHAvv+sXbwKGZfklHLEtLRsA+CKbKqf0cP8Wkec/xLHii70
 bnf1kR2gYSAnHbElmBIz3fXRjJJLp3MOkgBLA+v3z8Zk13xJcxGiOXRnk
 eAc1wOIkWJl+3NsePqJrUwdRp281QdVf92X5giWx5OTqxSABLvL3HkIU+
 6riaJ6xBMaY5Jpo0oLgsa9jHFItNlTooPBuqQURGP3kjbkMSLVF1oQv5z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341689119"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="341689119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890369746"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="890369746"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.105])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:17:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 20:17:39 +0200
Message-Id: <20230626181741.32820-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
References: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/4] drm/xe/bo: Avoid creating a system
 resource when allocating a fresh VRAM bo
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

When creating a new bo, on the first move the bo->resource is typically
NULL. Our move callback rejected that instructing TTM to create a system
resource. In addition a struct ttm_tt with a page-vector was created,
although not populated with pages. Similarly when the clearing of VRAM
was complete, the system resource was put on a ghost object and freed
using the TTM delayed destroy mechanism.

This is a lot of pointless work. So avoid creating the system resource and
instead change the code to cope with a NULL bo->resource.

v2:
- Add some code comments (Matthew Brost)
v3:
- Fix a dereference of old_mem which might be NULL.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 48 +++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d2f4575d8548..73e06597c84d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -479,7 +479,6 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
  * to unconditionally call unmap_attachment() when moving out to system.
  */
 static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
-			     struct ttm_resource *old_res,
 			     struct ttm_resource *new_res)
 {
 	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
@@ -564,6 +563,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_resource *old_mem = ttm_bo->resource;
+	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
 	struct xe_tile *tile = NULL;
 	struct dma_fence *fence;
@@ -572,35 +572,29 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	int ret = 0;
 
-	if (!old_mem) {
-		if (new_mem->mem_type != TTM_PL_SYSTEM) {
-			hop->mem_type = TTM_PL_SYSTEM;
-			hop->flags = TTM_PL_FLAG_TEMPORARY;
-			ret = -EMULTIHOP;
-			goto out;
-		}
-
+	/* Bo creation path, moving to system or TT. No clearing required. */
+	if (!old_mem && ttm) {
 		ttm_bo_move_null(ttm_bo, new_mem);
-		goto out;
+		return 0;
 	}
 
 	if (ttm_bo->type == ttm_bo_type_sg) {
 		ret = xe_bo_move_notify(bo, ctx);
 		if (!ret)
-			ret = xe_bo_move_dmabuf(ttm_bo, old_mem, new_mem);
+			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
 		goto out;
 	}
 
 	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
 			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
 
-	move_lacks_source = !resource_is_vram(old_mem) && !tt_has_data;
+	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
 
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
 
 	if ((move_lacks_source && !needs_clear) ||
-	    (old_mem->mem_type == XE_PL_SYSTEM &&
+	    (old_mem_type == XE_PL_SYSTEM &&
 	     new_mem->mem_type == XE_PL_TT)) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
@@ -610,7 +604,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	 * Failed multi-hop where the old_mem is still marked as
 	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
 	 */
-	if (old_mem->mem_type == XE_PL_TT &&
+	if (old_mem_type == XE_PL_TT &&
 	    new_mem->mem_type == XE_PL_TT) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
@@ -622,7 +616,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			goto out;
 	}
 
-	if (old_mem->mem_type == XE_PL_TT &&
+	if (old_mem_type == XE_PL_TT &&
 	    new_mem->mem_type == XE_PL_SYSTEM) {
 		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
 						     DMA_RESV_USAGE_BOOKKEEP,
@@ -637,8 +631,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if (!move_lacks_source &&
-	    ((old_mem->mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
-	     (resource_is_vram(old_mem) &&
+	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
+	     (mem_type_is_vram(old_mem_type) &&
 	      new_mem->mem_type == XE_PL_SYSTEM))) {
 		hop->fpfn = 0;
 		hop->lpfn = 0;
@@ -652,8 +646,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		tile = bo->tile;
 	else if (resource_is_vram(new_mem))
 		tile = mem_type_to_tile(xe, new_mem->mem_type);
-	else if (resource_is_vram(old_mem))
-		tile = mem_type_to_tile(xe, old_mem->mem_type);
+	else if (mem_type_is_vram(old_mem_type))
+		tile = mem_type_to_tile(xe, old_mem_type);
 
 	XE_BUG_ON(!tile);
 	XE_BUG_ON(!tile->migrate);
@@ -703,8 +697,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			xe_device_mem_access_put(xe);
 			goto out;
 		}
-		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
-						new_mem);
+		if (!move_lacks_source) {
+			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
+							true, new_mem);
+		} else {
+			/*
+			 * ttm_bo_move_accel_cleanup() may blow up if
+			 * bo->resource == NULL, so just attach the
+			 * fence and set the new resource.
+			 */
+			dma_resv_add_fence(ttm_bo->base.resv, fence,
+					   DMA_RESV_USAGE_KERNEL);
+			ttm_bo_move_null(ttm_bo, new_mem);
+		}
+
 		dma_fence_put(fence);
 	}
 
-- 
2.40.1

