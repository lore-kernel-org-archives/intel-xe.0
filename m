Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDEDFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0DD10F30D;
	Thu, 30 Apr 2026 10:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4dKa+NK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622F10F310
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546442; x=1809082442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yyw22DdPkcmFXti/c8lY7MncDbDlZSDyp3x19V9/sNw=;
 b=f4dKa+NK7YsMYfE3zGTO09M8J5cV29z7/jJ+OWeQqYbin2M0Idk5r0qR
 TuF7K2Nr0uJ3+NXvASS6y/WILeXWutwRvhXURBXSIB5WA6v6ZRDrnIZ49
 46qPjXVRWjSOXhcBxgQZRtrA/fxDqWt6K9u7qNoxMoAI481TDGPFTAw9o
 ID35uGhUy9pbx1CuOCFfkieNn8P/CAPFdMH9oBjQdAnlJKupQhHkohgGn
 cgn5LNLHlJCwpEcx+RA5zfxQW0XM+Gk1sANLXdXbTzebPnJ/o9cNhM2rS
 JAc+mbLJJgMRYSx63pA7v7ppr6dN0871DHH7jrVSFe+M//V0ouISWwR4k A==;
X-CSE-ConnectionGUID: Y/TCFYAlSyeWVA23mSL3Bg==
X-CSE-MsgGUID: GP+5QuAyQlOPuiMTX/OSQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89586083"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89586083"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:54:02 -0700
X-CSE-ConnectionGUID: QwrJBLx7TgSk8Usc4SHDZA==
X-CSE-MsgGUID: ut9ei3TLQKqzVO7v+v5pQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518936"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:57 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 23/24] drm/xe/eudebug: Enable EU pagefault handling
Date: Thu, 30 Apr 2026 13:51:19 +0300
Message-ID: <20260430105121.712843-24-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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
    to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
    TD_CTL register)
    Not stalled (none-pagefaulted) eu threads enter SIP mode
(4) XE kmd installs temporal null page to the pagetable entry of the
    address where pagefault happened.
(5) XE kmd replies pagefault successful message to GUC
(6) stalled eu thread resumes as per pagefault condition has resolved
(7) resumed eu thread enters SIP mode due to force exception set by (3)
(8) adapted to consumer/produced pagefaults

As designed this feature to only work when eudbug is enabled, it should
have no impact to regular recoverable pagefault code path.

v2: - pf->q holds the vm ref so drop it (Mika)
    - streamline uapi (Mika)
    - cleanup the pagefault through producer if (Mika)
v3: - pagefault rework (Maciej)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h      |  8 +++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c |  5 ++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h | 14 +++++
 drivers/gpu/drm/xe/xe_guc_pagefault.c     |  7 +++
 drivers/gpu/drm/xe/xe_pagefault.c         | 77 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pagefault_types.h   |  9 +++
 6 files changed, 113 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5d9569d5fd1a..826132dcab22 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -305,12 +305,20 @@ struct xe_device {
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
 		struct workqueue_struct *pf_wq;
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+		/*
+		 * For EU Debug Pagefault workaround we need single queue
+		 * to properly handle/ack incoming pagefaults.
+		 */
+#define XE_PAGEFAULT_QUEUE_COUNT	1
+#else
 		/*
 		 * We pick 4 here because, in the current implementation, it
 		 * yields the best bandwidth utilization of the kernel paging
 		 * engine.
 		 */
 #define XE_PAGEFAULT_QUEUE_COUNT	4
+#endif
 		/** @usm.pf_queue: Page fault queues */
 		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
index 15389fcd042f..2c812b32c543 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
@@ -95,6 +95,11 @@ void *xe_eudebug_pagefault_get_private(void *private)
 	return private;
 }
 
+bool xe_eudebug_pagefault_owned(struct xe_pagefault *pf)
+{
+	return !!((u64)pf->producer.private & XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG);
+}
+
 int
 xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
 {
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
index c7434e1c3bd3..b05e6d074346 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
@@ -32,7 +32,12 @@ void xe_eudebug_pagefault_service(struct xe_pagefault *pf, int err);
 #define XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG	0x1
 void *xe_eudebug_pagefault_get_private(void *private);
 
+bool xe_eudebug_pagefault_owned(struct xe_pagefault *pf);
+
 void xe_eudebug_pagefault_signal(struct xe_file *xef);
+
+#define xe_eudebug_pagefault_vm_lock(vm) down_write(&(vm)->lock)
+#define xe_eudebug_pagefault_vm_unlock(vm) up_write(&(vm)->lock)
 #else
 
 static inline int
@@ -41,6 +46,11 @@ xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
 	return -EOPNOTSUPP;
 }
 
