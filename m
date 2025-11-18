Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B6BCCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA1810E46F;
	Tue, 18 Nov 2025 09:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLRT2xj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC1310E470
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456773; x=1794992773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R4EWEAk5MCb+1WZqXNT0Zm8lFY93LQNwrKBDNIzMTrQ=;
 b=JLRT2xj6jDSN9YyAYgolHKn2hv4vGi699uIMrlYmWQ+FfL7jnw5rH55e
 dzBmExOpSnTUqthHykOrcwB+ohrONZJYxsMaDAbMMclryVXzKNWxuA1x6
 h/b/yc4sVcMbD8H7Gy82ryIT2AaY2GeVY9JlNDi8OX7oqjDP1Ze+TDOW3
 6bJVFHBn/1x2ANSlmxnVtNTLmnuN79MIC9zZPi/0h4s8youzm+krsuio/
 urN3+OKGk+ZXhTVrqb26NMMU3C69+K3rFMh2F5ql+sEDwGw7+7hmPsH73
 AQREIoELEAiyw2nKRmtdxJJ64VrW6eU5G5wnwUhJ0q0sqlKKP/VAt+pIc w==;
X-CSE-ConnectionGUID: YEDHV7F2SCqaFxqzFALerg==
X-CSE-MsgGUID: BVgHEsDYS++RQzl7bqzMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097790"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:13 -0800
X-CSE-ConnectionGUID: Q8ixh7r9SKq3+olrxfipuQ==
X-CSE-MsgGUID: kUb8R4SjTnShTXxpRmVv4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500885"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:11 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 09/11] drm/xe: Append page reclamation action to tlb inval
Date: Tue, 18 Nov 2025 17:05:50 +0800
Message-ID: <20251118090552.246243-10-brian3.nguyen@intel.com>
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

Add page reclamation action to tlb inval backend. The page reclamation
action is paired with range tlb invalidations so both are issued at the
same time.

Page reclamation will issue the TLB invalidation with an invalid seqno
and a H2G page reclamation action with the fence's corresponding seqno
and handle the fence accordingly on page reclaim action done handler.

If page reclamation fails, tlb timeout handler will be responsible for
signalling fence and celaning up.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 13 +++++++++----
 drivers/gpu/drm/xe/xe_tlb_inval.c       |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  3 ++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 3185f8dc00c4..f42dcaf17aab 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -13,6 +13,7 @@
 #include "xe_guc_tlb_inval.h"
 #include "xe_force_wake.h"
 #include "xe_mmio.h"
+#include "xe_sa.h"
 #include "xe_tlb_inval.h"
 
 #include "regs/xe_guc_regs.h"
@@ -117,20 +118,21 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
 static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				u64 start, u64 end, u32 asid, bool flush_cache)
+				u64 start, u64 end, u32 asid, bool flush_cache,
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
@@ -180,7 +182,10 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_inval(guc, action, len);
+	err = send_tlb_inval(guc, action, len);
+	if (!err && prl_sa)
+		err = send_page_reclaim(guc, seqno, xe_sa_bo_gpu_addr(prl_sa));
+	return err;
 }
 
 static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 18d49e017828..8ab967f47b45 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -337,7 +337,7 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		}
 	}
 	err = xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
-				 start, end, asid, flush_cache);
+				 start, end, asid, flush_cache, fence->prl_sa);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 7cf741e6a0c7..386f51db5a1c 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -9,6 +9,7 @@
 #include <linux/workqueue.h>
 #include <linux/dma-fence.h>
 
+struct drm_suballoc;
 struct xe_guc_page_reclaim_entry;
 struct xe_tlb_inval;
 
@@ -47,7 +48,7 @@ struct xe_tlb_inval_ops {
 	 * failure
 	 */
 	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
-		     u64 end, u32 asid, bool flush_cache);
+		     u64 end, u32 asid, bool flush_cache, struct drm_suballoc *sa);
 
 	/**
 	 * @initialized: Backend is initialized
-- 
2.51.2

