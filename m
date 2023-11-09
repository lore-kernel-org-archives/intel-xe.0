Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1CBC04E88
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5864E10E8DA;
	Thu,  9 Nov 2023 15:46:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76A310E8ED
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544772; x=1731080772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LqHjWPQyHaWE44cNNMoujloxlJ7v7R+pATnU2VyIDkE=;
 b=KXHiuHn4JaNdrH4K1SjxdyefAOgXO8FZrZUSg23s8+lvSCXzunkHGLnb
 uoHBgvCReQtA02fsGYdKJEgBaC+KQOYYbMAOhS+oFxcMHu0zzG64eBcet
 iLU24waZlEYTGKTbuA1Xv/kiDrGRHIgHk9RDYLwAEpyszAOk2wKcszqM/
 XbALWB2zDbDlaile4UXjEtQaS6ppfNCs6h5oPsLXXvpGTDSWtBXr9f/Sh
 IjzmccY2jHTgo2RsqDS+ccsLFhsoZ11jTfRh8qRDxE4NWlHOhK9qtvvew
 U1atsF1jjWkVFpK8j8+chzovK1M1Bxnh5fzZl6gShpMPbsiF2YmuGaCnO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556814"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556814"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886077"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886077"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:56 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:48 +0000
Message-Id: <20231109154457.7-35-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 34/43] drm/xe/uapi: Exec queue documentation
 and variable renaming
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Rename 'placement' to num_eng_per_bb and 'width' to num_bb_per_exec, and
give a graphical documentation to it.

Let's make it obvious and straight forward. Not only because it is
important to have variable names that are clear and descriptive, but also
because 'placement' is now used in many terms around the memory_region
selection where the BO or the page table will live and 'width' is so
generic and with so many other common meaning in the graphics world.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c      |  8 +--
 drivers/gpu/drm/xe/xe_exec.c             |  4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 49 +++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  4 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++-----
 drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +--
 drivers/gpu/drm/xe/xe_sched_job.c        | 10 +--
 drivers/gpu/drm/xe/xe_trace.h            |  8 +--
 include/uapi/drm/xe_drm.h                | 84 ++++++++++++++++++++++--
 10 files changed, 141 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195be..b4e8de4903b9 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -130,7 +130,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
-	u32 width_mask = (0x1 << q->width) - 1;
+	u32 num_bb_per_exec_mask = (0x1 << q->num_bb_per_exec) - 1;
 	int i;
 	bool cookie;
 
@@ -138,10 +138,10 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->boot_time = ktime_get_boottime();
 
 	cookie = dma_fence_begin_signalling();
-	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
+	for (i = 0; q->num_bb_per_exec > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
 		if (adj_logical_mask & BIT(i)) {
-			adj_logical_mask |= width_mask << i;
-			i += q->width;
+			adj_logical_mask |= num_bb_per_exec_mask << i;
+			i += q->num_bb_per_exec;
 		} else {
 			++i;
 		}
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 28e84a0bbeb0..ca922635db89 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -161,7 +161,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
+	if (XE_IOCTL_DBG(xe, q->num_bb_per_exec != args->num_batch_buffer))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
@@ -189,7 +189,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (xe_exec_queue_is_parallel(q)) {
 		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
-				       q->width);
+				       q->num_bb_per_exec);
 		if (err) {
 			err = -EFAULT;
 			goto err_syncs;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 59e8d1ed34f7..064f25e5e3a5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -33,7 +33,8 @@ enum xe_exec_queue_sched_prop {
 static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 						    struct xe_vm *vm,
 						    u32 logical_mask,
-						    u16 width, struct xe_hw_engine *hwe,
+						    u16 num_bb_per_exec,
+						    struct xe_hw_engine *hwe,
 						    u32 flags)
 {
 	struct xe_exec_queue *q;
@@ -44,7 +45,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
 
-	q = kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
+	q = kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * num_bb_per_exec, GFP_KERNEL);
 	if (!q)
 		return ERR_PTR(-ENOMEM);
 
@@ -55,7 +56,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	if (vm)
 		q->vm = xe_vm_get(vm);
 	q->class = hwe->class;
-	q->width = width;
+	q->num_bb_per_exec = num_bb_per_exec;
 	q->logical_mask = logical_mask;
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
@@ -77,7 +78,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 		q->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
 	}
 
