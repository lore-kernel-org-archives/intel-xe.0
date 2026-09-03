Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A560AC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5410F676;
	Thu,  3 Sep 2026 15:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcHfiAk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6028B10F68B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447730; x=1819983730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8mu/BOvlGB5+2EpRD/1UbCwbKEuMvxeO0MmyXQNcH6Q=;
 b=HcHfiAk5anL3xY6dAtR0KdKUP16JGf5LeHD/P6eVAUu3VPSnVfLUrfSs
 QNaRShDsEQz5N9MOdWxlVhc8vgdfuZk4Mh9IwdpX2Gc+gcfAi7bpXPMnO
 XVt/fcPWtMNriWD5liyi5syleaolT2R/gsSznneAu3yj7FbO4IGovOZdu
 VoitpOsP7rcyvczvZ7k+CKpicBbcbbyb6DILg4K63e1pPzTGvP3kjxMJq
 WGgXlc+dmQksMw3fkkPaki0rQKBVmD87XERssUo9gEmRxbIyyRj9v+QGk
 ngDFXOCdp8LJvSKRsrG+dNcbaXmflI2DLzpI3VhDpzPcE4oKxYQBp1SE1 w==;
X-CSE-ConnectionGUID: pYlTbBuiTjepJ5VnmqTrWA==
X-CSE-MsgGUID: p1LCR2/cR6KANdg7Ly/fPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91443573"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91443573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:02:10 -0700
X-CSE-ConnectionGUID: WeNvIqnNQiykcZsvHKfH+w==
X-CSE-MsgGUID: mijm87T+Tym3PiW8ozWm/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441675"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:02:05 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 27/27] drm/xe/eudebug: Enable EU pagefault handling
Date: Thu,  3 Sep 2026 17:59:51 +0300
Message-ID: <20260903145952.848051-28-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. To solve this problem, enable
EU pagefault handling functionality, which allows to unhalt pagefaulted
eu threads and to EU debugger to get inform about the eu attentions state
of EU threads during execution.

If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
after handling the pagefault.

The pagefault handling is a mechanism that allows a stalled EU thread to
enter SIP mode by installing a temporal null page to the page table entry
where the pagefault happened.

A brief description of the page fault handling mechanism flow between KMD
and the eu thread is as follows

(1) eu thread accesses unallocated address
(2) pagefault happens and eu thread stalls
(3) XE kmd set an force eu thread exception to allow the running eu thread
    to enter SIP mode (kmd set ForceException bit of TD_CTL register)
    Not stalled (none-pagefaulted) eu threads enter SIP mode
(4) XE kmd installs temporal null page to the pagetable entry of the
    address where pagefault happened.
(5) XE kmd replies pagefault successful message to GUC
(6) When a given pagefault is fully handled temporary NULL VMA is
    removed.
(7) If multiple threads caused a pagefault and this is reflected in
    pagefault queue or worker's cache then the first pagefault
    finalization is postponed but the worker is released
(8) All subsequent pagefaults for a given VM are handled by eudebug by
    inserting NULL VMA, ACK and then remove the temporary VMA
(9) stalled eu thread resumes as per pagefault condition has resolved
(10) resumed eu thread enters SIP mode due to force exception set
     by (3)
(9) When there are no more pagefault to process the first pagefault
    finalization is performed and event is send.

As designed this feature to only work when eudbug is enabled, it should
have no impact to regular recoverable pagefault code path.

v2: - pf->q holds the vm ref so drop it (Mika)
    - streamline uapi (Mika)
    - cleanup the pagefault through producer if (Mika)
v3: - pagefault rework (Maciej)

Assisted-by: GitHub Copilot CLI:claude-opus-4.7
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c |  25 ++++-
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h |   6 +-
 drivers/gpu/drm/xe/xe_eudebug_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_pagefault.c     |  10 +-
 drivers/gpu/drm/xe/xe_pagefault.c         | 106 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pagefault_types.h   |   3 +-
 6 files changed, 142 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
index 5ad37e757f69..f64e1974c86d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
@@ -139,8 +139,18 @@ void *xe_eudebug_pagefault_get_private(void *private)
 	return private;
 }
 
+static void
+eudebug_try_svm_remap(struct xe_vm *vm, struct xe_vma *vma)
+{
+	if (xe_vm_insert_vma(vm, vma)) {
+		xe_vm_destroy_vma(vma);
+		xe_vm_kill(vm, true);
+	}
+}
+
 int
-xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
+xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_vma *vma,
+			   struct xe_pagefault *pf)
 {
 	struct pagefault_fence *pf_fence;
 	struct xe_eudebug_pagefault *epf;
@@ -170,6 +180,9 @@ xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
 	if (!xe_exec_queue_is_debuggable(q))
 		goto err_put_exec_queue;
 
+	if (vma && !xe_vma_is_cpu_addr_mirror(vma))
+		goto err_put_exec_queue;
+
 	/**
 	 * Check if there is an active pagefault.
 	 * If so, attach original epf to current pagefault and leave.
@@ -267,6 +280,7 @@ xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
 	epf->fault.access_type = pf->consumer.access_type;
 
 	pagefault_set_private(pf, epf);
+	epf->svm_vma = vma;
 
 	return 0;
 
@@ -352,6 +366,11 @@ static void destroy_pagefault(struct xe_eudebug_pagefault *epf)
 		eudebug_destroy_vma(epf->q->vm, epf->null_vma);
 	}
 
+	if (epf->svm_vma) {
+		lockdep_assert_held(&epf->q->vm->lock);
+		eudebug_try_svm_remap(epf->q->vm, epf->svm_vma);
+	}
+
 	xe_exec_queue_put(epf->q);
 	if (epf->d)
 		xe_eudebug_put(epf->d);
@@ -370,6 +389,10 @@ static void queue_pagefault(struct xe_eudebug *d,
 		epf->null_vma = NULL;
 	}
 
+	if (epf->svm_vma) {
+		eudebug_try_svm_remap(epf->q->vm, epf->svm_vma);
+		epf->svm_vma = NULL;
+	}
 	list_add_tail(&epf->link, &d->pf.pagefaults);
 	mutex_unlock(&d->pf.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
index 927c9b83457c..976c8a88b9ba 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
@@ -13,13 +13,15 @@ struct xe_gt;
 struct xe_pagefault;
 struct xe_eudebug_pagefault;
 struct xe_vm;
+struct xe_vma;
 struct xe_file;
 
 void xe_eudebug_pagefault_fini(struct xe_eudebug *d);
 int xe_eudebug_handle_pagefaults(struct xe_gt *gt);
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
-int xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf);
+int xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_vma *vma,
+			       struct xe_pagefault *pf);
 struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf);
 void xe_eudebug_pagefault_end(void *private, int err);
 /*
@@ -40,7 +42,7 @@ bool xe_eudebug_pagefault_creatable(struct xe_gt *gt, struct xe_vm *vm);
 #else
 
 static inline int
-xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
+xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_vma *vma, struct xe_pagefault *pf)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 12711f507ddc..2f364aa48ab7 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -274,6 +274,11 @@ struct xe_eudebug_pagefault {
 	 * when pagefault is handled.
 	 */
 	struct xe_vma *null_vma;
+	/**
+	 * @svm_vma: After handling SVM pagefault original mapping shall be restored.
+	 * The svm_vma is the vma which was removed from original SVM mapping.
+	 */
+	struct xe_vma *svm_vma;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 8f8210a732e9..12a8fb4db134 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -9,12 +9,13 @@
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_eudebug_pagefault.h"
 
 #define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
 
 static void guc_ack_fault_begin(void *private)
 {
-	struct xe_guc *guc = private;
+	struct xe_guc *guc = xe_eudebug_pagefault_get_private(private);
 
 	xe_guc_ct_lock(&guc->ct);
 
@@ -51,7 +52,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
 		FIELD_PREP(PFR_PDATA, pdata),
 	};
-	struct xe_guc *guc = pf->producer.private;
+	struct xe_guc *guc = xe_eudebug_pagefault_get_private(pf->producer.private);
 	bool write_only = guc->pagefault_ack_counter++ &
 		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
 
@@ -59,13 +60,14 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 			      write_only);
 }
 
