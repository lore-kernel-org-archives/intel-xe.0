Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C060D59D9A
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99AF10E972;
	Fri, 12 Dec 2025 21:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGfB8ZuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42810E96D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575160; x=1797111160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gj5rLEe2HQfPTVVE3auMBVx+tOe/HPhYmgpG3PVmsWk=;
 b=EGfB8ZuVstWYQgjbkOxrHr0/7aBFvSlqDPZ+YFf+481CIWgeXzK10gIE
 4zMyyCo7CBFOekLdQTxkdOwgWTF91Wvez09fK7fapeYy8m0Jrp0UrKMbg
 OB0MPu5c3tGkTb+LtZWsK9vOZmnucxlOaonYbO7vVp+HljJVVddiOpznP
 tHTkE3O+sFFZzm3b3zkDIFidhQfnVHspr4pqYef29ybTsDXuK+hgl9LhX
 QDzv02fxwrzowtw0+vELFLpiUuIGW2PBRatSxMY6JD8tVN6eXlDfAbsTP
 /vRsbgzzXKIHQzXmV6PSgOPvFDd2wbo5DcX7uiOvG0m4ZyUEoQkvJ7OHY Q==;
X-CSE-ConnectionGUID: 4wVsg62bTKuftDvu/iIFpw==
X-CSE-MsgGUID: V6BA/NvOSrKXmK0wcuQQmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541903"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:40 -0800
X-CSE-ConnectionGUID: LfqHqkX4RDKBZXc70DRRcg==
X-CSE-MsgGUID: m5fcPC1sSDmI3hdqjzZgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244703"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:38 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v6 08/10] drm/xe: Append page reclamation action to tlb inval
Date: Sat, 13 Dec 2025 05:32:34 +0800
Message-ID: <20251212213225.3564537-20-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

Add page reclamation action to tlb inval backend. The page reclamation
action is paired with range tlb invalidations so both are issued at the
same time.

Page reclamation will issue the TLB invalidation with an invalid seqno
and a H2G page reclamation action with the fence's corresponding seqno
and handle the fence accordingly on page reclaim action done handler.

If page reclamation fails, tlb timeout handler will be responsible for
signalling fence and cleaning up.

v2:
 - add send_page_reclaim to patch.
 - Remove flush_cache and use prl_sa pointer to determine PPC flush
   instead of explicit bool. Add NULL as fallback for others. (Matthew B)

v3:
 - Add comments for flush_cache with media.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 30 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_tlb_inval.c       |  7 +++---
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  4 +++-
 drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
 6 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 37ac943cb10f..6532a88d51e2 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -13,6 +13,7 @@
 #include "xe_guc_tlb_inval.h"
 #include "xe_force_wake.h"
 #include "xe_mmio.h"
+#include "xe_sa.h"
 #include "xe_tlb_inval.h"
 
 #include "regs/xe_guc_regs.h"
@@ -93,6 +94,20 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	return -ECANCELED;
 }
 
+static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
+			     u64 gpu_addr)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_PAGE_RECLAMATION,
+		seqno,
+		lower_32_bits(gpu_addr),
+		upper_32_bits(gpu_addr),
+	};
+
+	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
+}
+
 /*
  * Ensure that roundup_pow_of_two(length) doesn't overflow.
  * Note that roundup_pow_of_two() operates on unsigned long,
@@ -101,20 +116,21 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
 static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				u64 start, u64 end, u32 asid)
+				u64 start, u64 end, u32 asid,
+				struct drm_suballoc *prl_sa)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
-	int len = 0;
+	int len = 0, err;
 
 	if (guc_to_xe(guc)->info.force_execlist)
 		return -ECANCELED;
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-	action[len++] = seqno;
+	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
 	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
@@ -155,7 +171,8 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 						    ilog2(SZ_2M) + 1)));
 		xe_gt_assert(gt, IS_ALIGNED(start, length));
 
-		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, true);
+		/* Flush on NULL case, Media is not required to modify flush due to no PPC so NOP */
+		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, !prl_sa);
 		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
@@ -164,7 +181,10 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_inval(guc, action, len);
+	err = send_tlb_inval(guc, action, len);
+	if (!err && prl_sa)
+		err = send_page_reclaim(guc, seqno, xe_sa_bo_gpu_addr(prl_sa));
+	return err;
 }
 
 static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index a122fbb9fc4a..dec042248164 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -313,6 +313,7 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
  * @start: start address
  * @end: end address
  * @asid: address space id
+ * @prl_sa: suballocation of page reclaim list if used, NULL indicates PPC flush
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
  * TLB invalidation. Completion of TLB is asynchronous and caller can use
@@ -322,10 +323,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
  */
 int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
-		       u32 asid)
+		       u32 asid, struct drm_suballoc *prl_sa)
 {
 	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
-				  start, end, asid);
+				  start, end, asid, prl_sa);
 }
 
 /**
@@ -341,7 +342,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm)
 	u64 range = 1ull << vm->xe->info.va_bits;
 
 	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
-	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
+	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, NULL);
 	xe_tlb_inval_fence_wait(&fence);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 05614915463a..858d0690f995 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -23,7 +23,7 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
 void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
 int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence,
-		       u64 start, u64 end, u32 asid);
+		       u64 start, u64 end, u32 asid, struct drm_suballoc *prl_sa);
 
 void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 			     struct xe_tlb_inval_fence *fence,
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index fc5b4a32a32d..6a7bd6315797 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -60,7 +60,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
 	}
 
 	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
-			   job->end, job->vm->usm.asid);
+			   job->end, job->vm->usm.asid, prl_sa);
 
 	return job->fence;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 7a6967ce3b76..48d1503e8460 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -9,6 +9,7 @@
 #include <linux/workqueue.h>
 #include <linux/dma-fence.h>
 
+struct drm_suballoc;
 struct xe_tlb_inval;
 
 /** struct xe_tlb_inval_ops - TLB invalidation ops (backend) */
@@ -40,12 +41,13 @@ struct xe_tlb_inval_ops {
 	 * @start: Start address
 	 * @end: End address
 	 * @asid: Address space ID
+	 * @prl_sa: Suballocation for page reclaim list
 	 *
 	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
 	 * failure
 	 */
 	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
-		     u64 end, u32 asid);
+		     u64 end, u32 asid, struct drm_suballoc *prl_sa);
 
 	/**
 	 * @initialized: Backend is initialized
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c2012d20faa6..bd787aae4248 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3928,7 +3928,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
 
 		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
 					 &fence[fence_id], start, end,
-					 vm->usm.asid);
+					 vm->usm.asid, NULL);
 		if (err)
 			goto wait;
 		++fence_id;
@@ -3941,7 +3941,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
 
 		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
 					 &fence[fence_id], start, end,
-					 vm->usm.asid);
+					 vm->usm.asid, NULL);
 		if (err)
 			goto wait;
 		++fence_id;
-- 
2.52.0

