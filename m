Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05332C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 07:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B498110F262;
	Fri, 21 Aug 2026 07:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMae08IH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C7210F262
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787298247; x=1818834247;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YqBjnm8yPMhTP3yTZQDvLptq4SE6d6swLLIqNm/8Ruo=;
 b=OMae08IH5cSwPUsjmqch3S5OfboiaaS0UHv3OLvm26vHUP92X3YLqghj
 sqh80o/Lgw2NBlWW0Va+H57WFiFXYxOB4fg8GUJBZYfSjC7sQd14ZFzLd
 ZBv+HnKBjL2zpDmw/ZRjXsYqzg9RAKSmpLQQItfEUlR1r7+6UKoOIIVU1
 WeRY/adUzBHmZyIW17LZwWCMMKHRFACQoA/7hgfsL/HYOP0+5oOvlo5e4
 RO0s5bqObyVRo23k9ZZ+Zc+qcCsUApzkkuMoyB83AOB+wsrbNM8YQ5A1n
 qNmxuDfSrb6sOxoQK2IdtZMY5Rwls9BXqph9t/MRiL9mHX7iCk0btsYAD Q==;
X-CSE-ConnectionGUID: /EVOvwHfSUK1NI2j1dsXhg==
X-CSE-MsgGUID: vJo8HSknT/u6FbOWJucCRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87971605"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87971605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 00:44:06 -0700
X-CSE-ConnectionGUID: jBejy4uET3qGPP5/AXts/g==
X-CSE-MsgGUID: dnYL11vtSp+/a2ArkwyDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="296173583"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 00:44:05 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/tlb_inval: add FULL_INTRA_VF GGTT invalidation
 helper
Date: Fri, 21 Aug 2026 13:12:37 +0530
Message-ID: <20260821074238.3000501-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
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
within the requesting VF partition across all engines.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++++++
 4 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 046d0655122f..9c7a02827902 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	return -ECANCELED;
 }
 
+/*
+ * Emit FULL_INTRA_VF to invalidate engine TLBs across all engines
+ * in the VF partition.
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
index bbd21d393062..aa12c7d95448 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -321,6 +321,31 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
 	return ret;
 }
 
+/**
+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within VF partition
+ * @tlb_inval: TLB invalidation client
+ *
+ * Issue FULL_INTRA_VF to flush engine TLBs of all engines in the
+ * requesting VF partition.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
+{
+	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
+	int ret;
+
+	if (!tlb_inval->ops->ggtt_full)
+		return -EOPNOTSUPP;
+
+	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
+	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr,
+				 tlb_inval->ops->ggtt_full);
+	xe_tlb_inval_fence_wait(fence_ptr);
+
+	return ret;
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
index 3d1797d186fd..02a356bfef47 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
 	 */
 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
 
+	/**
+	 * @ggtt_full: Full engine TLB invalidation within the VF partition
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

