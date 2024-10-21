Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D636AD0E6D9
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9435010E471;
	Mon, 21 Oct 2024 09:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGpCh5zR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42A10E471
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504786; x=1761040786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xbZQQ/3taVe8AnT2A41O5bKoU2Op7EWaTUK85/r25w4=;
 b=JGpCh5zR6sirlelHVEeCCrMFSIuqBede+95WABGU701T7yeRHarn9PZ8
 o7tn/xPeuk/QaiGySq8ItnC7rBD9c6PF1dyQSfpns3oN5+oDlzNA/zq9M
 kygdhYNbuN8o+W6BqiZcNLGQXbF4sY1RgS1B5vOGnmPlwbcmxnJtkutxN
 yliFASGrCkPZnRoIm79P5okyxuU/iRdNoCHN7r4zYkYEQVGvUnJla/zSq
 7DPLeZ35gS+0U1yyiln/7J9e6Bj+BUVD1gYwF5eyXrqCR9uDt5MtPxM+H
 bKSK5cdfU5H/vb1Zum/zus6rnPpDJRcgZudFBhVCW563lhqFUxCG3ujep w==;
X-CSE-ConnectionGUID: pZmQPSKjQUalpJ/1tmCt6A==
X-CSE-MsgGUID: uHMUvr9VT86wdqYGAOsVVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350816"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:46 -0700
X-CSE-ConnectionGUID: yUgR9Zw/QMWbWFoQoSUPnw==
X-CSE-MsgGUID: fet3GOOQTuiT/jDhKJCmHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546123"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:42 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 11/19] drm/xe/eudebug: vm open/pread/pwrite
Date: Mon, 21 Oct 2024 12:58:50 +0300
Message-ID: <20241021095904.439555-12-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

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

v3: update to use changed xe_force_wake_get() failure handling (G.G.)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  24 ++
 drivers/gpu/drm/xe/xe_eudebug.c      | 481 +++++++++++++++++++++++++++
 include/uapi/drm/xe_drm_eudebug.h    |  18 +
 3 files changed, 523 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 20fbb13ddf7a..0e298d2fc93f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -549,6 +549,30 @@
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
 #define RCU_DEBUG_1				XE_REG(0x14a00)
 #define   RCU_DEBUG_1_ENGINE_STATUS		REG_GENMASK(2, 0)
 #define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index d53060afda68..309358b575d6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -5,9 +5,12 @@
 
 #include <linux/anon_inodes.h>
 #include <linux/delay.h>
+#include <linux/file.h>
 #include <linux/poll.h>
 #include <linux/uaccess.h>
+#include <linux/vmalloc.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -16,6 +19,7 @@
 #include "regs/xe_engine_regs.h"
 
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
@@ -1219,6 +1223,8 @@ static long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
 	return ret;
 }
 
+static long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg);
+
 static long xe_eudebug_ioctl(struct file *file,
 			     unsigned int cmd,
 			     unsigned long arg)
@@ -1243,6 +1249,11 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
 		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_VM_OPEN:
+		ret = xe_eudebug_vm_open_ioctl(d, arg);
+		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
+		break;
+
 	default:
 		ret = -EINVAL;
 	}
@@ -2945,3 +2956,473 @@ void xe_eudebug_ufence_fini(struct xe_user_fence *ufence)
 	xe_eudebug_put(ufence->eudebug.debugger);
 	ufence->eudebug.debugger = NULL;
 }
