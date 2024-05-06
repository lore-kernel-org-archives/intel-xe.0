Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE6C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 20:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4321110ECCD;
	Mon,  6 May 2024 20:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q42pjLvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56810ECCD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715027401; x=1746563401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5aOqErXtNRIfAmyLcApYg7HLjST9NAikEfKv1jHXHtw=;
 b=Q42pjLvc7ysL9hiJ4JDR7KlHSuxIeVy4PdvdodW60dA8vrsPXcmu1krF
 DuM9uEC2PId4a6TPpXmNK2pdYNy+ZAOUKLkkuXDnNsBH8bWENlMt7CqsT
 HAuFp656hCkuabdoabdkYAFg3aufHsnP++WA7qn7Gh6ALgKb9DI6AXRak
 J/obdlEBAnclc8DGg/KKv3b72r6nqe/BbWb6hIgatTMghLL16xLQtXaD1
 zOcQ3mJOadKZ+eWoFBxD6w/RBVwikCyHGJ+9sd84a3w+YXh+b8Yd7bo4F
 5bBLLLjYWcHiIIRWe2QyTfy1Fk1GKnmbAXp+UNojAUWP/jbIi8XUTQKDq g==;
X-CSE-ConnectionGUID: GuWTVV0QQMGduzg9VHNVrA==
X-CSE-MsgGUID: isQEbXjuRFGjuk+6yBaexA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="13747286"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="13747286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:30:00 -0700
X-CSE-ConnectionGUID: 0xEIIEtBTru+CEt2kF16hw==
X-CSE-MsgGUID: 9iTwTPPNQa6T5Jg2BZv1zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32938545"
Received: from cooperst-gp5011.amr.corp.intel.com (HELO
 fdugast-desk.intel.com) ([10.251.209.110])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:30:00 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe/vm_doc: Fix some typos
Date: Mon,  6 May 2024 22:29:50 +0200
Message-ID: <20240506202950.109750-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix some typos and add / remove / change a few words to improve
readability and prevent some ambiguities.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_doc.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
index bdc6659891a5..4d33f310b653 100644
--- a/drivers/gpu/drm/xe/xe_vm_doc.h
+++ b/drivers/gpu/drm/xe/xe_vm_doc.h
@@ -25,7 +25,7 @@
  * VM bind (create GPU mapping for a BO or userptr)
  * ================================================
  *
- * Creates GPU mapings for a BO or userptr within a VM. VM binds uses the same
+ * Creates GPU mappings for a BO or userptr within a VM. VM binds uses the same
  * in / out fence interface (struct drm_xe_sync) as execs which allows users to
  * think of binds and execs as more or less the same operation.
  *
@@ -190,8 +190,8 @@
  * Deferred binds in fault mode
  * ----------------------------
  *
- * In a VM is in fault mode (TODO: link to fault mode), new bind operations that
- * create mappings are by default are deferred to the page fault handler (first
+ * If a VM is in fault mode (TODO: link to fault mode), new bind operations that
+ * create mappings are by default deferred to the page fault handler (first
  * use). This behavior can be overriden by setting the flag
  * DRM_XE_VM_BIND_FLAG_IMMEDIATE which indicates to creating the mapping
  * immediately.
@@ -225,7 +225,7 @@
  *
  * A VM in compute mode enables long running workloads and ultra low latency
  * submission (ULLS). ULLS is implemented via a continuously running batch +
- * semaphores. This enables to the user to insert jump to new batch commands
+ * semaphores. This enables the user to insert jump to new batch commands
  * into the continuously running batch. In both cases these batches exceed the
  * time a dma fence is allowed to exist for before signaling, as such dma fences
  * are not used when a VM is in compute mode. User fences (TODO: link user fence
@@ -244,7 +244,7 @@
  * Once all preempt fences are signaled for a VM the kernel can safely move the
  * memory and kick the rebind worker which resumes all the engines execution.
  *
- * A preempt fence, for every engine using the VM, is installed the VM's
+ * A preempt fence, for every engine using the VM, is installed into the VM's
  * dma-resv DMA_RESV_USAGE_PREEMPT_FENCE slot. The same preempt fence, for every
  * engine using the VM, is also installed into the same dma-resv slot of every
  * external BO mapped in the VM.
@@ -314,7 +314,7 @@
  * signaling, and memory allocation is usually required to resolve a page
  * fault, but memory allocation is not allowed to gate dma fence signaling. As
  * such, dma fences are not allowed when VM is in fault mode. Because dma-fences
- * are not allowed, long running workloads and ULLS are enabled on a faulting
+ * are not allowed, only long running workloads and ULLS are enabled on a faulting
  * VM.
  *
  * Defered VM binds
@@ -399,14 +399,14 @@
  * Notice no rebind is issued in the access counter handler as the rebind will
  * be issued on next page fault.
  *
- * Cavets with eviction / user pointer invalidation
- * ------------------------------------------------
+ * Caveats with eviction / user pointer invalidation
+ * -------------------------------------------------
  *
  * In the case of eviction and user pointer invalidation on a faulting VM, there
  * is no need to issue a rebind rather we just need to blow away the page tables
  * for the VMAs and the page fault handler will rebind the VMAs when they fault.
- * The cavet is to update / read the page table structure the VM global lock is
- * neeeed. In both the case of eviction and user pointer invalidation locks are
+ * The caveat is to update / read the page table structure the VM global lock is
+ * needed. In both the case of eviction and user pointer invalidation locks are
  * held which make acquiring the VM global lock impossible. To work around this
  * every VMA maintains a list of leaf page table entries which should be written
  * to zero to blow away the VMA's page tables. After writing zero to these
@@ -427,9 +427,9 @@
  * VM global lock (vm->lock) - rw semaphore lock. Outer most lock which protects
  * the list of userptrs mapped in the VM, the list of engines using this VM, and
  * the array of external BOs mapped in the VM. When adding or removing any of the
- * aforemented state from the VM should acquire this lock in write mode. The VM
+ * aforementioned state from the VM should acquire this lock in write mode. The VM
  * bind path also acquires this lock in write while the exec / compute mode
- * rebind worker acquire this lock in read mode.
+ * rebind worker acquires this lock in read mode.
  *
  * VM dma-resv lock (vm->ttm.base.resv->lock) - WW lock. Protects VM dma-resv
  * slots which is shared with any private BO in the VM. Expected to be acquired
-- 
2.43.0

