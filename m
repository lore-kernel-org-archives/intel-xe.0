Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5181AC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACCE10E2E6;
	Mon,  6 Nov 2023 11:22:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5010E2E6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269765; x=1730805765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HqHs1pn+hBCFVTUJcC/T6ycvi2r7Aqs47EGZO7GxZYQ=;
 b=TEYtzgl35EXNo2cX0GNyWxjumQjDYjAkLiOeCzp9ggKYfQiOp7ZZXKr4
 7Q+EGKilsUEWkLMIQhdJE13Ftmq05d/mQpgoO4WZJPgHFhoJSS/b/Uhlp
 CLV/Agf0mYx9Tm1isMjyu6vrmQ3mGEjiN8ufDUTi+8leNJMfko2zruu2q
 mC92msaiyV65rk7Ox9/Zg6Q78wCl+D/I7nS4G/DdFVPND59Xb+pskuc2T
 JQ1DoQqj3nm4AitM/uYXl5SMH3nPQyxsc5u7NTjgywbivpsDij4Q9Nc51
 NK3VWzUfdQ9pElRmSRwr163oGLbG7Q/8dg1YSXtlmEqLPU/15OM+ZDsEU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646892"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646892"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411766"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411766"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:43 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:45 +0200
Message-Id: <20231106111845.2333093-26-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 25/25] drm/xe/eudebug: vm open/pread/pwrite
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

TODO: userptr
TODO: flushes per engine

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  24 ++
 drivers/gpu/drm/xe/xe_eudebug.c      | 384 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h      |   5 +
 include/uapi/drm/xe_drm_tmp.h        |  18 ++
 4 files changed, 431 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8c4163004074..28d10e5a0a1b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -414,6 +414,30 @@
 #define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
 #define   RCU_DEBUG_1_CONTEXT_ACTIVE		REG_BIT(0)
 
+#define RCU_ASYNC_FLUSH	      			XE_REG(0x149fc)
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
+	RCU_ASYNC_INVALIDATE_INSTRUCTION_CACHE )
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 57a3cf59aaba..b0e6f30f15d2 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -10,8 +10,10 @@
 #include <linux/anon_inodes.h>
 #include <linux/poll.h>
 #include <linux/delay.h>
+#include <linux/file.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_drv.h>
 #include <uapi/drm/xe_drm_tmp.h>
 
 #include "regs/xe_engine_regs.h"
@@ -525,6 +527,17 @@ static struct xe_file *find_client(struct xe_eudebug *d, const u32 id)
 	return NULL;
 }
 
+static struct xe_vm *find_vm(struct xe_eudebug *d, const u32 id)
+{
+	struct xe_eudebug_handle *h;
+
+	h = find_resource(d->res, XE_EUDEBUG_RES_TYPE_VM, id);
+	if (h)
+		return (void *)h->key;
+
+	return NULL;
+}
+
 static int xe_eudebug_add_handle(struct xe_eudebug *d,
 				 int type,
 				 void *p)
@@ -844,6 +857,8 @@ static long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
 	return ret;
 }
 
+static long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg);
+
 static long xe_eudebug_ioctl(struct file *file,
 			     unsigned int cmd,
 			     unsigned long arg)
@@ -863,6 +878,11 @@ static long xe_eudebug_ioctl(struct file *file,
 		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
 		break;
 
+	case DRM_XE_EUDEBUG_IOCTL_VM_OPEN:
+		ret = xe_eudebug_vm_open_ioctl(d, arg);
+		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
+		break;
+
 	default:
 		ret = -EINVAL;
 	}
@@ -2166,3 +2186,367 @@ static void discovery_work_fn(struct work_struct *work)
 
 	complete_all(&d->discovery);
 }
