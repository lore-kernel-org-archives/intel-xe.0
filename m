Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4BDCE7B19
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1282710E60A;
	Thu, 28 Sep 2023 10:59:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28FE10E609
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898755; x=1727434755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1QPTH2V1P8IFXXBNeYUYrA1Bf3u+l/5qWFTgciFRUM=;
 b=eJOlloyEvLof996u+xHswekItJl+Uj6MniViOrf5DwRfejx/bVxk6VO/
 dHIU4Y1NldQg/iQa2SAv9NwRJHL3LRll8B7s5S8hOsqDXivL9ad2QOa2g
 Dp0ggUKEpOQSayM28W3AFTnpQaPbNcfep3NGAv6HME76iDl+ZSmyIo/fH
 WmcoHFVXzesHCWe8EZXgXoF9YIyWyxB+za+a3iCrmotjLabayIkJR9zXg
 IDqYOqgOzBrEtq/4F4lyndWtRqnfBGYgo9/2ow8bn4uZxCoC6EIu56Kye
 BH41m8R5E8X611rYv+tZhjn3hF2thSdH2mCRunijuIqRfkXwzLM0jqVos Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640190"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174475"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174475"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:36 +0000
Message-Id: <20230928105843.7-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 13/20] drm/xe/uapi: Kill
 DRM_XE_UFENCE_WAIT_VM_ERROR
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

From: Matthew Brost <matthew.brost@intel.com>

This is not used nor does it align VM async document, kill this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c              |  3 --
 drivers/gpu/drm/xe/xe_vm_types.h        | 11 -------
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 43 +++----------------------
 include/uapi/drm/xe_drm.h               | 17 +++-------
 4 files changed, 9 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ceab489e8f3b..99b3746cd2af 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1477,9 +1477,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
-	if (vm->async_ops.error_capture.addr)
-		wake_up_all(&vm->async_ops.error_capture.wq);
-
 	xe_assert(xe, list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index af2ba4acf1f9..c45f66db835c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -222,17 +222,6 @@ struct xe_vm {
 		struct work_struct work;
 		/** @lock: protects list of pending async VM ops and fences */
 		spinlock_t lock;
-		/** @error_capture: error capture state */
-		struct {
-			/** @mm: user MM */
-			struct mm_struct *mm;
-			/**
-			 * @addr: user pointer to copy error capture state too
-			 */
-			u64 addr;
-			/** @wq: user fence wait queue for VM errors */
-			wait_queue_head_t wq;
-		} error_capture;
 		/** @fence: fence state */
 		struct {
 			/** @context: context of async fence */
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 761eed3a022f..b47e9464c115 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,7 +13,6 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
-#include "xe_vm.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -81,8 +80,7 @@ static int check_hw_engines(struct xe_device *xe,
 }
 
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
-			 DRM_XE_UFENCE_WAIT_ABSTIME | \
-			 DRM_XE_UFENCE_WAIT_VM_ERROR)
+			 DRM_XE_UFENCE_WAIT_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
 
 static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
@@ -109,11 +107,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
-	struct xe_vm *vm = NULL;
 	u64 addr = args->addr;
 	int err;
-	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
-		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
+	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
 	unsigned long timeout;
 	ktime_t start;
 
@@ -134,8 +130,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) &&
-			 addr & 0x7))
+	if (XE_IOCTL_DBG(xe, addr & 0x7))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
@@ -153,22 +148,6 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
-	if (args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) {
-		if (XE_IOCTL_DBG(xe, args->vm_id >> 32))
-			return -EINVAL;
-
-		vm = xe_vm_lookup(to_xe_file(file), args->vm_id);
-		if (XE_IOCTL_DBG(xe, !vm))
-			return -ENOENT;
-
-		if (XE_IOCTL_DBG(xe, !vm->async_ops.error_capture.addr)) {
-			xe_vm_put(vm);
-			return -EOPNOTSUPP;
-		}
-
-		addr = vm->async_ops.error_capture.addr;
-	}
-
 	/*
 	 * For negative timeout we want to wait "forever" by setting
 	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
@@ -188,15 +167,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
 	 * work with the wait_event_* macros.
 	 */
-	if (vm)
-		add_wait_queue(&vm->async_ops.error_capture.wq, &w_wait);
-	else
-		add_wait_queue(&xe->ufence_wq, &w_wait);
+	add_wait_queue(&xe->ufence_wq, &w_wait);
 	for (;;) {
-		if (vm && xe_vm_is_closed(vm)) {
-			err = -ENODEV;
-			break;
-		}
 		err = do_compare(addr, args->value, args->mask, args->op);
 		if (err <= 0)
 			break;
@@ -213,12 +185,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
 	}
-	if (vm) {
-		remove_wait_queue(&vm->async_ops.error_capture.wq, &w_wait);
-		xe_vm_put(vm);
-	} else {
-		remove_wait_queue(&xe->ufence_wq, &w_wait);
-	}
+	remove_wait_queue(&xe->ufence_wq, &w_wait);
 
 	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
 		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e7cf42c7234b..f13974f17be9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -905,18 +905,10 @@ struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	union {
-		/**
-		 * @addr: user pointer address to wait on, must qword aligned
-		 */
-		__u64 addr;
-
-		/**
-		 * @vm_id: The ID of the VM which encounter an error used with
-		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
-		 */
-		__u64 vm_id;
-	};
+	/**
+	 * @addr: user pointer address to wait on, must qword aligned
+	 */
+	__u64 addr;
 
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
@@ -929,7 +921,6 @@ struct drm_xe_wait_user_fence {
 
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
-#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	/** @flags: wait flags */
 	__u16 flags;
 
-- 
2.34.1

