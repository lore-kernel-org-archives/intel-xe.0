Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFE7FF6E97
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 23:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D030710E68A;
	Tue, 17 Mar 2026 23:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3CP38UU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93BB10E68A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 23:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773789565; x=1805325565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d4f5wOo/kDMV/mbAq4TpyGo67cboIbQJpprM878RIZY=;
 b=I3CP38UU24tYCgN9iNg14PTn4Tm++o7ul6b4WrxaISLOKxPABZpna0o+
 YNRtBL4uxvQjDIDaOApvhm2Tb1oWGs7D4B5ifHRizMlXPcUD/v+LqEzq9
 7SNEwNPrBVe3HrqLtDY6vDnsuzMTJvObT4+QyWpjOxuXL2YrdTr3vlTtw
 glPbOa/bP9K2tg+cAYW6ndEl1UyipqDhBFoZrJmSy9cPUWRFVUdcTeUao
 TZB5rI7eS5jo+AF6ccVhxYCluSd83aCvau78ZI7Kp8bnANfC92WWRsBKq
 xVMt7CVMuCFSa5eu955nvmSjyCI135kY+SemZ1Yj4PRkUOVYkctIkguC8 Q==;
X-CSE-ConnectionGUID: cmfimZ1xTpebJWETJ9viXw==
X-CSE-MsgGUID: 1CLVQPb+TW2/c1wJdiQmSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86310592"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="86310592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 16:19:24 -0700
X-CSE-ConnectionGUID: BV27fgCMTuW343Gy3+VO3A==
X-CSE-MsgGUID: XpCbZmgsS6+nl2WQshqMPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="218057406"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 16:19:23 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.brost@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH] drm/xe: Wait for HW clearance before issuing the next TLB
 inval.
Date: Tue, 17 Mar 2026 16:21:33 -0700
Message-ID: <20260317232133.4106716-1-fei.yang@intel.com>
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

Hardware requires the software to poll the valid bit and make sure it's
cleared before issuing a new TLB invalidation request.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..4c2f87db3167 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -63,6 +63,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
 
 	/*
 	 * Returning -ECANCELED in this function is squashed at the caller and
@@ -85,11 +86,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
+			/* Wait 1-second for the valid bit to be cleared */
+			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
+					     0, 1000 * USEC_PER_MSEC, NULL, false);
+			if (ret) {
+				pr_info("TLB INVAL cancelled due to uncleared valid bit\n");
+				return -ECANCELED;
+			}
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
 					PVC_GUC_TLB_INV_DESC0_VALID);
 		} else {
+			/* Wait 1-second for the valid bit to be cleared */
+			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
+					     0, 1000 * USEC_PER_MSEC, NULL, false);
+			if (ret) {
+				pr_info("TLB INVAL cancelled due to uncleared valid bit\n");
+				return -ECANCELED;
+			}
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
-- 
2.43.0

