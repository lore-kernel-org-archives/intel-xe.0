Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A785606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=es+f1mzK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D93410E76C;
	Fri, 13 Nov 2026 07:36:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8410E76C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794555362; x=1826091362;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=snIYelmK3CxcGA7oiuigjVJm1oEk6jeXj+sJTWpaJ7g=;
 b=es+f1mzKfS+LVSpvcD4Wj1fwBGr4T7PdbOokUQS0mZEizqdcmNoA0pze
 Jjwp3v609IsFNEbMUxenYgU3eqF912vHKe3Mj7cuOX3/0Gqc74VQHXYZN
 GRbQCEfNsYFMnsS1Oc3Fn6dcBdfcHfk5426c6kQOgzlvJ7Vs3SWMWFGWI
 1y/4pZxFjJbesDIspYGv5iu2m/JY/2YD8dpIR4UEu6dAG4Jz9bnR4oy65
 dSojqJTJWBgVWBzwrE0lrXUob0gvedxzASgoKO+MGH29SsJzrEFrrZ6P2
 AyMTXzh83mJK2s3SF9DFTeK5/AQqWItJ5T6FfCLYlN9sKJYr6xy7kzmLE g==;
X-CSE-ConnectionGUID: O5olJD7QTbKYvZlIrrYv3A==
X-CSE-MsgGUID: KkFNGWVRSIqko4kxpCXjjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3347935"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3347935"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:36:01 -0800
X-CSE-ConnectionGUID: rIcpMESaT5aCoRe3ij/KkQ==
X-CSE-MsgGUID: gRHmaIlAQHihf409c4YqhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9030593"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:36:00 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/3] CI_ONLY Mark VMs as closing before queue cleanup
Date: Fri, 13 Nov 2026 13:05:48 +0530
Message-ID: <20261113073549.352746-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113073549.352746-1-arvind.yadav@intel.com>
References: <20261113073549.352746-1-arvind.yadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Queue cleanup is asynchronous. VM work can still run while file close
or VM destroy is stopping the queues.

Add a CLOSING state and set it before queue cleanup starts. Reject
new exec, bind, rebind and page-fault work on closing VMs without
removing their mappings yet.

Cached faults bypass xe_pagefault_service(), so also check VM state
at the common acknowledgment path. Hold vm->lock for read through
successful reply submission to serialize it with the closing
transition. Invalidate the local cache when that check fails.

Keep vm->size valid so SVM invalidation can still drain existing
mappings, but stop adding new SVM garbage-collector work once close
starts. Also reject page faults on banned VMs.

v3:
- Check VM state before replying to cached and chained faults (Tejas).
- Hold vm->lock through successful reply submission and invalidate
  the local cache when the VM lookup or state check fails. (Sashiko)
- Report faults rejected by the final VM-state check. (Sashiko)
- Preserve the original fault details when service replaces them with
  the resolved range. (Sashiko)
- Account for failed prefetches and invalidate the local cache on failure.
  (Sashiko)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    |  4 ++
 drivers/gpu/drm/xe/xe_pagefault.c | 85 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.c       |  3 +-
 drivers/gpu/drm/xe/xe_vm.c        | 18 ++++++-
 drivers/gpu/drm/xe/xe_vm.h        |  9 +++-
 drivers/gpu/drm/xe/xe_vm_types.h  |  1 +
 6 files changed, 103 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 273e2c45fea9..1ef9e276bbca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -181,6 +181,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 
 	guard(xe_pm_runtime)(xe);
 
+	/* Block new VM work before starting asynchronous queue teardown. */
+	xa_for_each(&xef->vm.xa, idx, vm)
+		xe_vm_close_start(vm);
+
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
 	 * when FD is closing as IOCTLs presumably can't be modifying the
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 98cce0f12b12..ac05e7b6315d 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -291,7 +291,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 
 	down_read(&vm->lock);
 