+
+static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
+				    void *buf, u64 len, bool write)
+{
+	struct xe_device * const xe = xe_bo_device(bo);
+	int ret;
+	u32 flags_orig;
+
+	/* XXX: require pin?. Assert bo->vm held */
+	ret = xe_bo_lock(bo, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * XXX: we want to use xe_bo_vmap but it insist that userspace
+	 * has provided it's need for CPU access. But that is the client
+	 * and we are the debugger. So we promote temporarily with
+	 * flag to allow xe_bo_vmap to work in our case even if the client
+	 * did not need cpu map.
+	 *
+	 * XXX: Fix this by adding extra flags to xe_bo_vmap?
+	 */
+	flags_orig = bo->flags;
+	bo->flags |= XE_BO_FLAG_NEEDS_CPU_ACCESS;
+
+	ret = xe_bo_vmap(bo);
+	if (!ret) {
+		if (write)
+			xe_map_memcpy_to(xe, &bo->vmap, offset, buf, len);
+		else
+			xe_map_memcpy_from(xe, buf, &bo->vmap, offset, len);
+
+		xe_bo_vunmap(bo);
+
+		ret = len;
+	}
+	bo->flags = flags_orig;
+
+	xe_bo_unlock(bo);
+
+	return ret;
+}
+
+static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
+				 void *buf, u64 len, bool write)
+{
+	struct xe_bo *bo;
+	u64 bytes;
+
+	lockdep_assert_held_write(&xe_vma_vm(vma)->lock);
+
+	if (XE_WARN_ON(offset >= xe_vma_size(vma)))
+		return -EINVAL;
+
+	bytes = min_t(u64, len, xe_vma_size(vma) - offset);
+	if (!bytes)
+		return 0;
+
+	bo = xe_bo_get(xe_vma_bo(vma));
+	if (bo) {
+		int ret;
+
+		ret = xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
+		xe_bo_put(bo);
+
+		return ret;
+	}
+
+	return -EINVAL;
+}
+
+static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
+				void *buf, u64 len, bool write)
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
+	struct xe_file *xef;
+	struct xe_vm *vm;
+	u64 flags;
+	u64 client_id;
+	u64 vm_handle;
+	u64 timeout_ns;
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
+		if (ret < 0)
+			return ret;
+
+		len = ret;
+	} else {
+		ret = xe_eudebug_vm_access(vm, offset, bb, len, false);
+		if (ret < 0)
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
+static struct xe_vm *find_vm_get(struct xe_eudebug *d, const u32 id)
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
+	vm = find_vm_get(d, vmf->vm_handle);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, vm != vmf->vm)) {
+		eu_warn(d, "vm_access(%s): vm handle mismatch client_handle=%llu, vm_handle=%llu, flags=0x%llx, pos=%llu, count=%zu\n",
+			write ? "write" : "read",
+			vmf->client_id, vmf->vm_handle, vmf->flags, pos, count);
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
+	u32 mask = RCU_ASYNC_FLUSH_AND_INVALIDATE_ALL;
+	unsigned int fw_ref;
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
+	mutex_lock(&d->eu_lock);
+	psmi_ctrl = xe_mmio_read32(&gt->mmio, psmi_addr);
+	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
+		xe_mmio_write32(&gt->mmio, psmi_addr, _MASKED_BIT_ENABLE(IDLE_MSG_DISABLE));
+
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
+	mutex_unlock(&d->eu_lock);
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
+	eu_dbg(d, "vm_fsync: client_handle=%llu, vm_handle=%llu, flags=0x%llx, start=%llu, end=%llu datasync=%d\n",
+	       vmf->client_id, vmf->vm_handle, vmf->flags, start, end, datasync);
+
+	for_each_gt(gt, d->xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id id;
+
+		/* XXX: vm open per engine? */
+		for_each_hw_engine(hwe, gt, id) {
+			u64 timeout_us;
+
+			if (hwe->class != XE_ENGINE_CLASS_RENDER &&
+			    hwe->class != XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			timeout_us = div64_u64(vmf->timeout_ns, 1000ull);
+			ret = engine_rcu_flush(d, hwe, timeout_us);
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
+	eu_dbg(d, "vm_release: client_handle=%llu, vm_handle=%llu, flags=0x%llx",
+	       vmf->client_id, vmf->vm_handle, vmf->flags);
+
+	xe_vm_put(vmf->vm);
+	xe_file_put(vmf->xef);
+	xe_eudebug_put(d);
+	drm_dev_put(&d->xe->drm);
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
+static long
+xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
+{
+	struct drm_xe_eudebug_vm_open param;
+	struct xe_device * const xe = d->xe;
+	struct vm_file *vmf = NULL;
+	struct xe_file *xef;
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
+	xef = find_client_get(d, param.client_handle);
+	if (xef)
+		vm = find_vm_get(d, param.vm_handle);
+	else
+		vm = NULL;
+
+	if (XE_IOCTL_DBG(xe, !xef))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !vm)) {
+		ret = -EINVAL;
+		goto out_file_put;
+	}
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
+	vmf->xef = xef;
+	vmf->flags = param.flags;
+	vmf->client_id = param.client_handle;
+	vmf->vm_handle = param.vm_handle;
+	vmf->timeout_ns = param.timeout_ns;
+
+	file = anon_inode_getfile("[xe_eudebug.vm]", &vm_fops, vmf, O_RDWR);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		XE_IOCTL_DBG(xe, ret);
+		file = NULL;
+		goto out_fd_put;
+	}
+
+	file->f_mode |= FMODE_PREAD | FMODE_PWRITE |
+		FMODE_READ | FMODE_WRITE | FMODE_LSEEK;
+
+	fd_install(fd, file);
+
+	eu_dbg(d, "vm_open: client_handle=%llu, handle=%llu, flags=0x%llx, fd=%d",
+	       vmf->client_id, vmf->vm_handle, vmf->flags, fd);
+
+	XE_WARN_ON(ret);
+
+	drm_dev_get(&xe->drm);
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
+out_file_put:
+	xe_file_put(xef);
+
+	XE_WARN_ON(ret >= 0);
+
+	return ret;
+}
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index b2f6038ccc59..9917280400d6 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -18,6 +18,7 @@ extern "C" {
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
+#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -170,6 +171,23 @@ struct drm_xe_eudebug_ack_event {
 	__u64 seqno;
 };
 
+struct drm_xe_eudebug_vm_open {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @client_handle: id of client */
+	__u64 client_handle;
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
2.46.1

