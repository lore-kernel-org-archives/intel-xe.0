Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE40C02181
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C3E10E041;
	Thu, 23 Jan 2025 01:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHi4UDzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597A010E3CA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737594863; x=1769130863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ogx4y+f1vXT6iDN6huapPRkML2bwWszb6CbE3X99PXc=;
 b=mHi4UDzlrXdl3DGhUISVcCGlVr+IhXYce0LOuY+yJvSXxkLbr9sV9w6N
 GJEMElIKF800Zn2NLCwp42/s5VD2/31ZBgFzwu7gym4WDHDhNrP2WW0Bt
 kNBj4hvEinE8Qvi8gGsB9GQ7rH4eeF6VeRhvnLOkkyH4pQcq961+Fcl3u
 jp5wtAijiClFCvHfSDIbT0oLDM5XGr1K+xJRquBZy8qTMnmrN8VaiCChn
 UaC5oqOPGBQ8nYT9su8KdxUw3x356JYPD7L4ntG5qZKyJo/+NZ0p4BeXT
 jhBoKqRmpiBBL9KyQnGBOTkQeAXFvvpqPgASTg2SG7SPPftmQuKmyg7Ge g==;
X-CSE-ConnectionGUID: AGIjPYFRTRmdAczTpHSrNQ==
X-CSE-MsgGUID: z0grkvAPSPmnX770Md4ApQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37967066"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37967066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
X-CSE-ConnectionGUID: l7QWQKXhSKuVS4uyF7CjNw==
X-CSE-MsgGUID: AaVoNdXkRLajcteXmsfr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107124125"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 carlos.santa@intel.com, rodrigo.vivi@intel.com
Subject: [RFC PATCH 6/6] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Wed, 22 Jan 2025 17:15:13 -0800
Message-Id: <20250123011513.362430-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123011513.362430-1-matthew.brost@intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
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

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 29 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 38 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
 5 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7e1abbbfba12..46fd9b2c87bd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -44,6 +44,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (q->xef)
 		xe_file_put(q->xef);
 
+	kvfree(q->replay_state);
 	kfree(q);
 }
 
@@ -120,7 +121,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+					  SZ_16K, q->msix_vec);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -405,6 +407,30 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
+static int exec_queue_set_hang_replay_state(struct xe_device *xe,
+					    struct xe_exec_queue *q,
+					    u64 value)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(q->gt, q->class);
+	u64 __user *address = u64_to_user_ptr(value);
+	void *ptr;
+	int err;
+
+	ptr = kvmalloc(size, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	err = __copy_from_user(ptr, address, size);
+	if (XE_IOCTL_DBG(xe, err)) {
+		kvfree(ptr);
+		return -EFAULT;
+	}
+
+	q->replay_state = ptr;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -412,6 +438,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5af5419cec7a..3c81dcd22ce3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -130,6 +130,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} lr;
 
+	/** @replay_state: GPU hang replay state */
+	void *replay_state;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 5ef96deaa881..468d9b2d4404 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
+	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 1ad3ab59fce2..96f76b6b0aa4 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -45,7 +45,16 @@ lrc_to_xe(struct xe_lrc *lrc)
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
 	size_t size;
@@ -74,6 +83,13 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size = 2 * SZ_4K;
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
@@ -883,7 +899,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size, u16 msix_vec)
+		       struct xe_vm *vm, void *replay_state, u32 ring_size,
+		       u16 msix_vec)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -896,9 +913,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
-	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
-	if (xe_gt_has_indirect_ring_state(gt))
-		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
+	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
@@ -924,7 +939,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	if (!gt->default_lrc[hwe->class]) {
+	if (!gt->default_lrc[hwe->class] && !replay_state) {
 		init_data = empty_lrc_data(hwe);
 		if (!init_data) {
 			err = -ENOMEM;
@@ -937,7 +952,11 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * values
 	 */
 	map = __xe_lrc_pphwsp_map(lrc);
-	if (!init_data) {
+	if (replay_state) {
+		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
+		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE, replay_state,
+				 xe_gt_lrc_hang_replay_size(gt, hwe->class));
+	} else if (!init_data) {
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
@@ -1022,6 +1041,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * xe_lrc_create - Create a LRC
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
  * @ring_size: LRC ring size
  * @msix_vec: MSI-X interrupt vector (for platforms that support it)
  *
@@ -1031,7 +1051,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec)
+			     void *replay_state, u32 ring_size, u16 msix_vec)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1040,7 +1060,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec);
+	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 848d64511ca8..9f90911df0c2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -43,7 +43,7 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec);
+			     void *replay_state, u32 ring_size, u16 msix_vec);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
@@ -70,6 +70,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 	kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.34.1

