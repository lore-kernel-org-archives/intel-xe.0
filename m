Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563E4D116FE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119F610E653;
	Tue,  2 Dec 2025 13:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBcwyYWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4353810E653
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683611; x=1796219611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lkamwe5FZ/IpwNjTnQKy40GLM70rvhUxfHpvu2y61eA=;
 b=lBcwyYWGXGMV3ANP+fEGh82pDi9DVWROZGNqIE7lexq48fFJsb1BA5J0
 CF7Xgqc2CDGNxp2JucWpdYblhoshX5Xkj1GwmtFGXydnF5SDxKVScm4Sx
 QSsniZsmLKQPlFVdG3CN7nwwO+3zZn2kwJng0dNk0m8efkQTDjbKVab1Z
 RqFCqbF9Z7JstOzXoR19vFDOvx3BFA05Dnqg7McRWiVH+fMEvkfQtZNgN
 wbzXVCFBsmbcQh/rLcUJBRQdiYiYCJpot0C1kbasM/klQ5QfUAhLbQ0tU
 znnFhP2wdo2jTwfrb0YO5TuTtrYoaYXqQ54LHIqmL7nDqWo27qhaMyvFp Q==;
X-CSE-ConnectionGUID: f9mf52pFSHqneazk5+nxjw==
X-CSE-MsgGUID: XROU3vuwSSiiIhxXGbUUPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537078"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537078"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:31 -0800
X-CSE-ConnectionGUID: P1pObVhISbW2viZ9mxxS+w==
X-CSE-MsgGUID: 4Nnyq9/qRO6cFNNmCYJBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505673"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:27 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 09/20] drm/xe/eudebug: vm open/pread/pwrite
Date: Tue,  2 Dec 2025 15:52:28 +0200
Message-ID: <20251202135241.880267-10-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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

Debugger needs access to the client's vm to read and write. For
example inspecting ISA/ELF and setting up breakpoints.

Add ioctl to open target vm with debugger client and vm_handle
and hook up pread/pwrite possibility.

Open will take timeout argument so that standard fsync
can be used for explicit flushing between cpu/gpu for
the target vm.

Implement this for bo backed storage. userptr will
be done in following patch.

v2: - checkpatch (Maciej)
    - 32bit fixes (Andrzej)
    - bo_vmap (Mika)
    - fix vm leak if can't allocate k_buffer (Mika)
    - assert vm write held for vma (Matthew)

v3: - fw ref, ttm_bo_access
    - timeout boundary check (Dominik)
    - dont try to copy to user on zero bytes (Mika)

v4: - offset as unsigned long (Thomas)
    - check XE_VMA_DESTROYED

v5: drm_dev_put before releasing debugger (Mika)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  24 ++
 drivers/gpu/drm/xe/xe_eudebug.c       |  41 ++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  12 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   5 +
 drivers/gpu/drm/xe/xe_eudebug_vm.c    | 418 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h    |   8 +
 include/uapi/drm/xe_drm_eudebug.h     |  15 +
 8 files changed, 521 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index caf2b9e518ea..ccf051e65408 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -148,7 +148,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 917a088c28f2..70e9a32c69a6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -570,6 +570,30 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define RCU_ASYNC_FLUSH				XE_REG(0x149fc)
+#define   RCU_ASYNC_FLUSH_IN_PROGRESS	REG_BIT(31)
+#define   RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT	28
+#define   RCU_ASYNC_FLUSH_ENGINE_ID_DECODE1 REG_BIT(26)
+#define   RCU_ASYNC_FLUSH_AMFS		REG_BIT(8)
+#define   RCU_ASYNC_FLUSH_PREFETCH	REG_BIT(7)
+#define   RCU_ASYNC_FLUSH_DATA_PORT	REG_BIT(6)
+#define   RCU_ASYNC_FLUSH_DATA_CACHE	REG_BIT(5)
+#define   RCU_ASYNC_FLUSH_HDC_PIPELINE	REG_BIT(4)
+#define   RCU_ASYNC_INVALIDATE_HDC_PIPELINE REG_BIT(3)
+#define   RCU_ASYNC_INVALIDATE_CONSTANT_CACHE REG_BIT(2)
+#define   RCU_ASYNC_INVALIDATE_TEXTURE_CACHE REG_BIT(1)
+#define   RCU_ASYNC_INVALIDATE_INSTRUCTION_CACHE REG_BIT(0)
+#define   RCU_ASYNC_FLUSH_AND_INVALIDATE_ALL ( \
+	RCU_ASYNC_FLUSH_AMFS | \
+	RCU_ASYNC_FLUSH_PREFETCH | \
+	RCU_ASYNC_FLUSH_DATA_PORT | \
+	RCU_ASYNC_FLUSH_DATA_CACHE | \
+	RCU_ASYNC_FLUSH_HDC_PIPELINE | \
+	RCU_ASYNC_INVALIDATE_HDC_PIPELINE | \
+	RCU_ASYNC_INVALIDATE_CONSTANT_CACHE | \
+	RCU_ASYNC_INVALIDATE_TEXTURE_CACHE | \
+	RCU_ASYNC_INVALIDATE_INSTRUCTION_CACHE)
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 
 /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index d3a8ef2ea9e5..41a9cdfd6142 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
