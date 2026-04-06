Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0CDEF4EC9
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B3B10E22A;
	Mon,  6 Apr 2026 08:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0kTQE9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8D710E22E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465934; x=1807001934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=obsSe2PYCv3f5H9dlLAUP46+kZ4JtQgcY12MQ1BdIoA=;
 b=N0kTQE9xNuMLT9rNoj0c3FhT66MLWzkDzSYXGTJ+ZnD/GF+iomqH9SJN
 Q5vfoGZ3G4Wrg2V/LmNvOS3EWs40iqsSHAdeY1Zs09JXEA4RGvbTf/2Jq
 pC/4FuR4//WOT6OGU9cxkWm0aBXVU8gIDfyGUdlIFgi9Na4Jtqwh59rpd
 Agt4Wt5tH5ShUt2JIM4Gaz/odloEFRcoK/wzO15VULn11OpUdAmO9pyYb
 phZNm9Xq3yGNf2iwN7jgFgMpgBevUNRY3IMz3R7hB3EfzEDuWFiFg23yO
 R6n3JkksNWS+qsN17TijcYK58oLKwY4xNUtE8OUfw/p3KW6lX6T/71Z15 Q==;
X-CSE-ConnectionGUID: vtYp39fNStyPI49u1HXJSA==
X-CSE-MsgGUID: DKZweIE+SUqtR1s3r313QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012895"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:53 -0700
X-CSE-ConnectionGUID: kcHWFC8/Tf2PlYq4njv3bA==
X-CSE-MsgGUID: uNZdwZE+RVGPT8aX97SpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775213"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:51 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 6/7] drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM
 lifecycle
Date: Mon,  6 Apr 2026 14:28:29 +0530
Message-ID: <20260406085830.1118431-7-arvind.yadav@intel.com>
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

Initialise MADVISE_AUTORESET notifier infrastructure for fault-mode VMs
in xe_svm_init() and tear it down during VM close.

Drop vm->lock around xe_vm_madvise_fini() since the madvise worker
takes vm->lock, then retake it for xe_svm_fini().

Register interval notifiers outside vm->lock; vm->lock is only taken for
deduplication and maple tree insertion. The callback only queues work.

Skip SVM PTE zapping for cpu_addr_mirror VMAs with
cpu_autoreset_active set since no GPU mappings exist yet.

If notifier registration fails, log and skip autoreset for that VMA.

v2:
  - Register notifiers outside vm->lock; take vm->lock only for dedup and
    mtree_store_range. (Matt)
  - Collect VMA ranges under vm->lock and register notifiers after
    unlock. (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |  9 +++++
 drivers/gpu/drm/xe/xe_vm.c         | 12 ++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 60 +++++++++++++++++++++++++++++-
 3 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b6544947d861..89668ada38ca 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -914,6 +914,15 @@ int xe_svm_init(struct xe_vm *vm)
 			drm_pagemap_release_owner(&vm->svm.peer);
 			return err;
 		}
