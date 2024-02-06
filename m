Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2EC48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 14:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E97710EE24;
	Tue,  6 Feb 2024 14:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="SVH/xQuY";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBD510EDF9
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 14:18:36 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1707229107; bh=SoSscVd+Kof9Z+4F1k89xLy+0ydY18FFacR2iZcmhvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SVH/xQuYBfh0K/E1zeFhBOuy2zkXE7rc0Xpl1tuzHon15JXrCFphm89Zx/HooSRxx
 kaa7wiEVOj4zCD3T3dFlLcY1CRlh/+PMvJ8Nt83b1mp99YBQ8LJ0fE848AEnugtaN7
 4Swwcq/LD8ECmwBCsPgZNLD/uu59fsgtpl3bN/Y36y1DaGgbjh6o1hBH9u8uYl5jJj
 7DLG8an5qJ/eUmqfDZVho7BKGkcRv295CfGlAOlIatsRbOKB5YFmhtwr9KSoQHHJDa
 wSBzWrym+SBvQVdGn3bJdyobu4WlOVgmZQNxXLvQ5LHByRc5uLRx3t68XmYXt5+8l0
 OJ3rMFqNu1JfA==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 416EIMcY265012
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 6 Feb 2024 16:18:22 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 416EIMsq265011; 
 Tue, 6 Feb 2024 16:18:22 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: mhaimovski@habana.ai, lucas.demarchi@intel.com, matthew.brost@intel.com,
 Bharat Jauhari <bjauhari@habana.ai>
Subject: [PATCH 2/2] drm/xe: support to export VM as fd
Date: Tue,  6 Feb 2024 16:18:20 +0200
Message-Id: <20240206141820.264977-3-mhaimovski@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206141820.264977-1-mhaimovski@habana.ai>
References: <20240206141820.264977-1-mhaimovski@habana.ai>
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

From: Bharat Jauhari <bjauhari@habana.ai>

In some situations, drivers and applications need to share a VM.
Currently a VM is exposed to the user as an integer. This integer
has no meaning outside the context/application created it.
This commit adds support to export VM ID as an FD which can be shared.
User is allowed to export a VM only once. Consecutive calls to export
the same VM will return with an error.

Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.c   |   1 +
 drivers/gpu/drm/xe/xe_vm.c       | 121 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h |  28 +++++++
 include/uapi/drm/xe_drm.h        |  27 +++++++
 5 files changed, 179 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e75bca060f473..14773afd3ab1c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -175,6 +175,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_EXPORT, xe_vm_export_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 78952a9a15827..ce8aaafdc1045 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -17,6 +17,8 @@
 #include <linux/kthread.h>
 #include <linux/mm.h>
 #include <linux/swap.h>
+#include <linux/anon_inodes.h>
+#include <linux/file.h>
 
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -1936,6 +1938,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 		err = -ENOENT;
 	else if (XE_IOCTL_DBG(xe, vm->preempt.num_exec_queues))
 		err = -EBUSY;
+	else if (XE_IOCTL_DBG(xe, xe_vm_scale_in_use(vm)))
+		err = -EBUSY;
 	else
 		xa_erase(&xef->vm.xa, args->vm_id);
 	mutex_unlock(&xef->vm.lock);
