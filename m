Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4923CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 23:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07810E0DB;
	Tue, 29 Sep 2026 23:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fd4qCF8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39BC10E0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 23:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790724908; x=1822260908;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mvetnSuLQdiaD2wiecp/TQ8ggOqDJ4on0PAWey1s4Bc=;
 b=fd4qCF8N1Vp3lvi5btIATxVWpb+5KuVL0g9tgfMDv8kSvtHKYPtekL6u
 N13erRFoNFOCPh4EMpCVKpV6sjhjIRFAk2NH2Rw04dSz2dQbzugG3Lgw3
 k72e9cOUaIHGLHYQvzjVGgWVarvOh9lLxd3EqwAFwcG+qCIaBS5OM01MM
 22LF+rptdTTvEGIpqBuHDvW+xTqVIRsTpIlHHf1AwAFoDEFUmQZRSYasg
 Xjw3s58UBAuNnIlw3+pyukW94E3FNLNYbzASAJIOgyhUFiTFCBf5kIuI/
 PuLGCBv7FOCgpt09uVsRB6cEGMuWIbK4zNq/Fp7x/AjcquHQhta2SIQst g==;
X-CSE-ConnectionGUID: HltHZhCGQPSHxkhdNVZ6ew==
X-CSE-MsgGUID: 5/Ony8BKTK6Vwq5Ku3qRuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102025143"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102025143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 16:35:07 -0700
X-CSE-ConnectionGUID: /t2lrxQ7SUqJ82EXu76tAg==
X-CSE-MsgGUID: CbK7Bf7wTiqnURFAODAhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="279321766"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 16:35:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Date: Tue, 29 Sep 2026 16:35:02 -0700
Message-Id: <20260929233502.2789888-1-matthew.brost@intel.com>
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

If no exec queues from a VM are mapped on a GT, issuing a PPGTT TLB
invalidation for that GT can require an rc6 wake which is expensive.

Skip the media TLB invalidation when the VM has no exec queues
mapped on it. If TLB invalidations are already in-flight on that GT
we can't break fence ordering, so issue a dummy GGTT invalidation
instead to maintain seqno ordering.

This optimization is particularly impactful for SVM workloads which
may or may not use the media GT. Average TLB invalidation time drops
from ~75us to ~18us in such benchmarks on certain BMG parts - the
improvement varies based on platform.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2:
 - Make GT generic rather than just media GT (Thomas)
 - Fix accounting bug in empty vs non-empty (CI)
v3:
 - Don't skip on platforms which don't support an asid (Sashiko)
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c            | 12 ++----------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 111fef781b2a..fcbbb8714dfc 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -232,11 +232,32 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 				     struct drm_suballoc *prl_sa)
 {
 	struct xe_guc *guc = tlb_inval->private;
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_vm *vm;
+	int err, id = guc_to_gt(guc)->info.id;
 
 	lockdep_assert_held(&tlb_inval->seqno_lock);
 
-	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
-				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
+	if (!xe->info.has_asid)
+		return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
+					    XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
+					    prl_sa);
+
+	vm = xe_device_asid_to_vm(xe, asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	down_read(&vm->exec_queues.lock);
+	if (!vm->exec_queues.count[id] && xe_tlb_inval_idle(tlb_inval))
+		err = -ECANCELED;
+	else
+		err = send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
+					   XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
+					   prl_sa);
+	up_read(&vm->exec_queues.lock);
+	xe_vm_put(vm);
+
+	return err;
 }
 
 static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1785bd3ade12..884cf3779a8e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -5483,8 +5483,7 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
  * @vm: The VM.
  * @q: The exec_queue
  *
- * Add exec queue to VM, skipped if the device does not have context based TLB
- * invalidations.
+ * Add exec queue to VM.
  */
 void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
@@ -5497,9 +5496,6 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(xe, vm->xef);
 	xe_assert(xe, vm == q->vm);
 
-	if (!xe->info.has_ctx_tlb_inval)
-		return;
-
 	down_write(&vm->exec_queues.lock);
 	list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q->gt->info.id]);
 	++vm->exec_queues.count[q->gt->info.id];
@@ -5511,14 +5507,10 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  * @vm: The VM.
  * @q: The exec_queue
  *
- * Remove exec queue from VM, skipped if the device does not have context based
- * TLB invalidations.
+ * Remove exec queue from VM.
  */
 void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	if (!vm->xe->info.has_ctx_tlb_inval)
-		return;
-
 	down_write(&vm->exec_queues.lock);
 	if (!list_empty(&q->vm_exec_queue_link)) {
 		list_del(&q->vm_exec_queue_link);
-- 
2.34.1

