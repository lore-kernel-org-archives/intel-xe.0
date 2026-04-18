Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A0F99C6E
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 23:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFF010EA79;
	Fri, 17 Apr 2026 23:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRm9agZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCD310EA79
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 23:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776470340; x=1808006340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v/3FIDyHdpMdGmhX7cgZWjOYOm2eG9GO4E7EjnmozBw=;
 b=VRm9agZsNLG9HkXDPsex3/Lmg9xUiOe91Oo1I0I7305fK8Yfspv+b2m1
 H+WZn5Nx2rrEiVRqXon4M/rjQ4hKMQ4xh6qzZK7on2vo0KyrN54kJYPbX
 36BdP3orlNqZsHSaOJCiOE1Pb4gkFbf/MiFQ4yv/A75WZJQ0SjXWkEIpB
 cDHJuDIwGIIdcyud8Fi+vS64tkMU/cjVnEtJW/vZMsGi+N0sgWSFzfP9v
 cXJROHHCQM2iml7Ju44r908w+hVZU9CePe9frmLzGnNiYvOVGcbCKjNTG
 k56ud6p51Gjv3oHCzP7dBfFW0Ph1t0mcIemHRalogE2YY5QLnLwL2BD2J w==;
X-CSE-ConnectionGUID: QW3cGzhwRbegeFLqjGjXqQ==
X-CSE-MsgGUID: W1XwUD2sQw2+3HOWtNaGKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77606257"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="77606257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 16:58:59 -0700
X-CSE-ConnectionGUID: QiHoVVNFQi6YO9nED7UVTA==
X-CSE-MsgGUID: WynOemxSTniGkbp+32B2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="236143395"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 16:58:59 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Roper Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Wait for HW clearance before issuing the next TLB
 inval.
Date: Fri, 17 Apr 2026 17:03:49 -0700
Message-ID: <20260418000349.1398567-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Hardware requires the software to poll the valid bit and make sure
it's cleared before issuing a new TLB invalidation request.
We also need to avoid racing against GuC on TLB invalidations. In
order to achieve that, add a mutex to serialize TLB invalidation
request, and whenever KMD initiates TLB invalidation, make sure
we poll for the clearance of the valid bit before and after issuing
TLB invalidation request.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Roper Matthew D <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c            |  8 +++-
 drivers/gpu/drm/xe/xe_gt_types.h      |  7 +++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 63 +++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a31c963c372..186b1c10334b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -486,15 +486,16 @@ static void wa_14026539277(struct xe_gt *gt)
 
 int xe_gt_init_early(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+	if (IS_SRIOV_PF(xe)) {
 		err = xe_gt_sriov_pf_init_early(gt);
 		if (err)
 			return err;
 	}
 
-	if (IS_SRIOV_VF(gt_to_xe(gt))) {
+	if (IS_SRIOV_VF(xe)) {
 		err = xe_gt_sriov_vf_init_early(gt);
 		if (err)
 			return err;
@@ -514,6 +515,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
+	err = drmm_mutex_init(&xe->drm, &gt->ggtt_tlb_invl_lock);
+	if (err)
+		return err;
 
 	err = xe_gt_tlb_inval_init_early(gt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7351aadd238e..3dd07d75d195 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -324,6 +324,13 @@ struct xe_gt {
 	 */
 	spinlock_t global_invl_lock;
 
+	/**
+	 * @ggtt_tlb_invl_lock: prevents back to back TLB invalidation
+	 *    by serializing TLB invalidation requests with polling for
+	 *    the valid bit enforced in between
+	 */
+	struct mutex ggtt_tlb_invl_lock;
+
 	/** @wa_active: keep track of active workarounds */
 	struct {
 		/** @wa_active.gt: bitmap with active GT workarounds */
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..2062f990e9de 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -63,7 +63,9 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
+	int ret = -ECANCELED;
 
+	mutex_lock(&gt->ggtt_tlb_invl_lock);
 	/*
 	 * Returning -ECANCELED in this function is squashed at the caller and
 	 * signals waiters.
@@ -76,26 +78,81 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 			MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 		};
 
-		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
+		ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
+		goto out;
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
 
 		if (IS_SRIOV_VF(xe))
-			return -ECANCELED;
+			goto out;
+
+		/*
+		 * If there are pending GuC TLB invalidation requests
+		 * KMD requests should be avoided
+		 */
+		if (!list_empty(&gt->tlb_inval.pending_fences))
+			goto out;
 
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
+			/*
+			 * In case of any failure causing CT to be disabled,
+			 * KMD needs to make sure there is no pending TLB
+			 * invalidation issued by GuC before sending more TLB
+			 * request through mmio. Wait 1-second for the valid
+			 * bit to be cleared, otherwise cancel the request.
+			 */
+			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
+					     PVC_GUC_TLB_INV_DESC0_VALID,
+					     0, 1000 * USEC_PER_MSEC, NULL, true);
+			if (ret) {
+				ret = -ECANCELED;
+				drm_dbg(&xe->drm, "Pending TLB INV not completed\n");
+				goto out;
+			}
+
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
 					PVC_GUC_TLB_INV_DESC0_VALID);
+
+			/*
+			 * In case the CT is recovered, make sure there is no
+			 * pending TLB invalidation request before GuC takes over
+			 */
+			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
+					     PVC_GUC_TLB_INV_DESC0_VALID,
+					     0, 1000 * USEC_PER_MSEC, NULL, true);
+			if (ret)
+				drm_dbg(&xe->drm, "TLB INV not completed\n");
+			ret = -ECANCELED;
 		} else {
+			/* See comments in the if clause above */
+			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
+					     GUC_TLB_INV_CR_INVALIDATE,
+					     0, 1000 * USEC_PER_MSEC, NULL, true);
+			if (ret) {
+				ret = -ECANCELED;
+				drm_dbg(&xe->drm, "Pending TLB INV not completed\n");
+				goto out;
+			}
+
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
+
+			/* See comments in the if clause above */
+			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
+					     GUC_TLB_INV_CR_INVALIDATE,
+					     0, 1000 * USEC_PER_MSEC, NULL, true);
+			if (ret)
+				drm_dbg(&xe->drm, "TLB INV not completed\n");
+			ret = -ECANCELED;
 		}
 	}
 
-	return -ECANCELED;
+out:
+	mutex_unlock(&gt->ggtt_tlb_invl_lock);
+	return ret;
 }
 
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
-- 
2.43.0

