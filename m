Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D04CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFAE10E465;
	Tue, 18 Nov 2025 09:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMpPi61U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9224810E469
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456761; x=1794992761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3OGd5VW8F7OIttY8tUexEsim9UGeJnhzVWLZp92doU=;
 b=LMpPi61UWv9mkFWnhv+saNnsk0dr8ElXw9KyysnpQh7sPVG2ahRC15VF
 XxXZLh095ZVfI33YImcNf3UA7086v0OoexVXp1AsOGUI03lvUrmra99BC
 QARWz88k5Eh28nP3HLT2kUD61/5+oX7mnypQkyY7CJ2pERtIeGhcHHMta
 obTiViBeqCSokgkHm7N7VsWDJtGsMk3sH4kKljnyFvuntQKNVBvZVgqlq
 hCxwgNf5YKxJ93Fh5F4Cw4rxrTuWSQ45ZywTpX8oVQxte758Yu4nmfKep
 SzCQPADSP6NNr9/Pn7Q7Ar2JQcHr+fUbxzIuXTkyN5cJtsX1AYQ+Gbafm g==;
X-CSE-ConnectionGUID: 0XB0qGEDTG6Ue17w765WCg==
X-CSE-MsgGUID: JyvshGqvRtuL1HRKWry6NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097759"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:01 -0800
X-CSE-ConnectionGUID: rH9otX3wTYWkMDrDcw52sQ==
X-CSE-MsgGUID: q34x3vBFSN+6uOlHMjEIAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500844"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:05:59 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to support
 PPC flush
Date: Tue, 18 Nov 2025 17:05:44 +0800
Message-ID: <20251118090552.246243-4-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

Allow for tlb_invalidation to configure when driver wants to flush the
Private Physical Cache (PPC) as a process of the tlb invalidation
process.

Default behavior is still to always flush the PPC but driver now has the
option to disable it.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 11 +++++++----
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  5 +++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++-
 drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
 6 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index cd126c53faab..c05709a5bc98 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len)
 			      G2H_LEN_DW_TLB_INVALIDATE, 1);
 }
 
-#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
+#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
 		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
-		XE_GUC_TLB_INVAL_FLUSH_CACHE)
+		(flush_cache ? \
+		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
+
+#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
 
 static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
 {
@@ -100,7 +103,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
 static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				u64 start, u64 end, u32 asid)
+				u64 start, u64 end, u32 asid, bool flush_cache)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_guc *guc = tlb_inval->private;
@@ -154,7 +157,7 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 						    ilog2(SZ_2M) + 1)));
 		xe_gt_assert(gt, IS_ALIGNED(start, length));
 
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
+		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, flush_cache);
 		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 50f05d6b5672..de275759743c 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -324,10 +324,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
  */
 int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
-		       u32 asid)
+		       u32 asid, bool flush_cache)
 {
 	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
-				  start, end, asid);
+				  start, end, asid, flush_cache);
 }
 
 /**
@@ -343,7 +343,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm)
 	u64 range = 1ull << vm->xe->info.va_bits;
 
 	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
-	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
+	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, true);
 	xe_tlb_inval_fence_wait(&fence);
 }
 
@@ -420,6 +420,20 @@ static const struct dma_fence_ops inval_fence_ops = {
 	.get_timeline_name = xe_inval_fence_get_timeline_name,
 };
 
+/**
+ * xe_tlb_inval_fence_flush_cache - Control PPC flush at invalidation
+ * @fence: TLB inval fence
+ * @flush_cache: whether to perform PPC cache flush
+ *
+ * Helper function to modify the tlb_inval fence to control the PPC flush.
+ * Other components shouldn't modify fence directly.
+ */
+void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
+				    bool flush_cache)
+{
+	fence->flush_cache = flush_cache;
+}
+
 /**
  * xe_tlb_inval_fence_init() - Initialize TLB invalidation fence
  * @tlb_inval: TLB invalidation client
@@ -446,4 +460,5 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 	else
 		dma_fence_get(&fence->base);
 	fence->tlb_inval = tlb_inval;
+	fence->flush_cache = true;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 9dbddc310eb9..b84ce3e6f294 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -24,8 +24,9 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
 void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
 int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence,
-		       u64 start, u64 end, u32 asid);
-
+		       u64 start, u64 end, u32 asid, bool flush_cache);
+void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
+				    bool flush_cache);
 void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 			     struct xe_tlb_inval_fence *fence,
 			     bool stack);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 1ae0dec2cf31..6248f90323a9 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -49,7 +49,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
 		container_of(job->fence, typeof(*ifence), base);
 
 	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
-			   job->end, job->vm->usm.asid);
+			   job->end, job->vm->usm.asid, ifence->flush_cache);
 
 	return job->fence;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 7a6967ce3b76..c3c3943fb07e 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -40,12 +40,13 @@ struct xe_tlb_inval_ops {
 	 * @start: Start address
 	 * @end: End address
 	 * @asid: Address space ID
+	 * @flush_cache: PPC flush control
 	 *
 	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
 	 * failure
 	 */
 	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
-		     u64 end, u32 asid);
+		     u64 end, u32 asid, bool flush_cache);
 
 	/**
 	 * @initialized: Backend is initialized
@@ -126,6 +127,8 @@ struct xe_tlb_inval_fence {
 	int seqno;
 	/** @inval_time: time of TLB invalidation */
 	ktime_t inval_time;
+	/** @flush_cache: bool for PPC flush, default is true */
+	bool flush_cache;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c..5fb5226574c5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3907,7 +3907,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
 
 		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
 					 &fence[fence_id], start, end,
-					 vm->usm.asid);
+					 vm->usm.asid, true);
 		if (err)
 			goto wait;
 		++fence_id;
@@ -3920,7 +3920,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
 
 		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
 					 &fence[fence_id], start, end,
-					 vm->usm.asid);
+					 vm->usm.asid, true);
 		if (err)
 			goto wait;
 		++fence_id;
-- 
2.51.2

