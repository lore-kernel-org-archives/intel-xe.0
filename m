Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D99AEFCE53
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 23:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77A10E02D;
	Wed,  4 Mar 2026 23:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpdSMloc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1F610E02D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 23:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772667460; x=1804203460;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bl4bgQr7HEwV7+iQ2un1f3mbbCebdEirdMTHy3YsZvA=;
 b=IpdSMlocQYnlPSIOuL9NR6wNVxaFoN1T5XpwUCsd6fOmtbBXhc8AMwX3
 bCnUjBGOUyG5OZmMIfQn41M0NuCyF5mki46l+NlXXcDD3CRtXPy9dauiX
 PTgRXXZ2yJ5Nxw46vXWI9rHTaWRr09slZbUwSkwCri7AP2oARz0lUi3wn
 CxYbNQGemHcG2aZOl86X6IW9/KefS771ivvfdYe01LjPCuc59YNLkrw9K
 iA96pY2fjgN2hhMlBxnqpDqOgaYK5sUXASB64xqLT4oH6Obi9nC5Q8kF0
 nkwkEu/tFuQ1DmTx09RKazqXkYWfZCmXb48CB65KftuLUyF0VLMBIQeIC Q==;
X-CSE-ConnectionGUID: bHZPOY3JSoC24kK1wODlgQ==
X-CSE-MsgGUID: tsbW+xr/RNqs1dxDekgQ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91315066"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="91315066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 15:37:35 -0800
X-CSE-ConnectionGUID: SEw5GMrVSca5fepPlq7Gzg==
X-CSE-MsgGUID: u8B1GsoaSyGhcsVJo8zOaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218438840"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 15:37:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no queues
 mapped
Date: Wed,  4 Mar 2026 15:37:28 -0800
Message-Id: <20260304233728.926378-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

If no exec queues from a VM are mapped on the media GT, issuing a
PPGTT TLB invalidation for that GT requires an rc6 wake which is
expensive.

Skip the media GT TLB invalidation when the VM has no exec queues
mapped on it. If TLB invalidations are already in-flight on that GT
we can't break fence ordering, so issue a dummy GGTT invalidation
instead to maintain seqno ordering.

This optimization is particularly impactful for SVM workloads which
may or may not use the media GT. Average TLB invalidation time drops
from ~75us to ~18us in such benchmarks.

Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 43 +++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..20c34469d9a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -205,14 +205,53 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 				     struct drm_suballoc *prl_sa)
 {
 	struct xe_guc *guc = tlb_inval->private;
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_vm *vm;
+	int err = 0, id = guc_to_gt(guc)->info.id;
 
 	lockdep_assert_held(&tlb_inval->seqno_lock);
 
 	if (guc_to_xe(guc)->info.force_execlist)
 		return -ECANCELED;
 
-	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
-				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
+	if (!xe_gt_is_media_type(gt))
+		return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
+					    XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
+					    prl_sa);
+
+	/* Try to skip media GT TLB invalidations */
+
+	vm = xe_device_asid_to_vm(xe, asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	down_read(&vm->exec_queues.lock);
+
+	if (!vm->exec_queues.count[id]) {
+		/*
+		 * We can't break fence ordering for TLB invalidation jobs, if
+		 * TLB invalidations are inflight issue a dummy invalidation to
+		 * maintain ordering. Nor can we move safely the seqno_recv when
+		 * returning -ECANCELED if TLB invalidations are in flight. Use
+		 * GGTT invalidation as dummy invalidation given ASID
+		 * invalidations are unsupported here.
+		 */
+		if (xe_tlb_inval_idle(tlb_inval))
+			err = -ECANCELED;
+		else
+			err = send_tlb_inval_ggtt(tlb_inval, seqno);
+		goto err_unlock;
+	}
+
+	err = send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
+				   XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
+
+err_unlock:
+	up_read(&vm->exec_queues.lock);
+	xe_vm_put(vm);
+
+	return err;
 }
 
 static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-- 
2.34.1

