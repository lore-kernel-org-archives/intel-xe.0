Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD8C55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2D10E131;
	Fri, 31 Jul 2026 02:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SS10Koww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEC210E131
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785464685; x=1817000685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nrcaDo4mrOwovX/20yr5+HJ30AMhBhdVdoOjH/JNfBI=;
 b=SS10KowwmJ9S6vkeakKEMl0ONZXx83+YnI/y1+lgbtiipLMLpom9D/AJ
 DNhC+sBX7Vx+qg0y2lCnPs3dnlKh02ktlueRWgdIFxTUm9dvf8vA5qu0u
 B2EByo0vJyrKaZTQRuUJoZLhw3YBIN937sPGtmjAl75bqYUuS2o6msf7D
 f5/QF+UZvjBMZB+STDPBjbdoduIedtE0DGTAB+xNixkPGzfFuTrFvXfqy
 Ycv2WzK71MWOa7QT7D0Pwt5hLiH11IhEI0QvsyQf4fWE+yEXi4P9I3nm2
 mNE7zxv87zEHE8pGjsxlQ8gWvTbgFRECKMTW5AhuDN8j24R1LL40oPXgO g==;
X-CSE-ConnectionGUID: w5I4maNWTtO79UrFYi/mWw==
X-CSE-MsgGUID: raoWw0mnSNOP36URxhFkPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88623485"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="88623485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:44 -0700
X-CSE-ConnectionGUID: vdwqtTsySFuVcp0fZat5zw==
X-CSE-MsgGUID: 0SKYJ8b+QtifRpbhjWkcHQ==
X-ExtLoop1: 1
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v6 1/8] drm/xe: Track exec queue priority band counts for user
 VMs
Date: Thu, 30 Jul 2026 19:24:32 -0700
Message-Id: <20260731022439.2446486-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731022439.2446486-1-matthew.brost@intel.com>
References: <20260731022439.2446486-1-matthew.brost@intel.com>
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

Add a per-priority-band count (LOW/NORMAL/HIGH) of exec queues
attached to a user VM in xe_vm_add_exec_queue()/xe_vm_remove_exec_queue(),
protected by vm->exec_queues.lock in write mode. KERNEL priority is
not counted since it is not possible for user exec queues.

This count is needed so a VM's private buffer objects can later be
prioritized for eviction based on the priority userspace has assigned
to the exec queues using that VM (i.e. work submitted at a higher
priority band implies its buffers are more important to keep
resident), rather than treating every VM the same.

Also move the has_ctx_tlb_inval check inside the lock in
xe_vm_add_exec_queue() so the list add/count update is properly
gated under the same critical section, and make
xe_vm_remove_exec_queue() bail out early if q->xef is not set,
rather than relying on callers to check this.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 31 ++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e0176861cb6..f2636fea4dec 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4946,8 +4946,9 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
  * @vm: The VM.
  * @q: The exec_queue
  *
- * Add exec queue to VM, skipped if the device does not have context based TLB
- * invalidations.
+ * Track exec queue's priority band count for the VM. Also links the exec
+ * queue onto the per-GT list, skipped if the device does not have context
+ * based TLB invalidations.
  */
 void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
@@ -4961,12 +4962,14 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(xe, vm->xef);
 	xe_assert(xe, vm == q->vm);
 
-	if (!xe->info.has_ctx_tlb_inval)
-		return;
-
 	down_write(&vm->exec_queues.lock);
-	list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q->gt->info.id]);
-	++vm->exec_queues.count[q->gt->info.id];
+	if (xe->info.has_ctx_tlb_inval) {
+		list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q->gt->info.id]);
+		++vm->exec_queues.count[q->gt->info.id];
+	}
+	if (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_LOW &&
+	    q->sched_props.priority <= XE_EXEC_QUEUE_PRIORITY_HIGH)
+		++vm->exec_queues.priority_count[q->sched_props.priority];
 	up_write(&vm->exec_queues.lock);
 }
 
@@ -4975,18 +4978,24 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  * @vm: The VM.
  * @q: The exec_queue
  *
- * Remove exec queue from VM, skipped if the device does not have context based
- * TLB invalidations.
+ * Untrack exec queue's priority band count for the VM. Also unlinks the
+ * exec queue from the per-GT list, skipped if the device does not have
+ * context based TLB invalidations. No-op if @q is not a user exec queue,
+ * or is a VM exec queue (VM exec queues are never tracked by
+ * xe_vm_add_exec_queue()).
  */
 void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	if (!vm->xe->info.has_ctx_tlb_inval)
+	if (!q->xef || (q->flags & EXEC_QUEUE_FLAG_VM))
 		return;
 
 	down_write(&vm->exec_queues.lock);
-	if (!list_empty(&q->vm_exec_queue_link)) {
+	if (vm->xe->info.has_ctx_tlb_inval && !list_empty(&q->vm_exec_queue_link)) {
 		list_del(&q->vm_exec_queue_link);
 		--vm->exec_queues.count[q->gt->info.id];
 	}
+	if (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_LOW &&
+	    q->sched_props.priority <= XE_EXEC_QUEUE_PRIORITY_HIGH)
+		--vm->exec_queues.priority_count[q->sched_props.priority];
 	up_write(&vm->exec_queues.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..d75546c4eb66 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -16,6 +16,7 @@
 #include <linux/scatterlist.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
 #include "xe_tlb_inval_types.h"
@@ -342,6 +343,12 @@ struct xe_vm {
 		 * per GT
 		 */
 		int count[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+		/**
+		 * @exec_queues.priority_count: count of exec queues attached
+		 * to this VM, per priority band (LOW / NORMAL / HIGH only,
+		 * KERNEL priority is not possible for user exec queues)
+		 */
+		int priority_count[XE_EXEC_QUEUE_PRIORITY_HIGH + 1];
 		/** @exec_queues.lock: lock to protect exec_queues list */
 		struct rw_semaphore lock;
 	} exec_queues;
-- 
2.34.1

