Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E340CD6E73
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61A10E85E;
	Wed, 11 Oct 2023 13:59:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D868810E849
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032787; x=1728568787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rBASt00K9dyVL9ElymGVXR87o3RJLip5SSHyxEmlb4M=;
 b=Qb2WHlmEHhggbrlEOa6pkWt8HWUyv/JP/OyvMHfYDJcHIZYnYFzq/KfD
 n33uAYMh3WGr4RdSOJa/M17Mw4uDWLpXTUd/KNGBelK4UDwEf3+DiEm4g
 aqauw/ObpQbi/Tu0qs6vdHGAs29nwm9reKOoa32IQEssMnmsIqIcWjrhK
 skXca4KPHZj9SSOJfIPPN4OEWC1IHd3XPWzMfwgWjFNqdSBrV0htvxrst
 CUvFCWDOC7SakngJNG14ej09s2BSsCjW/7JBZBWntVy1bLzNb5Yh+y+VH
 wnJ7o0xxZy25zFpikfIyhmfSnr/2lJp+Uxrr4wrfKjhIFHDudUYH9Zqsr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156246"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156246"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829113"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829113"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:18 +0000
Message-Id: <20231011135926.7-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 09/17] drm/xe/uapi: Add _FLAG to uAPI constants
 usable for flags
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Most constants defined in xe_drm.h which can be used for flags are
named DRM_XE_*_FLAG_*, which is helpful to identify them. Make this
systematic and add _FLAG where it was missing.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c            | 16 ++++++-------
 drivers/gpu/drm/xe/xe_vm.c              | 32 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_vm_doc.h          |  2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 10 ++++----
 include/uapi/drm/xe_drm.h               | 30 +++++++++++------------
 5 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 73ef259aa387..eafe53c2f55d 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -110,14 +110,14 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		return -EFAULT;
 
 	if (XE_IOCTL_DBG(xe, sync_in.flags &
-			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
+			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_FLAG_SIGNAL)) ||
 	    XE_IOCTL_DBG(xe, sync_in.pad) ||
 	    XE_IOCTL_DBG(xe, sync_in.reserved[0] || sync_in.reserved[1]))
 		return -EINVAL;
 
-	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
+	signal = sync_in.flags & DRM_XE_SYNC_FLAG_SIGNAL;
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
-	case DRM_XE_SYNC_SYNCOBJ:
+	case DRM_XE_SYNC_FLAG_SYNCOBJ:
 		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
 			return -EOPNOTSUPP;
 
@@ -135,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		}
 		break;
 
-	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
+	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
 		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
 			return -EOPNOTSUPP;
 
@@ -165,12 +165,12 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		}
 		break;
 
-	case DRM_XE_SYNC_DMA_BUF:
+	case DRM_XE_SYNC_FLAG_DMA_BUF:
 		if (XE_IOCTL_DBG(xe, "TODO"))
 			return -EINVAL;
 		break;
 
-	case DRM_XE_SYNC_USER_FENCE:
+	case DRM_XE_SYNC_FLAG_USER_FENCE:
 		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
@@ -225,7 +225,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			  struct dma_fence *fence)
 {
-	if (!(sync->flags & DRM_XE_SYNC_SIGNAL))
+	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
 		return;
 
 	if (sync->chain_fence) {
@@ -253,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			dma_fence_put(fence);
 		}
 	} else if ((sync->flags & SYNC_FLAGS_TYPE_MASK) ==
-		   DRM_XE_SYNC_USER_FENCE) {
+		   DRM_XE_SYNC_FLAG_USER_FENCE) {
 		job->user_fence.used = true;
 		job->user_fence.addr = sync->addr;
 		job->user_fence.value = sync->timeline_value;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8758d2d140df..9a441cd1ce58 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1911,10 +1911,10 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-#define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
-				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
-				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
-				    DRM_XE_VM_CREATE_FAULT_MODE)
+#define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
+				    DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE | \
+				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
+				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file)
@@ -1932,9 +1932,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
-		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
+		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
 			 !xe->info.supports_usm))
 		return -EINVAL;
 
