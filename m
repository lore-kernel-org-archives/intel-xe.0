Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB5DC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 14:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A82010E751;
	Tue, 13 Feb 2024 14:53:00 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672410E748
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 14:52:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 3/4] drm/xe: Add vm snapshot mutex for easily taking a vm
 snapshot during devcoredump
Date: Tue, 13 Feb 2024 15:52:38 +0100
Message-ID: <20240213145239.359679-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
References: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
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

The devcoredump is done in fence signaling context. Because of this, we
cannot take any of the normal mutexes or we would invert.

Normal: Take vm->lock, dma_fence_wait()
Devcoredump: from dma_fence_wait() context, take vm->lock.

This doesn't work, and we only care about integrity, so take the locks
around additions and removals of vma's.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_vm_types.h | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 838eb991d52fc..925881fc7d173 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1055,7 +1055,9 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
+	mutex_lock(&vm->snap_mutex);
 	err = drm_gpuva_insert(&vm->gpuvm, &vma->gpuva);
+	mutex_unlock(&vm->snap_mutex);
 	XE_WARN_ON(err);	/* Shouldn't be possible */
 
 	return err;
@@ -1066,7 +1068,9 @@ static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
+	mutex_lock(&vm->snap_mutex);
 	drm_gpuva_remove(&vma->gpuva);
+	mutex_unlock(&vm->snap_mutex);
 	if (vm->usm.last_fault_vma == vma)
 		vm->usm.last_fault_vma = NULL;
 }
@@ -1293,6 +1297,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->flags = flags;
 
 	init_rwsem(&vm->lock);
+	mutex_init(&vm->snap_mutex);
 
 	INIT_LIST_HEAD(&vm->rebind_list);
 
@@ -1418,6 +1423,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	return ERR_PTR(err);
 
 err_no_resv:
+	mutex_destroy(&vm->snap_mutex);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
@@ -1517,6 +1523,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	up_write(&vm->lock);
 
+	mutex_destroy(&vm->snap_mutex);
+
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode--;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 59499dc28b8a5..33adf4ae404e5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -158,6 +158,11 @@ struct xe_vm {
 	 * VM
 	 */
 	struct rw_semaphore lock;
+	/**
+	 * @snap_mutex: Mutex used to guard insertions and removals from gpuva,
+	 * so we can take a snapshot safely from devcoredump.
+	 */
+	struct mutex snap_mutex;
 
 	/**
 	 * @rebind_list: list of VMAs that need rebinding. Protected by the
-- 
2.43.0

