Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9941E9A04F
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1B210E1FB;
	Thu, 19 Feb 2026 09:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDdqeDLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0C910E687
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492414; x=1803028414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDAMZojI1azV0RFGTkQk5JMOe7krQgmv4un3URru20I=;
 b=KDdqeDLj334O4/lHqxXpPDeKwu5p1M6I9fS7Bz0qpNW7a1RfSnfEwXMH
 92oNBFCxU2Bo1olJYGE01hfYybZ+OagEE6z4x6YOXDebCixmt/HNyrNvD
 enNNxozFMgb9peSuhiOdUqQMfsTwpsGAnACTbxi8L0P4OfKNy/LZEQf2h
 LoyNOYgI6qA5MdeDo/MmS2w36RHDZrivKyNav4n8yvEsCnYSCHO5zRiHg
 yJrPWsKwSMAgHlf8vazLlgtT/kSzvjuFUtSECT4k9SErWDwm/88G6c2jk
 cf7wz98bKR5C+5650/SdH2cnBY5omUGcDx30whHpUceA9B4cjD3r41Rrn g==;
X-CSE-ConnectionGUID: FLynwtC8RfCBuo8p4jROkw==
X-CSE-MsgGUID: vFBf1ff8TliYYOVvHbvByw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637314"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:34 -0800
X-CSE-ConnectionGUID: E/EpPROfS4yDAuyXJyl7wA==
X-CSE-MsgGUID: Buv4/jt/Sg2cDh3vzmIv+Q==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:33 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 5/7] drm/xe/vm: Deactivate madvise notifier on GPU touch
Date: Thu, 19 Feb 2026 14:43:10 +0530
Message-ID: <20260219091312.796749-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
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

MADVISE_AUTORESET notifier is only needed while VMA is CPU-only.
After GPU touch, the existing SVM notifier handles munmap.

Add 'active' flag to xe_madvise_notifier, cleared on first GPU touch.
The callback checks this flag and returns early when inactive.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |  5 +++-
 drivers/gpu/drm/xe/xe_vm.h         |  6 ++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 46 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h   |  2 ++
 5 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b9dbbb245779..3f09f5f6481f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -21,6 +21,7 @@
 #include "xe_tile.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vm_types.h"
 #include "xe_vram_types.h"
 
@@ -1367,8 +1368,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held_write(&vm->lock);
 
 	/* Transition CPU-only -> GPU-touched before installing PTEs. */
-	if (xe_vma_has_cpu_autoreset_active(vma))
+	if (xe_vma_has_cpu_autoreset_active(vma)) {
 		xe_vma_gpu_touch(vma);
+		xe_vm_madvise_gpu_touch(vm, vma);
+	}
 
 retry:
 	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3dc549550c91..f353ab928e4c 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -426,12 +426,14 @@ void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *fr
 
 /**
  * xe_vma_gpu_touch() - Mark VMA as GPU-touched
- * @vma: VMA to mark
+ * @vma: VMA to transition
  *
- * Clear XE_VMA_CPU_AUTORESET_ACTIVE. Must be done before first GPU PTE install.
+ * Clears CPU_AUTORESET_ACTIVE flag. Call xe_vm_madvise_gpu_touch() separately
+ * to deactivate the madvise notifier.
  */
 static inline void xe_vma_gpu_touch(struct xe_vma *vma)
 {
 	vma->gpuva.flags &= ~XE_VMA_CPU_AUTORESET_ACTIVE;
 }
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 4c0ffb100bcc..98663707d039 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -657,6 +657,9 @@ static bool xe_madvise_notifier_callback(struct mmu_interval_notifier *mni,
 	if (range->event != MMU_NOTIFY_UNMAP)
 		return true;
 
+	if (!atomic_read(&notifier->active))
+		return true;
+
 	/*
 	 * Best-effort: skip in non-blockable contexts to avoid building up work.
 	 * Correctness does not rely on this notifier - CPU_AUTORESET_ACTIVE flag
@@ -857,6 +860,7 @@ int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
 	notifier->vm = xe_vm_get(vm);
 	notifier->vma_start = start;
 	notifier->vma_end = end;
+	atomic_set(&notifier->active, 1);
 	INIT_LIST_HEAD(&notifier->list);
 
 	err = mmu_interval_notifier_insert(&notifier->mmu_notifier,
@@ -894,3 +898,45 @@ int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
 
 	return 0;
 }
+
+/**
+ * xe_vm_deactivate_madvise_notifier_for_range - Deactivate notifier for a range
+ * @vm: VM
+ * @start: Start address (page-aligned)
+ * @end: End address (page-aligned)
+ *
+ * Called when GPU touches a VMA - disables munmap processing for this range.
+ * Notifier remains registered but callback becomes a no-op until VM teardown.
+ */
+void xe_vm_deactivate_madvise_notifier_for_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_madvise_notifier *notifier;
+
+	/* Skip if madvise infrastructure not initialized */
+	if (!READ_ONCE(vm->svm.madvise_work.wq))
+		return;
+
+	mutex_lock(&vm->svm.madvise_notifiers.lock);
+	/* Deactivate overlapping notifiers (VMA splits may create multiple) */
+	list_for_each_entry(notifier, &vm->svm.madvise_notifiers.list, list) {
+		if (notifier->vma_start < end && notifier->vma_end > start)
+			atomic_set(&notifier->active, 0);
+	}
+	mutex_unlock(&vm->svm.madvise_notifiers.lock);
+}
+
+/**
+ * xe_vm_madvise_gpu_touch() - Deactivate madvise notifier on GPU touch
+ * @vm: VM
+ * @vma: VMA that was GPU-touched
+ *
+ * Deactivates the madvise notifier for this VMA's range after GPU touch.
+ * Call after xe_vma_gpu_touch() clears the CPU_AUTORESET_ACTIVE flag.
+ */
+void xe_vm_madvise_gpu_touch(struct xe_vm *vm, struct xe_vma *vma)
+{
+	if (vma->gpuva.flags & XE_VMA_MADV_AUTORESET)
+		xe_vm_deactivate_madvise_notifier_for_range(vm,
+							    xe_vma_start(vma),
+							    xe_vma_end(vma));
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index ba9cd7912113..91417062a33e 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -19,5 +19,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 int xe_vm_madvise_init(struct xe_vm *vm);
 void xe_vm_madvise_fini(struct xe_vm *vm);
 int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
+void xe_vm_deactivate_madvise_notifier_for_range(struct xe_vm *vm, u64 start, u64 end);
+void xe_vm_madvise_gpu_touch(struct xe_vm *vm, struct xe_vma *vma);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index eb978995000c..9cdae3492472 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -48,6 +48,8 @@ struct xe_madvise_notifier {
 	u64 vma_end;
 	/** @list: Link in vm->svm.madvise_notifiers.list */
 	struct list_head list;
+	/** @active: Cleared when GPU touches VMA to avoid callback overhead */
+	atomic_t active;
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-- 
2.43.0

