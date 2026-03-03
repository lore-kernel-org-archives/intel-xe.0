Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B23EDEBFA
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 22:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1AC10E8E6;
	Tue,  3 Mar 2026 22:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0aTOpmN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43C10E8E6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772577050; x=1804113050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PHzbRb29DvuK09CtfVOlwMQjFxG5NHtl7HfwqKktSms=;
 b=K0aTOpmNJIgR8Z5K4NifJd7Sv0UE6Qp4r/qkNLXJO06UiAQcxFJfn++E
 2HSxd3v6MzSREOMGv4y/K9FM5RaiAc5icbqZOv0MJkNYDF/n90u6ZB5r5
 5YA4/+dXo7L+DMjF519cBUNnMcB4HlRpRLN6HTV2mInEiSXHyTtmh/Vjk
 X8Luo5fCKE7EFJ/MxgbLePtu9rTeq+y4raZPHuqyuuJhmmtim1p7bCvrC
 N7NnzQ2vlyzSvkHYhGpI9Lw77sW7cX5cqU0P2IJPYNusrHvSwUplYBc7s
 hP6s+FRuB7sy5NAJxMTw4WNP3cxFrq8najAKlj8BTP0J+R4tP6eQ9V95P w==;
X-CSE-ConnectionGUID: BfjhZk0bSc6l4tD1Cf7VlQ==
X-CSE-MsgGUID: zPP5qnNjRUGjPGP99IG8UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73593851"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73593851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:30:48 -0800
X-CSE-ConnectionGUID: p7EO41p4Qfy7evoP9nSFsQ==
X-CSE-MsgGUID: dRwFXChfTLWvst7Fkm+9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215590162"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:30:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2] drm/xe: Add missing kernel docs in xe_exec_queue.c
Date: Tue,  3 Mar 2026 14:30:41 -0800
Message-ID: <20260303223040.140504-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add kernel doc to all exported functions that do not have
a kernel doc in xe_exec_queue.c.

v2: mention multi-lrc in comment (Matt Brost)

Assisted-by: Claude 4.5 Sonnet
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 112 +++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bb273ca02d28..6166b1a81433 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -399,6 +399,20 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	return err;
 }
 
+/**
+ * xe_exec_queue_create() - Create an exec queue
+ * @xe: Xe device
+ * @vm: VM for the exec queue
+ * @logical_mask: Logical mask of HW engines
+ * @width: Width of the exec queue (number of LRCs)
+ * @hwe: Hardware engine
+ * @flags: Exec queue creation flags
+ * @extensions: Extensions for exec queue creation
+ *
+ * Create an exec queue (allocate and initialize) with the specified parameters
+ *
+ * Return: Pointer to the created exec queue on success, ERR_PTR on failure
+ */
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hwe, u32 flags,
@@ -442,6 +456,19 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create, ERRNO);
 
+/**
+ * xe_exec_queue_create_class() - Create an exec queue for a specific engine class
+ * @xe: Xe device
+ * @gt: GT for the exec queue
+ * @vm: VM for the exec queue
+ * @class: Engine class
+ * @flags: Exec queue creation flags
+ * @extensions: Extensions for exec queue creation
+ *
+ * Create an exec queue for the specified engine class.
+ *
+ * Return: Pointer to the created exec queue on success, ERR_PTR on failure
+ */
 struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
 						 struct xe_vm *vm,
 						 enum xe_engine_class class,
@@ -533,6 +560,14 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 
+/**
+ * xe_exec_queue_destroy() - Destroy an exec queue
+ * @ref: Reference count of the exec queue
+ *
+ * Called when the last reference to the exec queue is dropped.
+ * Cleans up all resources associated with the exec queue.
+ * This function should not be called directly; use xe_exec_queue_put() instead.
+ */
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
@@ -565,6 +600,14 @@ void xe_exec_queue_destroy(struct kref *ref)
 	q->ops->destroy(q);
 }
 
+/**
+ * xe_exec_queue_fini() - Finalize an exec queue
+ * @q: The exec queue
+ *
+ * Finalizes the exec queue by updating run ticks, releasing LRC references,
+ * and freeing the queue structure. This is called after the queue has been
+ * destroyed and all references have been dropped.
+ */
 void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	/*
@@ -579,6 +622,14 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	__xe_exec_queue_free(q);
 }
 
+/**
+ * xe_exec_queue_assign_name() - Assign a name to an exec queue
+ * @q: The exec queue
+ * @instance: Instance number for the engine
+ *
+ * Assigns a human-readable name to the exec queue based on its engine class
+ * and instance number (e.g., "rcs0", "vcs1", "bcs2").
+ */
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
 {
 	switch (q->class) {
@@ -605,6 +656,15 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
 	}
 }
 
+/**
+ * xe_exec_queue_lookup() - Look up an exec queue by ID
+ * @xef: Xe file private data
+ * @id: Exec queue ID
+ *
+ * Looks up an exec queue by its ID and increments its reference count.
+ *
+ * Return: Pointer to the exec queue if found, NULL otherwise
+ */
 struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
 {
 	struct xe_exec_queue *q;
@@ -618,6 +678,14 @@ struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
 	return q;
 }
 
+/**
+ * xe_exec_queue_device_get_max_priority() - Get maximum priority for an exec queues
+ * @xe: Xe device
+ *
+ * Returns the maximum priority level that can be assigned to an exec queues.
+ *
+ * Return: Maximum priority level (HIGH if CAP_SYS_NICE, NORMAL otherwise)
+ */
 enum xe_exec_queue_priority
 xe_exec_queue_device_get_max_priority(struct xe_device *xe)
 {
@@ -924,6 +992,17 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 							exec_queue_set_multi_queue_priority,
 };
 
+/**
+ * xe_exec_queue_set_property_ioctl() - Set a property on an exec queue
+ * @dev: DRM device
+ * @data: IOCTL data
+ * @file: DRM file
+ *
+ * Allows setting properties on an existing exec queue. Currently only
+ * supports setting multi-queue priority.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
 int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file)
 {
@@ -1148,6 +1227,18 @@ static bool has_sched_groups(struct xe_gt *gt)
 	return false;
 }
 
+/**
+ * xe_exec_queue_create_ioctl() - Create an exec queue via IOCTL
+ * @dev: DRM device
+ * @data: IOCTL data
+ * @file: DRM file
+ *
+ * Creates a new exec queue based on user-provided parameters. Supports
+ * creating VM bind queues, regular exec queues, multi-lrc exec queues
+ * and multi-queue groups.
+ *
+ * Return: 0 on success with exec_queue_id filled in, negative error code on failure
+ */
 int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file)
 {
@@ -1324,6 +1415,17 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+/**
+ * xe_exec_queue_get_property_ioctl() - Get a property from an exec queue
+ * @dev: DRM device
+ * @data: IOCTL data
+ * @file: DRM file
+ *
+ * Retrieves property values from an existing exec queue. Currently supports
+ * getting the ban/reset status.
+ *
+ * Return: 0 on success with value filled in, negative error code on failure
+ */
 int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file)
 {
@@ -1461,6 +1563,16 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 	xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
+/**
+ * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
+ * @dev: DRM device
+ * @data: IOCTL data
+ * @file: DRM file
+ *
+ * Destroys an existing exec queue and releases its reference.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file)
 {
-- 
2.43.0

