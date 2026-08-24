Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A037C5DF9D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAED310E7E7;
	Mon, 24 Aug 2026 16:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUDO8eJt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37A010E7E7
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589388; x=1819125388;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bTrH0bT2ZpOntjPtgzhzu4GXsiqNrw2H+ldb6TWpVK4=;
 b=UUDO8eJtNLPz6CInhClR5T9K+jZNWeRl+OtZlOqrbYXjsbBieuEXZxIi
 3sldRDb0KdBsf2JPR033XgOpjZJdUw9nqZI/qw2k43S/kyL/m19QN+H3N
 X2B8Om8mR1P/HRkF3uQfpCtXwGQkzcpADtijL8b88beKxJtiXAArLol2T
 Wp7IGj8yw7/xJKLu/qZpYyQhc6nPG0GhZzWEb5Od3u4bFNoTOYZUrOSbA
 QzkJFS3EVHt1m9k8sgBtO9cY0MTqYZJ1dWhmeDFHsV367mzMiVEIpzh7V
 BJaOmPHH+p3tTW2auNgTdLFV3WpqWVyOiE34av3Z2XwtpuAIOc9uiFAfc g==;
X-CSE-ConnectionGUID: J7M+h++7SUiumv07j2yAAg==
X-CSE-MsgGUID: UoUovhj4ToypFPM/+20EVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99209647"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99209647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:36:28 -0700
X-CSE-ConnectionGUID: UgvQMd26S6OM312SBy9pGQ==
X-CSE-MsgGUID: 5PsFsqzyTVCDnooyKmxKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263321837"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 09:36:26 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Date: Mon, 24 Aug 2026 22:04:57 +0530
Message-ID: <20260824163458.3129935-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Add xe_tlb_inval_ggtt_full() and its GuC backend
send_tlb_inval_ggtt_full() for full engine TLB invalidation
within the requesting VF across all engines.

v2: Refactor with new helper xe_tlb_inval_issue_op_wait()
    and other knits. -Niranjana

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
 4 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 046d0655122f..08dc2ee4cbff 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	return -ECANCELED;
 }
 
+/*
+ * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
+ * within the VF.
+ */
+static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
+{
+	struct xe_guc *guc = tlb_inval->private;
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION,
+		seqno,
+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
+	};
+
+	if (!xe_guc_ct_enabled(&guc->ct) || !guc->submission_state.enabled)
+		return -ECANCELED;
+
+	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
+}
+
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			     u64 gpu_addr)
 {
@@ -346,6 +365,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
+	.ggtt_full = send_tlb_inval_ggtt_full,
 	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
@@ -354,6 +374,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 
 static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
 	.ggtt = send_tlb_inval_ggtt,
+	.ggtt_full = send_tlb_inval_ggtt_full,
 	.all = send_tlb_inval_all,
 	.ppgtt = send_tlb_inval_ctx_ppgtt,
 	.initialized = tlb_inval_initialized,
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index bbd21d393062..7c3bf32d9258 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 }
 
 /**
- * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
+ * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
  * @tlb_inval: TLB invalidation client
- *
- * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
- * caller can use the invalidation fence to wait for completion.
+ * @op: backend invalidation hook to issue
  *
  * Return: 0 on success, negative error code on error
  */
-int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
+static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
+				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
 {
 	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
 	int ret;
 
 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
-	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
+	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
 	xe_tlb_inval_fence_wait(fence_ptr);
 
 	return ret;
 }
 
+/**
+ * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
+ * @tlb_inval: TLB invalidation client
+ *
+ * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
+ * caller can use the invalidation fence to wait for completion.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
+{
+	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
+}
+
+/**
+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
+ * @tlb_inval: TLB invalidation client
+ *
+ * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
+ * within the requesting VF.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
+{
+	if (!tlb_inval->ops->ggtt_full)
+		return -EOPNOTSUPP;
+
+	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
+}
+
 /**
  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
  * @tlb_inval: TLB invalidation client
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index a76b7823a5f2..665072b4b81d 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
 int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 		     struct xe_tlb_inval_fence *fence);
 int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
 void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
 int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence,
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 3d1797d186fd..d77be1aedc91 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
 	 */
 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
 
+	/**
+	 * @ggtt_full: Full engine TLB invalidation within a VF
+	 * @tlb_inval: TLB invalidation client
+	 * @seqno: Seqno of TLB invalidation
+	 *
+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
+	 * failure
+	 */
+	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
+
 	/**
 	 * @ppgtt: Invalidate per-process translation TLBs
 	 * @tlb_inval: TLB invalidation client
-- 
2.46.0

