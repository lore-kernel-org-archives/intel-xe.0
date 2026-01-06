Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C18CD042C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 01:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE8210E231;
	Tue,  6 Jan 2026 01:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdA7yeG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1C810E3C4
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 01:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767662972; x=1799198972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRQ8ebhlI0WNmQ5zmblPdRe4aFP3orve/YRN0OcX5bo=;
 b=AdA7yeG8aiLLuHNcDjRjmRlwrVrkpKjqmAAFL51uYRexBsOPaJagFAcJ
 Cqao0/SvcbiPh5W3qQyndMMOy4eZV6QKsxSm5MUQf29KVLcakgWxKf0vj
 pYj0hSJGf4CuZmvNL0QyWZfYfnUI8jWWS9mb8vFHnv0w6bB8Dg5d6mA+w
 eJQoYArkdlVKmRQVWRtSKXFl/UCzG+/nXlMoOGE9yaubAvg5UjRv5Sgbs
 MJSNT+wWJUFBJ5uNWEVbvU2+eg7oywDSFmG09C+yJHDOJzwxW/SBXo6Nc
 VjE4NN3A+zTt+/gbnIswhM9p6w92icxpBSKibXIxN/r+9CV7ol3x/FLhN g==;
X-CSE-ConnectionGUID: wjJ3SjrmR1afc039fUzpPA==
X-CSE-MsgGUID: bfULdDNTQreEqgZBR8i4xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69072798"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69072798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:29:32 -0800
X-CSE-ConnectionGUID: n7HNgJ2xQ4ibeRytLr0Krg==
X-CSE-MsgGUID: zurOz8/8T0+Pk03eXSjtaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202148073"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:29:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 1/2] Revert "drm/xe/multi_queue: Support active group after
 primary is destroyed"
Date: Mon,  5 Jan 2026 17:29:15 -0800
Message-ID: <20260106012920.2850975-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
References: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
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

This reverts commit 3131a43ecb346ae3b5287ee195779fc38c6fcd11.

There is no must have requirement for this feature from Compute UMD.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  7 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +-----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 --
 include/uapi/drm/xe_drm.h                |  4 --
 5 files changed, 3 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e101d290b2a6..f4741cbe4c45 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -180,12 +180,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		if (q->vm && q->hwe->hw_engine_group)
 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
-
-		if (xe_exec_queue_is_multi_queue_primary(q))
-			xe_exec_queue_group_kill_put(q->multi_queue.group);
-		else
-			xe_exec_queue_kill(q);
-
+		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
 	xa_for_each(&xef->vm.xa, idx, vm)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0b9e074b022f..529a40ca4002 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -467,26 +467,6 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 
-static void xe_exec_queue_group_kill(struct kref *ref)
-{
-	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
-							 kill_refcount);
-	xe_exec_queue_kill(group->primary);
-}
-
-static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
-{
-	kref_get(&group->kill_refcount);
-}
-
-void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
-{
-	if (!group)
-		return;
-
-	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
-}
-
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
@@ -716,7 +696,6 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
-	kref_init(&group->kill_refcount);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
@@ -792,11 +771,6 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
 
 	q->multi_queue.pos = pos;
 
-	if (group->primary->multi_queue.keep_active) {
-		xe_exec_queue_group_kill_get(group);
-		q->multi_queue.keep_active = true;
-	}
-
 	return 0;
 }
 
@@ -810,11 +784,6 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
 	lrc = xa_erase(&group->xa, q->multi_queue.pos);
 	xe_assert(xe, lrc);
 	xe_lrc_put(lrc);
-
-	if (q->multi_queue.keep_active) {
-		xe_exec_queue_group_kill_put(group);
-		q->multi_queue.keep_active = false;
-	}
 }
 
 static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
@@ -836,24 +805,12 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
 		return -EINVAL;
 
 	if (value & DRM_XE_MULTI_GROUP_CREATE) {
-		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
-					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
-			return -EINVAL;
-
-		/*
-		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
-		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
-		 */
-		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
-				 xe_vm_in_preempt_fence_mode(q->vm)))
+		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
 			return -EINVAL;
 
 		q->multi_queue.valid = true;
 		q->multi_queue.is_primary = true;
 		q->multi_queue.pos = 0;
-		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
-			q->multi_queue.keep_active = true;
-
 		return 0;
 	}
 
@@ -1419,11 +1376,6 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 
 	q->ops->kill(q);
 	xe_vm_remove_compute_exec_queue(q->vm, q);
-
-	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
-		xe_exec_queue_group_kill_put(q->multi_queue.group);
-		q->multi_queue.keep_active = false;
-	}
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -1450,10 +1402,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
-	if (xe_exec_queue_is_multi_queue_primary(q))
-		xe_exec_queue_group_kill_put(q->multi_queue.group);
-	else
-		xe_exec_queue_kill(q);
+	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index b5ad975d7e97..b1e51789128f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -113,8 +113,6 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
 	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
 }
 
-void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
-
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 67ea5eebf70b..5fc516b0bb77 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -62,8 +62,6 @@ struct xe_exec_queue_group {
 	struct list_head list;
 	/** @list_lock: Secondary queue list lock */
 	struct mutex list_lock;
-	/** @kill_refcount: ref count to kill primary queue */
-	struct kref kill_refcount;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 	/** @banned: Group banned */
@@ -163,8 +161,6 @@ struct xe_exec_queue {
 		u8 valid:1;
 		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
 		u8 is_primary:1;
-		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
-		u8 keep_active:1;
 	} multi_queue;
 
 	/** @sched_props: scheduling properties */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bb69f9b30c7d..077e66a682e2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1280,9 +1280,6 @@ struct drm_xe_vm_bind {
  *    then a new multi-queue group is created with this queue as the primary queue
  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
  *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
- *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
- *    set, then the multi-queue group is kept active after the primary queue is
- *    destroyed.
  *    All the other non-relevant bits of extension's 'value' field while adding the
  *    primary or the secondary queues of the group must be set to 0.
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
@@ -1331,7 +1328,6 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
-#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.43.0

