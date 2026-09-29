Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A377ACA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 14:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE3C10EF17;
	Tue, 29 Sep 2026 14:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM0fY2m5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5DF10EF17
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790692182; x=1822228182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ETVBR+YbkjihPPn+hgz7c9HS4OBFL1+C7JkP9v4LtHQ=;
 b=YM0fY2m5sP3qcl54IYAuvvEZ+EgCeXcW/77GZYbTjGyS2A5MhOyjLC2U
 w4hlTMBhMg74O7buVr5zN9TdLxRzQaTSEd64d672Nxx9K2L89PV6UmyE+
 GW3eFhNQmtquRNKWTLIU333fz1TAgOHtYHAXW4PwSz1ysP1755gZGKDgT
 AbH4zNhHiD11zBuEFeRlY1QWjqoyS4NwErw3iuKdjQiw81roz2cj2Jlxm
 R8vbKuLs1I2uwN/5Semt6KVipOj/BFl4e+1LmXuQIIIVWiamc6bRCG7sy
 FMriP/DZeevBYkYqeTUzzFahIsOZPgdbbsF+sR/86eTmO8bVyKuvbfrue Q==;
X-CSE-ConnectionGUID: 6CAkreCZSsSGJzLKzhelYg==
X-CSE-MsgGUID: ro+YrCS3SAOCMh4rs4foLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90541151"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90541151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 07:29:42 -0700
X-CSE-ConnectionGUID: y34fShtzTMmh0Jm2pzYAdg==
X-CSE-MsgGUID: Je/Cn8LJRA+1HAQz7DrP9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="278732072"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.222])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 07:29:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Route deferred xe_vma/xe_vm teardown off
 system_dfl_wq
Date: Tue, 29 Sep 2026 16:29:09 +0200
Message-ID: <20260929142910.47480-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
References: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
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

xe_vma_destroy() can defer the final teardown of a struct xe_vma to a
dma_fence completion callback (vma_destroy_cb()), and xe_vm_free() (the
drm_gpuvm_ops.vm_free callback) always defers struct xe_vm teardown to
a work item, since destroying a VM needs to sleep. Both used to queue
their work on system_dfl_wq, a global, kernel-wide workqueue that xe
has no control over and never waits on during module unload.

drm_gpuvm_free() drops its drm_device reference immediately after
calling xe_vm_free(), without waiting for the deferred work to run.
The same applies one level down: whichever xe_vma or xe_vm reference
happens to be the last one can trigger this chain from a dma_fence
callback that may fire at an arbitrary time, including after the
owning file has already been closed and its own module reference
dropped. Since nothing tracks or waits for work queued on
system_dfl_wq, `rmmod xe` could succeed and free the module's text
while vma_destroy_work_func() or vm_destroy_work_func() is still
queued or running on it, jumping into freed code.

Fix xe_vm_free() by queueing its work on the per-device xe->destroy_wq
instead. drm_gpuvm still holds a drm_device reference at the point
xe_vm_free() runs (it is only dropped after xe_vm_free() returns), so
xe->destroy_wq is guaranteed to still be alive and to be drained by
xe_device_destroy() before the device, and hence xe->destroy_wq
itself, goes away.

vma_destroy_cb() cannot use the same per-device queue:
xe_vma_destroy_late(), run from that work, can itself drop the last
reference to the owning xe_vm, which would recursively trigger
xe_vm_free() and queue work on the same xe->destroy_wq that is
currently executing this work item, deadlocking
xe_device_destroy()'s destroy_workqueue(xe->destroy_wq) call against
itself. Fix this one by queueing on xe_destroy_wq instead, the
module-lifetime workqueue already used for GuC exec queue teardown.
Unlike the per-device queue, this requires no dereference of a struct
xe_device that may already be gone by the time the deferred callback
fires, and unlike system_dfl_wq it is guaranteed to be drained by
xe_destroy_wq_module_exit() before the module is unloaded, following
the drm_pagemap_dev_hold()/unhold_work precedent of using a workqueue
that is waited on at module unload rather than a bare module
reference. The previous commit's reordering of xe_destroy_wq_exit()
to run after xe_device_exit() guarantees that xe_destroy_wq is only
torn down once the device-count has reached zero, i.e. after any
xe_vma whose teardown queues work here has already dropped its
drm_device reference and thus already queued that work.

v4:
- Add code comments
- Use the xe->destroy_wq for vm->destroy_work (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Assisted-by: LLM
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c |  6 ++++--
 drivers/gpu/drm/xe/xe_vm.c     | 18 +++++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index c61bd33546f2..897724cb5cfb 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -114,8 +114,10 @@ static void xe_destroy_wq_module_exit(void)
  * xe_destroy_wq_queue() - Queue work on the destroy workqueue
  * @work: work item to queue
  *
- * The destroy workqueue has module lifetime and is used for GuC exec queue
- * teardown that can outlive a single xe_device. SVM pagemap destroy uses the
+ * The destroy workqueue has module lifetime, and is guaranteed to outlive
+ * any xe_device, and to be drained before the module is unloaded. It is used
+ * for GuC exec queue and xe_vm/xe_vma teardown that can be deferred past the
+ * lifetime of the xe_device that triggered it. SVM pagemap destroy uses the
  * per-device xe->destroy_wq instead.
  *
  * Return: %true if @work was queued, %false if it was already pending.
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 390da884c727..e07384c1c2dc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -29,6 +29,7 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_migrate.h"
+#include "xe_module.h"
 #include "xe_pagefault.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -1249,7 +1250,14 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_dfl_wq, &vma->destroy_work);
+
+	/*
+	 * The destroy work puts a vm reference which may put the last
+	 * device reference. Hence we can't queue this work on the device
+	 * destroy queue since that may deadlock. Use the module-wide
+	 * destroy queue.
+	 */
+	xe_destroy_wq_queue(&vma->destroy_work);
 }
 
 static void xe_vm_assert_write_mode_or_garbage_collector(struct xe_vm *vm)
@@ -2058,8 +2066,12 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 {
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
-	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_dfl_wq, &vm->destroy_work);
+	/*
+	 * To destroy the VM we need to be able to sleep.
+	 * drm_gpuvm keeps at least one device reference at this
+	 * point so xe->destroy_wq must still be alive.
+	 */
+	queue_work(vm->xe->destroy_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.55.0

