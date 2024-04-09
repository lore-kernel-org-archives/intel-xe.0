Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258F7CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977C9112F1C;
	Tue,  9 Apr 2024 20:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuOCIDQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C00112F23
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f2m+KarKBpoOci2U7qeYFJeCLHvL3BJ3wdWyHr0O810=;
 b=IuOCIDQnl1FqfkPn2Lxoml/1v34yGzd/c6h2lmiWAYwDiWk5TFfsv5Nl
 8YO2fDWrfMI+OdK+X1WZSf5WFiCCHyr7nRX6VcsZJlEw21w1yhwUa55hM
 GDKJ0q9qexLNI48ZX5yvu7uBSj3vssqj9HjudCJJQlUQkmYt9KRluEhME
 SXho91OmEOtOJ5XV6KlA/GWBDzYCL0ceFtoODZJ1/5vLIP+3HK7v6G5Wq
 8baln7b7zp5hd0fnQengBNtxod5C/v7y7QGaCtvml8WofAHvVqHRTvoh+
 tPSVn0pii8TheX4dEOaE8PvWimY8+C4izBuhe1hcS2j7TkrWJrR0KtgbE w==;
X-CSE-ConnectionGUID: jj6yv4ObS6elb3y8gUG3bA==
X-CSE-MsgGUID: 5ejaKOvQR46w4W5lAWs2uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803762"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: gM/JnqMGQ0WpenibDCVUpg==
X-CSE-MsgGUID: YL+cz+kPQK2r6Fajx2M+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773772"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 20/31] drm/xe: add xe lock document
Date: Tue,  9 Apr 2024 16:17:31 -0400
Message-Id: <20240409201742.3042626-21-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

This is not intended a complete documentation of xe locks. It
only documents some key locks used in xe driver and gives an
example to illustrate the lock usage.

This is just a start. We should eventually refine this document.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 Documentation/gpu/xe/index.rst   |   1 +
 Documentation/gpu/xe/xe_lock.rst |   8 +++
 drivers/gpu/drm/xe/xe_lock_doc.h | 113 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |   2 +-
 4 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/xe/xe_lock.rst
 create mode 100644 drivers/gpu/drm/xe/xe_lock_doc.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 106b60aba1f0..6ae2c8e7bbb4 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -24,3 +24,4 @@ DG2, etc is provided to prototype the driver.
    xe_tile
    xe_debugging
    xe_svm
