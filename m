Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE241091906
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 18:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3638E10E490;
	Thu, 19 Mar 2026 18:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9zjfIJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8615710E490
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 18:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773944173; x=1805480173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KfRiKxw+rvDDp2ij0+fFTo+qslQL3M8nEx/63/X9oRg=;
 b=W9zjfIJ3Uz88hx4uZkbUv04DPXuIeRBM8rzHSQ6GWBlnxVubg8iDVBH6
 piSNv0g7kbFuv/E4erHom6ZPOzGb9EBEkSEbzIsfKT2za9D5ohC5nlp5v
 K3i9k3repqm04iAHcTqB/F8oZ03dSTX1lIey7MC0g0OR/8SFxjV+aGy70
 DUk9zWPxvMjrp3io9BpnAKkJwxMRL2MGlicqsmUR+Fyct+Wcj72O0E3Ck
 0HuSCRzpNAEd8ifPIUl31d4dLu7Ha3XtFtA5Fq94lEpDCEwntfprluvin
 ZoynUi2cldB4m8aI7aDZ9Y1bLdRXvZGtCR0mFHeFJU13CjpAdKQ0PU9MB w==;
X-CSE-ConnectionGUID: TxlsO6ZkTs+NkKFamB3PpQ==
X-CSE-MsgGUID: OP8nkY7QSUyQ/ADzSdHubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78631873"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78631873"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 11:16:13 -0700
X-CSE-ConnectionGUID: XAq3AGi5QUy9K4dQhpN7ug==
X-CSE-MsgGUID: FE6uz514TNqrN+AGOT2O7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="253523241"
Received: from dut4407arlh.fm.intel.com ([10.105.10.118])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 11:16:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: piotr.piorkowski@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Add LMTT invalidation to VF provisioning flow
Date: Thu, 19 Mar 2026 18:16:05 +0000
Message-ID: <20260319181610.18006-1-stuart.summers@intel.com>
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

There is a new invalidation type added to invalidate an LMTT of a
particular VF from the PF instead of doing a full invalidation.

A new invalidation type has been added to GuC to accommodate this.
Add the new invalidation type, add a new TLB invalidation front
and back end hook for the new type, and use this in xe_lmtt.c
by passing the VF ID any time we are provisioning the LMTT for
a particular VF so GuC can then relay that VF ID to hardware
during the invalidation.

Bspec: 59311

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h   |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  6 +++---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c      | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.c               | 17 ++++++++++-------
 drivers/gpu/drm/xe/xe_lmtt.h               |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c          | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h          |  3 +++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h    | 12 ++++++++++++
 8 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 83a6e7794982..31272de6fd3f 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -239,6 +239,8 @@ enum xe_guc_tlb_invalidation_type {
 	XE_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
 	XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX = 0x2,
 	XE_GUC_TLB_INVAL_GUC = 0x3,
+	XE_GUC_TLB_INVAL_ALL_TLB = 0x4,
+	XE_GUC_TLB_INVAL_LMTT_ONLY = 0x5,
 };
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2f376b5fb088..bcdcb9fec8a1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1518,7 +1518,7 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
 	return 0;
 }
 
-static void pf_force_lmtt_invalidate(struct xe_device *xe)
+static void pf_force_lmtt_invalidate(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_lmtt *lmtt;
 	struct xe_tile *tile;
@@ -1529,7 +1529,7 @@ static void pf_force_lmtt_invalidate(struct xe_device *xe)
 
 	for_each_tile(tile, xe, tid) {
 		lmtt = &tile->sriov.pf.lmtt;
-		xe_lmtt_invalidate_hw(lmtt);
+		xe_lmtt_invalidate_hw(lmtt, vfid);
 	}
 }
 
@@ -1592,7 +1592,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 		}
 	}
 
-	pf_force_lmtt_invalidate(xe);
+	pf_force_lmtt_invalidate(xe, vfid);
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 256759b826bc..978c3905a525 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -98,6 +98,22 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	return -ECANCELED;
 }
 
+static int send_tlb_inval_lmtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+			       unsigned int vfid)
+{
+	struct xe_guc *guc = tlb_inval->private;
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION,
+		seqno,
+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_LMTT_ONLY),
+		vfid,
+	};
+
+	xe_gt_assert(guc_to_gt(guc), xe_device_has_lmtt(tlb_inval->xe));
+
+	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
+}
+
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			     u64 gpu_addr)
 {
@@ -355,6 +371,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
+	.lmtt = send_tlb_inval_lmtt,
 	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
@@ -364,6 +381,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
 	.ggtt = send_tlb_inval_ggtt,
 	.all = send_tlb_inval_all,
+	.lmtt = send_tlb_inval_lmtt,
 	.ppgtt = send_tlb_inval_ctx_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda9390..a8bca1e5a633 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -252,19 +252,21 @@ void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
 	lmtt_setup_dir_ptr(lmtt);
 }
 