+#include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
@@ -52,8 +53,7 @@ event_fifo_num_events_peek(const struct xe_eudebug * const d)
 	return kfifo_len(&d->events.fifo);
 }
 
-static bool
-xe_eudebug_detached(struct xe_eudebug *d)
+bool xe_eudebug_detached(struct xe_eudebug *d)
 {
 	bool connected;
 
@@ -187,7 +187,7 @@ static void xe_eudebug_free(struct kref *ref)
 	kfree(d);
 }
 
-static void xe_eudebug_put(struct xe_eudebug *d)
+void xe_eudebug_put(struct xe_eudebug *d)
 {
 	kref_put(&d->ref, xe_eudebug_free);
 }
@@ -662,6 +662,35 @@ static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
 	return ret;
 }
 
+static void *find_resource__unlocked(struct xe_eudebug_resources *res,
+				     int type,
+				     u32 id)
+{
+
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h;
+
+	r = resource_from_type(res, type);
+	h = xa_load(&r->xa, id);
+
+	return h ? (void *)(uintptr_t)h->key : NULL;
+}
+
+struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 id)
+{
+	struct xe_vm *vm;
+
+	mutex_lock(&d->res->lock);
+	vm = find_resource__unlocked(d->res, XE_EUDEBUG_RES_TYPE_VM, id);
+	if (vm)
+		xe_vm_get(vm);
+
+	mutex_unlock(&d->res->lock);
+
+	return vm;
+}
+
+
 static struct drm_xe_eudebug_event *
 xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
 			u32 len)
@@ -1626,6 +1655,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
 		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_VM_OPEN:
+		ret = xe_eudebug_vm_open_ioctl(d, arg);
+		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1690,6 +1723,8 @@ xe_eudebug_connect(struct xe_device *xe,
 	spin_lock_init(&d->acks.lock);
 	d->acks.tree = RB_ROOT;
 
+	mutex_init(&d->hw.lock);
+
 	d->res = xe_eudebug_resources_alloc();
 	if (XE_IOCTL_DBG(xe, IS_ERR(d->res))) {
 		err = PTR_ERR(d->res);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index d0f1b51564dc..74171cc81fe1 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -18,6 +18,7 @@ struct xe_vma;
 struct xe_vma_ops;
 struct xe_exec_queue;
 struct xe_user_fence;
+struct xe_eudebug;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -38,6 +39,10 @@ struct xe_user_fence;
 
 #define xe_eudebug_assert(d, ...) xe_assert((d)->xe, ##__VA_ARGS__)
 
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))
+
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
 			     struct drm_file *file);
@@ -47,10 +52,15 @@ bool xe_eudebug_is_enabled(struct xe_device *xe);
 
 void xe_eudebug_file_close(struct xe_file *xef);
 
+bool xe_eudebug_detached(struct xe_eudebug *d);
+
 void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
+
 int xe_eudebug_enable(struct xe_device *xe, bool enable);
 
+struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 vm_id);
+
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
@@ -60,6 +70,8 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
 void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
 
+void xe_eudebug_put(struct xe_eudebug *d);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index a294e2f4e7df..292e93c72a64 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -139,6 +139,11 @@ struct xe_eudebug {
 
 		struct rb_root tree;
 	} acks;
