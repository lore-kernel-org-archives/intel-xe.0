Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49069C624DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B9D10F683;
	Thu,  3 Sep 2026 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4hrHvh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62D10F66B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447666; x=1819983666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xs2srD/1a8h1frF6re3EpZrLYoe7l9S9wH/uH8v8PJ8=;
 b=S4hrHvh0aDMcB+OxFX4iS2bun2/Tj0Igd8qLiw9dlxS89tegAni4KUEj
 5JktSmOqE84CwmSQoUNofgusvQk2pcje5B7Eupn4yvLHNUUEQN4AKC2U3
 wCbNgH/mphOhHwawY1GacRIJ/ThcT7Z8Dh45NLeQPo6X7Kk82W0mpA215
 GwGbviXQB4TJMYmwIgC4cMClk8KpXCg02gPD7p+4MDByIhtvxih/X8FsM
 rXfhhqAXm2cXT9KD8Gzf6+dxCvLxbzBcH2wO9TojYfEnzwG3A7qhi5eqg
 rmKoVPObc2UYZj5Uzniz35OPYci/Aq+9xX02nbBBGKEDAfoudRDgbXW5g A==;
X-CSE-ConnectionGUID: UCAUrP1gTU+H2iQrGsNYAw==
X-CSE-MsgGUID: pq4VhVLhROaFYt8i/16xOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486742"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:01 -0700
X-CSE-ConnectionGUID: mpRCl3ORREmHq4MwCBdi+A==
X-CSE-MsgGUID: 3dXJFaPTTRitGy+XpqLa9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440922"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:56 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 12/27] drm/xe/eudebug: Add vm open/pread/pwrite
Date: Thu,  3 Sep 2026 17:59:36 +0300
Message-ID: <20260903145952.848051-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

The debugger needs access to the client's vm to read and write, for
example to inspect ISA/ELF and set up breakpoints.

Add an ioctl to open the target vm with the debugger client and
vm_handle, and hook up pread/pwrite support.

Open will take a timeout argument so that standard fsync
can be used for explicit flushing between cpu/gpu for
the target vm.

Implement this for bo-backed storage. userptr will
be done in the following patch.

v2: - checkpatch (Maciej)
    - 32bit fixes (Andrzej)
    - bo_vmap (Mika)
    - fix vm leak if can't allocate k_buffer (Mika)
    - assert vm write held for vma (Matthew)

v3: - fw ref, ttm_bo_access
    - timeout boundary check (Dominik)
    - don't try to copy to user on zero bytes (Mika)

v4: - offset as unsigned long (Thomas)
    - check XE_VMA_DESTROYED

v5: - drm_dev_put before releasing debugger (Mika)
v6: - stop flushing on first error (Mika)
v7: - deny access on debugger disconnect (Andrzej)
v8: - correct offset calc in ttm_bo_access (Sashiko)
    - overzealous warn removed (Sashiko)
    - check param.extensions (Sashiko)
    - avoid hitting assert (Sashiko)
    - fix detach race on open (Claude)
    - build assert on ioctl cmd (Claude)
    - reject >u32 on vm lookup (Claude)
    - allow smaller vmallocs before fail

Assisted-by: Claude:claude-opus-4-8
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst  |   6 +
 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  24 ++
 drivers/gpu/drm/xe/xe_eudebug.c      |  32 +-
 drivers/gpu/drm/xe/xe_eudebug.h      |  10 +
 drivers/gpu/drm/xe/xe_eudebug_vm.c   | 456 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h   |   8 +
 include/uapi/drm/xe_drm_eudebug.h    |  29 ++
 8 files changed, 565 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index db52945714f3..466d366c1e83 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -66,3 +66,9 @@ Resource Event Types
 
 .. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
    :identifiers: drm_xe_eudebug_event_vm_bind_ufence
+
+VM Access
+=========
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_vm_open
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 68dfab1a5c30..a37ab5e654aa 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -162,7 +162,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 48c515d91882..8056d007c23e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -616,6 +616,30 @@
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
index a1f07db6ad81..188a4c60513c 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
+#include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
@@ -222,7 +223,7 @@ xe_eudebug_resources_destroy(struct xe_eudebug *d)
 	}
 }
 
