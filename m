Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024ECCFA03
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3110EC02;
	Fri, 31 Oct 2025 18:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0MBA0fd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDFB10E380
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934196; x=1793470196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=36wHB2cTTuB2m9Y7LfuHaeFWHeuN5swCzBMHF+6PZ70=;
 b=N0MBA0fdV25mWU2YIgpcMr3fDqIWBq1cxI0svKGol4AxFItjiyJYZRLF
 QH+Pzs/pSXztlYSG9oYR79POJV9PmFVFQHniundhiuSQDuYZ64pddp03x
 bRXItpnl8vM/4ZCme5wYcmKaa3Hk4mX4XC43Yq6pmlXvDUtspnRC5qwAY
 NKW0Mm+hALT7zarAfZB56LLdh5bVXCCEj2krSDlO8kBNh1OiCYWyDcwx5
 s/irzVJ55ukusxyDOw1RtjF721dd4jms+XTIPji9JWHZBhjU+bY+uFPRh
 rZl/yr0Vasdtk1vRKRXTDPqu6H4UvJiinu7lbu36N6kRuZm1THV/c5QCL g==;
X-CSE-ConnectionGUID: EeMnQHwtQG6FC47CziwDVA==
X-CSE-MsgGUID: nMvtgLsQQ0CHXD1tB9YD6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63305203"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63305203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
X-CSE-ConnectionGUID: BAU5rTcXTQeuRUFSSbe+lA==
X-CSE-MsgGUID: 4EkEV8mhQiqojd6T+Zgb3A==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v6 4/6] drm/xe: Skip TLB invalidation waits in page fault binds
Date: Fri, 31 Oct 2025 11:09:47 -0700
Message-Id: <20251031180949.2968311-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031180949.2968311-1-matthew.brost@intel.com>
References: <20251031180949.2968311-1-matthew.brost@intel.com>
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

Avoid waiting on unrelated TLB invalidations when servicing page fault
binds. Since the migrate queue is shared across processes, TLB
invalidations triggered by other processes may occur concurrently but
are not relevant to the current bind. Teach the bind pipeline to skip
waits on such invalidations to prevent unnecessary serialization.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 45cbe5f05107..2b5d25f4dd53 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -755,6 +755,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
@@ -845,6 +846,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
@@ -3111,8 +3113,13 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	if (number_tiles == 0)
 		return ERR_PTR(-ENODATA);
 
-	for_each_tile(tile, vm->xe, id)
-		n_fence += (1 + XE_MAX_GT_PER_TILE);
+	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
+		for_each_tile(tile, vm->xe, id)
+			++n_fence;
+	} else {
+		for_each_tile(tile, vm->xe, id)
+			n_fence += (1 + XE_MAX_GT_PER_TILE);
+	}
 
 	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
 	if (!fences) {
@@ -3153,6 +3160,9 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 
 collect_fences:
 		fences[current_fence++] = fence ?: dma_fence_get_stub();
+		if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)
+			continue;
+
 		xe_migrate_job_lock(tile->migrate, q);
 		for_each_tlb_inval(i)
 			fences[current_fence++] =
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 9043bc4a381c..ccd6cc090309 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -466,6 +466,7 @@ struct xe_vma_ops {
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 #define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
+#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