+
+	struct {
+		/** @lock: guards access to hw state */
+		struct mutex lock;
+	} hw;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_eudebug_vm.c
new file mode 100644
index 000000000000..4dd747680a9c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_vm.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include "xe_eudebug_vm.h"
+
+#include <linux/anon_inodes.h>
+#include <linux/fs.h>
+#include <linux/vmalloc.h>
+
+#include <drm/drm_drv.h>
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_eudebug.h"
+#include "xe_eudebug_types.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_mmio.h"
+#include "xe_vm.h"
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
+
+static int xe_eudebug_vma_access(struct xe_vma *vma,
+				 unsigned long offset_in_vma,
+				 void *buf, unsigned long len, bool write)
+{
+	struct xe_bo *bo;
+	u64 bytes;
+
+	lockdep_assert_held_write(&xe_vma_vm(vma)->lock);
+
+	if (XE_WARN_ON(offset_in_vma >= xe_vma_size(vma)))
+		return -EINVAL;
+
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+		return -EINVAL;
+
+	bytes = min_t(u64, len, xe_vma_size(vma) - offset_in_vma);
+	if (!bytes)
+		return 0;
+
+	bo = xe_bo_get(xe_vma_bo(vma));
+	if (bo) {
+		int ret;
+
+		ret = ttm_bo_access(&bo->ttm, offset_in_vma, buf, bytes, write);
+
+		xe_bo_put(bo);
+
+		return ret;
+	}
+
+	return -EINVAL;
+}
+
+static int xe_eudebug_vm_access(struct xe_vm *vm, unsigned long offset,
+				void *buf, unsigned long len, bool write)
+{
+	struct xe_vma *vma;
+	int ret;
+
+	down_write(&vm->lock);
+
+	vma = xe_vm_find_overlapping_vma(vm, offset, len);
+	if (vma) {
+		/* XXX: why find overlapping returns below start? */
+		if (offset < xe_vma_start(vma) ||
+		    offset >= (xe_vma_start(vma) + xe_vma_size(vma))) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* Offset into vma */
+		offset -= xe_vma_start(vma);
+		ret = xe_eudebug_vma_access(vma, offset, buf, len, write);
+	} else {
+		ret = -EINVAL;
+	}
+
+out:
+	up_write(&vm->lock);
+
+	return ret;
+}
+
+struct vm_file {
+	struct xe_eudebug *debugger;
+	struct xe_vm *vm;
+	u64 flags;
+	u64 vm_handle;
+	unsigned int timeout_us;
+};
+
+static ssize_t __vm_read_write(struct xe_vm *vm,
+			       void *bb,
+			       char __user *r_buffer,
+			       const char __user *w_buffer,
+			       unsigned long offset,
+			       unsigned long len,
+			       const bool write)
+{
+	ssize_t ret;
+
+	if (!len)
+		return 0;
+
+	if (write) {
+		ret = copy_from_user(bb, w_buffer, len);
+		if (ret)
+			return -EFAULT;
+
+		ret = xe_eudebug_vm_access(vm, offset, bb, len, true);
+		if (ret <= 0)
+			return ret;
+
+		len = ret;
+	} else {
+		ret = xe_eudebug_vm_access(vm, offset, bb, len, false);
+		if (ret <= 0)
+			return ret;
+
+		len = ret;
+
+		ret = copy_to_user(r_buffer, bb, len);
+		if (ret)
+			return -EFAULT;
+	}
+
+	return len;
+}
+
+static ssize_t __xe_eudebug_vm_access(struct file *file,
+				      char __user *r_buffer,
+				      const char __user *w_buffer,
+				      size_t count, loff_t *__pos)
+{
+	struct vm_file *vmf = file->private_data;
+	struct xe_eudebug * const d = vmf->debugger;
+	struct xe_device * const xe = d->xe;
+	const bool write = !!w_buffer;
+	struct xe_vm *vm;
+	ssize_t copied = 0;
+	ssize_t bytes_left = count;
+	ssize_t ret;
+	unsigned long alloc_len;
+	loff_t pos = *__pos;
+	void *k_buffer;
+
+	if (XE_IOCTL_DBG(xe, write && r_buffer))
+		return -EINVAL;
+
+	vm = xe_eudebug_vm_get(d, vmf->vm_handle);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, vm != vmf->vm)) {
+		eu_warn(d, "vm_access(%s): vm handle mismatch vm_handle=%llu, flags=0x%llx, pos=%llu, count=%zu\n",
+			write ? "write" : "read",
+			vmf->vm_handle, vmf->flags, pos, count);
+		xe_vm_put(vm);
+		return -EINVAL;
+	}
+
+	if (!count) {
+		xe_vm_put(vm);
+		return 0;
+	}
+
+	alloc_len = min_t(unsigned long, ALIGN(count, PAGE_SIZE), 64 * SZ_1M);
+	do  {
+		k_buffer = vmalloc(alloc_len);
+		if (k_buffer)
+			break;
+
+		alloc_len >>= 1;
+	} while (alloc_len > PAGE_SIZE);
+
+	if (XE_IOCTL_DBG(xe, !k_buffer)) {
+		xe_vm_put(vm);
+		return -ENOMEM;
+	}
+
+	do {
+		const ssize_t len = min_t(ssize_t, bytes_left, alloc_len);
+
+		ret = __vm_read_write(vm, k_buffer,
+				      write ? NULL : r_buffer + copied,
+				      write ? w_buffer + copied : NULL,
+				      pos + copied,
+				      len,
+				      write);
+		if (ret <= 0)
+			break;
+
+		bytes_left -= ret;
+		copied += ret;
+	} while (bytes_left > 0);
+
+	vfree(k_buffer);
+	xe_vm_put(vm);
+
+	if (XE_WARN_ON(copied < 0))
+		copied = 0;
+
+	*__pos += copied;
+
+	return copied ?: ret;
+}
+
+static ssize_t xe_eudebug_vm_read(struct file *file,
+				  char __user *buffer,
+				  size_t count, loff_t *pos)
+{
+	return __xe_eudebug_vm_access(file, buffer, NULL, count, pos);
+}
+
+static ssize_t xe_eudebug_vm_write(struct file *file,
+				   const char __user *buffer,
+				   size_t count, loff_t *pos)
+{
+	return __xe_eudebug_vm_access(file, NULL, buffer, count, pos);
+}
+
+static int engine_rcu_flush(struct xe_eudebug *d,
+			    struct xe_hw_engine *hwe,
+			    unsigned int timeout_us)
+{
+	const struct xe_reg psmi_addr = RING_PSMI_CTL(hwe->mmio_base);
+	struct xe_gt *gt = hwe->gt;
+	unsigned int fw_ref;
+	u32 mask = RCU_ASYNC_FLUSH_AND_INVALIDATE_ALL;
+	u32 psmi_ctrl;
+	u32 id;
+	int ret;
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER)
+		id = 0;
+	else if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
+		id = hwe->instance + 1;
+	else
+		return -EINVAL;
+
+	if (id < 8)
+		mask |= id << RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT;
+	else
+		mask |= (id - 8) << RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT |
+			RCU_ASYNC_FLUSH_ENGINE_ID_DECODE1;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), hwe->domain);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	/* Prevent concurrent flushes */
+	mutex_lock(&d->hw.lock);
+	psmi_ctrl = xe_mmio_read32(&gt->mmio, psmi_addr);
+	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
+		xe_mmio_write32(&gt->mmio, psmi_addr, _MASKED_BIT_ENABLE(IDLE_MSG_DISABLE));
+
+	/* XXX: Timeout is per operation but in here we flush previous */
+	ret = xe_mmio_wait32(&gt->mmio, RCU_ASYNC_FLUSH,
+			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
+			     timeout_us, NULL, false);
+	if (ret)
+		goto out;
+
+	xe_mmio_write32(&gt->mmio, RCU_ASYNC_FLUSH, mask);
+
+	ret = xe_mmio_wait32(&gt->mmio, RCU_ASYNC_FLUSH,
+			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
+			     timeout_us, NULL, false);
+out:
+	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
+		xe_mmio_write32(&gt->mmio, psmi_addr, _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
+
+	mutex_unlock(&d->hw.lock);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	return ret;
+}
+
+static int xe_eudebug_vm_fsync(struct file *file, loff_t start, loff_t end, int datasync)
+{
+	struct vm_file *vmf = file->private_data;
+	struct xe_eudebug *d = vmf->debugger;
+	struct xe_gt *gt;
+	int gt_id;
+	int ret = -EINVAL;
+
+	eu_dbg(d, "vm_fsync: vm_handle=%llu, flags=0x%llx, start=%llu, end=%llu datasync=%d\n",
+	       vmf->vm_handle, vmf->flags, start, end, datasync);
+
+	for_each_gt(gt, d->xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id id;
+
+		/* XXX: vm open per engine? */
+		xe_eudebug_for_each_hw_engine(hwe, gt, id) {
+			ret = engine_rcu_flush(d, hwe, vmf->timeout_us);
+			if (ret)
+				break;
+		}
+	}
+
+	return ret;
+}
+
+static int xe_eudebug_vm_release(struct inode *inode, struct file *file)
+{
+	struct vm_file *vmf = file->private_data;
+	struct xe_eudebug *d = vmf->debugger;
+
+	eu_dbg(d, "vm_release: vm_handle=%llu, flags=0x%llx",
+	       vmf->vm_handle, vmf->flags);
+
+	xe_vm_put(vmf->vm);
+	drm_dev_put(&d->xe->drm);
+	xe_eudebug_put(d);
+
+	kfree(vmf);
+
+	return 0;
+}
+
+static const struct file_operations vm_fops = {
+	.owner   = THIS_MODULE,
+	.llseek  = generic_file_llseek,
+	.read    = xe_eudebug_vm_read,
+	.write   = xe_eudebug_vm_write,
+	.fsync   = xe_eudebug_vm_fsync,
+	.mmap    = NULL,
+	.release = xe_eudebug_vm_release,
+};
+
+long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
+{
+	struct drm_xe_eudebug_vm_open param;
+	struct xe_device * const xe = d->xe;
+	struct vm_file *vmf = NULL;
+	struct xe_vm *vm;
+	struct file *file;
+	long ret = 0;
+	int fd;
+
+	if (XE_IOCTL_DBG(xe, _IOC_SIZE(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) != sizeof(param)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) & _IOC_WRITE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, copy_from_user(&param, (void __user *)arg, sizeof(param))))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, param.flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
+
+	vm = xe_eudebug_vm_get(d, param.vm_handle);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	vmf = kzalloc(sizeof(*vmf), GFP_KERNEL);
+	if (XE_IOCTL_DBG(xe, !vmf)) {
+		ret = -ENOMEM;
+		goto out_vm_put;
+	}
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (XE_IOCTL_DBG(xe, fd < 0)) {
+		ret = fd;
+		goto out_free;
+	}
+
+	kref_get(&d->ref);
+	vmf->debugger = d;
+	vmf->vm = vm;
+	vmf->flags = param.flags;
+	vmf->vm_handle = param.vm_handle;
+	vmf->timeout_us = div64_u64(param.timeout_ns, 1000ull);
+
+	file = anon_inode_getfile("[xe_eudebug.vm]", &vm_fops, vmf, O_RDWR);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		XE_IOCTL_DBG(xe, ret);
+		file = NULL;
+		goto out_fd_put;
+	}
+
+	drm_dev_get(&xe->drm);
+
+	file->f_mode |= FMODE_PREAD | FMODE_PWRITE |
+		FMODE_READ | FMODE_WRITE | FMODE_LSEEK;
+
+	fd_install(fd, file);
+
+	eu_dbg(d, "vm_open: handle=%llu, flags=0x%llx, fd=%d",
+	       vmf->vm_handle, vmf->flags, fd);
+
+	XE_WARN_ON(ret);
+
+	return fd;
+
+out_fd_put:
+	put_unused_fd(fd);
+	xe_eudebug_put(d);
+out_free:
+	kfree(vmf);
+out_vm_put:
+	xe_vm_put(vm);
+
+	XE_WARN_ON(ret >= 0);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.h b/drivers/gpu/drm/xe/xe_eudebug_vm.h
new file mode 100644
index 000000000000..b3dc5618a5e6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_vm.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+struct xe_eudebug;
+
+long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg);
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index b363583cb1d6..139926a0f38c 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -17,6 +17,7 @@ extern "C" {
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack_event)
+#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x2, struct drm_xe_eudebug_vm_open)
 
 /**
  * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
@@ -164,6 +165,20 @@ struct drm_xe_eudebug_ack_event {
 	__u64 seqno;
 };
 
+struct drm_xe_eudebug_vm_open {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_handle: id of vm */
+	__u64 vm_handle;
+
+	/** @flags: flags */
+	__u64 flags;
+
+	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
+	__u64 timeout_ns;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

