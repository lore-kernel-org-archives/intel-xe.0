Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794B3C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A1410E81E;
	Wed, 26 Aug 2026 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkHr9phV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6110E6B2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787740407; x=1819276407;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Yduk0C6x2487Ve+uQIllI4TmTzRUi4xGwkP1LP2JJjw=;
 b=lkHr9phV1vAkI6OT7TClhc/nr2IryiQBOiX4XDq1EQ3M/h8V+8vxVO2Y
 qa7YIGype9xVmJZOipj/hnYxuoETOJiFXcnM/ld+kuGq/Lreg5WrSq7y2
 lmFpMTMgGuUh6cZz9an+27GOsEjet4jAUrA9YobSEqYLfdYLyaDnn6pO3
 vtjQY2AwOAbc4Qhy5cdXstsO9N/F5cUOwyNriszROV/VI1NOi4mVkp8cE
 RCXUnMzImdRMPwEPvQTe26oE5vTpBnHo7+V6WyF2zX+jg2Tbew7Hc8t1Y
 qiSy9CAkoJcDAmnBIPSxfEzkthmDatp9w8b7ZOdMBDGAI+H/+SKvG9k7R g==;
X-CSE-ConnectionGUID: mCpMprrJS3mkDEWCIrFdNg==
X-CSE-MsgGUID: 8U+Z5scqTZu1wdXT2F8NfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98813206"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98813206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:33:26 -0700
X-CSE-ConnectionGUID: ROkXC9zqRHubPR8rm4CaoQ==
X-CSE-MsgGUID: 4/hDlvlvQ3SAADKhOGcLNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261411452"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 03:33:24 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Date: Wed, 26 Aug 2026 16:01:55 +0530
Message-ID: <20260826103156.3233208-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260826103156.3233208-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260826103156.3233208-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
 4 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 046d0655122f..c2f56be833a2 100644
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
+	if (send_tlb_inval(guc, action, ARRAY_SIZE(action)))
+		return -ECANCELED;
+
+	return 0;
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