-static void guc_ack_fault_end(void *private)
+static void guc_ack_fault_end(void *private, int err)
 {
-	struct xe_guc *guc = private;
+	struct xe_guc *guc = xe_eudebug_pagefault_get_private(private);
 
 	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
 		xe_guc_ct_send_flush(&guc->ct);
 	xe_guc_ct_unlock(&guc->ct);
+	xe_eudebug_pagefault_end(private, err);
 }
 
 static const struct xe_pagefault_ops guc_pagefault_ops = {
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 27c3a90e4e73..348ebda5a5fc 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -10,6 +10,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
@@ -227,8 +228,56 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 
 	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
 	if (!vma) {
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+retry_eudebug_pf:
+#endif
 		err = -EINVAL;
-		goto unlock_vm;
+		if (!xe_eudebug_pagefault_start(vm, vma, pf)) {
+			/*
+			 * This section is reachable only when eudebug is connected.
+			 * It's rather safe since page faults hitting same vma
+			 * are chained. Only the first one will be fully processed.
+			 *
+			 * For SVM retry case we're holding vm write lock
+			 */
+			if (!vma) {
+				up_read(&vm->lock);
+				down_write(&vm->lock);
+				/* The lock was dropped, re-check the vma */
+				vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
+				if (vma) {
+					err = -EINVAL;
+					downgrade_write(&vm->lock);
+					goto unlock_vm;
+				}
+			}
+			vma = xe_eudebug_create_vma(vm, pf);
+			downgrade_write(&vm->lock);
+			if (IS_ERR(vma)) {
+				err = PTR_ERR(vma);
+				vma = NULL;
+			}
+		} else if (vma) {
+			/*
+			 * xe_eudebug_pagefault_start() failed on svm retry.
+			 * Need to insert again vma.
+			 * Write-lock is still held so no error expected.
+			 */
+			xe_vm_insert_vma(vm, vma);
+			vma = NULL;
+			downgrade_write(&vm->lock);
+		}
+		if (!vma)
+			goto unlock_vm;
+	} else {
+		/*
+		 * For non-SVM case:
+		 * Eudebug with active pagefault always needs to be attached
+		 * to pagefault since it waits for all pagefaults with matching
+		 * asid to be resolved.
+		 */
+		if (!xe_vma_is_cpu_addr_mirror(vma))
+			xe_eudebug_pagefault_set_private(pf, vm);
 	}
 
 	if (xe_vma_read_only(vma) &&
@@ -239,11 +288,52 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 
 	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
 
-	if (xe_vma_is_cpu_addr_mirror(vma))
+	if (xe_vma_is_cpu_addr_mirror(vma)) {
 		err = xe_svm_handle_pagefault(vm, vma, pf, gt,
 					      pf->consumer.page_addr, atomic);
-	else
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+		/*
+		 * If err is -ENOENT, it means that the cpu-address-space-mirrored
+		 * xe vma exists, but there is no mm vma allocated in
+		 * the CPU address space. This indicates that no memory has been
+		 * allocated in the CPU address space.
+		 */
+		if (err == -ENOENT &&
+		    !xe_vm_is_closed_or_banned(vm) &&
+		    xe_eudebug_pagefault_creatable(gt, vm)) {
+			u32 page_size = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
+
+			/*
+			 * This section is reachable only when eudebug is connected.
+			 *
+			 * Up until now there was a read-lock. Now entering write-lock.
+			 * Under new lock a vma split may occur. This means that before
+			 * entering write-lock a origin vma could be already split.
+			 * Update the vma to get current one before subtracting.
+			 */
+			up_read(&vm->lock);
+			down_write(&vm->lock);
+			vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
+			if (vma && xe_vma_is_cpu_addr_mirror(vma))
+				vma = xe_vm_svm_vma_subtract(vm, vma,
+							     pf->consumer.page_addr,
+							     pf->consumer.page_addr + page_size);
+			else
+				vma = ERR_PTR(-EINVAL);
+
+			if (IS_ERR(vma)) {
+				downgrade_write(&vm->lock);
+				err = PTR_ERR(vma);
+			} else {
+				/* keep the write lock for vma */
+				goto retry_eudebug_pf;
+			}
+		}
+#endif
+	} else {
 		err = xe_pagefault_handle_vma(gt, vma, pf, atomic);
+	}
 
 unlock_vm:
 	up_read(&vm->lock);
@@ -565,7 +655,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
 		const struct xe_pagefault_ops *ops = pf->producer.ops;
-		void *private = pf->producer.private;
+		void *private;
 		struct xe_gt *gt = pf->gt;
 		u32 asid = pf->consumer.asid;
 		int err = 0;
@@ -598,6 +688,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		}
 
 ack_fault:
+		/*
+		 * set private after xe_pagefault_service() since eudebug could swap
+		 * the pf->producer.private field. Also needed when cache was hit.
+		 */
+		private = pf->producer.private;
+
 		xe_assert(xe, pf->consumer.alloc_state ==
 			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
 		xe_assert(xe, pf == pf_work->cache.pf);
@@ -637,7 +733,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 			spin_unlock_irq(&pf_queue->lock);
 		}
-		ops->ack_fault_end(private);
+		ops->ack_fault_end(private, err);
 
 		if (time_after(jiffies, threshold)) {
 			queue_work(xe->usm.pagefault_wq, w);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index c7ff08408e43..8067724a2c66 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -53,10 +53,11 @@ struct xe_pagefault_ops {
 	/**
 	 * @ack_fault_end: Ack fault end
 	 * @private: producer private data
+	 * @err: Error state of fault
 	 *
 	 * Page fault producer ends acknowledgment from the consumer.
 	 */
-	void (*ack_fault_end)(void *private);
+	void (*ack_fault_end)(void *private, int err);
 };
 
 /**
-- 
2.53.0

