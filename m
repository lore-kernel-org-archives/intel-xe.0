Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2EEEED61A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E7E10E651;
	Fri, 15 Sep 2023 17:27:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A9310E651
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694798829; x=1726334829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nm0OCHPsm0cgMUvAgR0Qw5dRHbBWE6KySqb3sjMI1Ko=;
 b=B8xtQ/hkC4QN0zhg0FWvR2POUIydv64HhgSP47s9WlJLDi0Bs07cPwJz
 ZJlmCw/Tk/YA9vqMTGaPIruNaKjaf6Vwmpc8+ykiKP+XTL+3JUuT0Mhbt
 GswC4oGbRYj9H66OOArv+hWv8x1VTcUm4SI8jwTnxmApX7XQzfZ/g/zVl
 +KKcZBW5eIdttGCxbzPAxm4h07f3L0LcdIGDBE1Ngx/wOaVcPU7T5UHto
 BUT/mwH3eDkxaokTrVg/o+rGKr1gFFzRHnmAUrDPc1Xj/1d08vBa9q/ht
 jrAvmebesypN2VHiE7QSCfjkZhJc++JCIWcpttHEWwey+grtuuQIdwQwq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369623649"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="369623649"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774388777"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="774388777"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.223])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:26:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 19:26:06 +0200
Message-ID: <20230915172606.14436-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Reinstate pipelined fence
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

v2:
- Rebase.
v3:
- Fix display code build error.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 drivers/gpu/drm/xe/xe_bo.c              | 5 ++---
 drivers/gpu/drm/xe/xe_bo_types.h        | 2 --
 drivers/gpu/drm/xe/xe_pt.c              | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f5a96b94cfba..d5b9b0255c6a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2012,7 +2012,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		 * mode when the object is VM_BINDed, so we can only set
 		 * coherency with display when unbound.
 		 */
-		if (XE_IOCTL_DBG(dev_priv, !list_empty(&obj->vmas))) {
+		if (XE_IOCTL_DBG(dev_priv, !list_empty(&obj->ttm.base.gpuva.list))) {
 			ttm_bo_unreserve(&obj->ttm);
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 27726d4f3423..c5e4d04c4d58 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -455,7 +455,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 	dma_resv_assert_held(bo->ttm.base.resv);
 
-	if (!xe_device_in_fault_mode(xe) && !list_empty(&bo->vmas)) {
+	if (!list_empty(&bo->ttm.base.gpuva.list)) {
 		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
 				    DMA_RESV_USAGE_BOOKKEEP);
 		dma_resv_for_each_fence_unlocked(&cursor, fence)
@@ -1046,7 +1046,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		drm_prime_gem_destroy(&bo->ttm.base, NULL);
 	drm_gem_object_release(&bo->ttm.base);
 
-	xe_assert(xe, list_empty(&bo->vmas));
+	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
 	if (bo->ggtt_node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
@@ -1229,7 +1229,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
 	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
 	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
-	INIT_LIST_HEAD(&bo->vmas);
 	INIT_LIST_HEAD(&bo->pinned_link);
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 2ea9ad423170..946427fd3fe8 100644
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
index d1e06c913260..ce8d9e9d1b61 100644
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

