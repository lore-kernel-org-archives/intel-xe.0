Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA88BD116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66310E64C;
	Tue,  2 Dec 2025 13:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5shpP1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9794D10E64C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683599; x=1796219599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbeRnSC2HZCE7FLCRuj3erNYU+XDRyqyGO198m78VKQ=;
 b=A5shpP1jKTnSTc5QYAexl+L/a6mtc/fDDHE5Ecu6eioBgCRS19qbIhhP
 9A4xfiFZg3EREaWlreF1pgjduev2kY9Rx183CFcnkKRFIjTIMUDuAYXiH
 Vogo6q4LM0H0jTAn3rU7Ca9nckJ6lY4FLLZQtzyOUKJ113Va8FtF0DCKi
 IWdczk7MYqUci6gkgqKBP/gt6GV+3JbcIDyBD0IHOB8JZik4+GFcXUUW6
 mUzzSIa7Jmqg9SbSoBEd+2Cl1s6fPAeQ2Dh3zbwbi11Bj0iZmHn6FrgZD
 9tXVb4Rxld9m3c5EPw2CQx7K26iBLGcPyAkDwhAEt32fUF9uEPflPBnL0 g==;
X-CSE-ConnectionGUID: UHhGhskUQBCoFTCs7SKlEA==
X-CSE-MsgGUID: rJfS3qw7QcKIbic4frnGLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537055"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:19 -0800
X-CSE-ConnectionGUID: tzoiaVZHQ8a6ERneAVefdA==
X-CSE-MsgGUID: d+jMyHI5SGGCIMhYmDfWiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505634"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:15 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 06/20] drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA
 vm bind ops
Date: Tue,  2 Dec 2025 15:52:25 +0200
Message-ID: <20251202135241.880267-7-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Make it possible to add and remove per vm debug data, which can be used
to annotate vm ranges (using pseudopaths) or to associate them with
a file which can carry arbitrary debug data (e.g. binary instruction to
code line mapping). The debug data is kept separe from the vmas. Each
address can be associated with only one debug data entry i.e. debug data
entries cannot overlap. Each entry is atomic so to remove it the
creation address and range has to be passed for removal.

For debug data manipulation only the 'op' and 'extensions' field from
'struct drm_xe_vm_bind_op' is used. All required parameters are passed
through 'struct drm_xe_vm_bind_op_ext_debug_data' and a valid instance
should be present in the extension chain pointed by the 'extensions'
field.

Debug data will be accessible through the eudebug event interface,
introduced in the following patch. An alternative way to access debug data
using debugfs, without relying on eudebug, will be proposed as a follow-up
to the eudebug series.

