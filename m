Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCD7C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6403410E2D8;
	Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5D110E2D5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269759; x=1730805759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1b3LQvLU37F2C8fIHYIY3qGYoQKFp02rOBy+Hy+Ev/4=;
 b=KuMkE8dLHUJylf1NeBlb0Wa/dhUXbyG9oqBX5yUA+y57N1/tpabjlrJo
 2yJIiS5WQoeuSRSJBdvAkZ55oolRFrKeR6TrQ4+MPdT7qcfxLGhX5xhK9
 v3f23tEvm6duZGcYYjHtDsIxtsHMnms5/G6h7vYpbzu34DreDQHdU75rG
 Qa23T4Qr+CZAD5DIZkvaeDrwfGIHj8yAvl5DXUPlxQsppEkAZAG3++bVL
 0t971qTh2McuUWLAjvC4mjKfI9bItFTsuVxmvTCdbV61C3G9s+tUcvLYQ
 RucZC5hCqQlENYReq2DZ+yb51QzNVtXZlkrv7jwJXtEll+mOVVVwptrk8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646844"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411672"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411672"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:33 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:36 +0200
Message-Id: <20231106111845.2333093-17-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 16/25] drm/xe/eudebug: User coredump support
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

Capture the user state when gpu encounters error.
We start by allowing user to mark vma to of intrest so
that its content will be included in the coredump.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_device_types.h       |   1 +
 drivers/gpu/drm/xe/xe_eudebug.c            |   1 -
 drivers/gpu/drm/xe/xe_usercoredump.c       | 292 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_usercoredump.h       |  19 ++
 drivers/gpu/drm/xe/xe_usercoredump_types.h |  48 ++++
 drivers/gpu/drm/xe/xe_vm.c                 |  33 ++-
 drivers/gpu/drm/xe/xe_vm.h                 |   5 +
 drivers/gpu/drm/xe/xe_vm_types.h           |   3 +
 9 files changed, 392 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_usercoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_usercoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_usercoredump_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8371f3dd34f8..59f76d29f44b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -48,6 +48,7 @@ xe-y += xe_bb.o \
 	xe_bo_evict.o \
 	xe_debugfs.o \
 	xe_devcoredump.o \
+	xe_usercoredump.o \
 	xe_device.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f6d45e605a30..c025ecd1c321 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
+#include "xe_usercoredump_types.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index e110ba7aa860..a5cae53fe496 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -24,7 +24,6 @@
 #include "xe_hw_engine.h"
 #include "xe_exec_queue.h"
 #include "xe_eudebug_types.h"
