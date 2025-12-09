Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E30D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B7210E37F;
	Tue,  9 Dec 2025 03:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIjW3lI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82410E37F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250465; x=1796786465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zIWjacR2gupTxHDPr+4cakol2D+AUUV+tfjXCeKD08U=;
 b=iIjW3lI9BU/oU/R03D+yTPUZCr2B5IVt6hXY4V+WFuZOjK2PrNq3OIUC
 LuWJDlpi+QYOhTAkYQQWjF3rOUwK09l2t/hUVtoQk7Jm5M1f0JWzdfLOT
 NEzSzXQuXRejXzFqegQWqsCAA4bkxuhfWKG3QZuI4UYbFytUm/nrqEmh4
 YccVqKyWc0Kgp22nrYXoCZ3F1Xq4Igxgggiyel4rzY4nthgNMUt0W/Kgw
 7S8Wo5ywzSYXkuA3i8ga8SnfyCxUl8EeYmbNuDwxNTJVzVADOziKRRVfK
 BDtgNnYSFYlGALvDvnTsJVkPI5MOGzhZWUF41Kqjm/o+UA/MotA48w9vC w==;
X-CSE-ConnectionGUID: vOX0dsw4SICkzw2g1s0/4w==
X-CSE-MsgGUID: g5DIsxZyQKCNMp94n4f+bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254139"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:04 -0800
X-CSE-ConnectionGUID: qCxSxausTeihkQscdb7BdQ==
X-CSE-MsgGUID: sbFC799aToClFgPhGpglsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289615"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:04 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 02/18] drm/xe/multi_queue: Add user interface for multi
 queue support
Date: Mon,  8 Dec 2025 19:20:52 -0800
Message-ID: <20251209032055.1539229-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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

Multi Queue is a new mode of execution supported by the compute and
blitter copy command streamers (CCS and BCS, respectively). It is an
enhancement of the existing hardware architecture and leverages the
same submission model. It enables support for efficient, parallel
execution of multiple queues within a single context. All the queues
of a group must use the same address space (VM).

The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
property supports creating a multi queue group and adding queues to
a queue group. All queues of a multi queue group share the same
context.

A exec queue create ioctl call with above property specified with value
DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
queue being created as the primary queue (aka q0) of the group. To add
secondary queues to the group, they need to be created with the above
property with id of the primary queue as the value. The properties of
the primary queue (like priority, timeslice) applies to the whole group.
So, these properties can't be set for secondary queues of a group.

Once destroyed, the secondary queues of a multi queue group can't be
replaced. However, they can be dynamically added to the group up to a
total of 64 queues per group. Once the primary queue is destroyed,
secondary queues can't be added to the queue group.

v2: Remove group->lock, fix xe_exec_queue_group_add()/delete()
    function semantics, add additional comments, remove unused
    group->list_lock, add XE_BO_FLAG_GGTT_INVALIDATE for cgp bo,
    Assert LRC is valid, update uapi kernel doc.
    (Matt Brost)
v3: Use XE_BO_FLAG_PINNED_LATE_RESTORE/USER_VRAM/GGTT_INVALIDATE
    flags for cgp bo (Matt)
v4: Ensure queue is not a vm_bind queue
    uapi change due to rebase

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 197 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  26 +++
 include/uapi/drm/xe_drm.h                |  10 ++
 4 files changed, 278 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 02b75652d497..f76ec277c5af 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -13,6 +13,7 @@
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_bo.h"
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -63,6 +64,33 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
 
+static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_lrc *lrc;
+	unsigned long idx;
+
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		/*
+		 * Put pairs with get from xe_exec_queue_lookup() call
+		 * in xe_exec_queue_group_validate().
+		 */
+		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
+		return;
+	}
+
+	if (!group)
+		return;
+
+	/* Primary queue cleanup */
+	xa_for_each(&group->xa, idx, lrc)
+		xe_lrc_put(lrc);
+
+	xa_destroy(&group->xa);
+	xe_bo_unpin_map_no_vm(group->cgp_bo);
+	kfree(group);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
 	int i;