+
+		/* Initialize madvise notifier infrastructure after gpusvm */
+		err = xe_vm_madvise_init(vm);
+		if (err) {
+			drm_gpusvm_fini(&vm->svm.gpusvm);
+			xe_svm_put_pagemaps(vm);
+			drm_pagemap_release_owner(&vm->svm.peer);
+			return err;
+		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
 				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 65425f2f1bf1..a2a4ffdcf7bf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1788,6 +1788,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 err_svm_fini:
 	if (flags & XE_VM_FLAG_FAULT_MODE) {
 		vm->size = 0; /* close the vm */
+		/* ok to call even if madvise_init() never ran, fini is a no-op then. */
+		xe_vm_madvise_fini(vm);
 		xe_svm_fini(vm);
 	}
 err_no_resv:
@@ -1932,6 +1934,16 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	/* Drop vm->lock around madvise fini; workers take vm->lock. */
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	up_write(&vm->lock);
+
+	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
+		xe_vm_madvise_fini(vm);
+
+	/* Retake vm->lock for xe_svm_fini(); required by drm_gpusvm. */
+	down_write(&vm->lock);
+
 	xe_svm_fini(vm);
 
 	up_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 4c57cac63d13..e526819d0a12 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -28,6 +28,7 @@ struct xe_vmas_in_madvise_range {
 	int num_vmas;
 	bool has_bo_vmas;
 	bool has_svm_userptr_vmas;
+	bool has_cpu_addr_mirror_vmas;
 };
 
 /**
@@ -70,7 +71,11 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
 
 		if (xe_vma_bo(vma))
 			madvise_range->has_bo_vmas = true;
-		else if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_userptr(vma))
+		else if (xe_vma_is_cpu_addr_mirror(vma)) {
+			/* CPU mirror VMAs also require SVM notifier locking. */
+			madvise_range->has_svm_userptr_vmas = true;
+			madvise_range->has_cpu_addr_mirror_vmas = true;
+		} else if (xe_vma_is_userptr(vma))
 			madvise_range->has_svm_userptr_vmas = true;
 
 		if (madvise_range->num_vmas == max_vmas) {
@@ -439,7 +444,13 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 			continue;
 
 		if (xe_vma_is_cpu_addr_mirror(vma)) {
-			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+			/*
+			 * cpu_autoreset_active == true means no GPU PTEs exist
+			 * yet; skip to avoid zapping non-existent mappings.
+			 * Once GPU-touched, the bit clears and SVM zap applies.
+			 */
+			if (!xe_vma_has_cpu_autoreset_active(vma))
+				tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
 								      xe_vma_start(vma),
 								      xe_vma_end(vma));
 		} else {
@@ -693,6 +704,11 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct drm_exec exec;
 	int err, attr_type;
 	bool do_retained;
+	struct {
+		u64 start;
+		u64 end;
+	} *notifier_ranges = NULL;
+	int num_notifier_ranges = 0;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
 	if (XE_IOCTL_DBG(xe, !vm))
@@ -815,6 +831,31 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
 
+	if (err)
+		goto err_fini;
+
+	if (madvise_range.has_cpu_addr_mirror_vmas) {
+		notifier_ranges = kmalloc_array(madvise_range.num_vmas,
+						sizeof(*notifier_ranges), GFP_KERNEL);
+		if (!notifier_ranges) {
+			err = -ENOMEM;
+			goto err_fini;
+		}
+		for (int i = 0; i < madvise_range.num_vmas; i++) {
+			struct xe_vma *vma = madvise_range.vmas[i];
+
+			if (!xe_vma_is_cpu_addr_mirror(vma))
+				continue;
+			if (!(vma->gpuva.flags & XE_VMA_MADV_AUTORESET))
+				continue;
+			if (!xe_vma_has_cpu_autoreset_active(vma))
+				continue;
+			notifier_ranges[num_notifier_ranges].start = xe_vma_start(vma);
+			notifier_ranges[num_notifier_ranges].end   = xe_vma_end(vma);
+			num_notifier_ranges++;
+		}
+	}
+
 err_fini:
 	if (madvise_range.has_bo_vmas)
 		drm_exec_fini(&exec);
@@ -826,6 +867,21 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 unlock_vm:
 	up_write(&vm->lock);
 
+	if (!err) {
+		/* notifier_ranges may be NULL here; loop and kfree are safe. */
+		for (int i = 0; i < num_notifier_ranges; i++) {
+			int ret = xe_vm_madvise_register_notifier_range(vm,
+							notifier_ranges[i].start,
+							notifier_ranges[i].end);
+			if (ret)
+				drm_warn(&vm->xe->drm,
+					 "Failed to register madvise notifier [%#llx-%#llx]: %d\n",
+					 notifier_ranges[i].start,
+					 notifier_ranges[i].end, ret);
+		}
+	}
+	kfree(notifier_ranges);
+
 	/* Write retained value to user after releasing all locks */
 	if (!err && do_retained)
 		err = xe_madvise_purgeable_retained_to_user(&details);
-- 
2.43.0