@@ -3260,3 +3264,120 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
+
+static int xe_vm_file_release(struct inode *inode, struct file *file)
+{
+	struct xe_vm_file *vm_file = file->private_data;
+	struct xe_vm *vm = vm_file->vm;
+	struct xe_file *xef = vm_file->xef;
+
+	down_write(&vm->lock);
+	vm_file->vm->scale_info.exported_fd = -1;
+	vm_file->vm->scale_info.exported_vm = false;
+	up_write(&vm->lock);
+
+	xe_vm_put(vm_file->vm);
+	xe_file_put(xef);
+
+	kfree(vm_file);
+
+	return 0;
+}
+
+static const struct file_operations xe_vm_file_fops = {
+	.release = xe_vm_file_release,
+};
+
+static int xe_vm_get_fd(struct xe_file *xef, struct xe_vm *vm, u32 vm_id, int *p_fd)
+{
+	struct xe_vm_file *vm_file;
+	struct file *file;
+	int fd, err;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		err = fd;
+		goto exit;
+	}
+
+	vm_file = kzalloc(sizeof(struct xe_vm_file), GFP_KERNEL);
+	if (!vm_file) {
+		err = -ENOMEM;
+		goto alloc_fail;
+	}
+
+	if (!xe_file_get(xef)) {
+		err = -ENOENT;
+		goto free_vm_file;
+	}
+
+	xe_vm_get(vm);
+
+	vm_file->xef = xef;
+	vm_file->vm = vm;
+	vm_file->vm_id = vm_id;
+
+	file = anon_inode_getfile("xe_vm_file", &xe_vm_file_fops, vm_file, 0);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_put;
+	}
+
+	fd_install(fd, file);
+
+	*p_fd = fd;
+	vm->scale_info.exported_fd = fd;
+	vm->scale_info.exported_vm = true;
+
+	return 0;
+
+err_put:
+	xe_vm_put(vm);
+	xe_file_put(xef);
+free_vm_file:
+	kfree(vm_file);
+alloc_fail:
+	put_unused_fd(fd);
+exit:
+	return err;
+}
+
+int xe_vm_export_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_export *args = data;
+	struct xe_vm *vm;
+	int err, fd = -1;
+
+	if (XE_IOCTL_DBG(xe, args->pad) || XE_IOCTL_DBG(xe, args->pad1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto release_vm_lock;
+	}
+
+	if (XE_IOCTL_DBG(xe, xe_vm_scale_in_use(vm))) {
+		err = -EEXIST;
+		goto release_vm_lock;
+	}
+
+	err = xe_vm_get_fd(xef, vm, args->vm_id, &fd);
+	args->fd = fd;
+
+release_vm_lock:
+	up_write(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index df4a82e960ff0..e1b93b872d83b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -180,6 +180,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
+int xe_vm_export_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1fec66ae2eb2d..7d1f91e16c40d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -119,6 +119,8 @@ struct xe_userptr_vma {
 
 struct xe_device;
 
+#define xe_vm_scale_in_use(vm) ((vm)->scale_info.exported_vm || (vm)->scale_info.registered_vm)
+
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
@@ -281,8 +283,19 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	/** @scale_info: aux/scale information related to this VM */
+	struct {
+		/** @exported FD: fd exported to the user for this VM */
+		int exported_fd;
+		/** @exported_vm: VM had been exported via the vm_export ioctl */
+		bool exported_vm;
+		/** @registered_vm: Indicates the exported-VM is registered with the XE driver */
+		bool registered_vm;
+	} scale_info;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
@@ -374,4 +387,19 @@ struct xe_vma_op {
 		struct xe_vma_op_prefetch prefetch;
 	};
 };
+
+/**
+ * struct xe_vm_file - VM file private data
+ *
+ * This structure stores data to check the sanity of the VM id stored.
+ */
+struct xe_vm_file {
+	/** @xef: file handle for XE driver */
+	struct xe_file *xef;
+	/** @vm: VM object which belongs to @xef object */
+	struct xe_vm *vm;
+	/** @vm_id: VM id */
+	u32 vm_id;
+};
+
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9c..d69bf015324e4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -80,6 +80,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
+ *  - &DRM_IOCTL_XE_VM_EXPORT
  */
 
 /*
@@ -100,6 +101,7 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_VM_EXPORT		0x0b
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +115,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_VM_EXPORT			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_EXPORT, struct drm_xe_vm_export)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1339,6 +1342,30 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_export - Export VM ID as an FD which can be shared by another driver.
+ *
+ * As part of networking support, application needs to work with both XE and IB driver
+ * sharing VM. VM ID by itself is not unique therefore we export the VM ID as a FD which
+ * can be shared.
+ */
+struct drm_xe_vm_export {
+	/** @vm_id: VM ID allocated during DRM_IOCTL_XE_VM_CREATE */
+	__u32 vm_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @fd: Returned FD */
+	__s32 fd;
+
+	/** @pad1: MBZ */
+	__u32 pad1;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