-	for (i = 0; i < width; ++i) {
+	for (i = 0; i < num_bb_per_exec; ++i) {
 		err = xe_lrc_init(q->lrc + i, hwe, q, vm, SZ_16K);
 		if (err)
 			goto err_lrc;
@@ -108,7 +109,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 }
 
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
-					   u32 logical_mask, u16 width,
+					   u32 logical_mask, u16 num_bb_per_exec,
 					   struct xe_hw_engine *hwe, u32 flags)
 {
 	struct xe_exec_queue *q;
@@ -119,7 +120,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 		if (err)
 			return ERR_PTR(err);
 	}
-	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
+	q = __xe_exec_queue_create(xe, vm, logical_mask, num_bb_per_exec, hwe, flags);
 	if (vm)
 		xe_vm_unlock(vm);
 
@@ -170,7 +171,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
-	for (i = 0; i < q->width; ++i)
+	for (i = 0; i < q->num_bb_per_exec; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (q->vm)
 		xe_vm_put(q->vm);
@@ -512,15 +513,15 @@ find_hw_engine(struct xe_device *xe,
 
 static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 					struct drm_xe_engine_class_instance *eci,
-					u16 width, u16 num_placements)
+					u16 num_bb_per_exec, u16 num_eng_per_bb)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	u32 logical_mask = 0;
 
-	if (XE_IOCTL_DBG(xe, width != 1))
+	if (XE_IOCTL_DBG(xe, num_bb_per_exec != 1))
 		return 0;
-	if (XE_IOCTL_DBG(xe, num_placements != 1))
+	if (XE_IOCTL_DBG(xe, num_eng_per_bb != 1))
 		return 0;
 	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
 		return 0;
@@ -541,9 +542,9 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
-				      u16 width, u16 num_placements)
+				      u16 num_bb_per_exec, u16 num_eng_per_bb)
 {
-	int len = width * num_placements;
+	int len = num_bb_per_exec * num_eng_per_bb;
 	int i, j, n;
 	u16 class;
 	u16 gt_id;
@@ -553,13 +554,13 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			 len > 1))
 		return 0;
 
-	for (i = 0; i < width; ++i) {
+	for (i = 0; i < num_bb_per_exec; ++i) {
 		u32 current_mask = 0;
 
-		for (j = 0; j < num_placements; ++j) {
+		for (j = 0; j < num_eng_per_bb; ++j) {
 			struct xe_hw_engine *hwe;
 
-			n = j * width + i;
+			n = j * num_bb_per_exec + i;
 
 			hwe = find_hw_engine(xe, eci[n]);
 			if (XE_IOCTL_DBG(xe, !hwe))
@@ -575,7 +576,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			class = eci[n].engine_class;
 			gt_id = eci[n].gt_id;
 
-			if (width == 1 || !i)
+			if (num_bb_per_exec == 1 || !i)
 				return_mask |= BIT(eci[n].engine_instance);
 			current_mask |= BIT(eci[n].engine_instance);
 		}
@@ -612,7 +613,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	len = args->width * args->num_placements;
+	len = args->num_bb_per_exec * args->num_eng_per_bb;
 	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
@@ -637,8 +638,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 			eci[0].gt_id = gt->info.id;
 			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
-								    args->width,
-								    args->num_placements);
+								    args->num_bb_per_exec,
+								    args->num_eng_per_bb);
 			if (XE_IOCTL_DBG(xe, !logical_mask))
 				return -EINVAL;
 
@@ -651,7 +652,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
-						   args->width, hwe,
+						   args->num_bb_per_exec, hwe,
 						   EXEC_QUEUE_FLAG_PERSISTENT |
 						   EXEC_QUEUE_FLAG_VM |
 						   (sync ? 0 :
@@ -678,8 +679,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	} else {
 		gt = xe_device_get_gt(xe, eci[0].gt_id);
 		logical_mask = calc_validate_logical_mask(xe, gt, eci,
-							  args->width,
-							  args->num_placements);
+							  args->num_bb_per_exec,
+							  args->num_eng_per_bb);
 		if (XE_IOCTL_DBG(xe, !logical_mask))
 			return -EINVAL;
 
@@ -704,7 +705,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe,
+					 args->num_bb_per_exec, hwe,
 					 xe_vm_no_dma_fences(vm) ? 0 :
 					 EXEC_QUEUE_FLAG_PERSISTENT);
 		up_read(&vm->lock);
