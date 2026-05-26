Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC837CD5BB4
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 08:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE56910E60A;
	Tue, 26 May 2026 08:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEusSnit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B0210E60A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779784049; x=1811320049;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5iY9R/oNCmRDtVPl63+FyY4cyoZXMOUzUhKfdgz/cgo=;
 b=SEusSnitdUaqILyDI8wRW4uKleHAD9LDedl/kY1vD9DVdy1rWlEwUIlf
 zn9f4UQbpVFQj9O0Vc6mGfY8djoPxgynMpFNodJrVYQDCO0twPsfA3BDN
 27TITyViaadht8CyvtjRRldvYbGiqL1zG2Qbgv17HzcDTviyEYOkPM18P
 s/NllGfodb018jtnYosYkxRrh1i+6ZClP5nervssDXBkbJ/THWMQtAQEx
 htIbJvgWETb4argDlPcQiWD6FiFENE5BYs8DCXIJ7svPx/+z3iroIJbVC
 qbr2KwURWyZ7LMHZs3CKHWTKoDXCPcMho4CN8VRFZgj/aOPqifxAd3YDH g==;
X-CSE-ConnectionGUID: 4EDSE7zPQQKoMH9X2VJjIg==
X-CSE-MsgGUID: dRTqHf+JT8irHGTBIg3k2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91698408"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91698408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:27:29 -0700
X-CSE-ConnectionGUID: JkL5jmSgSkyrUSXdG1dfow==
X-CSE-MsgGUID: o33Y4+vCTyGTi85uMXwd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="239251750"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 01:27:27 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/xe: explcit TLB flush for context based tlb
 invalidation
Date: Tue, 26 May 2026 13:56:58 +0530
Message-ID: <20260526082700.1383831-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
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

In LR preempt-fence mode, on devices with context based
TLB Invalidation, rebind operations for VMAs require
an explicit invalidation request.

Request explicit TLB Invalidation in notifier path
and in PT path.

Userptr VMAs are excluded in PT path since the notifier path
already submits invalidation, preventing duplicate
requests for the same rebind window.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c      |  4 ++++
 drivers/gpu/drm/xe/xe_userptr.c | 15 ++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2669ff5ee747..d5c4c82205e4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2019,6 +2019,10 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
 		     xe_vm_in_lr_mode(vm)))
 			pt_update_ops->needs_invalidation = true;
+		else if (pt_op->rebind && xe_vm_in_preempt_fence_mode(vm) &&
+			 vm->xe->info.has_ctx_tlb_inval &&
+			 !xe_vma_is_userptr(vma))
+			pt_update_ops->needs_invalidation = true;
 		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
 			/* We bump also if batch_invalidate_tlb is true */
 			vm->tlb_flush_seqno++;
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..b2b57e729eab 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -102,7 +102,20 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	/*
+	 * Flush GPU translations for this userptr VMA before dropping CPU-side
+	 * page mappings.
+	 *
+	 * In fault-mode VMs, work is not drained via preempt-fence sequencing,
+	 * so stale PTE/TLB state must be cleared explicitly before page release.
+	 *
+	 * On devices using context-scoped TLB invalidation (has_ctx_tlb_inval),
+	 * a context switch is not sufficient to retire old userptr translations.
+	 * Therefore, this notifier path explicitly triggers invalidation ahead of
+	 * unmap to prevent reuse of obsolete address translations.
+	 */
+	if ((xe_vm_in_fault_mode(vm) || vm->xe->info.has_ctx_tlb_inval) &&
+	    userptr->initial_bind) {
 		if (!userptr->finish_inuse) {
 			/*
 			 * Defer the TLB wait to an extra pass so the caller
-- 
2.46.0