+   xe_lock
diff --git a/Documentation/gpu/xe/xe_lock.rst b/Documentation/gpu/xe/xe_lock.rst
new file mode 100644
index 000000000000..24e4c2e7c5d1
--- /dev/null
+++ b/Documentation/gpu/xe/xe_lock.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==============
+xe lock design
+==============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_lock_doc.h
+   :doc: xe lock design
diff --git a/drivers/gpu/drm/xe/xe_lock_doc.h b/drivers/gpu/drm/xe/xe_lock_doc.h
new file mode 100644
index 000000000000..0fab623ce056
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_lock_doc.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_LOCK_DOC_H_
+#define _XE_LOCK_DOC_H_
+
+/**
+ * DOC: XE lock design
+ *
+ * Locks used in xekmd are complicated. This document try to document the
+ * very fundamentals, such as key locks  used, their purpose and the
+ * order of locking if you need to hold multiple locks.
+ *
+ * Locks used in xekmd
+ * ===================
+ * 1. xe_vm::lock
+ * xe_vm::lock is used mainly to protect data in xe_vm struct, more specifically
+ * this includes below:
+ *
+ * 1) vm::rebind_list
+ * 2) vm::flags, only XE_VM_FLA_BANNED bit
+ * 3) vma::tile_present
+ * 4) userptr::repin_list
+ * 5) userptr::invalidated list
+ * 6) vm::preempt::exec_queue
+ * 7) drm_gpuvm::rb list and tree
+ * 8) vm::size
+ * 9) vm::q[]->last_fence, only if q->flags' EXEC_QUEUE_FLAG_VM is set,
+ *    see xe_exec_queue_last_fence_lockdep_assert
+ * 10) a contested list during vm close. see xe_vm_close_and_put
+ *
+ * 2. mm mmap_lock
+ * mm's mmap_lock is used to protect mm's memory mapping such as CPU page
+ * tables. Linux core mm hold this lock whenever it need to change process
+ * space's memory mapping, for example, during a user munmap process.
+ *
+ * xe hold mmap_lock when it needs to walk CPU page table, such as when
+ * it calls hmm_range_fault to populate CPU page tables.
+ *
+ * 3. xe_vm's dma-resv
+ * xe_vm's dma reservation object is used protect GPU page table update.
+ * For BO type vma, dma resv is enough for page table update. For userptr
+ * and hmmptr, besides dma resv, we need an extra notifier_lock to avoid
+ * page table update collision with userptr invalidation. See below.
+ *
+ * 4. xe_vm::userptr::notifier_lock
+ * notifier_lock is used to protect userptr/hmmptr GPU page table update,
+ * to avoid a update collision with userptr invalidation. So notifier_lock
+ * is required in the userptr invalidate callback function. Notifier_lock
+ * is the "user_lock" in the documentation of mmu_interval_read_begin().
+ *
+ * Lock order
+ * ==========
+ * Acquiring locks in the same order can avoid deadlocks. The locking
+ * order of above locks are:
+ *
+ * xe_vm::lock => mmap_lock => xe_vm::dma-resv => notifier_lock
+ *
+ *
+ * Use case, pseudo codes
+ * =====================
+ *
+ * Below are pseudo codes of hmmptr's gpu page fault handler:
+ *
+ * get gpu vm from page fault asid
+ * Down_write(vm->lock)
+ * walk vma tree, get vma of fault address
+ *
+ * Again:
+ * Mmap_read_lock
+ * do page migration for vma if needed
+ * vma->userptr.notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier)
+ * call hmm_range_fault to retrieve vma's pfns/pages
+ * Mmap_read_unlock
+ *
+ * xe_vm_lock(vm)
+ * down_read(&vm->userptr.notifier_lock);
+ * if (!mmu_interval_read_retry() {
+ *     up_read(&vm->userptr.notifier_lock);
+ *     goto Again; //collision happened with userptr invalidation, retry
+ * }
+ *
+ * xe_vm_populate_pgtable or submit gpu job to update page table
+ * up_read(&vm->userptr.notifier_lock);
+ *
+ * xe_vm_unlock(vm)
+ * Up_write(vm->lock)
+ *
+ * In above code, we first hold vm->lock so we can walk vm's vma tree to
+ * get a vma of the fault address.
+ *
+ * Then we do page migration if needed. Page migration is not needed for
+ * userptr but might be needed for hmmptr. After migration, we populate
+ * the pfns of the vma. Since this requires walking CPU page table, we
+ * hold a mmap_lock in this step.
+ *
+ * After that, the remaining work is to update GPU page table with the
+ * pfns/pages populated above. Since we use vm's dma-resv object to protect
+ * gpu page table update, we need to hold vm's dma-resv in this step.
+ *
+ * Since we don't hold the mmap_lock during GPU page table update, user
+ * might perform munmap simultaneously which can cause userptr invalidation.
+ * If such collision happens, we will retry.
+ *
+ * notifier_lock is hold in both mmu notifier callback (Not listed above),
+ * and GPU page table update.
+ *
+ */
+#endif
+
+
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3b4debfecc9b..d1f5949d4a3b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -271,7 +271,7 @@ struct xe_vm {
 
 	/**
 	 * @lock: outer most lock, protects objects of anything attached to this
-	 * VM
+	 * VM. See more details in xe_lock_doc.h
 	 */
 	struct rw_semaphore lock;
 	/**
-- 
2.26.3