@@ -73,6 +101,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
+
+	if (xe_exec_queue_is_multi_queue(q))
+		xe_exec_queue_group_cleanup(q);
+
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -588,6 +620,150 @@ static int exec_queue_set_hang_replay_state(struct xe_device *xe,
 	return 0;
 }
 
+static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	struct xe_tile *tile = gt_to_tile(q->gt);
+	struct xe_exec_queue_group *group;
+	struct xe_bo *bo;
+
+	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+
+	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_PINNED_LATE_RESTORE |
+				       XE_BO_FLAG_FORCE_USER_VRAM |
+				       XE_BO_FLAG_GGTT_INVALIDATE |
+				       XE_BO_FLAG_GGTT, false);
+	if (IS_ERR(bo)) {
+		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
+			PTR_ERR(bo));
+		kfree(group);
+		return PTR_ERR(bo);
+	}
+
+	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
+
+	group->primary = q;
+	group->cgp_bo = bo;
+	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
+	q->multi_queue.group = group;
+
+	return 0;
+}
+
+static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
+{
+	return q->gt->info.multi_queue_engine_class_mask & BIT(q->class);
+}
+
+static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
+					u32 primary_id)
+{
+	struct xe_exec_queue_group *group;
+	struct xe_exec_queue *primary;
+	int ret;
+
+	/*
+	 * Get from below xe_exec_queue_lookup() pairs with put
+	 * in xe_exec_queue_group_cleanup().
+	 */
+	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
+	if (XE_IOCTL_DBG(xe, !primary))
+		return -ENOENT;
+
+	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
+	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
+	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
+		ret = -EINVAL;
+		goto put_primary;
+	}
+
+	group = primary->multi_queue.group;
+	q->multi_queue.valid = true;
+	q->multi_queue.group = group;
+
+	return 0;
+put_primary:
+	xe_exec_queue_put(primary);
+	return ret;
+}
+
+#define XE_MAX_GROUP_SIZE	64
+static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	u32 pos;
+	int err;
+
+	xe_assert(xe, xe_exec_queue_is_multi_queue_secondary(q));
+
+	/* Primary queue holds a reference to LRCs of all secondary queues */
+	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
+		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
+	if (XE_IOCTL_DBG(xe, err)) {
+		xe_lrc_put(q->lrc[0]);
+
+		/* It is invalid if queue group limit is exceeded */
+		if (err == -EBUSY)
+			err = -EINVAL;
+
+		return err;
+	}
+
+	q->multi_queue.pos = pos;
+
+	return 0;
+}
+
+static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_lrc *lrc;
+
+	xe_assert(xe, xe_exec_queue_is_multi_queue_secondary(q));
+
+	lrc = xa_erase(&group->xa, q->multi_queue.pos);
+	xe_assert(xe, lrc);
+	xe_lrc_put(lrc);
+}
+
+static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
+				      u64 value)
+{
+	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
+		return -ENODEV;
+
+	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
+		return -EOPNOTSUPP;
+
+	if (XE_IOCTL_DBG(xe, !q->vm->xef))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
+		return -EINVAL;
+
+	if (value & DRM_XE_MULTI_GROUP_CREATE) {
+		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
+			return -EINVAL;
+
+		q->multi_queue.valid = true;
+		q->multi_queue.is_primary = true;
+		q->multi_queue.pos = 0;
+		return 0;
+	}
+
+	/* While adding secondary queues, the upper 32 bits must be 0 */
+	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
+		return -EINVAL;
+
+	return xe_exec_queue_group_validate(xe, q, value);
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -597,6 +773,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
 	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -618,7 +795,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
@@ -667,6 +845,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 		return exec_queue_user_extensions(xe, q, ext.next_extension,
 						  ++ext_number);
 
+	if (xe_exec_queue_is_multi_queue_primary(q)) {
+		err = xe_exec_queue_group_init(xe, q);
+		if (XE_IOCTL_DBG(xe, err))
+			return err;
+	}
+
 	return 0;
 }
 
