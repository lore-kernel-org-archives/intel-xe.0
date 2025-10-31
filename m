Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD16CCCFA03
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0CB10E333;
	Fri, 31 Oct 2025 18:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/rvjkHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D4A10E304
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935385; x=1793471385;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=faP/INZTpN8BD7Oxd+5Pev8XFj/QRZ5h82ddi1XAh7o=;
 b=B/rvjkHUfciLeA1NdRZ0AZfQNfndhZBYcCoW0uAKz2IcuRx+2TF7BxLL
 VitAkidCv2vXEv/SUQalyK2QGCx/mvotncFUmeT1c3UdB8KgsjspgYqm9
 aNbtHoJMUs9xsX8ZycaSXoIJbKLaM3In7eZitvhBBbupK4VdfaULrvHTI
 ut7b6YBnU1IQTFEwoIPU/u8dRsAWQv38upST3LiyDGqGYRqDyBQhJLcIU
 do6XOmuRewRBZs6Qp10TEF4XQ/ywX9gRELCe2LqHPLAUNXPfkflXfRRX1
 XKDETPVOEyvYnFEOTtMv3zM3Ja2eHykd8EaXzZx9moyXM6QPqUmgTTNap w==;
X-CSE-ConnectionGUID: d44WqLB5QSyxeEQGAeAJkA==
X-CSE-MsgGUID: yQjf38quRl2KkaBr2gxZag==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123863"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123863"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:44 -0700
X-CSE-ConnectionGUID: ojfbKffPThaImG0Fc8dN3w==
X-CSE-MsgGUID: nLeQBw8pTPqs5mJ0chbZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987642"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/16] drm/xe/multi_queue: Support active group after primary
 is destroyed
Date: Fri, 31 Oct 2025 11:29:33 -0700
Message-ID: <20251031182936.1882062-14-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Add support to keep the group active after the primary queue is
destroyed. Instead of killing the primary queue during exec_queue
destroy ioctl, kill it when all the secondary queues of the group
are killed.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  7 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
 include/uapi/drm/xe_drm.h                |  5 +++
 5 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b496676527a..708a17c357e6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -176,7 +176,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		if (q->vm && q->hwe->hw_engine_group)
 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
-		xe_exec_queue_kill(q);
+
+		if (xe_exec_queue_is_multi_queue_primary(q))
+			xe_exec_queue_group_kill_put(q->multi_queue.group);
+		else
+			xe_exec_queue_kill(q);
+
 		xe_exec_queue_put(q);
 	}
 	xa_for_each(&xef->vm.xa, idx, vm)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 3c1bb4f10fd5..d7b0173691c1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -405,6 +405,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 
+static void xe_exec_queue_group_kill(struct kref *ref)
+{
+	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
+							 kill_refcount);
+	xe_exec_queue_kill(group->primary);
+}
+
+static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
+{
+	kref_get(&group->kill_refcount);
+}
+
+void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
+{
+	if (!group)
+		return;
+
+	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
+}
+
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
@@ -607,6 +627,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
+	kref_init(&group->kill_refcount);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->lock);
 	mutex_init(&group->list_lock);
@@ -675,6 +696,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
 	q->multi_queue.pos = pos;
 	mutex_unlock(&group->lock);
 
+	if (group->primary->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_get(group);
+		q->multi_queue.keep_active = true;
+	}
+
 	return 0;
 }
 
@@ -691,6 +717,11 @@ static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
 	if (lrc)
 		xe_lrc_put(lrc);
 	mutex_unlock(&group->lock);
+
+	if (q->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_put(group);
+		q->multi_queue.keep_active = false;
+	}
 }
 
 static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
@@ -709,12 +740,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
 		return -EINVAL;
 
 	if (value & DRM_XE_MULTI_GROUP_CREATE) {
-		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
+		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
+					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
+			return -EINVAL;
+
+		/*
+		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
+		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
+		 */
+		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
+				 xe_vm_in_preempt_fence_mode(q->vm)))
 			return -EINVAL;
 
 		q->multi_queue.valid = true;
 		q->multi_queue.is_primary = true;
 		q->multi_queue.pos = 0;
+		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
+			q->multi_queue.keep_active = true;
+
 		return 0;
 	}
 
@@ -1254,6 +1297,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 
 	q->ops->kill(q);
 	xe_vm_remove_compute_exec_queue(q->vm, q);
+
+	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_put(q->multi_queue.group);
+		q->multi_queue.keep_active = false;
+	}
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -1280,7 +1328,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
-	xe_exec_queue_kill(q);
+	if (xe_exec_queue_is_multi_queue_primary(q))
+		xe_exec_queue_group_kill_put(q->multi_queue.group);
+	else
+		xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 61478b2e883b..b642341f1ede 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -109,6 +109,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
 	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
 }
 
+void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
+
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index e64b6588923e..cdca3afe838c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -55,6 +55,8 @@ struct xe_exec_queue_group {
 	struct list_head list;
 	/** @list_lock: Secondary queue list lock */
 	struct mutex list_lock;
+	/** @kill_refcount: ref count to kill primary queue */
+	struct kref kill_refcount;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 };
@@ -152,6 +154,8 @@ struct xe_exec_queue {
 		u8 valid:1;
 		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
 		u8 is_primary:1;
+		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
+		u8 keep_active:1;
 	} multi_queue;
 
 	/** @sched_props: scheduling properties */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d72151163e77..333fb38b3404 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1260,6 +1260,10 @@ struct drm_xe_vm_bind {
  *    then a new multi-queue group is created with this queue as the primary queue
  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
  *    queue id is specified in the 'value' field.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
+ *    set, then the multi-queue group is kept active after the primary queue is
+ *    destroyed.
+ *
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
  *    priority within the multi-queue group.
  *
@@ -1304,6 +1308,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.43.0

