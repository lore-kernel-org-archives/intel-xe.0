Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F076CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 15:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9410E199;
	Fri, 13 Oct 2023 15:21:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0D10E199
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 15:21:50 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 17:21:41 +0200
Message-Id: <20231013152142.52869-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
References: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe: Add vm snapshot mutex for easily
 taking a vm snapshot during devcoredump
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vm.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_vm_types.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index da006249147e..544d998293d3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1163,7 +1163,9 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
+	mutex_lock(&vm->snap_mutex);
 	err = drm_gpuva_insert(&vm->gpuvm, &vma->gpuva);
+	mutex_unlock(&vm->snap_mutex);
 	XE_WARN_ON(err);	/* Shouldn't be possible */
 
 	return err;
@@ -1174,7 +1176,9 @@ static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
+	mutex_lock(&vm->snap_mutex);
 	drm_gpuva_remove(&vma->gpuva);
+	mutex_unlock(&vm->snap_mutex);
 	if (vm->usm.last_fault_vma == vma)
 		vm->usm.last_fault_vma = NULL;
 }
@@ -1343,6 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->flags = flags;
 
 	init_rwsem(&vm->lock);
+	mutex_init(&vm->snap_mutex);
 
 	INIT_LIST_HEAD(&vm->rebind_list);
 
@@ -1486,6 +1491,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	dma_resv_unlock(&vm->resv);
 	drm_gpuvm_destroy(&vm->gpuvm);
 err_put:
+	mutex_destroy(&vm->snap_mutex);
 	dma_resv_fini(&vm->resv);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
@@ -1625,6 +1631,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	up_write(&vm->lock);
 
 	drm_gpuvm_destroy(&vm->gpuvm);
+	mutex_destroy(&vm->snap_mutex);
 
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 825f8127741e..bf5017b631a5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -183,6 +183,11 @@ struct xe_vm {
 	 * VM
 	 */
 	struct rw_semaphore lock;
+	/**
+	 * @snap_mutex: Mutex used to guard insertions and removals from gpuva,
+	 * so we can take a snapshot safely from devcoredump.
+	 */
+	struct mutex snap_mutex;
 
 	/**
 	 * @rebind_list: list of VMAs that need rebinding, and if they are
-- 
2.40.1

