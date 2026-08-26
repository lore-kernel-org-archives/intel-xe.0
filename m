Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A031C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 11:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290E510EC50;
	Wed, 26 Aug 2026 11:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecv7VsMp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF4610E467
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787743624; x=1819279624;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mCjJpdXDlLTXH5Uvfdo6yf4LeBnyBanFtSC7gAmL8VI=;
 b=ecv7VsMpBINH8gQ9nzYXnNwp4h4VhLmp3ljFXF6NtbniphOeXpFnVwBv
 gxL5hMWxxMEyNFzHw9yXyYbGRA8HWCT60zubRvvSx67xehH8DRFLiOTAR
 zisPGdsaVGS7Am9fdTCAb6TenQS3bt29d3Q91qJXzIxQKPs9wbJwntLjk
 VDgdNV2Sg7HVblMqC5AN7eU/e0YviPKZwPGJgQydkfMwDqmf+RlO8TMfZ
 AoLx3S/DXS+t1fxEsYOkBDJQplYFdDYHvBmni1NdSSIHbW0/qYQkzB0Yg
 dhMgfBzYwEfPc/rLTXUf7fh8IJCKQhXAWEZ4IFq5l8qW+hS1HpnhauxR+ Q==;
X-CSE-ConnectionGUID: jxy0jR0US8eTaLDqMAxpqg==
X-CSE-MsgGUID: h2jIdejfQ7uUCzPa0kEv5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98556778"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98556778"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:27:03 -0700
X-CSE-ConnectionGUID: JqzsIP1tR96C9DvjE+ecBQ==
X-CSE-MsgGUID: aGZTArgOReO4ClesGVpu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261418226"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 04:27:02 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Date: Wed, 26 Aug 2026 16:55:32 +0530
Message-ID: <20260826112533.3289978-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 25 +++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
 4 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 046d0655122f..665483bf2e67 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -98,6 +98,29 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
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
+	/* CT unavailable means nothing runs on the engines; treat as cancelled. */
+	if (ret == -ENODEV || ret == -ECANCELED)
+		return -ECANCELED;
+
+	return ret;
+}
+
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			     u64 gpu_addr)
 {
@@ -346,6 +369,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
+	.ggtt_full = send_tlb_inval_ggtt_full,
 	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
@@ -354,6 +378,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 
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

