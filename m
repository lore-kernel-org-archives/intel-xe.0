Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86286C3ABCB
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A710E893;
	Wed,  7 May 2025 20:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7lkxqOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF2B10E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648858; x=1778184858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ezFpU+g37ILZ8dnHtgBYjuPtseF0g+X+p3yI/zuJNkA=;
 b=J7lkxqOICAeuxOmO7jDs488hYSLlDJGCM4qkDUVNfTCm4rzmN3uspUPy
 d0os2DhV/XL26T7ZEaDpmglak6DJOCD47obyfGjHNUxCd43YlvwSWR8HG
 dHG6bfebWN+owQde1BsOwteOFAdRsPvGKNZQzsiXEpYNft3k52xE98uEr
 jpnr3am0YuP2Ya5LbJl/q/aAaHiR2v7ZVYRifsEgO7Tys3GGgzPb08OUp
 9nTZ5dfRcZ0p/9yMbzD68NIlRnBuEBrxSyhsqg4l+489KjjN+LZKEmGUF
 3lbQIu/hr/8IW7weoPRFPMLzZhhNiPQ218yuFNOblVa3MW9yuT0PwRAOY g==;
X-CSE-ConnectionGUID: 6TEQ2FFpQwKREZtR1VXaog==
X-CSE-MsgGUID: h5LIoLmrTiG+rPBVpQBWxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935092"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:18 -0700
X-CSE-ConnectionGUID: Ixam6KESQ/eLk7SSgCj73w==
X-CSE-MsgGUID: +CKPF6JvQniy6bL0bmQcrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136571030"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 9/9] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Wed,  7 May 2025 13:15:39 -0700
Message-Id: <20250507201539.1316770-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507201539.1316770-1-matthew.brost@intel.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
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

Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
queue default state to user data passed in. The intent is for a Mesa
tool to use this replay GPU hangs.

v2:
 - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
 - Fix the page size math calculation to avoid a crash
v4:
 - Use vmemdup_user (Maarten)
 - Copy default state first into LRC, then replay state (Testing, Carlos)

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 25 ++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 42 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
 5 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 21d4ced31dd9..a4d0a2c9be51 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -47,6 +47,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (q->xef)
 		xe_file_put(q->xef);
 
+	kvfree(q->replay_state);
 	kfree(q);
 }
 
@@ -139,7 +140,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+					  SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -460,6 +462,23 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
 	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
 }
 
+static int exec_queue_set_hang_replay_state(struct xe_device *xe,
+					    struct xe_exec_queue *q,
+					    u64 value)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(q->gt, q->class);
+	u64 __user *address = u64_to_user_ptr(value);
+	void *ptr;
+
+	ptr = vmemdup_user(address, size);
+	if (XE_IOCTL_DBG(xe, IS_ERR(ptr)))
+		return PTR_ERR(ptr);
+
+	q->replay_state = ptr;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -468,6 +487,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
+	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -488,7 +508,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..94185854ffbf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -140,6 +140,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} pxp;
 
+	/** @replay_state: GPU hang replay state */
+	void *replay_state;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 788f56b066b6..cbc2ed9f6ffb 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index fa4bd48c1874..d9130c360a23 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -46,13 +46,19 @@ lrc_to_xe(struct xe_lrc *lrc)
 	return gt_to_xe(lrc->fence_ctx.gt);
 }
 
-size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
+/**
+ * xe_gt_lrc_hang_replay_size() - Hang replay size
+ * @gt: The GT
+ * @class: Hardware engine class
+ *
+ * Determine size of GPU hang replay state for a GT and hardware engine class.
+ *
+ * Return: Size of GPU hang replay size
+ */
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	size_t size;
-
-	/* Per-process HW status page (PPHWSP) */
-	size = LRC_PPHWSP_SIZE;
+	size_t size = 0;
 
 	/* Engine context image */
 	switch (class) {
@@ -78,11 +84,18 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size += 1 * SZ_4K;
 	}
 
+	return size;
+}
+
+size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(gt, class);
+
 	/* Add indirect ring state page */
 	if (xe_gt_has_indirect_ring_state(gt))
 		size += LRC_INDIRECT_RING_STATE_SIZE;
 
-	return size;
+	return size + LRC_PPHWSP_SIZE;
 }
 
 /*
@@ -886,7 +899,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
+		       struct xe_vm *vm, void *replay_state, u32 ring_size,
+		       u16 msix_vec,
 		       u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -901,9 +915,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
-	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
-	if (xe_gt_has_indirect_ring_state(gt))
-		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
+	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
@@ -932,7 +944,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	if (!gt->default_lrc[hwe->class]) {
+	if (!gt->default_lrc[hwe->class] && !replay_state) {
 		init_data = empty_lrc_data(hwe);
 		if (!init_data) {
 			err = -ENOMEM;
@@ -950,6 +962,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
 				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
+		if (replay_state)
+			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE, replay_state,
+					 lrc->replay_size);
 	} else {
 		xe_map_memcpy_to(xe, &map, 0, init_data,
 				 xe_gt_lrc_size(gt, hwe->class));
@@ -1040,6 +1055,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * xe_lrc_create - Create a LRC
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
  * @ring_size: LRC ring size
  * @msix_vec: MSI-X interrupt vector (for platforms that support it)
  * @flags: LRC initialization flags
@@ -1050,7 +1066,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec, u32 flags)
+			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1059,7 +1075,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 2d6838645858..1ee1bff40569 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -46,7 +46,7 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_RUNALONE 0x1
 #define XE_LRC_CREATE_PXP 0x2
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec, u32 flags);
+			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
@@ -73,6 +73,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 	kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.34.1