-	if (xe_vm_is_closed(vm)) {
+	if (xe_vm_is_closed_or_banned(vm)) {
 		err = -ENOENT;
 		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VM_CLOSED);
 		goto unlock_vm;
@@ -678,32 +678,35 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
 		const struct xe_pagefault_ops *ops = pf->producer.ops;
+		struct xe_vm *ack_vm = NULL;
 		void *private = pf->producer.private;
 		struct xe_gt *gt = pf->gt;
 		u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
+		struct xe_pagefault original = {
+			.gt = gt,
+			.consumer = {
+				.page_addr = pf->consumer.page_addr,
+				.access_type = pf->consumer.access_type,
+				.fault_type_level = pf->consumer.fault_type_level,
+				.engine_class_instance =
+					pf->consumer.engine_class_instance,
+				.id = pf->consumer.id,
+			},
+		};
+		struct xe_pagefault *report_pf = pf;
 		int err = 0;
 		bool invalidated = false;
+		bool cache_hit = false;
 
 		/* Last fault same address, ack immediately */
 		if (xe_pagefault_match(pf, cache_start, cache_end, cache_asid)) {
-			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
+			cache_hit = true;
 			goto ack_fault;
 		}
 
 		err = xe_pagefault_service(pf);
 
-		if (err) {
-			if (!(pf->consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
-				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
-				xe_pagefault_cache_start_invalidate(cache_start);
-				xe_pagefault_print(pf);
-				xe_log_err_info(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
-			} else {
-				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
-				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
-					  ERR_PTR(err));
-			}
-		} else {
+		if (!err) {
 			/* Cache valid fault locally */
 			cache_start = xe_pagefault_start_addr(pf);
 			cache_end = xe_pagefault_end_addr(pf);
@@ -711,6 +714,55 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		}
 
 ack_fault:
+		/*
+		 * Cache hits bypass fault service. Serialize successful replies
+		 * with VM close, including replies to matching chained faults.
+		 * Take vm->lock before ack_fault_begin() takes the CT lock and
+		 * hold it until ack_fault_end() flushes the reply batch.
+		 */
+		if (!err) {
+			/*
+			 * Successful service may replace the fault fields with
+			 * the resolved range. Use the original fields to report
+			 * a failure detected here. Do not restore the live entry,
+			 * which also contains queue state and chain links.
+			 */
+			report_pf = &original;
+			ack_vm = xe_pagefault_asid_to_vm(report_pf, asid);
+			if (IS_ERR(ack_vm)) {
+				err = PTR_ERR(ack_vm);
+				ack_vm = NULL;
+			} else {
+				down_read(&ack_vm->lock);
+				if (xe_vm_is_closed_or_banned(ack_vm)) {
+					xe_pagefault_set_error(report_pf,
+							       XE_PAGEFAULT_ERROR_VM_CLOSED);
+					err = -ENOENT;
+					up_read(&ack_vm->lock);
+					xe_vm_put(ack_vm);
+					ack_vm = NULL;
+				}
+			}
+		}
+
+		if (err) {
+			xe_pagefault_cache_start_invalidate(cache_start);
+			if (!(report_pf->consumer.access_type &
+			      XE_PAGEFAULT_ACCESS_PREFETCH)) {
+				xe_pagefault_save_to_vm(xe, report_pf);
+				xe_pagefault_print(report_pf);
+				xe_log_err_info(gt, PAGEFAULT, err,
+						"Unsuccessful response\n");
+			} else {
+				xe_gt_stats_incr(gt,
+						 XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
+				xe_gt_dbg(gt, "Prefetch Fault response: Unsuccessful %pe\n",
+					  ERR_PTR(err));
+			}
+		} else if (cache_hit) {
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
+		}
+
 		xe_assert(xe, pf->consumer.alloc_state ==
 			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
 		xe_assert(xe, pf == pf_work->cache.pf);
@@ -752,6 +804,11 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		}
 		ops->ack_fault_end(private);
 
+		if (ack_vm) {
+			up_read(&ack_vm->lock);
+			xe_vm_put(ack_vm);
+		}
+
 		if (time_after(jiffies, threshold)) {
 			queue_work(xe->usm.pagefault_wq, w);
 			break;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bc6902b5bf57..62ccb2fe6f8f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -219,7 +219,8 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 
 	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &(to_xe_range(r)->pages),
 			       drm_gpusvm_range_size(r) >> PAGE_SHIFT, &ctx);
-	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
+	if (!xe_vm_is_closed(vm) && !xe_vm_is_closing(vm) &&
+	    mmu_range->event == MMU_NOTIFY_UNMAP)
 		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
 						   mmu_range);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12afb3363e79..e6e53912448f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1976,6 +1976,20 @@ static void xe_vm_close(struct xe_vm *vm)
 		drm_dev_exit(idx);
 }
 
+void xe_vm_close_start(struct xe_vm *vm)
+{
+	down_write(&vm->lock);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_lock(vm);
+
+	/* Keep size valid so SVM invalidation still performs its full drain. */
+	vm->flags |= XE_VM_FLAG_CLOSING;
+
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_unlock(vm);
+	up_write(&vm->lock);
+}
+
 void xe_vm_close_and_put(struct xe_vm *vm)
 {
 	LIST_HEAD(contested);
@@ -2273,8 +2287,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 		xa_erase(&xef->vm.xa, args->vm_id);
 	mutex_unlock(&xef->vm.lock);
 
-	if (!err)
+	if (!err) {
+		xe_vm_close_start(vm);
 		xe_vm_close_and_put(vm);
+	}
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b1c5f940bcc5..c90c9dc1351c 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -59,6 +59,11 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
 	return !vm->size;
 }
 
+static inline bool xe_vm_is_closing(struct xe_vm *vm)
+{
+	return vm->flags & XE_VM_FLAG_CLOSING;
+}
+
 static inline bool xe_vm_is_banned(struct xe_vm *vm)
 {
 	return vm->flags & XE_VM_FLAG_BANNED;
@@ -67,7 +72,8 @@ static inline bool xe_vm_is_banned(struct xe_vm *vm)
 static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
 {
 	lockdep_assert_held(&vm->lock);
-	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
+	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm) ||
+		xe_vm_is_closing(vm);
 }
 
 struct xe_vma *
@@ -214,6 +220,7 @@ int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
+void xe_vm_close_start(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fb9305124679..6ca9ef9d0c0b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -286,6 +286,7 @@ struct xe_vm {
 #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
 #define XE_VM_FLAG_GSC			BIT(8)
 #define XE_VM_FLAG_NO_VM_OVERCOMMIT     BIT(9)
+#define XE_VM_FLAG_CLOSING		BIT(10)
 	unsigned long flags;
 
 	/**
-- 
2.43.0