+
+static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
+				 void *buf, u64 len, bool write)
+{
+	struct xe_device * const xe = xe_vma_vm(vma)->xe;
+	struct xe_bo *bo = NULL;
+	int ret;
+
+	if (offset + len > xe_vma_size(vma))
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	bo = xe_vma_bo(vma);
+
+	if (bo) {
+		struct iosys_map src;
+
+		dma_resv_lock(bo->ttm.base.resv, NULL);
+
+		ret = ttm_bo_vmap(&bo->ttm, &src);
+		if (!ret) {
+			if (write)
+				xe_map_memcpy_to(xe, &src, offset, buf, len);
+			else
+				xe_map_memcpy_from(xe, buf, &src, offset, len);
+
+			ttm_bo_vunmap(&bo->ttm, &src);
+		}
+		dma_resv_unlock(bo->ttm.base.resv);
+	} else {
+		/* XXX: Userptr */
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
+			 void *buf, u64 len, bool write)
+{
+	struct xe_vma *vma;
+	int ret;
+
+	down_write(&vm->lock);
+
+	vma = xe_vm_find_overlapping_vma(vm, offset, len);
+	if (vma) {
+		offset -= xe_vma_start(vma);
+		ret = xe_eudebug_vma_access(vma, offset, buf, len, write);
+	} else {
+		ret = -EINVAL;
+	}
+
+	up_write(&vm->lock);
+
+	return ret;
+}
+
+struct vm_file {
+	struct xe_eudebug *debugger;
+	struct xe_vm *vm;
+	u64 flags;
+	u64 client_id;
+	u64 vm_handle;
+	u64 timeout_ns;
+};
+
+static ssize_t xe_eudebug_vm_read(struct file *file,
+				  char __user *buffer,
+				  size_t count, loff_t *pos)
+{
+	struct vm_file *vmf = file->private_data;
+	struct xe_eudebug *d = vmf->debugger;
+	struct xe_vm *res_vm;
+	void *k_buffer;
+	int ret;
+
+	res_vm = find_vm(d, vmf->vm_handle);
+	if (!res_vm)
+		return 0;
+
+	if (res_vm != vmf->vm) {
+		eu_warn(d, "vm_read: vm handle mismatch client_handle=%llu, "
+			"vm_handle=%llu, flags=0x%llx, "
+			"pos=%llu, count=%lu\n",
+			vmf->client_id, vmf->vm_handle, vmf->flags, *pos, count);
+		return 0;
+	}
+
+	k_buffer = kzalloc(count, GFP_KERNEL);
+	if (!k_buffer)
+		return -ENOMEM;
+
+	ret = xe_eudebug_vm_access(vmf->vm, *pos, k_buffer, count, false);
+	if (!ret)
+		ret = copy_to_user(buffer, k_buffer, count);
+
+	kfree(k_buffer);
+
+	eu_dbg(d, "vm_read: client_handle=%llu, vm_handle=%llu, flags=0x%llx, "
+	       "pos=%llu, count=%lu, ret=%d\n",
+	       vmf->client_id, vmf->vm_handle, vmf->flags, *pos, count, ret);
+
+	return ret ?: count;
+}
+
+static ssize_t xe_eudebug_vm_write(struct file *file,
+				   const char __user *buffer,
+				   size_t count, loff_t *pos)
+{
+	struct vm_file *vmf = file->private_data;
+	struct xe_eudebug *d = vmf->debugger;
+	struct xe_vm *res_vm;
+	void *k_buffer;
+	int ret;
+
+	res_vm = find_vm(d, vmf->vm_handle);
+	if (!res_vm)
+		return 0;
+
+	if (res_vm != vmf->vm) {
+		eu_warn(d, "vm_write: vm handle mismatch client_handle=%llu, "
+			"vm_handle=%llu, flags=0x%llx, "
+			"pos=%llu, count=%lu\n",
+			vmf->client_id, vmf->vm_handle, vmf->flags, *pos, count);
+		return 0;
+	}
+
+	k_buffer = kzalloc(count, GFP_KERNEL);
+	if (!k_buffer)
+		return -ENOMEM;
+
+	ret = copy_from_user(k_buffer, buffer, count);
+	if (!ret)
+		ret = xe_eudebug_vm_access(vmf->vm, *pos, k_buffer, count, true);
+
+	kfree(k_buffer);
+
+	eu_dbg(d, "vm_write: client_handle=%llu, vm_handle=%llu, flags=0x%llx, "
+	       "pos=%llu, count=%lu, ret=%d\n",
+	       vmf->client_id, vmf->vm_handle, vmf->flags, *pos, count, ret);
+
+	return ret ?: count;
+}
+
+static int engine_rcu_flush(struct xe_eudebug *d,
+			    struct xe_hw_engine *hwe,
+			    unsigned int timeout_us)
+{
+	const struct xe_reg psmi_addr = RING_PSMI_CTL(hwe->mmio_base);
+	struct xe_gt *gt = hwe->gt;
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
+	ret = xe_force_wake_get(gt_to_fw(gt), hwe->domain);
+	if (ret)
+		return ret;
+
+	/* Prevent concurrent flushes */
+	mutex_lock(&d->eu_lock);
+	psmi_ctrl = xe_mmio_read32(gt, psmi_addr);
+	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
+		xe_mmio_write32(gt, psmi_addr,_MASKED_BIT_ENABLE(IDLE_MSG_DISABLE));
+
+	ret = xe_mmio_wait32(gt, RCU_ASYNC_FLUSH,
+			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
+			     timeout_us, NULL, false);
+	if (ret)
+		goto out;
+
+	xe_mmio_write32(gt, RCU_ASYNC_FLUSH, mask);
+
+	ret = xe_mmio_wait32(gt, RCU_ASYNC_FLUSH,
+			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
+			     timeout_us, NULL, false);
+out:
+	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
+		xe_mmio_write32(gt, psmi_addr, _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
+
+	mutex_unlock(&d->eu_lock);
+	xe_force_wake_put(gt_to_fw(gt), hwe->domain);
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
+	eu_dbg(d, "vm_fsync: client_handle=%llu, vm_handle=%llu, flags=0x%llx, "
+	       "start=%llu, end=%llu datasync=%d\n",
+	       vmf->client_id, vmf->vm_handle, vmf->flags, start, end, datasync);
+
+	for_each_gt(gt, d->xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id id;
+
+		/* XXX: vm open per engine? */
+		for_each_hw_engine(hwe, gt, id) {
+			if (hwe->class != XE_ENGINE_CLASS_RENDER &&
+			    hwe->class != XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			ret = engine_rcu_flush(d, hwe, vmf->timeout_ns * 1000ull);
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
+	drm_dev_get(&d->xe->drm);
+	xe_vm_put(vmf->vm);
+	xe_eudebug_put(d);
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
+	struct xe_eudebug *d_ref = NULL;
+	struct vm_file *vmf = NULL;
+	struct xe_file *xef;
+	struct xe_vm *vm;
+	struct file *file;
+	long ret = 0;
+	int fd;
+
+	if (_IOC_SIZE(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) != sizeof(param))
+		return -EINVAL;
+
+	if (!(_IOC_DIR(DRM_XE_EUDEBUG_IOCTL_VM_OPEN) & _IOC_WRITE))
+		return -EINVAL;
+
+	if (copy_from_user(&param, (void __user *)arg, sizeof(param)))
+		return -EFAULT;
+
+	if (param.flags)
+		return -EINVAL;
+
+	if (xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	vm = NULL;
+	mutex_lock(&d->xe->clients.lock);
+	xef = find_client(d, param.client_handle);
+	if (!xef) {
+		mutex_unlock(&d->xe->clients.lock);
+		return -EINVAL;
+	}
+
+	d_ref = xe_eudebug_get(xef);
+	if (!d_ref) {
+		mutex_unlock(&d->xe->clients.lock);
+		return -EINVAL;
+	}
+
+	mutex_lock(&xef->vm.lock);
+	vm = find_vm(d, param.vm_handle);
+	if (vm)
+		xe_vm_get(vm);
+	mutex_unlock(&xef->vm.lock);
+	mutex_unlock(&d->xe->clients.lock);
+
+	XE_WARN_ON(d != d_ref);
+
+	if (!vm) {
+		ret = -EINVAL;
+		goto out_eudebug_put;
+	}
+
+	vmf = kmalloc(sizeof(*vmf), GFP_KERNEL);
+	if (!vmf) {
+		ret = -ENOMEM;
+		goto out_vm_put;
+	}
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto out_free;
+	}
+
+	vmf->debugger = d_ref;
+	vmf->vm = vm;
+	vmf->flags = param.flags;
+	vmf->client_id = param.client_handle;
+	vmf->vm_handle = param.vm_handle;
+	vmf->timeout_ns = param.timeout_ns;
+
+	file = anon_inode_getfile("[xe_eudebug.vm]", &vm_fops, vmf, O_RDWR);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_file_put;
+	}
+
+	drm_dev_get(&d->xe->drm);
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
+	return fd;
+
+out_file_put:
+	put_unused_fd(fd);
+out_free:
+	kfree(vmf);
+out_vm_put:
+	xe_vm_put(vm);
+out_eudebug_put:
+	xe_eudebug_put(d_ref);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 0f5e04603c9d..79ac6c38d123 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -5,6 +5,8 @@
 
 #ifndef _XE_EUDEBUG_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
 struct xe_device;
@@ -13,6 +15,7 @@ struct xe_vm;
 struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
+struct xe_vma;
 
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
@@ -34,4 +37,6 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 void xe_eudebug_vm_bind(struct xe_file *xef, struct xe_vm *vm, struct xe_vma *vma);
 void xe_eudebug_vm_unbind(struct xe_file *xef, struct xe_vm *vm, struct xe_vma *vma);
 
+int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
+			 void *buf, u64 len, bool write);
 #endif
diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index 093884b70ca6..906bb0ef2d4a 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -22,6 +22,7 @@ extern "C" {
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
+#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -147,6 +148,23 @@ struct drm_xe_eudebug_eu_control {
 	__u64 bitmask_ptr;
 } __attribute__((packed));
 
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
2.34.1