v2: enforce empty path on unmap (Joonas, Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_debug_data.c       | 314 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debug_data.h       |  22 ++
 drivers/gpu/drm/xe/xe_debug_data_types.h |  25 ++
 drivers/gpu/drm/xe/xe_vm.c               | 157 +++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h         |  19 ++
 include/uapi/drm/xe_drm.h                |  36 +++
 7 files changed, 568 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debug_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_data.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_data_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d81981b6a297..caf2b9e518ea 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -86,6 +86,7 @@ xe-y += xe_bb.o \
 	xe_irq.o \
 	xe_late_bind_fw.o \
 	xe_lrc.o \
+	xe_debug_data.o \
 	xe_migrate.o \
 	xe_mmio.o \
 	xe_mmio_gem.o \
diff --git a/drivers/gpu/drm/xe/xe_debug_data.c b/drivers/gpu/drm/xe/xe_debug_data.c
new file mode 100644
index 000000000000..1cc89396d8b2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_data.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_debug_data.h"
+#include "xe_debug_data_types.h"
+#include "xe_vm.h"
+
+const char *xe_debug_data_pseudo_path_to_string(u64 pseudopath)
+{
+	switch (pseudopath) {
+	case DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA:
+		return "[module_area]";
+	case DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SBA_AREA:
+		return "[sba_area]";
+	case DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SIP_AREA:
+		return "[sip_area]";
+	default:
+		return "[unknown]";
+	}
+}
+
+static bool
+debug_data_overlaps(const struct drm_xe_vm_bind_op_ext_debug_data *a,
+		    const struct xe_debug_data *b)
+{
+	const u64 s1 = a->addr;
+	const u64 e1 = a->addr + a->range;
+	const u64 s2 = b->addr;
+	const u64 e2 = b->addr + b->range;
+
+	return (s1 < e2) && (s2 < e1);
+}
+
+static bool
+debug_data_matches(const struct drm_xe_vm_bind_op_ext_debug_data *a,
+		   const struct xe_debug_data *b)
+{
+	return (a->addr == b->addr) && (a->range == b->range);
+}
+
+static bool
+debug_data_is_empty(const struct drm_xe_vm_bind_op_ext_debug_data *dd)
+{
+	int i;
+
+	if (dd->flags)
+		return false;
+
+	if (dd->offset)
+		return false;
+
+	for (i = 0; i < PATH_MAX; i++)
+		if (dd->pathname[i])
+			return false;
+
+	return true;
+}
+
+static int xe_debug_data_check_add(struct xe_vm *vm,
+				   const struct drm_xe_vm_bind_op_ext_debug_data *ext)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_debug_data *i;
+
+	mutex_lock(&vm->debug_data.lock);
+	list_for_each_entry(i, &vm->debug_data.list, link) {
+		if (XE_IOCTL_DBG(xe, debug_data_overlaps(ext, i))) {
+			mutex_unlock(&vm->debug_data.lock);
+			return -EINVAL;
+		}
+	}
+	mutex_unlock(&vm->debug_data.lock);
+
+	return 0;
+}
+
+static int xe_debug_data_check_remove(struct xe_vm *vm,
+				      const struct drm_xe_vm_bind_op_ext_debug_data *ext)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_debug_data *i;
+	bool found = false;
+
+	if (XE_IOCTL_DBG(xe, !debug_data_is_empty(ext)))
+		return -EINVAL;
+
+	mutex_lock(&vm->debug_data.lock);
+	list_for_each_entry(i, &vm->debug_data.list, link) {
+		found = debug_data_matches(ext, i);
+		if (found)
+			break;
+	}
+	mutex_unlock(&vm->debug_data.lock);
+
+	if (XE_IOCTL_DBG(xe, !found)) {
+		drm_dbg(&xe->drm, "Debug data to remove not found for addr 0x%llx, range 0x%llx\n",
+			ext->addr, ext->range);
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+int xe_debug_data_check_extension(struct xe_vm *vm, u32 operation, u64 extension)
+{
+	const u64 __user * const address = u64_to_user_ptr(extension);
+	struct drm_xe_vm_bind_op_ext_debug_data *ext;
+	struct xe_device *xe = vm->xe;
+	int ret;
+
+	if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+			 operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA))
+		return -EINVAL;
+
+	ext = kzalloc(sizeof(*ext), GFP_KERNEL);
+	if (!ext)
+		return -ENOMEM;
+
+	if (copy_from_user(ext, address, sizeof(*ext))) {
+		kfree(ext);
+		return -EFAULT;
+	}
+
+	if (XE_IOCTL_DBG(xe, ext->flags & ~DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) ||
+	    XE_IOCTL_DBG(xe, ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO &&
+			 ext->offset != 0) ||
+	    XE_IOCTL_DBG(xe, ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO &&
+			 (ext->pseudopath < DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA ||
+			  ext->pseudopath > DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SIP_AREA)) ||
+	    XE_IOCTL_DBG(xe, !(ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) &&
+			 strnlen(ext->pathname, PATH_MAX) >= PATH_MAX)) {
+		kfree(ext);
+		return -EINVAL;
+	}
+
+	ret = operation == DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA ?
+		xe_debug_data_check_add(vm, ext) :
+		xe_debug_data_check_remove(vm, ext);
+
+	kfree(ext);
+	return ret;
+}
+
+static int xe_debug_data_add(struct xe_vm *vm, struct xe_vma_op *vma_op,
+			     struct drm_xe_vm_bind_op_ext_debug_data *ext)
+{
+	struct xe_debug_data *dd;
+
+	vm_dbg(&vm->xe->drm,
+	       "ADD_DEBUG_DATA: addr=0x%016llx, range=0x%016llx, offset=0x%08x, flags=0x%016llx, path=%s\n",
+	       ext->addr, ext->range, ext->offset, ext->flags,
+	       (ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) ?
+	       xe_debug_data_pseudo_path_to_string(ext->pseudopath) : ext->pathname);
+
+	dd = kzalloc(sizeof(*dd), GFP_KERNEL);
+	if (!dd)
+		return -ENOMEM;
+
+	dd->addr = ext->addr;
+	dd->range = ext->range;
+	dd->flags = ext->flags;
+	dd->offset = ext->offset;
+
+	if (ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) {
+		dd->pseudopath = ext->pseudopath;
+	} else if (strscpy(dd->pathname, ext->pathname, PATH_MAX) < 0) {
+		kfree(dd);
+		return -EINVAL;
+	}
+
+	mutex_lock(&vm->debug_data.lock);
+	list_add_tail(&dd->link, &vm->debug_data.list);
+	mutex_unlock(&vm->debug_data.lock);
+
+	memcpy(&vma_op->modify_debug_data.debug_data, dd, sizeof(*dd));
+
+	return 0;
+}
+
+static int xe_debug_data_remove(struct xe_vm *vm, struct xe_vma_op *vma_op,
+				struct drm_xe_vm_bind_op_ext_debug_data *ext)
+{
+	struct xe_debug_data *dd;
+
+	vm_dbg(&vm->xe->drm,
+	       "REMOVE_DEBUG_DATA: addr=0x%016llx, range=0x%016llx, offset=0x%08x, flags=0x%016llx, path=%s\n",
+	       ext->addr, ext->range, ext->offset, ext->flags,
+	       (ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) ?
+	       xe_debug_data_pseudo_path_to_string(ext->pseudopath) : ext->pathname);
+
+	mutex_lock(&vm->debug_data.lock);
+	list_for_each_entry(dd, &vm->debug_data.list, link) {
+		if (dd->addr == ext->addr && dd->range == ext->range) {
+			list_del(&dd->link);
+			memcpy(&vma_op->modify_debug_data.debug_data, dd, sizeof(*dd));
+			kfree(dd);
+			break;
+		}
+	}
+	mutex_unlock(&vm->debug_data.lock);
+
+	return 0;
+}
+
+int xe_debug_data_process_extension(struct xe_vm *vm, struct drm_gpuva_ops *ops, u32 operation,
+				    u64 extension)
+{
+	const u64 __user * const address = u64_to_user_ptr(extension);
+	struct drm_xe_vm_bind_op_ext_debug_data *ext;
+	struct xe_vma_op *vma_op;
+	struct drm_gpuva_op *op;
+	int ret;
+
+	ext = kzalloc(sizeof(*ext), GFP_KERNEL);
+	if (!ext)
+		return -ENOMEM;
+
+	if (copy_from_user(ext, address, sizeof(*ext))) {
+		kfree(ext);
+		return -EFAULT;
+	}
+
+	/* We expect only a single op for debug data */
+	op = drm_gpuva_first_op(ops);
+	if (op != drm_gpuva_last_op(ops))
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+
+	vma_op = gpuva_op_to_vma_op(op);
+
+	if (vma_op->subop == XE_VMA_SUBOP_ADD_DEBUG_DATA)
+		ret = xe_debug_data_add(vm, vma_op, ext);
+	else
+		ret = xe_debug_data_remove(vm, vma_op, ext);
+
+	kfree(ext);
+	return ret;
+}
+
+static int xe_debug_data_op_unwind_add(struct xe_vm *vm, struct xe_vma_op *vma_op)
+{
+	const struct xe_debug_data *op_data = &vma_op->modify_debug_data.debug_data;
+	struct xe_debug_data *dd;
+
+	vm_dbg(&vm->xe->drm,
+	       "Reverting debug data add: addr=0x%016llx, range=0x%016llx, offset=0x%08x, flags=0x%016llx, path=%s\n",
+	       op_data->addr, op_data->range, op_data->offset, op_data->flags,
+	       (op_data->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) ?
+	       xe_debug_data_pseudo_path_to_string(op_data->pseudopath) : op_data->pathname);
+
+	mutex_lock(&vm->debug_data.lock);
+	list_for_each_entry(dd, &vm->debug_data.list, link) {
+		if (dd->addr == op_data->addr && dd->range == op_data->range) {
+			list_del(&dd->link);
+			kfree(dd);
+			break;
+		}
+	}
+	mutex_unlock(&vm->debug_data.lock);
+
+	return 0;
+}
+
+static int xe_debug_data_op_unwind_remove(struct xe_vm *vm, struct xe_vma_op *vma_op)
+{
+	const struct xe_debug_data *op_data = &vma_op->modify_debug_data.debug_data;
+	struct xe_debug_data *dd;
+
+	vm_dbg(&vm->xe->drm,
+	       "Reverting debug data remove: addr=0x%016llx, range=0x%016llx, offset=0x%08x, flags=0x%016llx, path=%s\n",
+	       op_data->addr, op_data->range, op_data->offset, op_data->flags,
+	       (op_data->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) ?
+	       xe_debug_data_pseudo_path_to_string(op_data->pseudopath) : op_data->pathname);
+
+	dd = kzalloc(sizeof(*dd), GFP_KERNEL);
+	if (!dd)
+		return -ENOMEM;
+
+	memcpy(dd, op_data, sizeof(*dd));
+
+	mutex_lock(&vm->debug_data.lock);
+	list_add_tail(&dd->link, &vm->debug_data.list);
+	mutex_unlock(&vm->debug_data.lock);
+
+	return 0;
+}
+
+int xe_debug_data_op_unwind(struct xe_vm *vm, struct xe_vma_op *vma_op)
+{
+	switch (vma_op->subop) {
+	case XE_VMA_SUBOP_ADD_DEBUG_DATA:
+		return xe_debug_data_op_unwind_add(vm, vma_op);
+	case XE_VMA_SUBOP_REMOVE_DEBUG_DATA:
+		return xe_debug_data_op_unwind_remove(vm, vma_op);
+	default:
+		drm_err(&vm->xe->drm, "Invalid debug data subop %d\n", vma_op->subop);
+		return -EINVAL;
+	}
+}
+
+int xe_debug_data_destroy(struct xe_vm *vm)
+{
+	struct xe_debug_data *dd, *tmp;
+
+	mutex_lock(&vm->debug_data.lock);
+	list_for_each_entry_safe(dd, tmp, &vm->debug_data.list, link) {
+		list_del(&dd->link);
+		kfree(dd);
+	}
+	mutex_unlock(&vm->debug_data.lock);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_debug_data.h b/drivers/gpu/drm/xe/xe_debug_data.h
new file mode 100644
index 000000000000..3436a7023920
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_data.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DEBUG_DATA_H_
+#define _XE_DEBUG_DATA_H_
+
+#include <linux/types.h>
+
+struct drm_gpuva_ops;
+struct xe_vm;
+struct xe_vma_op;
+
+const char *xe_debug_data_pseudo_path_to_string(u64 pseudopath);
+int xe_debug_data_check_extension(struct xe_vm *vm, u32 operation, u64 extension);
+int xe_debug_data_process_extension(struct xe_vm *vm, struct drm_gpuva_ops *ops, u32 operation,
+				    u64 extension);
+int xe_debug_data_op_unwind(struct xe_vm *vm, struct xe_vma_op *vma_op);
+int xe_debug_data_destroy(struct xe_vm *vm);
+
+#endif /* _XE_DEBUG_DATA_H_ */
diff --git a/drivers/gpu/drm/xe/xe_debug_data_types.h b/drivers/gpu/drm/xe/xe_debug_data_types.h
new file mode 100644
index 000000000000..a8b430af2275
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_data_types.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DEBUG_DATA_TYPES_H_
+#define _XE_DEBUG_DATA_TYPES_H_
+
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/types.h>
+
+struct xe_debug_data {
+	struct list_head link;
+	u64 addr;
+	u64 range;
+	u64 flags;
+	u32 offset;
+	union {
+		u64 pseudopath;
+		char pathname[PATH_MAX];
+	};
+};
+
+#endif /* _XE_DEBUG_DATA_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 903f478ff1cc..4bc23d384134 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -24,6 +24,7 @@
 #include "regs/xe_gtt_defs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_debug_data.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_eudebug.h"
@@ -1514,6 +1515,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
+	INIT_LIST_HEAD(&vm->debug_data.list);
+	mutex_init(&vm->debug_data.lock);
+
 	vm->pt_ops = &xelp_pt_ops;
 
 	/*
@@ -1812,6 +1816,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
+	xe_debug_data_destroy(vm);
+
 	xe_vm_put(vm);
 }
 
@@ -2154,6 +2160,7 @@ static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 {
+	struct xe_vma_op *vma_op;
 	struct xe_vma *vma;
 
 	switch (op->op) {
@@ -2188,6 +2195,12 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		vm_dbg(&xe->drm, "PREFETCH: addr=0x%016llx, range=0x%016llx",
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		vma_op = gpuva_op_to_vma_op(op);
+		if (vma_op->subop != XE_VMA_SUBOP_ADD_DEBUG_DATA &&
+		    vma_op->subop != XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			drm_warn(&xe->drm, "Unexpected vma sub op: %d", vma_op->subop);
+		break;
 	default:
 		drm_warn(&xe->drm, "NOT POSSIBLE");
 	}
@@ -2232,12 +2245,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			 struct xe_bo *bo, u64 bo_offset_or_userptr,
 			 u64 addr, u64 range,
 			 u32 operation, u32 flags,
-			 u32 prefetch_region, u16 pat_index)
+			 u32 prefetch_region, u16 pat_index, u64 extensions)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	struct xe_vma_op *vma_op;
 	u64 range_start = addr;
 	u64 range_end = addr + range;
 	int err;
@@ -2291,6 +2305,24 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		drm_gpuvm_bo_put(vm_bo);
 		xe_bo_unlock(bo);
 		break;
+	case DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA:
+	case DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA:
+		ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+		if (!ops)
+			return ERR_PTR(-ENOMEM);
+
+		INIT_LIST_HEAD(&ops->list);
+		vma_op = kzalloc(sizeof(*vma_op), GFP_KERNEL);
+		if (!vma_op) {
+			kfree(ops);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		vma_op->base.op = DRM_GPUVA_OP_DRIVER;
+		vma_op->subop = operation == DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA ?
+			XE_VMA_SUBOP_ADD_DEBUG_DATA : XE_VMA_SUBOP_REMOVE_DEBUG_DATA;
+		list_add_tail(&vma_op->base.entry, &ops->list);
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		ops = ERR_PTR(-EINVAL);
@@ -2569,6 +2601,11 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	case DRM_GPUVA_OP_PREFETCH:
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop != XE_VMA_SUBOP_ADD_DEBUG_DATA &&
+		    op->subop != XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			drm_warn(&vm->xe->drm, "Unexpected vma sub op: %d", op->subop);
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -2768,6 +2805,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 
 			break;
+		case DRM_GPUVA_OP_DRIVER:
+			if (op->subop != XE_VMA_SUBOP_ADD_DEBUG_DATA &&
+			    op->subop != XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+				drm_warn(&vm->xe->drm, "Unexpected vma sub op: %d", op->subop);
+			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
@@ -2830,6 +2872,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	case DRM_GPUVA_OP_PREFETCH:
 		/* Nothing to do */
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop == XE_VMA_SUBOP_ADD_DEBUG_DATA ||
+		    op->subop == XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			xe_debug_data_op_unwind(vm, op);
+		else
+			drm_warn(&vm->xe->drm, "Unexpected vma sub op: %d", op->subop);
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -3007,6 +3056,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    exec);
 		break;
 	}
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop != XE_VMA_SUBOP_ADD_DEBUG_DATA &&
+		    op->subop != XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			drm_warn(&vm->xe->drm, "Unexpected vma sub op: %d", op->subop);
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -3246,6 +3300,11 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 	case DRM_GPUVA_OP_PREFETCH:
 		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop != XE_VMA_SUBOP_ADD_DEBUG_DATA &&
