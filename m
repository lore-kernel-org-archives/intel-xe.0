Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB90CDE000
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 22:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C637F10E0BA;
	Wed, 24 Jun 2026 22:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqoDgUJJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4317610E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782341238; x=1813877238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/y+4yAnDiKuJVd3e+TKWWmp1/NT4W4iNrWbjqxfHzg=;
 b=iqoDgUJJ76+NclEOdO3kOzZSICTnLrK7ZOCBdiCgZIpl3p4sAqWjj33R
 1KaD/lnl0ouJYoFwA4w1BGFhsC0SgQ9JHpBBR9WGrekkZIXGB8tiNs0hQ
 UqloxXehry1UDGG9ldKerUYFRjTeCBjSh+cg6dDGXaHr7PAcWEfe4DGrh
 moVgFLnLJUNX0PddFhMy/SdIgN8ymhW2PVRhZ+yuSmpEfwXGDqg0teHvp
 yZYzIjiZnBUrWTrxcqc2Beo2XfpKw9zeijBbB8qZhUyHh4VJBdX+ZmGwr
 Tc/6jJj8g3KJjbcJa6fIN7IdYd/VKLxYHgxpZYDnMYLFe3HNPxNKrsTt7 w==;
X-CSE-ConnectionGUID: c794JIfoQ1eyKt4L55uRGA==
X-CSE-MsgGUID: M7RKRPpsRei4cZf1RUjrjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94233916"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="94233916"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 15:47:18 -0700
X-CSE-ConnectionGUID: C2WbfxgxQDGbzPaC13fjjA==
X-CSE-MsgGUID: ZSJr2SKnRfKaFbswjPs8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="249905267"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 15:47:18 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Roper Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH 1/1 v4] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Date: Wed, 24 Jun 2026 15:51:04 -0700
Message-ID: <20260624225105.2355641-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624225105.2355641-1-fei.yang@intel.com>
References: <20260624225105.2355641-1-fei.yang@intel.com>
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
order to achieve that, check for pending TLB invalidation in tlb_inval
list.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Roper Matthew D <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index cf6d106e6036..815fbd059112 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -8,6 +8,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
@@ -60,6 +61,12 @@ static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
 
 static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 {
+	/*
+	 * Timeout for MMIO-based TLB invalidation polling. Make it 250ms
+	 * based on hw_tlb_timeout = HZ/4 defined in tlb_inval_timeout_delay().
+	 */
+	const long hw_tlb_timeout = HZ / 4;
+
 	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -79,19 +86,82 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
+		int err;
 
 		if (IS_SRIOV_VF(xe))
 			return -ECANCELED;
 
+		/*
+		 * seqno_lock serializes MMIO-based TLB invalidations to prevent
+		 * races between concurrent requests issued through GuC CT and
+		 * direct MMIO writes.
+		 */
+		lockdep_assert_held(&tlb_inval->seqno_lock);
+
+		/*
+		 * If there are pending GuC TLB invalidation requests MMIO-based
+		 * requests should be avoided.
+		 */
+		if (!xe_tlb_inval_idle(tlb_inval)) {
+			xe_gt_dbg(gt, "MMIO TLB INV skipped due to pending GuC INv\n");
+			return -ECANCELED;
+		}
+
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
+			/*
+			 * HW requires the valid bit to be clear before writing a
+			 * new request.
+			 */
+			err = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
+					     PVC_GUC_TLB_INV_DESC0_VALID, 0,
+					     hw_tlb_timeout, NULL, false);
+			if (err) {
+				xe_gt_err(gt, "MMIO TLB INV pre-write poll timeout\n");
+				return -ECANCELED;
+			}
+
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
 					PVC_GUC_TLB_INV_DESC0_VALID);
+
+			/*
+			 * Poll for clearance of the valid bit after writing to
+			 * ensure the request has been consumed and to avoid races
+			 * between TLB invalidation through GuC and MMIO.
+			 */
+			err = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
+					     PVC_GUC_TLB_INV_DESC0_VALID, 0,
+					     hw_tlb_timeout, NULL, false);
+			if (err)
+				xe_gt_err(gt, "MMIO TLB INV post-write poll timeout\n");
 		} else {
+			/*
+			 * HW requires the valid bit to be clear before writing a
+			 * new request.
+			 */
+			err = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
+					     GUC_TLB_INV_CR_INVALIDATE, 0,
+					     hw_tlb_timeout, NULL, false);
+			if (err) {
+				xe_gt_err(gt, "MMIO TLB INV pre-write poll timeout\n");
+				return -ECANCELED;
+			}
+
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
+
+			/*
+			 * Poll for clearance of the valid bit after writing to
+			 * ensure the request has been consumed and to avoid races
+			 * between TLB invalidation through GuC and MMIO.
+			 */
+			err = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
+					     GUC_TLB_INV_CR_INVALIDATE, 0,
+					     hw_tlb_timeout, NULL, false);
+			if (err)
+				xe_gt_err(gt, "MMIO TLB INV post-write poll timeout\n");
 		}
 	}
 
-- 
2.43.0

