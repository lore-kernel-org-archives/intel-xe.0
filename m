Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E18C61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5FF10E61C;
	Thu, 27 Aug 2026 08:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbZS/ns2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1F10E61C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787818901; x=1819354901;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gCkfs1kQGZeY3oC1fsI4j+DvPJ5vHR4MNKx6befuzj0=;
 b=KbZS/ns28kSpnBk04MbNNuynFs2qANaJLmlQNBdov+O7gid2t8yEYN6m
 4AtL64f3HXweGm7DhJWIY9P4Pd8Jg24mWbviSxnK6YUrz+D9YrwkiW9jy
 wbnIaXHE1kAs5lh0q7gV2tcf43QRByAk0Cjb4xkVw4tTWze6+I5LUPLYy
 7D7dasLoQFR90X2eQGeAYANsJ7DzLk36fylvHfOGA8oWdr0lNHMwrrX11
 iaAI7wDrsr72LJB5J0Mw3somMQAOojFBLpXTkB7wq04IdKHcarpOQ2yk6
 7OhcodPYxUe74Wd6Ub+sGIiVHYclk8mklWuc2ajqF1+nSYK8/mQX54Fza w==;
X-CSE-ConnectionGUID: xb4iQeapQvu3uw50Nvg+dQ==
X-CSE-MsgGUID: BM0QGSTdQ36oATKv5WdFMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99475712"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99475712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:21:41 -0700
X-CSE-ConnectionGUID: yMLZ75XoQRG5D3CpMTQoDw==
X-CSE-MsgGUID: gTlVyM07QQKBOHhpSrwSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264559610"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2026 01:21:39 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Date: Thu, 27 Aug 2026 13:50:10 +0530
Message-ID: <20260827082011.3370672-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
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

v2:
- Refactor with new helper xe_tlb_inval_issue_op_wait() and address
  nits (Niranjana)
v3:
- Avoid TOCTOU issue around CT state (Matt Brost)
v4:
- Propagate real send errors instead of masking as -ECANCELED (Sashiko)
v5:
- Handle -ENOTRECOVERABLE (wedged), drop redundant -ECANCELED
  (Matt Brost, Niranjana)

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 29 +++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
 4 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 046d0655122f..111fef781b2a 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -98,6 +98,33 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
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
+	int ret;
+
+	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
+
+	/*
+	 * send_tlb_inval() may return -ENODEV (CT disabled at cold boot) or
+	 * -ENOTRECOVERABLE (device wedged); nothing runs on the engines in
+	 * either case, so treat as cancelled.
+	 */
+	if (ret == -ENODEV || ret == -ENOTRECOVERABLE)
+		return -ECANCELED;
+
+	return ret;
+}
+
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			     u64 gpu_addr)
 {
@@ -346,6 +373,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
+	.ggtt_full = send_tlb_inval_ggtt_full,
 	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
@@ -354,6 +382,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 
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

