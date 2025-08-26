Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B764CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B8410E3A1;
	Tue, 26 Aug 2025 18:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqkT5p3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FC210E39E
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 18:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756232955; x=1787768955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pa9gtTbqR5dAcRZQbwnjA+wqrbHUYfbN9C6daeX7LK4=;
 b=HqkT5p3Ylh9jml1970T/Q5Li3FJmZLH7NSY6JaUhPPu7fddV548cS8fZ
 jIHDLivpSHbbxnlv5q8CR+dc0/TI6iu9FLdiSSXqZynuoSFR7/0DMV1P2
 FjN6lQvT5wLTr7UN62nDzTc1zGl0GK+ILQ06A3nx7NuVErMCm5fBaxO2P
 bVyk4HcLklMEc0bget+aP9cq73z9QkurKDHaEw/DBs009vePeX+Dare/q
 fn0tHwh7aFq5G2Lm04NEUXetC6VM4ts7ODw9IKSwOSM0dxwybw+6MwJoZ
 9wCnRQrzcaFnxWFOAor12skhELrhxe7rW6TUwm0rT6Y/1eWyFQb6o0bLn g==;
X-CSE-ConnectionGUID: dZYhCtjKTP2zgDhnWWspNA==
X-CSE-MsgGUID: WMESsb7yTLaTsap/u12h4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="76080641"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="76080641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:29:14 -0700
X-CSE-ConnectionGUID: XofxTDvJRyW3Ag6FYsFc0A==
X-CSE-MsgGUID: YcrlPw86TISPRj9sbWk5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173800832"
Received: from dut137arlu.fm.intel.com ([10.105.23.75])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:29:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/9] drm/xe: Move explicit CT lock in TLB invalidation sequence
Date: Tue, 26 Aug 2025 18:29:03 +0000
Message-Id: <20250826182911.392550-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826182911.392550-1-stuart.summers@intel.com>
References: <20250826182911.392550-1-stuart.summers@intel.com>
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

Currently the CT lock is used to cover TLB invalidation
sequence number updates. In an effort to separate the GuC
back end tracking of communication with the firmware from
the front end TLB sequence number tracking, add a new lock
here to specifically track those sequence number updates
coming in from the user.

Apart from the CT lock, we also have a pending lock to
cover both pending fences and sequence numbers received
from the back end. Those cover interrupt cases and so
it makes not to overload those with sequence numbers
coming in from new transactions. In that way, we'll employ
a mutex here.

v2: Actually add the correct lock rather than just dropping
    it... (Matt)

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 19 +++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h            |  2 ++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 02f0bb92d6e0..75854b963d66 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -118,6 +118,9 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
  */
 int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
@@ -125,6 +128,10 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
+	err = drmm_mutex_init(&xe->drm, &gt->tlb_invalidation.seqno_lock);
+	if (err)
+		return err;
+
 	gt->tlb_invalidation.job_wq =
 		drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm, "gt-tbl-inval-job-wq",
 					     WQ_MEM_RECLAIM);
@@ -158,7 +165,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 * appear.
 	 */
 
-	mutex_lock(&gt->uc.guc.ct.lock);
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 	/*
@@ -178,7 +185,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	mutex_unlock(&gt->uc.guc.ct.lock);
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
@@ -211,13 +218,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&guc->ct.lock);
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 	seqno = gt->tlb_invalidation.seqno;
 	fence->seqno = seqno;
 	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
 	action[1] = seqno;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
-				    G2H_LEN_DW_TLB_INVALIDATE, 1);
+	ret = xe_guc_ct_send(&guc->ct, action, len,
+			     G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret) {
 		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		/*
@@ -248,7 +255,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		if (!gt->tlb_invalidation.seqno)
 			gt->tlb_invalidation.seqno = 1;
 	}
-	mutex_unlock(&guc->ct.lock);
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index ef0f2eecfa29..4dbc40fa6639 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -190,6 +190,8 @@ struct xe_gt {
 		/** @tlb_invalidation.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
 		int seqno;
+		/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
+		struct mutex seqno_lock;
 		/**
 		 * @tlb_invalidation.seqno_recv: last received TLB invalidation seqno,
 		 * protected by CT lock
-- 
2.34.1