+		    op->subop != XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			drm_warn(&vm->xe->drm, "Unexpected vma sub op: %d", op->subop);
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -3332,6 +3391,79 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
+#define MAX_USER_EXTENSIONS	16
+
+typedef int (*xe_vm_bind_user_extension_check_fn)(struct xe_vm *vm, u32 operation, u64 extension);
+
+typedef int (*xe_vm_bind_user_extension_process_fn)(struct xe_vm *vm, struct drm_gpuva_ops *ops,
+						    u32 operation, u64 extension);
+
+static const xe_vm_bind_user_extension_check_fn vm_bind_extension_check_funcs[] = {
+	[XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA] = xe_debug_data_check_extension,
+};
+
+static const xe_vm_bind_user_extension_process_fn vm_bind_extension_process_funcs[] = {
+	[XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA] = xe_debug_data_process_extension,
+};
+
+#define MAX_USER_EXTENSIONS 16
+static int __vm_bind_op_user_extensions(struct xe_vm *vm, struct drm_gpuva_ops *ops,
+					u32 operation, u64 extensions)
+{
+	struct xe_device *xe = vm->xe;
+	int debug_data_count = 0;
+	int ext_count = 0;
+	int err = -1;
+
+	struct drm_xe_user_extension ext;
+
+	while (extensions) {
+		u64 __user *address = u64_to_user_ptr(extensions);
+
+		if (XE_IOCTL_DBG(xe, ++ext_count >= MAX_USER_EXTENSIONS))
+			return -E2BIG;
+
+		err = copy_from_user(&ext, address, sizeof(ext));
+		if (XE_IOCTL_DBG(xe, err))
+			return -EFAULT;
+
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&
+				     ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA) ||
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ext.pad) ||
+		    XE_IOCTL_DBG(xe, ext.name > XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA))
+			return -EINVAL;
+
+		if (!ops)
+			err = vm_bind_extension_check_funcs[ext.name](vm, operation, extensions);
+		else
+			err = vm_bind_extension_process_funcs[ext.name](vm, ops, operation,
+									extensions);
+
+		if (XE_IOCTL_DBG(xe, err))
+			return err;
+
+		extensions = ext.next_extension;
+	}
+
+	return 0;
+}
+
+static int vm_bind_ioctl_check_user_extensions(struct xe_vm *vm, u32 operation, u64 extensions)
+{
+	return __vm_bind_op_user_extensions(vm, NULL, operation, extensions);
+}
+
+static int vm_bind_ioctl_process_user_extensions(struct xe_vm *vm, struct drm_gpuva_ops *ops,
+						 u32 operation, u64 extensions)
+{
+	return __vm_bind_op_user_extensions(vm, ops, operation, extensions);
+}
+
 static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