-static bool xe_eudebug_detached(struct xe_eudebug *d)
+bool xe_eudebug_detached(struct xe_eudebug *d)
 {
 	return !READ_ONCE(d->target.xef);
 }
@@ -712,6 +713,31 @@ static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
 	return ret;
 }
 
+static void *find_resource__unlocked(struct xe_eudebug_resource *r,
+				     u32 id)
+{
+	struct xe_eudebug_handle *h;
+
+	h = xa_load(&r->xa, id);
+
+	return h ? (void *)(uintptr_t)h->key : NULL;
+}
+
+struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 id)
+{
+	struct xe_eudebug_resource *r =
+		resource_from_type(d, XE_EUDEBUG_RES_TYPE_VM);
+	struct xe_vm *vm;
+
+	mutex_lock(&r->lock);
+	vm = find_resource__unlocked(r, id);
+	if (vm)
+		xe_vm_get(vm);
+	mutex_unlock(&r->lock);
+
+	return vm;
+}
+
 static struct drm_xe_eudebug_event *
 xe_eudebug_prepare_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
 			 u32 len)
@@ -1849,6 +1875,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_ack_event_ioctl(d, arg);
 		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_VM_OPEN:
+		ret = xe_eudebug_vm_open_ioctl(d, arg);
+		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 48608a061f0c..ea370dbfc0aa 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -18,6 +18,7 @@ struct xe_exec_queue;
 struct xe_vma;
 struct xe_vma_ops;
 struct xe_user_fence;
+struct xe_eudebug;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -42,6 +43,10 @@ struct xe_user_fence;
 
 #define xe_eudebug_assert(d, ...) xe_assert((d)->xe, ##__VA_ARGS__)
 
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		for_each_if(xe_hw_engine_has_eudebug(__hwe))
+
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
 			     struct drm_file *file);
@@ -54,12 +59,17 @@ void xe_eudebug_file_close(struct xe_file *xef);
 
 void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
+
+bool xe_eudebug_detached(struct xe_eudebug *d);
+
 int xe_eudebug_enable(struct xe_device *xe, bool enable);
 
 struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
 struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
+struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 vm_id);
+
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_eudebug_vm.c
new file mode 100644
index 000000000000..316fe29586b0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_vm.c
@@ -0,0 +1,456 @@
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
+				 const u64 offset_in_vma,
+				 void *buf, const size_t len, bool write)
+{
+	struct xe_bo *bo;
+	u64 bytes;
+
+	lockdep_assert_held_write(&xe_vma_vm(vma)->lock);
+
+	if (offset_in_vma >= xe_vma_size(vma))
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
+		const u64 bo_offset = xe_vma_bo_offset(vma) + offset_in_vma;
+		int ret;
+
+		ret = ttm_bo_access(&bo->ttm, bo_offset, buf, bytes, write);
+
+		xe_bo_put(bo);
+
+		return ret;
+	}
+
+	return -EINVAL;
+}
+
+static int xe_eudebug_vm_access(struct xe_vm *vm, const u64 offset,
+				void *buf, const size_t len, bool write)
+{
+	struct xe_vma *vma;
+	int ret;
+
+	down_write(&vm->lock);
+
+	if (offset >= vm->size || len > vm->size - offset) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	vma = xe_vm_find_overlapping_vma(vm, offset, len);
+	if (vma) {
+		u64 vma_local_offset;
+
+		/*
+		 * xe_vm_find_overlapping_vma() may return a VMA whose start is
+		 * below @offset when the VMA's range still overlaps
+		 * [offset, offset+len). Reject anything that doesn't actually
+		 * cover @offset itself.
+		 */
+		if (offset < xe_vma_start(vma) ||
+		    offset >= (xe_vma_start(vma) + xe_vma_size(vma))) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* Translate VM-space offset to VMA-local offset. */
+		vma_local_offset = offset - xe_vma_start(vma);
+		ret = xe_eudebug_vma_access(vma, vma_local_offset, buf, len, write);
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
+	u64 timeout_us;
+};
+
+static ssize_t __vm_read_write(struct xe_vm *vm,
+			       void *bb,
+			       char __user *r_buffer,
+			       const char __user *w_buffer,
+			       const u64 offset,
+			       size_t len,
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
+	ssize_t bytes_left;
+	ssize_t ret;
+	unsigned long alloc_len;
+	loff_t pos = *__pos;
+	void *k_buffer;
+
+	if (XE_IOCTL_DBG(d->xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
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
+	if (pos >= vm->size) {
+		xe_vm_put(vm);
+		return write ? -ENOSPC : 0;
+	}
+
+	count = min_t(u64, count, vm->size - pos);
+	bytes_left = count;
+
+	alloc_len = min_t(unsigned long, ALIGN(count, PAGE_SIZE), 64 * SZ_1M);
+	do  {
+		k_buffer = vmalloc(alloc_len);
+		if (k_buffer)
+			break;
+
+		alloc_len >>= 1;
+	} while (alloc_len >= PAGE_SIZE);
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
+				      (u64)(pos + copied),
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
+	mutex_lock(&d->xe->eudebug.lock);
+	psmi_ctrl = xe_mmio_read32(&gt->mmio, psmi_addr);
+	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
+		xe_mmio_write32(&gt->mmio, psmi_addr,
+				REG_MASKED_FIELD_ENABLE(IDLE_MSG_DISABLE));
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
+		xe_mmio_write32(&gt->mmio, psmi_addr,
+				REG_MASKED_FIELD_DISABLE(IDLE_MSG_DISABLE));
+
+	mutex_unlock(&d->xe->eudebug.lock);
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
+	if (XE_IOCTL_DBG(d->xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
+
+	for_each_gt(gt, d->xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id id;
+
+		/* XXX: vm open per engine? */
+		xe_eudebug_for_each_hw_engine(hwe, gt, id) {
+			ret = engine_rcu_flush(d, hwe, vmf->timeout_us);
+			if (ret)
+				goto out;
+		}
+	}
+out:
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
+	BUILD_BUG_ON(_IOC_SIZE(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) != sizeof(param));
+	BUILD_BUG_ON(!(_IOC_DIR(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) & _IOC_WRITE));
+
+	if (XE_IOCTL_DBG(xe, copy_from_user(&param, (void __user *)arg, sizeof(param))))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, param.flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, param.extensions))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, param.vm_handle > U32_MAX))
+		return -EINVAL;
+
+	/*
+	 * Resolve the handle while holding the lock that the detach takes.
+	 * The map keys vms by pointer without holding a reference, and a
+	 * client closing its fd tears its vms down without removing their
+	 * handles, so a lookup that races the close would otherwise return
+	 * a pointer to freed memory.
+	 */
+	scoped_guard(mutex, &xe->eudebug.lock) {
+		if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
+			return -ENOTCONN;
+
+		vm = xe_eudebug_vm_get(d, param.vm_handle);
+	}
+
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	vmf = kzalloc_obj(*vmf, GFP_KERNEL);
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
+	eu_dbg(d, "vm_open: handle=%llu, flags=0x%llx, fd=%d",
+	       vmf->vm_handle, vmf->flags, fd);
+
+	drm_dev_get(&xe->drm);
+
+	file->f_mode |= FMODE_PREAD | FMODE_PWRITE |
+		FMODE_READ | FMODE_WRITE | FMODE_LSEEK;
+
+	fd_install(fd, file);
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
index b99ac815a7c3..12e6197230db 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -33,6 +33,7 @@ extern "C" {
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack)
+#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x2, struct drm_xe_eudebug_vm_open)
 
 /**
  * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
@@ -267,6 +268,34 @@ struct drm_xe_eudebug_ack {
 	__u64 reserved;
 };
 
+/**
+ * struct drm_xe_eudebug_vm_open - Open a target vm
+ *
+ * Open target VM for reading and writing with DRM_XE_EUDEBUG_IOCTL_VM_OPEN.
+ *
+ * File descriptor is returned which can be used with pread and pwrite
+ * to inspect and modify the target VM.
+ *
+ * Multiple operations can be synced with calling fsync(fd). If
+ * timeout_ns was specified, the fsync will timeout if the
+ * VM can't be guaranteed to be in sync. Caller should re-read the
+ * state with pread again.
+ *
+ */
+struct drm_xe_eudebug_vm_open {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_handle: handle of vm to be accessed */
+	__u64 vm_handle;
+
+	/** @flags: flags, must be zero */
+	__u64 flags;
+
+	/** @timeout_ns: Timeout value in nanoseconds */
+	__u64 timeout_ns;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.53.0