-//#include "xe_exec_queue_types.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_execlist_types.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_usercoredump.c b/drivers/gpu/drm/xe/xe_usercoredump.c
new file mode 100644
index 000000000000..2ebaf15b563c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usercoredump.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_usercoredump.h"
+
+#include "xe_device_types.h"
+#include "xe_exec_queue_types.h"
+#include "xe_vm.h"
+#include "xe_bo.h"
+#include "xe_res_cursor.h"
+
+/**
+ * DOC: Xe User context coredump
+ *
+ * Contains nonpriviledged per process information
+ * for error dumps, captured VMAs and debug metadata.
+ */
+
+static struct task_struct *find_task_get(struct pid *pid)
+{
+	struct task_struct *task;
+
+	rcu_read_lock();
+	task = pid_task(pid, PIDTYPE_PID);
+	if (task)
+		get_task_struct(task);
+	rcu_read_unlock();
+
+	return task;
+}
+
+static void capture_vma_contents(struct xe_vma_snapshot *s,
+				 struct xe_vma *vma)
+{
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	const bool is_userptr = xe_vma_is_userptr(vma);
+	const bool is_null = xe_vma_is_null(vma);
+	struct xe_res_cursor cur = { 0,  };
+	struct xe_bo *bo = NULL;
+
+	if (is_null)
+		return;
+
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+		return;
+
+	if (!s->data)
+		return;
+
+	if (XE_WARN_ON(s->size != xe_vma_size(vma)))
+		return;
+
+	if (is_userptr) {
+		if (vma->userptr.sg) {
+			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
+					&cur);
+		} else {
+			return;
+		}
+	} else {
+		bo = xe_vma_bo(vma);
+	}
+
+	if (bo) {
+		struct iosys_map src;
+
+		dma_resv_lock(bo->ttm.base.resv, NULL);
+		if (!ttm_bo_vmap(&bo->ttm, &src)) {
+			xe_map_memcpy_from(xe, s->data, &src, 0, s->size);
+			ttm_bo_vunmap(&bo->ttm, &src);
+			s->captured_bytes = s->size;
+		}
+		dma_resv_unlock(bo->ttm.base.resv);
+
+		drm_info(&xe->drm, "captured bytes %llu for vma 0x%llx\n",
+			 s->captured_bytes,
+			 s->start);
+	} else {
+		/* XXX: Userptr */
+	}
+
+	XE_WARN_ON(s->captured_bytes > s->size);
+}
+
+static struct xe_vma_snapshot *
+vma_snapshot_create(struct xe_vma *vma, u64 addr, bool is_vram)
+{
+	struct xe_vma_snapshot *s;
+
+	s = kzalloc(sizeof(*s), GFP_ATOMIC);
+	if (!s)
+		return NULL;
+
+	INIT_LIST_HEAD(&s->link);
+
+	s->start = xe_vma_start(vma);
+	s->size = xe_vma_size(vma);
+	s->flags = vma->gpuva.flags;
+	s->dma_addr = addr;
+	s->is_vram = is_vram;
+	s->is_userptr = xe_vma_is_userptr(vma);
+	s->is_null = xe_vma_is_null(vma);
+
+	/* Ignore alloc failure by omitting contents */
+	if (xe_vma_is_capture_requested(vma)) {
+		s->data = kzalloc(s->size, GFP_ATOMIC);
+		if (!s->data)
+			s->data = kzalloc(min_t(size_t, s->size, PAGE_SIZE),
+					  GFP_ATOMIC);
+	}
+
+	return s;
+}
+
+static void free_vma_snapshot(struct xe_vma_snapshot *s)
+{
+	kfree(s->data);
+	kfree(s);
+}
+
+void xe_user_state_snapshot_release(struct xe_user_state_snapshot *s)
+{
+	struct xe_vma_snapshot *v, *v_tmp;
+
+	mutex_lock(&s->vmas.lock);
+	list_for_each_entry_safe(v, v_tmp, &s->vmas.list, link)
+		free_vma_snapshot(v);
+	mutex_unlock(&s->vmas.lock);
+
+	mutex_destroy(&s->vmas.lock);
+
+	put_pid(s->pid);
+	kfree(s);
+}
+
+static void capture_vma(struct xe_user_state_snapshot *s,
+			struct xe_vma *vma)
+{
+	const bool is_userptr = xe_vma_is_userptr(vma);
+	const bool is_null = xe_vma_is_null(vma);
+	bool is_vram = false;
+	struct xe_vma_snapshot *vma_s;
+	uint64_t addr;
+
+	if (is_null) {
+		addr = 0;
+	} else if (is_userptr) {
+		struct xe_res_cursor cur;
+
+		if (vma->userptr.sg) {
+			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
+					&cur);
+			addr = xe_res_dma(&cur);
+		} else {
+			addr = 0;
+		}
+	} else {
+		addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
+		is_vram = xe_bo_is_vram(xe_vma_bo(vma));
+	}
+
+	vma_s = vma_snapshot_create(vma, addr, is_vram);
+	if (!vma_s)
+		return;
+
+	if (xe_vma_is_capture_requested(vma))
+		capture_vma_contents(vma_s, vma);
+
+	mutex_lock(&s->vmas.lock);
+	list_add_tail(&vma_s->link, &s->vmas.list);
+	mutex_unlock(&s->vmas.lock);
+}
+
+static void capture_vmas(struct xe_user_state_snapshot *s,
+			 struct xe_exec_queue *q)
+{
+	struct drm_gpuva *gpuva;
+	struct xe_vm *vm;
+
+	if (!q->vm)
+		return;
+
+	vm = q->vm;
+
+	if (!down_read_trylock(&vm->lock)) {
+		drm_info(&vm->xe->drm, " Failed to acquire VM lock to capture user state");
+		return;
+	}
+
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm)
+		capture_vma(s, gpuva_to_vma(gpuva));
+
+	up_read(&vm->lock);
+}
+
+static void hexdump(struct drm_printer *m, const void *buf, size_t len)
+{
+	const size_t rowsize = 8 * sizeof(u32);
+	const void *prev = NULL;
+	bool skip = false;
+	size_t pos;
+
+	for (pos = 0; pos < len; pos += rowsize) {
+		char line[128];
+
+		if (prev && !memcmp(prev, buf + pos, rowsize)) {
+			if (!skip) {
+				drm_printf(m, "*\n");
+				skip = true;
+			}
+			continue;
+		}
+
+		WARN_ON_ONCE(hex_dump_to_buffer(buf + pos, len - pos,
+						rowsize, sizeof(u32),
+						line, sizeof(line),
+						false) >= sizeof(line));
+		drm_printf(m, "[%04zx] %s\n", pos, line);
+
+		prev = buf + pos;
+		skip = false;
+	}
+}
+
+static void vma_snapshot_print(struct drm_printer *p,
+			       struct xe_vma_snapshot *s)
+{
+	const bool is_null = s->flags & DRM_GPUVA_SPARSE;
+	const bool is_userptr = s->is_userptr;
+	const bool is_captured = s->flags & XE_VMA_CAPTURE;
+
+	drm_printf(p, " [%016llx-%016llx] S:0x%016llx f:%08x A:%016llx %s %s\n",
+		   s->start, s->start + s->size,
+		   s->size, s->flags,
+		   s->dma_addr, is_null ? "NULL" : is_userptr ? "USR" :
+		   s->is_vram ? "VRAM" : "SYS",
+		   is_captured ? "(captured)" : "");
+
+	if (s->data)
+		hexdump(p, s->data, s->captured_bytes);
+}
+
+void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
+				  struct drm_printer *p)
+{
+	struct xe_vma_snapshot *v;
+
+	drm_printf(p, "PID: %d\n", pid_vnr(s->pid));
+	drm_printf(p, "Comm: %s\n", s->comm);
+	drm_printf(p, "Client ID: %llu\n", s->client_id);
+
+	mutex_lock(&s->vmas.lock);
+	list_for_each_entry(v, &s->vmas.list, link)
+		vma_snapshot_print(p, v);
+	mutex_unlock(&s->vmas.lock);
+}
+
+struct xe_user_state_snapshot *
+xe_user_state_snapshot_capture(struct xe_exec_queue *q)
+{
+	struct xe_user_state_snapshot *s;
+	struct task_struct *task;
+	struct xe_file *xef;
+
+	xef = q->persistent.xef;
+	if (!xef)
+		return NULL;
+
+	s = kzalloc(sizeof(*s), GFP_ATOMIC);
+	if (!s)
+		return NULL;
+
+	INIT_LIST_HEAD(&s->vmas.list);
+	mutex_init(&s->vmas.lock);
+	s->client_id = xef->drm->client_id;
+	s->pid = get_pid(xef->drm->pid);
+
+	task = find_task_get(s->pid);
+	if (task) {
+		get_task_comm(s->comm, task);
+		put_task_struct(task);
+	} else {
+		strcpy(s->comm, "");
+	}
+
+	capture_vmas(s, q);
+
+	return s;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_usercoredump.h b/drivers/gpu/drm/xe/xe_usercoredump.h
new file mode 100644
index 000000000000..cc94e85996e9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usercoredump.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_USER_COREDUMP__H_
+#define _XE_USER_COREDUMP__H_
+
+struct xe_device;
+struct xe_exec_queue;
+struct drm_printer;
+struct xe_user_state_snapshot;
+
+struct xe_user_state_snapshot*
+xe_user_state_snapshot_capture(struct xe_exec_queue *eq);
+void xe_user_state_snapshot_release(struct xe_user_state_snapshot *s);
+void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
+				  struct drm_printer *p);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_usercoredump_types.h b/drivers/gpu/drm/xe/xe_usercoredump_types.h
new file mode 100644
index 000000000000..7d80f412edaf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usercoredump_types.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_USERCOREDUMP_TYPES_H_
+#define _XE_USERCOREDUMP_TYPES_H_
+
+#include <linux/ktime.h>
+#include <linux/mutex.h>
+#include <linux/sched.h>
+
+struct xe_device;
+
+struct xe_vma_snapshot {
+	struct list_head link;
+
+	u32 flags;
+	u64 start;
+	u64 size;
+	u64 dma_addr;
+	u64 captured_bytes;
+	bool is_vram:1;
+	bool is_userptr:1;
+	bool is_null;
+	void *data;
+};
+
+/**
+ * struct xe_user_state_snapshot - Crash snapshot
+ *
+ * This struct contains all the useful information quickly captured at the time
+ * of the crash or shader error. So, any subsequent reads of the dump points to a data that
+ * shows the state of the GPU of when the issue has happened.
+ */
+struct xe_user_state_snapshot {
+
+	struct {
+		struct mutex lock;
+		struct list_head list;
+	} vmas;
+
+	struct pid *pid;
+	u64 client_id; /* drm client id */
+	char comm[TASK_COMM_LEN];
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b333910042b2..a284fd1fdad6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -865,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
+				    bool capture,
 				    u8 tile_mask)
 {
 	struct xe_vma *vma;
@@ -896,7 +897,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
-
+	if (capture)
+		vma->gpuva.flags |= XE_VMA_CAPTURE;
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
 	} else {
@@ -2204,6 +2206,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				flags & XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
+			op->map.capture = flags & XE_VM_BIND_FLAG_CAPTURE;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -2268,7 +2271,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null, bool capture)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2283,7 +2286,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only, is_null,
+			    op->va.range - 1, read_only, is_null, capture,
 			    tile_mask);
 	if (bo)
 		xe_bo_unlock(bo);
