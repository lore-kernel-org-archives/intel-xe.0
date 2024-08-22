Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C153C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 13:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2996810EA1B;
	Thu, 22 Aug 2024 13:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdZlnggN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2FF10EA1B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724332270; x=1755868270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LkFmrc2iWyz1xPTNsn5M/ys82OYOARE5HpdGP2vQEes=;
 b=hdZlnggNDdQ11yVF85voKRo/kzlop89q/bj8AnpCw0mjqvcZmOkOn8R4
 JABIunUblkuWoEqDJ0O6flj/YY/4Z/epvxtBdR5GImA9tkxQWKShxBvq7
 mR9cWMiRbXjYxLGaQ7HW1Wh0XHWAAd5mzyb/ymtD8FgZy+SJyGQ4e9so6
 HbRn/v8nmi2LNL9CJMRQt0zKZ0RMjgKqrrcdAWNLe4KEa/vPzKakCvQDX
 qtoolKLbHoEGbTTOOMWxy/WW66WNVDQlWAOsXwIeEL454rkQ4T9mktWJB
 FJordlmNBKJzMVskfDO+NcRK3HONYU1q9sX05xVxeo6qb28o/HbTSM9c+ w==;
X-CSE-ConnectionGUID: 6rRmrOElSWm6ukZz989d9w==
X-CSE-MsgGUID: MLB8a8SXTYCoKr26OQu5Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25640156"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="25640156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:11:10 -0700
X-CSE-ConnectionGUID: tWsRGiSZQIqV7j69YGLxxA==
X-CSE-MsgGUID: UsoCmWJ1R5qvaJMYnmfO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92238228"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:11:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
Date: Thu, 22 Aug 2024 14:42:44 +0200
Message-ID: <20240822124244.10554-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Implement GPU clear-on-free for pooled system pages in Xe.

Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU clear
fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.

Clear-on-free is only relevant for pooled pages as driver needs to give
back those pages. So do clear-on-free only for such BOs and keep doing
clear-on-alloc for ttm_cached type BOs

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 101 +++++++++++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6ed0e1955215..e7bc74f8ae82 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -283,6 +283,8 @@ struct xe_ttm_tt {
 	struct device *dev;
 	struct sg_table sgt;
 	struct sg_table *sg;
+	bool sys_clear_on_free;
+	bool sys_clear_on_alloc;
 };
 
 static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -401,8 +403,23 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	 * flag. Zeroed pages are only required for ttm_bo_type_device so
 	 * unwanted data is not leaked to userspace.
 	 */
-	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
-		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys) {
+		/*
+		 * Non-pooled BOs are always clear on alloc when possible.
+		 * clear-on-free is not needed as there is no pool to give pages back.
+		 */
+		if (caching == ttm_cached) {
+			tt->sys_clear_on_alloc = true;
+			tt->sys_clear_on_free = false;
+		} else {
+		/*
+		 * For pooled BO, clear-on-alloc is done by the CPU for now and
+		 * GPU will do clear on free when releasing the BO.
+		 */
+			tt->sys_clear_on_alloc = false;
+			tt->sys_clear_on_free = true;
+		}
+	}
 
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
@@ -416,8 +433,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct xe_ttm_tt *xe_tt;
 	int err;
 
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 	/*
 	 * dma-bufs are not populated with pages, and the dma-
 	 * addresses are set up when moved to XE_PL_TT.
@@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 		return 0;
 
 	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
-	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
+	if (xe_tt->sys_clear_on_alloc)
 		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
 
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
@@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
+	struct xe_ttm_tt *xe_tt;
+
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return;
 
 	xe_tt_unmap_sg(tt);
 
+	/* Hint TTM pool that pages are already cleared */
+	if (xe_tt->sys_clear_on_free)
+		tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+
 	return ttm_pool_free(&ttm_dev->pool, tt);
 }
 
@@ -664,6 +691,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct ttm_resource *old_mem = ttm_bo->resource;
 	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
+	struct xe_ttm_tt *xe_tt;
 	struct xe_migrate *migrate = NULL;
 	struct dma_fence *fence;
 	bool move_lacks_source;
@@ -674,12 +702,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool clear_system_pages;
 	int ret = 0;
 
+	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
 	/*
 	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
 	 * moving to system as the bo doesn't have dma_mapping.
 	 */
 	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
-		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
+		xe_tt->sys_clear_on_alloc = false;
 
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
@@ -703,10 +732,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
-	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
+	clear_system_pages = ttm && xe_tt->sys_clear_on_alloc;
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
-		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
-		clear_system_pages;
+		(!ttm && ttm_bo->type == ttm_bo_type_device) || clear_system_pages;
 
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(ttm);
@@ -1028,10 +1056,47 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	return locked;
 }
 
+static struct dma_fence *xe_ttm_bo_clear_on_free(struct ttm_buffer_object *ttm_bo)
+{
+	struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_migrate *migrate;
+	struct xe_ttm_tt *xe_tt;
+	struct dma_fence *clear_fence;
+
+	/* return early if nothing to clear */
+	if (!ttm_bo->ttm)
+		return NULL;
+
+	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
+	/* return early if nothing to clear */
+	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
+		return NULL;
+
+	if (XE_WARN_ON(!xe_tt->sg))
+		return NULL;
+
+	if (bo->tile)
+		migrate = bo->tile->migrate;
+	else
+		migrate = xe->tiles[0].migrate;
+
+	xe_assert(xe, migrate);
+
+	clear_fence = xe_migrate_clear(migrate, bo, bo->ttm.resource,
+				       XE_MIGRATE_CLEAR_FLAG_FULL);
+	if (IS_ERR(clear_fence))
+		return NULL;
+
+	xe_tt->sys_clear_on_free = false;
+
+	return clear_fence;
+}
+
 static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
+	struct dma_fence *clear_fence, *fence;
 	struct dma_fence *replacement = NULL;
 	struct xe_bo *bo;
 
@@ -1041,15 +1106,31 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	bo = ttm_to_xe_bo(ttm_bo);
 	xe_assert(xe_bo_device(bo), !(bo->created && kref_read(&ttm_bo->base.refcount)));
 
+	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
+
 	/*
 	 * Corner case where TTM fails to allocate memory and this BOs resv
 	 * still points the VMs resv
 	 */
-	if (ttm_bo->base.resv != &ttm_bo->base._resv)
+	if (ttm_bo->base.resv != &ttm_bo->base._resv) {
+		if (clear_fence)
+			dma_fence_wait(clear_fence, false);
 		return;
+	}
 
-	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
+	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
+		if (clear_fence)
+			dma_fence_wait(clear_fence, false);
 		return;
+	}
+
+	if (clear_fence) {
+		if (dma_resv_reserve_fences(ttm_bo->base.resv, 1))
+			dma_fence_wait(clear_fence, false);
+		else
+			dma_resv_add_fence(ttm_bo->base.resv, clear_fence,
+					   DMA_RESV_USAGE_KERNEL);
+	}
 
 	/*
 	 * Scrub the preempt fences if any. The unbind fence is already
-- 
2.42.0

