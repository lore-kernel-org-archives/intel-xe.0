Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03223EDE98C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 07:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C8C10E516;
	Thu, 14 Sep 2023 07:54:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE4D10E516
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694678046; x=1726214046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5eJGXa1v1MRD4Vd+K/1mmYn4XMt3u5KZ0tXMYyhVsPc=;
 b=CgpKOcRPvHO1sc0CMBBeZbDEdqYJq47NtxDTJZir7qi48bMIcdqF87PF
 nN0w8cYBry3sbyCZ6xYTfIdHAujQWqMU65BqdTIX8IyPSZMhW+NtYvcyR
 KzT7MpgIIYPkHBKxKeFxBSm7258f+4r+PlZd3grpHxE/KTgs6Erm7+Nr8
 B1PKPHwKetKQVTBydNsIANtuURlRIvBjYCk7eaUNLdv/JbNp072lkRC11
 Y0zoHj+v1fVq1ISwI2Hbq+6MMh+if1BQmjEWlB2vPs+QF3A/ylY+ee9IJ
 FugDoe4MO5V9GV5fmTKpEz+kuqtt9YIdeOa5ZQm0CHADR1ULD/UyV+mY7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465252900"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="465252900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 00:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747632322"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="747632322"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.49])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 00:54:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 09:53:24 +0200
Message-ID: <20230914075325.1936-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Reinstate pipelined fence
 enable_signaling
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

With the GPUVA conversion, the xe_bo::vmas member became replaced with
drm_gem_object::gpuva.list, however there was a couple of usage instances
left using the old member. Most notably the pipelined fence
enable_signaling.

Remove the xe_bo::vmas member completely, fix usage instances and
also enable this pipelined fence enable_signaling even for faulting
VM:s since we actually wait for bind fences to complete.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 5 ++---
 drivers/gpu/drm/xe/xe_bo_types.h | 2 --
 drivers/gpu/drm/xe/xe_pt.c       | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 25fdc04627ca..3fdd0bab2fd5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -455,7 +455,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 	dma_resv_assert_held(bo->ttm.base.resv);
 
-	if (!xe_device_in_fault_mode(xe) && !list_empty(&bo->vmas)) {
+	if (!list_empty(&bo->ttm.base.gpuva.list)) {
 		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
 				    DMA_RESV_USAGE_BOOKKEEP);
 		dma_resv_for_each_fence_unlocked(&cursor, fence)
@@ -1043,7 +1043,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		drm_prime_gem_destroy(&bo->ttm.base, NULL);
 	drm_gem_object_release(&bo->ttm.base);
 
-	WARN_ON(!list_empty(&bo->vmas));
+	WARN_ON(!list_empty(&ttm_bo->base.gpuva.list));
 
 	if (bo->ggtt_node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
@@ -1226,7 +1226,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
 	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
 	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
-	INIT_LIST_HEAD(&bo->vmas);
 	INIT_LIST_HEAD(&bo->pinned_link);
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..27fe72129ee6 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -31,8 +31,6 @@ struct xe_bo {
 	struct xe_vm *vm;
 	/** @tile: Tile this BO is attached to (kernel BO only) */
 	struct xe_tile *tile;
-	/** @vmas: List of VMAs for this BO */
-	struct list_head vmas;
 	/** @placements: valid placements for this BO */
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5709518e314b..5e4d8f89d8e1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -265,7 +265,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 	if (!pt)
 		return;
 
-	XE_WARN_ON(!list_empty(&pt->bo->vmas));
+	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
 	xe_bo_unpin(pt->bo);
 	xe_bo_put_deferred(pt->bo, deferred);
 
-- 
2.41.0