@@ -2430,7 +2433,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 			vma = new_vma(vm, &op->base.map,
 				      op->tile_mask, op->map.read_only,
-				      op->map.is_null);
+				      op->map.is_null, op->map.capture);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -2456,7 +2459,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, op->map.capture);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2487,10 +2490,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				bool is_null =
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
+				bool capture =
+					op->base.remap.unmap->va->flags &
+					XE_VMA_CAPTURE;
 
 				vma = new_vma(vm, op->base.remap.next,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, capture);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2835,12 +2841,12 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
 	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
-	 XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_NULL | XE_VM_BIND_FLAG_CAPTURE | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
 	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
 	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | \
-	 0xffff)
+	 XE_VM_BIND_FLAG_CAPTURE | 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 
@@ -2888,6 +2894,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
 		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
+		bool capture = flags & XE_VM_BIND_FLAG_CAPTURE;
 
 		if (i == 0) {
 			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
@@ -2918,6 +2925,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, capture &&
+				 op != XE_VM_BIND_OP_MAP_USERPTR &&
+				 op != XE_VM_BIND_OP_MAP) ||
+		    XE_IOCTL_DBG(xe, capture && is_null) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, region &&
@@ -3295,6 +3306,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 		bool is_userptr = xe_vma_is_userptr(vma);
 		bool is_null = xe_vma_is_null(vma);
+		bool capture = xe_vma_is_capture_requested(vma);
 
 		if (is_null) {
 			addr = 0;
@@ -3312,11 +3324,12 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
 			is_vram = xe_bo_is_vram(xe_vma_bo(vma));
 		}
-		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
+		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s %s\n",
 			   xe_vma_start(vma), xe_vma_end(vma) - 1,
 			   xe_vma_size(vma),
 			   addr, is_null ? "NULL" : is_userptr ? "USR" :
-			   is_vram ? "VRAM" : "SYS");
+			   is_vram ? "VRAM" : "SYS",
+			   capture ? "(captured)" : "not captured");
 	}
 	up_read(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b08c75fbd8a1..5aa40471e095 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -129,6 +129,11 @@ static inline bool xe_vma_is_null(struct xe_vma *vma)
 	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
 }
 
+static inline bool xe_vma_is_capture_requested(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_CAPTURE;
+}
+
 static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 {
 	return !xe_vma_bo(vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aaf0c7101019..bbf192587ff3 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -32,6 +32,7 @@ struct xe_vm;
 #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_CAPTURE		(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -340,6 +341,8 @@ struct xe_vma_op_map {
 	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @capture:: Try to include in devcoredump */
+	bool capture;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
-- 
2.34.1

