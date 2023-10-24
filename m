Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9C1C07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 12:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B3F10E366;
	Tue, 24 Oct 2023 12:23:16 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86DF10E366
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 12:23:08 +0000 (UTC)
From: Maarten@mblankhorst.nl,
	"Lankhorst <maarten.lankhorst"@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 14:22:55 +0200
Message-Id: <20231024122256.19512-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231024122256.19512-1-dev@lankhorst.se>
References: <20231024122256.19512-1-dev@lankhorst.se>
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

The devcoredump is done in fence signaling context. Because of this, we
cannot take any of the normal mutexes or we would invert.

Normal: Take vm->lock, dma_fence_wait()
Devcoredump: from dma_fence_wait() context, take vm->lock.

This doesn't work, and we only care about integrity, so take the locks
around additions and removals of vma's.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vm.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_vm_types.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e17af7aa1ca1..b42ca1069c5b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1168,7 +1168,9 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
+	mutex_lock(&vm->snap_mutex);
 	err = drm_gpuva_insert(&vm->gpuvm, &vma->gpuva);
+	mutex_unlock(&vm->snap_mutex);
 	XE_WARN_ON(err);	/* Shouldn't be possible */
 
 	return err;
@@ -1179,7 +1181,9 @@ static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
+	mutex_lock(&vm->snap_mutex);
 	drm_gpuva_remove(&vma->gpuva);
+	mutex_unlock(&vm->snap_mutex);
 	if (vm->usm.last_fault_vma == vma)
 		vm->usm.last_fault_vma = NULL;
 }
@@ -1352,6 +1356,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->flags = flags;
 
 	init_rwsem(&vm->lock);
+	mutex_init(&vm->snap_mutex);
 
 	INIT_LIST_HEAD(&vm->rebind_list);
 
@@ -1489,6 +1494,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	dma_resv_unlock(&vm->resv);
 	drm_gpuvm_destroy(&vm->gpuvm);
 err_put:
+	mutex_destroy(&vm->snap_mutex);
 	dma_resv_fini(&vm->resv);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
@@ -1594,6 +1600,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	up_write(&vm->lock);
 
 	drm_gpuvm_destroy(&vm->gpuvm);
+	mutex_destroy(&vm->snap_mutex);
 
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6852af366ea2..da42b1ee7aaa 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -182,6 +182,11 @@ struct xe_vm {
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