@@ -827,7 +828,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_parallel(q)) {
 		int i;
 
-		for (i = 0; i < q->width; ++i) {
+		for (i = 0; i < q->num_bb_per_exec; ++i) {
 			if (xe_lrc_seqno(&q->lrc[i]) !=
 			    q->lrc[i].fence_ctx.next_seqno - 1)
 				return false;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 59a54bfb9a8c..6782f3ce9faf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -15,7 +15,7 @@ struct xe_device;
 struct xe_file;
 
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
-					   u32 logical_mask, u16 width,
+					   u32 logical_mask, u16 num_bb_per_exec,
 					   struct xe_hw_engine *hw_engine, u32 flags);
 struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
 						 struct xe_vm *vm,
@@ -40,7 +40,7 @@ static inline void xe_exec_queue_put(struct xe_exec_queue *q)
 
 static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
 {
-	return q->width > 1;
+	return q->num_bb_per_exec > 1;
 }
 
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ecd761177567..eb924a3e5d98 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -47,8 +47,8 @@ struct xe_exec_queue {
 	u32 logical_mask;
 	/** @name: name of this exec queue */
 	char name[MAX_FENCE_NAME_LEN];
-	/** @width: width (number BB submitted per exec) of this exec queue */
-	u16 width;
+	/** @num_bb_per_exec: the width of this exec queue */
+	u16 num_bb_per_exec;
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..b5a41a772445 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -259,7 +259,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
 	if (xe_exec_queue_is_parallel(q))
 		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
 				      q->guc->id - GUC_ID_START_MLRC,
-				      order_base_2(q->width));
+				      order_base_2(q->num_bb_per_exec));
 	else
 		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
 }
@@ -283,7 +283,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 		void *bitmap = guc->submission_state.guc_ids_bitmap;
 
 		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