@@ -3380,6 +3512,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		bool is_cpu_addr_mirror = flags &
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
+		u64 extensions = (*bind_ops)[i].extensions;
 		u16 coh_mode;
 
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
@@ -3407,7 +3540,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
+		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
@@ -3449,10 +3582,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, !range &&
-				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL &&
+				 op != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				 op != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		err = vm_bind_ioctl_check_user_extensions(vm, op, extensions);
+		if (err)
+			goto free_bind_ops;
 	}
 
 	return 0;
@@ -3710,11 +3849,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
+		u64 extensions = bind_ops[i].extensions;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
-						  prefetch_region, pat_index);
-		if (IS_ERR(ops[i])) {
+						  prefetch_region, pat_index, extensions);
+
+		if (!IS_ERR(ops[i]) && extensions) {
+			err = vm_bind_ioctl_process_user_extensions(vm, ops[i], op, extensions);
+			if (err)
+				goto unwind_ops;
+		} else if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
 			goto unwind_ops;
@@ -3822,7 +3967,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
-				       vm->xe->pat.idx[cache_lvl]);
+				       vm->xe->pat.idx[cache_lvl], 0);
 	if (IS_ERR(ops)) {
 		err = PTR_ERR(ops);
 		goto release_vm_lock;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3bf912bfbdcc..1aa1412f0a2c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -14,6 +14,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
 
+#include "xe_debug_data_types.h"
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
@@ -335,6 +336,12 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: Xe file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	/** @debug_data: track debug_data mapped to vm */
+	struct {
+		struct list_head list;
+		struct mutex lock;
+	} debug_data;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
@@ -401,6 +408,12 @@ struct xe_vma_op_prefetch_range {
 	struct xe_tile *tile;
 };
 
+/** struct xe_vma_op_debug_data - debug data altering operation */
+struct xe_vma_op_modify_debug_data {
+	/** @debug_data: debug data associated with that operation */
+	struct xe_debug_data debug_data;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -417,6 +430,10 @@ enum xe_vma_subop {
 	XE_VMA_SUBOP_MAP_RANGE,
 	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
 	XE_VMA_SUBOP_UNMAP_RANGE,
+	/** @XE_VMA_SUBOP_ADD_DEBUG_DATA: Add debug data to vm */
+	XE_VMA_SUBOP_ADD_DEBUG_DATA,
+	/** @XE_VMA_SUBOP_REMOVE_DEBUG_DATA: Remove debug data from vm */
+	XE_VMA_SUBOP_REMOVE_DEBUG_DATA,
 };
 
 /** struct xe_vma_op - VMA operation */
@@ -445,6 +462,8 @@ struct xe_vma_op {
 		struct xe_vma_op_unmap_range unmap_range;
 		/** @prefetch_range: VMA prefetch range operation specific data */
 		struct xe_vma_op_prefetch_range prefetch_range;
+		/** @debug_data: debug_data operation specific data */
+		struct xe_vma_op_modify_debug_data modify_debug_data;
 	};
 };
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7349b832837d..8217e60700a6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -6,6 +6,8 @@
 #ifndef _UAPI_XE_DRM_H_
 #define _UAPI_XE_DRM_H_
 
+#include <linux/limits.h>
+
 #include "drm.h"
 
 #if defined(__cplusplus)
@@ -991,6 +993,35 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+struct drm_xe_vm_bind_op_ext_debug_data {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @addr: Address of the metadata mapping */
+	__u64 addr;
+
+	/** @range: Range of the metadata mapping */
+	__u64 range;
+
+#define DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO (1 << 0)
+	/** @flags: Debug metadata flags */
+	__u64 flags;
+
+	/** @offset: Offset into the debug data file, MBZ for DEBUG_PSEUDO */
+	__u32 offset;
+
+	/** @reserved: Reserved */
+	__u32 reserved;
+
+	union {
+#define DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA	0x1
+#define DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SBA_AREA	0x2
+#define DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SIP_AREA	0x3
+		__u64 pseudopath;
+		char pathname[PATH_MAX];
+	};
+};
+
 /**
  * struct drm_xe_vm_bind_op - run bind operations
  *
@@ -1000,6 +1031,8 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
  *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
+ *  - %DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA
+ *  - %DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA
  *
  * and the @flags can be:
  *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
@@ -1043,6 +1076,7 @@ struct drm_xe_vm_destroy {
  *    the memory region advised by madvise.
  */
 struct drm_xe_vm_bind_op {
+#define	XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA 0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1134,6 +1168,8 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
 #define DRM_XE_VM_BIND_OP_UNMAP_ALL	0x3
 #define DRM_XE_VM_BIND_OP_PREFETCH	0x4
+#define DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA	0x5
+#define DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA	0x6
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-- 
2.43.0

