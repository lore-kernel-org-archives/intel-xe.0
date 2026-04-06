Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4B2EF4EC2
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE1710E21B;
	Mon,  6 Apr 2026 08:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGo4X0fb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD6610E21B
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465932; x=1807001932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rlYGzuTOLVrWt5YPRapElzjaCV28ivlrc7UQRhuYdEo=;
 b=XGo4X0fbt/RKJPMiK6L7gQtfPPFrh+/IzRXb1s4rIwRPqC0HLT8+9w9+
 0UWcdwRQlKcAZTSw94tW//iYIv6zQ8Uj53KwjBGjk4IPvmeGkh5qsZFZZ
 Xea7DV1V7APZbAGaiJY1miQNYy4Ref9Jgqxbt0bsLmiso3vT8fThAX6/4
 xVgHXxehysyrFU1TSTufyKaQc0osbm2ezSHeUg15R60K7a7aAEIiqyQ3n
 i3GqUdL/Mzmg3lYf5lQyEQ11F5oyBaYDcdgqohTG66uNBCz1pxYIwDK36
 SAWU0ROsCOYx4YWYMio/ri37Q2f+x5+MyVK5MDq6Wzlcj6R4Q2czlAgPB g==;
X-CSE-ConnectionGUID: 9HwtQV+GQrSFBZcNIkBxbQ==
X-CSE-MsgGUID: 2M9eUVO3R2OaJJUJupA1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012893"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:51 -0700
X-CSE-ConnectionGUID: M7PxECVvQaujnU6vKTvW5g==
X-CSE-MsgGUID: vP0dMTuSSH+rQGuP4UwWzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775203"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:50 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 5/7] drm/xe/vm: Deactivate madvise notifier on GPU touch
Date: Mon,  6 Apr 2026 14:28:28 +0530
Message-ID: <20260406085830.1118431-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

MADVISE_AUTORESET notifier is only needed while the VMA is CPU-only.
After GPU touch, SVM notifiers handle munmap.

Gate the callback on an active flag and clear it on first GPU touch in
xe_vm_madvise_gpu_touch(), making the callback a no-op.

v2:
  - Use plain bool active; callback reads it lockless. (Matt)
  - Use wq check and mt_for_each in deactivate path. (Matt)
  - Add lockdep_assert_held_write(&vm->lock) to xe_vm_madvise_gpu_touch().

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |  5 ++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 52 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.h |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h   |  7 ++++
 4 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fd57c9d41db8..b6544947d861 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -22,6 +22,7 @@
 #include "xe_tlb_inval.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vm_types.h"
 #include "xe_vram_types.h"
 
@@ -1414,8 +1415,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	 * Mark the VMA as GPU-touched only after a successful fault-in.
 	 * Prefetch faults that find no range must not transition this state.
 	 */
-	if (!ret && xe_vma_has_cpu_autoreset_active(vma))
+	if (!ret && xe_vma_has_cpu_autoreset_active(vma)) {
 		xe_vma_gpu_touch(vma);
+		xe_vm_madvise_gpu_touch(vm, vma);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index bdeb2e8e0f2c..4c57cac63d13 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -981,10 +981,10 @@ static bool xe_madvise_notifier_callback(struct mmu_interval_notifier *mni,
 	struct xe_vm *vm = notifier->vm;
 	u64 start, end;
 
-	if (range->event != MMU_NOTIFY_UNMAP)
+	if (range->event != MMU_NOTIFY_UNMAP || !notifier->active)
 		return true;
 
-	/* Skip non-blockable contexts; correctness is ensured by cpu_autoreset_active. */
+	/* Skip non-blockable contexts; cpu_autoreset_active handles fallback. */
 	if (!mmu_notifier_range_blockable(range))
 		return true;
 
@@ -1157,6 +1157,7 @@ int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
 	notifier->vm = xe_vm_get(vm);
 	notifier->vma_start = start;
 	notifier->vma_end = end;
+	notifier->active = true;
 	INIT_LIST_HEAD(&notifier->list);
 	spin_lock_init(&notifier->work_lock);
 	INIT_WORK(&notifier->work, xe_madvise_work_func);
@@ -1221,3 +1222,50 @@ int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
 	return err;
 }
 
+/**
+ * xe_vm_deactivate_madvise_notifier_for_range - Disable notifier callbacks
+ * @vm: VM
+ * @start: Start address (page-aligned)
+ * @end: End address (page-aligned)
+ *
+ * Clear @active on notifiers in [start, end) so future callbacks no-op.
+ * Removal is handled in xe_vm_madvise_fini().
+ */
+void xe_vm_deactivate_madvise_notifier_for_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_madvise_notifier *notifier;
+	unsigned long index = start;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	/* No-op if madvise infrastructure is not available. */
+	if (!vm->svm.madvise_work.wq)
+		return;
+
+	/* Plain walk to deactivate overlapping notifiers. */
+	mt_for_each(&vm->svm.madvise_notifiers, notifier, index, end - 1)
+		notifier->active = false;
+}
+
+/**
+ * xe_vm_madvise_gpu_touch() - Suppress madvise callbacks after GPU touch
+ * @vm: VM
+ * @vma: VMA that was GPU-touched
+ *
+ * Clears @active on this VMA's notifiers so future callbacks no-op.
+ * Already-queued work still runs but no-ops: the worker rechecks
+ * cpu_autoreset_active under vm->lock and skips GPU-touched VMAs.
+ */
+void xe_vm_madvise_gpu_touch(struct xe_vm *vm, struct xe_vma *vma)
+{
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Guard: only deactivate notifiers for AUTORESET-marked VMAs. */
+	if (!(vma->gpuva.flags & XE_VMA_MADV_AUTORESET))
+		return;
+
+	xe_vm_deactivate_madvise_notifier_for_range(vm,
+						xe_vma_start(vma),
+						xe_vma_end(vma));
+}
+
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index 111953de4d2f..3c6f4d9e8343 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -22,4 +22,6 @@ void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
 int xe_vm_madvise_init(struct xe_vm *vm);
 void xe_vm_madvise_fini(struct xe_vm *vm);
 int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
+void xe_vm_deactivate_madvise_notifier_for_range(struct xe_vm *vm, u64 start, u64 end);
+void xe_vm_madvise_gpu_touch(struct xe_vm *vm, struct xe_vma *vma);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 93e777f010f9..850245042dd8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -50,6 +50,13 @@ struct xe_madvise_notifier {
 	u64 vma_start;
 	/** @vma_end: End address of VMA being tracked */
 	u64 vma_end;
+	/**
+	 * @active: Fast-path gate; cleared on GPU touch so callbacks bail
+	 * early.  Not authoritative — worker rechecks cpu_autoreset_active
+	 * under vm->lock, so a stale read only causes redundant work.
+	 * Written under vm->lock; read lockless in the callback.
+	 */
+	bool active;
 	/** @list: Used only in xe_vm_madvise_fini() to stage notifiers for removal. */
 	struct list_head list;
 	/** @work_lock: Serialises work_pending, work_start and work_end. */
-- 
2.43.0