-					      order_base_2(q->width));
+					      order_base_2(q->num_bb_per_exec));
 	} else {
 		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
 				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
@@ -295,7 +295,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	if (xe_exec_queue_is_parallel(q))
 		q->guc->id += GUC_ID_START_MLRC;
 
-	for (i = 0; i < q->width; ++i) {
+	for (i = 0; i < q->num_bb_per_exec; ++i) {
 		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
 			       q->guc->id + i, q, GFP_NOWAIT);
 		if (IS_ERR(ptr)) {
@@ -315,7 +315,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	mutex_lock(&guc->submission_state.lock);
-	__release_guc_id(guc, q, q->width);
+	__release_guc_id(guc, q, q->num_bb_per_exec);
 	mutex_unlock(&guc->submission_state.lock);
 }
 
@@ -426,11 +426,11 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	action[len++] = info->wq_base_lo;
 	action[len++] = info->wq_base_hi;
 	action[len++] = info->wq_size;
-	action[len++] = q->width;
+	action[len++] = q->num_bb_per_exec;
 	action[len++] = info->hwlrca_lo;
 	action[len++] = info->hwlrca_hi;
 
-	for (i = 1; i < q->width; ++i) {
+	for (i = 1; i < q->num_bb_per_exec; ++i) {
 		struct xe_lrc *lrc = q->lrc + i;
 
 		action[len++] = lower_32_bits(xe_lrc_descriptor(lrc));
@@ -578,7 +578,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 	struct iosys_map map = xe_lrc_parallel_map(q->lrc);
 #define WQ_HEADER_SIZE	4	/* Includes 1 LRC address too */
 	u32 wqi[XE_HW_ENGINE_MAX_INSTANCE + (WQ_HEADER_SIZE - 1)];
-	u32 wqi_size = (q->width + (WQ_HEADER_SIZE - 1)) * sizeof(u32);
+	u32 wqi_size = (q->num_bb_per_exec + (WQ_HEADER_SIZE - 1)) * sizeof(u32);
 	u32 len_dw = (wqi_size / sizeof(u32)) - 1;
 	int i = 0, j;
 
@@ -595,7 +595,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
 		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc->ring.tail / sizeof(u64));
 	wqi[i++] = 0;
-	for (j = 1; j < q->width; ++j) {
+	for (j = 1; j < q->num_bb_per_exec; ++j) {
 		struct xe_lrc *lrc = q->lrc + j;
 
 		wqi[i++] = lrc->ring.tail / sizeof(u64);
@@ -766,17 +766,17 @@ static void simple_error_capture(struct xe_exec_queue *q)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
-	u32 width_mask = (0x1 << q->width) - 1;
+	u32 width_mask = (0x1 << q->num_bb_per_exec) - 1;
 	int i;
 	bool cookie;
 
 	if (q->vm && !q->vm->error_capture.capture_once) {
 		q->vm->error_capture.capture_once = true;
 		cookie = dma_fence_begin_signalling();
-		for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
+		for (i = 0; q->num_bb_per_exec > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
 			if (adj_logical_mask & BIT(i)) {
 				adj_logical_mask |= width_mask << i;
-				i += q->width;
+				i += q->num_bb_per_exec;
 			} else {
 				++i;
 			}
@@ -1462,7 +1462,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
+		for (i = 0; i < q->num_bb_per_exec; ++i)
 			xe_lrc_set_ring_head(q->lrc + i, q->lrc[i].ring.tail);
 		drm_sched_resubmit_jobs(sched);
 	}
@@ -1508,7 +1508,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	}
 
 	xe_assert(xe, guc_id >= q->guc->id);
-	xe_assert(xe, guc_id < (q->guc->id + q->width));
+	xe_assert(xe, guc_id < (q->guc->id + q->num_bb_per_exec));
 
 	return q;
 }
@@ -1768,20 +1768,20 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	memcpy(&snapshot->name, &q->name, sizeof(snapshot->name));
 	snapshot->class = q->class;
 	snapshot->logical_mask = q->logical_mask;
-	snapshot->width = q->width;
+	snapshot->width = q->num_bb_per_exec;
 	snapshot->refcount = kref_read(&q->refcount);
 	snapshot->sched_timeout = sched->timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
 		q->sched_props.preempt_timeout_us;
 
-	snapshot->lrc = kmalloc_array(q->width, sizeof(struct lrc_snapshot),
+	snapshot->lrc = kmalloc_array(q->num_bb_per_exec, sizeof(struct lrc_snapshot),
 				      GFP_ATOMIC);
 
 	if (!snapshot->lrc) {
 		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
 	} else {
-		for (i = 0; i < q->width; ++i) {
+		for (i = 0; i < q->num_bb_per_exec; ++i) {
 			struct xe_lrc *lrc = q->lrc + i;
 
 			snapshot->lrc[i].context_desc =
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 59e0aa2d6a4c..d3d671784e8e 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -383,7 +383,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 {
 	struct xe_gt *gt = job->q->gt;
 
-	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
+	xe_gt_assert(gt, job->q->num_bb_per_exec <= 1); /* no parallel submission for GSCCS */
 
 	__emit_job_gen12_simple(job, job->q->lrc,
 				job->batch_addr[0],
@@ -400,7 +400,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 		return;
 	}
 
-	for (i = 0; i < job->q->width; ++i)
+	for (i = 0; i < job->q->num_bb_per_exec; ++i)
 		__emit_job_gen12_simple(job, job->q->lrc + i,
 				        job->batch_addr[i],
 				        xe_sched_job_seqno(job));
@@ -411,7 +411,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 	int i;
 
 	/* FIXME: Not doing parallel handshake for now */
-	for (i = 0; i < job->q->width; ++i)
+	for (i = 0; i < job->q->num_bb_per_exec; ++i)
 		__emit_job_gen12_video(job, job->q->lrc + i,
 				       job->batch_addr[i],
 				       xe_sched_job_seqno(job));
@@ -421,7 +421,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
 {
 	int i;
 
-	for (i = 0; i < job->q->width; ++i)
+	for (i = 0; i < job->q->num_bb_per_exec; ++i)
 		__emit_job_gen12_render_compute(job, job->q->lrc + i,
 						job->batch_addr[i],
 						xe_sched_job_seqno(job));
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index adbd82f8744e..1884b6b6b398 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -117,13 +117,13 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	} else {
 		struct dma_fence_array *cf;
 
-		fences = kmalloc_array(q->width, sizeof(*fences), GFP_KERNEL);
+		fences = kmalloc_array(q->num_bb_per_exec, sizeof(*fences), GFP_KERNEL);
 		if (!fences) {
 			err = -ENOMEM;
 			goto err_sched_job;
 		}
 
-		for (j = 0; j < q->width; ++j) {
+		for (j = 0; j < q->num_bb_per_exec; ++j) {
 			fences[j] = xe_lrc_create_seqno_fence(q->lrc + j);
 			if (IS_ERR(fences[j])) {
 				err = PTR_ERR(fences[j]);
@@ -131,7 +131,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 			}
 		}
 
-		cf = dma_fence_array_create(q->width, fences,
+		cf = dma_fence_array_create(q->num_bb_per_exec, fences,
 					    q->parallel.composite_fence_ctx,
 					    q->parallel.composite_fence_seqno++,
 					    false);
@@ -142,13 +142,13 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 		}
 
 		/* Sanity check */
-		for (j = 0; j < q->width; ++j)
+		for (j = 0; j < q->num_bb_per_exec; ++j)
 			xe_assert(job_to_xe(job), cf->base.seqno == fences[j]->seqno);
 
 		job->fence = &cf->base;
 	}
 
-	width = q->width;
+	width = q->num_bb_per_exec;
 	if (is_migration)
 		width = 2;
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 1536130e56f6..d49b6d9c480a 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -112,7 +112,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			     __field(enum xe_engine_class, class)
 			     __field(u32, logical_mask)
 			     __field(u8, gt_id)
-			     __field(u16, width)
+			     __field(u16, num_bb_per_exec)
 			     __field(u16, guc_id)
 			     __field(u32, guc_state)
 			     __field(u32, flags)
@@ -122,15 +122,15 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->class = q->class;
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
-			   __entry->width = q->width;
+			   __entry->num_bb_per_exec = q->num_bb_per_exec;
 			   __entry->guc_id = q->guc->id;
 			   __entry->guc_state = atomic_read(&q->guc->state);
 			   __entry->flags = q->flags;
 			   ),
 
-		    TP_printk("%d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
+		    TP_printk("%d:0x%x, gt=%d, num_bb_per_exec=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
 			      __entry->class, __entry->logical_mask,
-			      __entry->gt_id, __entry->width, __entry->guc_id,
+			      __entry->gt_id, __entry->num_bb_per_exec, __entry->guc_id,
 			      __entry->guc_state, __entry->flags)
 );
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 144a423868cf..df8c5663f899 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1008,6 +1008,68 @@ struct drm_xe_sync {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: Execution Queue
+ *
+ * The Execution Queue abstracts the Hardware Engine that is going to be used
+ * with the execution of the Batch Buffers in &DRM_IOCTL_XE_EXEC
+ *
+ * In a regular usage of this execution queue, only one hardware engine pointer
+ * would be given as input of the @instances below and both @num_bb_per_exec and
+ * @num_eng_per_bb would be set to '1'.
+ *
+ * Regular execution example::
+ *
+ *                    ┌─────┐
+ *                    │ BB0 │
+ *                    └──┬──┘
+ *                       │     @num_bb_per_exec = 1
+ *                       │     @num_eng_per_bb = 1
+ *                       │     @instances = {Engine0}
+ *                       ▼
+ *                   ┌───────┐
+ *                   │Engine0│
+ *                   └───────┘
+ *
+ * However this execution queue is flexible to be used for parallel submission or
+ * for load balancing submission (a.k.a virtual load balancing).
+ *
+ * In a parallel submission, different batch buffers will be simultaneously
+ * dispatched to different engines listed in @instances, in a 1-1 relationship.
+ *
+ * Parallel execution example::
+ *
+ *               ┌─────┐   ┌─────┐
+ *               │ BB0 │   │ BB1 │
+ *               └──┬──┘   └──┬──┘
+ *                  │         │     @num_bb_per_exec = 2
+ *                  │         │     @num_eng_per_bb = 1
+ *                  │         │     @instances = {Engine0, Engine1}
+ *                  ▼         ▼
+ *              ┌───────┐ ┌───────┐
+ *              │Engine0│ │Engine1│
+ *              └───────┘ └───────┘
+ *
+ * On a load balancing submission, each batch buffer is virtually dispatched
+ * to all of the listed engine @instances. Then, underneath driver, firmware, or
+ * hardware can select the best available engine to actually run the job.
+ *
+ * Virtual Load Balancing example::
+ *
+ *                    ┌─────┐
+ *                    │ BB0 │
+ *                    └──┬──┘
+ *                       │      @num_bb_per_exec = 1
+ *                       │      @num_eng_per_bb = 2
+ *                       │      @instances = {Engine0, Engine1}
+ *                  ┌────┴────┐
+ *                  │         │
+ *                  ▼         ▼
+ *              ┌───────┐ ┌───────┐
+ *              │Engine0│ │Engine1│
+ *              └───────┘ └───────┘
+ */
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  */
@@ -1016,11 +1078,17 @@ struct drm_xe_exec_queue_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @width: submission width (number BB per exec) for this exec queue */
-	__u16 width;
+	/**
+	 * @num_bb_per_exec: Indicates a submission width for this exec queue,
+	 * for how many batch buffers can be submitted in parallel.
+	 */
+	__u16 num_bb_per_exec;
 
-	/** @num_placements: number of valid placements for this exec queue */
-	__u16 num_placements;
+	/**
+	 * @num_eng_per_bb: Indicates how many possible engines are available
+	 * at @instances for the Xe to distribute the load.
+	 */
+	__u16 num_eng_per_bb;
 
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
@@ -1035,8 +1103,10 @@ struct drm_xe_exec_queue_create {
 	 * @instances: user pointer to a 2-d array of struct
 	 * drm_xe_engine_class_instance
 	 *
-	 * length = width (i) * num_placements (j)
-	 * index = j + i * width
+	 * Every engine in the array needs to have the same @sched_group_id
+	 *
+	 * length = num_bb_per_exec (i) * num_eng_per_bb (j)
+	 * index = j + i * num_bb_per_exec
 	 */
 	__u64 instances;
 
@@ -1146,7 +1216,7 @@ struct drm_xe_exec {
 
 	/**
 	 * @num_batch_buffer: number of batch buffer in this exec, must match
-	 * the width of the engine
+	 * the @num_bb_per_exec of the struct drm_xe_exec_queue_create
 	 */
 	__u16 num_batch_buffer;
 
-- 
2.34.1