@@ -1944,32 +1944,32 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
-			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE &&
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
 			 xe_device_in_non_fault_mode(xe)))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
 			 xe_device_in_fault_mode(xe)))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
-	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
 		flags |= XE_VM_FLAG_COMPUTE_MODE;
-	if (args->flags & DRM_XE_VM_CREATE_ASYNC_DEFAULT)
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
 		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
-	if (args->flags & DRM_XE_VM_CREATE_FAULT_MODE)
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
 	vm = xe_vm_create(xe, flags);
diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
index 516f4dc97223..bdc6659891a5 100644
--- a/drivers/gpu/drm/xe/xe_vm_doc.h
+++ b/drivers/gpu/drm/xe/xe_vm_doc.h
@@ -18,7 +18,7 @@
  * Scratch page
  * ------------
  *
- * If the VM is created with the flag, DRM_XE_VM_CREATE_SCRATCH_PAGE, set the
+ * If the VM is created with the flag, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, set the
  * entire page table structure defaults pointing to blank page allocated by the
  * VM. Invalid memory access rather than fault just read / write to this page.
  *
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 78686908f7fb..13562db6c07f 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -79,8 +79,8 @@ static int check_hw_engines(struct xe_device *xe,
 	return 0;
 }
 
-#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
-			 DRM_XE_UFENCE_WAIT_ABSTIME)
+#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
+			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
 
 static long to_jiffies_timeout(struct xe_device *xe,
@@ -107,7 +107,7 @@ static long to_jiffies_timeout(struct xe_device *xe,
 	 * Save the timeout to an u64 variable because nsecs_to_jiffies
 	 * might return a value that overflows s32 variable.
 	 */
-	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
+	if (args->flags & DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
 		t = drm_timeout_abs_to_jiffies(args->timeout);
 	else
 		t = nsecs_to_jiffies(args->timeout);
@@ -137,7 +137,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		u64_to_user_ptr(args->instances);
 	u64 addr = args->addr;
 	int err;
-	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
+	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
 	long timeout;
 	ktime_t start;
 
@@ -206,7 +206,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	}
 	remove_wait_queue(&xe->ufence_wq, &w_wait);
 
-	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
+	if (!(args->flags & DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)) {
 		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
 		if (args->timeout < 0)
 			args->timeout = 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6a6f47d329c2..4755aa5e73f2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -660,10 +660,10 @@ struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_VM_CREATE_SCRATCH_PAGE		(0x1 << 0)
-#define DRM_XE_VM_CREATE_COMPUTE_MODE		(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_DEFAULT		(0x1 << 2)
-#define DRM_XE_VM_CREATE_FAULT_MODE		(0x1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
+#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
+#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -895,11 +895,11 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_SYNC_SYNCOBJ		0x0
-#define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
-#define DRM_XE_SYNC_DMA_BUF		0x2
-#define DRM_XE_SYNC_USER_FENCE		0x3
-#define DRM_XE_SYNC_SIGNAL		0x10
+#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
+#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
+#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
+#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
 	__u32 flags;
 
 	/** @pad: MBZ */
@@ -985,8 +985,8 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1004,10 +1004,10 @@ struct drm_xe_wait_user_fence {
 	__u64 mask;
 	/**
 	 * @timeout: how long to wait before bailing, value in nanoseconds.
-	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
+	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
 	 * it contains timeout expressed in nanoseconds to wait (fence will
 	 * expire at now() + timeout).
-	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
+	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flat is set (absolute timeout) wait
 	 * will end at timeout (uses system MONOTONIC_CLOCK).
 	 * Passing negative timeout leads to neverending wait.
 	 *
@@ -1020,13 +1020,13 @@ struct drm_xe_wait_user_fence {
 
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
 	 */
 	__u64 num_engines;
 
 	/**
 	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
 	 */
 	__u64 instances;
 
-- 
2.34.1