@@ -821,12 +1005,18 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (IS_ERR(q))
 			return PTR_ERR(q);
 
+		if (xe_exec_queue_is_multi_queue_secondary(q)) {
+			err = xe_exec_queue_group_add(xe, q);
+			if (XE_IOCTL_DBG(xe, err))
+				goto put_exec_queue;
+		}
+
 		if (xe_vm_in_preempt_fence_mode(vm)) {
 			q->lr.context = dma_fence_context_alloc(1);
 
 			err = xe_vm_add_compute_exec_queue(vm, q);
 			if (XE_IOCTL_DBG(xe, err))
-				goto put_exec_queue;
+				goto delete_queue_group;
 		}
 
 		if (q->vm && q->hwe->hw_engine_group) {
@@ -849,6 +1039,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 kill_exec_queue:
 	xe_exec_queue_kill(q);
+delete_queue_group:
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		xe_exec_queue_group_delete(xe, q);
 put_exec_queue:
 	xe_exec_queue_put(q);
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index fda4d4f9bda8..e6daa40003f2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -66,6 +66,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
 	return q->pxp.type;
 }
 
+/**
+ * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
+ * @q: The exec_queue
+ *
+ * Return: True if the exec_queue is part of a queue group, false otherwise.
+ */
+static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
+{
+	return q->multi_queue.valid;
+}
+
+/**
+ * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
+ * of a multi queue group.
+ * @q: The exec_queue
+ *
+ * Return: True if @q is primary queue of a queue group, false otherwise.
+ */
+static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
+{
+	return q->multi_queue.is_primary;
+}
+
+/**
+ * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
+ * of a multi queue group.
+ * @q: The exec_queue
+ *
+ * Return: True if @q is secondary queue of a queue group, false otherwise.
+ */
+static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
+{
+	return xe_exec_queue_is_multi_queue(q) && !xe_exec_queue_is_multi_queue_primary(q);
+}
+
+/**
+ * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
+ * @q: The exec_queue
+ *
+ * If @q belongs to a multi queue group, then the primary queue of the group will
+ * be returned. Otherwise, @q will be returned.
+ */
+static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
+{
+	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
+}
+
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3ba10632dcd6..29feafb42e0a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
 	XE_EXEC_QUEUE_PRIORITY_COUNT
 };
 
+/**
+ * struct xe_exec_queue_group - Execution multi queue group
+ *
+ * Contains multi queue group information.
+ */
+struct xe_exec_queue_group {
+	/** @primary: Primary queue of this group */
+	struct xe_exec_queue *primary;
+	/** @cgp_bo: BO for the Context Group Page */
+	struct xe_bo *cgp_bo;
+	/** @xa: xarray to store LRCs */
+	struct xarray xa;
+};
+
 /**
  * struct xe_exec_queue - Execution queue
  *
@@ -111,6 +125,18 @@ struct xe_exec_queue {
 		struct xe_guc_exec_queue *guc;
 	};
 
+	/** @multi_queue: Multi queue information */
+	struct {
+		/** @multi_queue.group: Queue group information */
+		struct xe_exec_queue_group *group;
+		/** @multi_queue.pos: Position of queue within the multi-queue group */
+		u8 pos;
+		/** @multi_queue.valid: Queue belongs to a multi queue group */
+		u8 valid:1;
+		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
+		u8 is_primary:1;
+	} multi_queue;
+
 	/** @sched_props: scheduling properties */
 	struct {
 		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 876a076fa6c0..19a8ae856a17 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1272,6 +1272,14 @@ struct drm_xe_vm_bind {
  *    Given that going into a power-saving state kills PXP HWDRM sessions,
  *    runtime PM will be blocked while queues of this type are alive.
  *    All PXP queues will be killed if a PXP invalidation event occurs.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
+ *    or add secondary queues to a multi-queue group.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
+ *    then a new multi-queue group is created with this queue as the primary queue
+ *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
+ *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
+ *    All the other non-relevant bits of extension's 'value' field while adding the
+ *    primary or the secondary queues of the group must be set to 0.
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1313,6 +1321,8 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
+#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