-static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
+static int lmtt_invalidate_hw(struct xe_lmtt *lmtt, unsigned int vfid)
 {
 	struct xe_tlb_inval_fence fences[XE_MAX_GT_PER_TILE];
 	struct xe_tlb_inval_fence *fence = fences;
 	struct xe_tile *tile = lmtt_to_tile(lmtt);
 	struct xe_gt *gt;
-	int result = 0;
-	int err;
+	int result = 0, err = 0;
 	u8 id;
 
 	for_each_gt_on_tile(gt, tile, id) {
 		xe_tlb_inval_fence_init(&gt->tlb_inval, fence, true);
-		err = xe_tlb_inval_all(&gt->tlb_inval, fence);
+		if (gt_to_xe(gt)->info.has_ctx_tlb_inval)
+			err = xe_tlb_inval_lmtt(&gt->tlb_inval, fence, vfid);
+		else
+			err = xe_tlb_inval_all(&gt->tlb_inval, fence);
 		result = result ?: err;
 		fence++;
 	}
@@ -286,13 +288,14 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 /**
  * xe_lmtt_invalidate_hw - Invalidate LMTT hardware.
  * @lmtt: the &xe_lmtt to invalidate
+ * @vfid: VF ID associated with this LMTT
  *
  * Send requests to all GuCs on this tile to invalidate all TLBs.
  * If the platform has a standalone MERT, also invalidate MERT's TLB.
  *
  * This function should be called only when running as a PF driver.
  */
-void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
+void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt, unsigned int vfid)
 {
 	struct xe_tile *tile = lmtt_to_tile(lmtt);
 	struct xe_device *xe = lmtt_to_xe(lmtt);
@@ -300,7 +303,7 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 
 	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
 
-	err = lmtt_invalidate_hw(lmtt);
+	err = lmtt_invalidate_hw(lmtt, vfid);
 	if (err)
 		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
 				  ERR_PTR(err));
@@ -367,7 +370,7 @@ static void lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid)
 		return;
 
 	lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid);
-	lmtt_invalidate_hw(lmtt);
+	lmtt_invalidate_hw(lmtt, vfid);
 
 	lmtt_assert(lmtt, pd->level > 0);
 	lmtt_assert(lmtt, pt->level == pd->level - 1);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
index 8fa387b38c52..ad370807ff3c 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.h
+++ b/drivers/gpu/drm/xe/xe_lmtt.h
@@ -15,7 +15,7 @@ struct xe_lmtt_ops;
 #ifdef CONFIG_PCI_IOV
 int xe_lmtt_init(struct xe_lmtt *lmtt);
 void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
-void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
+void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt, unsigned int vfid);
 int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
 int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
 void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 10dcd4abb00f..1283fde94a16 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -321,6 +321,26 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
 	return ret;
 }
 
+/**
+ * xe_tlb_inval_lmtt() - Issue a TLB invalidation for the LMTT for a VF
+ * @tlb_inval: TLB invalidation client
+ * @fence: invalidation fence which will be signal on TLB invalidation
+ * completion
+ * @vfid: VF ID for this LMTT
+ *
+ * Issue a TLB invalidation for the LMTT for a VF. Completion of TLB is
+ * asynchronous and caller can use the invalidation fence to wait for
+ * completion.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_tlb_inval_lmtt(struct xe_tlb_inval *tlb_inval,
+		      struct xe_tlb_inval_fence *fence,
+		      unsigned int vfid)
+{
+	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->lmtt, vfid);
+}
+
 /**
  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
  * @tlb_inval: TLB invalidation client
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index a76b7823a5f2..38d312c41365 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -20,6 +20,9 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
 int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 		     struct xe_tlb_inval_fence *fence);
 int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
+int xe_tlb_inval_lmtt(struct xe_tlb_inval *tlb_inval,
+		      struct xe_tlb_inval_fence *fence,
+		      unsigned int vfid);
 void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
 int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence,
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 3d1797d186fd..6205f5619303 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -36,6 +36,18 @@ struct xe_tlb_inval_ops {
 	 */
 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
 
+	/**
+	 * @lmtt: Invalidate the LMTT for a VF
+	 * @tlb_inval: TLB invalidation client
+	 * @seqno: Seqno of TLB invalidation
+	 * @vfid: VF ID for this LMTT
+	 *
+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
+	 * failure
+	 */
+	int (*lmtt)(struct xe_tlb_inval *tlb_inval, u32 seqno,
+		    unsigned int vfid);
+
 	/**
 	 * @ppgtt: Invalidate per-process translation TLBs
 	 * @tlb_inval: TLB invalidation client
-- 
2.43.0