+static inline bool xe_eudebug_pagefault_owned(struct xe_pagefault *pf)
+{
+	return false;
+}
+
 static inline struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
 {
 	return NULL;
@@ -58,6 +68,10 @@ static inline void *xe_eudebug_pagefault_get_private(void *private)
 static inline void xe_eudebug_pagefault_signal(struct xe_file *xef)
 {
 }
+
+#define xe_eudebug_pagefault_vm_lock(vm) down_read(&(vm)->lock)
+#define xe_eudebug_pagefault_vm_unlock(vm) up_read(&(vm)->lock)
+
 #endif
 
 #endif /* _XE_EUDEBUG_PAGEFAULT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 038688ab63b4..9c00f3662e35 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -10,6 +10,7 @@
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_eudebug_pagefault.h"
 
 static void guc_ack_fault(struct xe_pagefault *pf, int err)
 {
@@ -41,8 +42,14 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
+static void guc_cleanup_fault(struct xe_pagefault *pf, int err)
+{
+	xe_eudebug_pagefault_service(pf, err);
+}
+
 static const struct xe_pagefault_ops guc_pagefault_ops = {
 	.ack_fault = guc_ack_fault,
+	.cleanup_fault = guc_cleanup_fault,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..265fbff85c07 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -10,6 +10,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
@@ -184,10 +185,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	/*
-	 * TODO: Change to read lock? Using write lock for simplicity.
-	 */
-	down_write(&vm->lock);
+	xe_eudebug_pagefault_vm_lock(vm);
 
 	if (xe_vm_is_closed(vm)) {
 		err = -ENOENT;
@@ -197,7 +195,15 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
 	if (!vma) {
 		err = -EINVAL;
-		goto unlock_vm;
+		if (!xe_eudebug_pagefault_create(vm, pf)) {
+			vma = xe_eudebug_create_vma(vm, pf);
+			if (IS_ERR(vma)) {
+				err = PTR_ERR(vma);
+				vma = NULL;
+			}
+		}
+		if (!vma)
+			goto unlock_vm;
 	}
 
 	if (xe_vma_read_only(vma) &&
@@ -217,7 +223,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 unlock_vm:
 	if (!err)
 		vm->usm.last_fault_vma = vma;
-	up_write(&vm->lock);
+	xe_eudebug_pagefault_vm_unlock(vm);
 	xe_vm_put(vm);
 
 	return err;
@@ -240,6 +246,49 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 	return found_fault;
 }
 
+static bool pagefault_match(struct xe_pagefault *pf,
+			    struct xe_pagefault *pf_to_match)
+{
+	if (pf_to_match->consumer.asid == pf->consumer.asid)
+		return true;
+	return false;
+}
+
+static bool xe_pagefault_queue_pop_if_match(struct xe_pagefault_queue *pf_queue,
+					    struct xe_pagefault *pf,
+					    struct xe_pagefault *pf_to_match)
+{
+	bool found_fault = false;
+	u32 ltail;
+
+	spin_lock_irq(&pf_queue->lock);
+	ltail = pf_queue->tail;
+	while (ltail != pf_queue->head && !found_fault) {
+		memcpy(pf, pf_queue->data + ltail, sizeof(*pf));
+
+		/* This will reorder the queue. */
+		if (pagefault_match(pf, pf_to_match)) {
+			if (ltail != pf_queue->tail) {
+				memcpy(pf_queue->data + ltail,
+				       pf_queue->data + pf_queue->tail,
+				       sizeof(*pf));
+			}
+			found_fault = true;
+		} else {
+			ltail = (ltail + xe_pagefault_entry_size()) %
+				pf_queue->size;
+		}
+	}
+
+	if (found_fault)
+		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
+			pf_queue->size;
+
+	spin_unlock_irq(&pf_queue->lock);
+
+	return found_fault;
+}
+
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
@@ -292,7 +341,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 {
 	struct xe_pagefault_queue *pf_queue =
 		container_of(w, typeof(*pf_queue), worker);
-	struct xe_pagefault pf;
+	struct xe_pagefault pf, pf_next;
 	unsigned long threshold;
 
 #define USM_QUEUE_MAX_RUNTIME_MS      20
@@ -320,6 +369,20 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		pf.producer.ops->ack_fault(&pf, err);
 
+		/*
+		 * EU Debugger: pagefault workaround needs to ACK all PFs
+		 * for a given VM to have proper status. Otherwise
+		 * the attention readout will be inacurate and any update
+		 * will be visible in attention worker later on.
+		 * For PF workaround EU Debugger runs in runalone mode.
+		 */
+		if (!err && xe_eudebug_pagefault_owned(&pf)) {
+			while (xe_pagefault_queue_pop_if_match(pf_queue, &pf_next, &pf))
+				pf.producer.ops->ack_fault(&pf_next, err);
+		}
+		if (pf.producer.ops->cleanup_fault)
+			pf.producer.ops->cleanup_fault(&pf, err);
+
 		if (time_after(jiffies, threshold)) {
 			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index ab38e135f23d..149e5989024e 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -43,6 +43,15 @@ struct xe_pagefault_ops {
 	 * sends the result to the HW/FW interface.
 	 */
 	void (*ack_fault)(struct xe_pagefault *pf, int err);
+
+	/**
+	 * @cleanup_fault: Cleanup for producer, if any
+	 * @pf: Page fault
+	 * @err: Error state of fault
+	 *
+	 * Page fault producer received cleanup request from consumer
+	 */
+	void (*cleanup_fault)(struct xe_pagefault *pf, int err);
 };
 
 /**
-- 
2.43.0

