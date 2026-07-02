Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0C6C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 01:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190210E0B7;
	Thu,  2 Jul 2026 01:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9eVsAaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1385710E0B7
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 01:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782955911; x=1814491911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lAOaqqeOJr+LdzRTRWlQD9YWQUEY+iQJplpIs/yGEWs=;
 b=F9eVsAaXbXfcAXN5241JOAiI4Gg5ByRRU02HUwwUm8ZtwtcdgLgjYhJ7
 +Dggl5iKbB9JpPB95F+5ecWPUTMAiiAIyIaRRvdaJfnD7CAlFoU4FZOvG
 UxYJZS/waew4NvQcV2+/ZhGn/bAS2Nm5xx3uRY78dtN8R2xzSO5CEUNNQ
 jl2fDgQF7jMciL57ER8l3n5L1YxgA0XNtaX5OaOX3jZL8tfNerD+WHFXz
 SORoiPyk6a3kfVfoAbir21hQjBCjraUDVQo9adOa2ooqu/k79u8OwCkxC
 bT9vusKb3aleB+phcFbxo2FkLNSKp74iD4vxMwSCFnHun1Te8zxVbUrXV g==;
X-CSE-ConnectionGUID: ok1g9vWpRxqJIeRdylyUIg==
X-CSE-MsgGUID: /GZTwpjeRTeWvIYwrNycLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83689565"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="83689565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 18:31:50 -0700
X-CSE-ConnectionGUID: oKnQ9aouTm2w/4PLg/vBoQ==
X-CSE-MsgGUID: z2acP7KRSLGsLJH5XnDegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="275927411"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 18:31:50 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe/vm: Drop ASID after TLB invalidation
Date: Thu,  2 Jul 2026 01:31:47 +0000
Message-ID: <20260702013147.2446299-1-zongyao.bai@intel.com>
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

xe_vm_close() clears vm->size before flushing the VM TLBs, while the
ASID remains in asid_to_vm until final teardown. A late GPU page fault
can still resolve the closed VM, fail in handle_pagefault_start(), and
send an unsuccessful response while invalidation is pending, which may
trigger IOMMU CAT and engine reset.

Erase the ASID after xe_tlb_inval_vm() returns, so subsequent GPU
faults for this ASID cannot resolve the closing VM. xe_tlb_inval_vm()
waits for invalidation completion before returning.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h |  5 +++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..42d5a9de2452 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1864,6 +1864,21 @@ static void xe_vm_close(struct xe_vm *vm)
 		xe_svm_notifier_unlock(vm);
 	up_write(&vm->lock);
 
+	/*
+	 * Drop the ASID lookup after TLB invalidation, when no further GPU faults
+	 * are expected for this ASID.
+	 */
+	if (bound && xe->info.has_asid && vm->usm.asid &&
+	    !(vm->flags & XE_VM_FLAG_MIGRATION)) {
+		void *lookup;
+
+		down_write(&xe->usm.lock);
+		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
+		if (!drm_WARN_ON(&xe->drm, lookup != vm))
+			vm->usm.asid_removed_from_lookup = true;
+		up_write(&xe->usm.lock);
+	}
+
 	if (bound)
 		drm_dev_exit(idx);
 }
@@ -1960,7 +1975,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
-	if (vm->usm.asid) {
+	if (vm->usm.asid && !vm->usm.asid_removed_from_lookup) {
 		void *lookup;
 
 		xe_assert(xe, xe->info.has_asid);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..0d451ac0e73b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -355,6 +355,11 @@ struct xe_vm {
 		 * get a flood of faults to the same VMA
 		 */
 		struct xe_vma *last_fault_vma;
+		/**
+		 * @asid_removed_from_lookup: Set once the ASID has already
+		 * been removed from asid_to_vm early in xe_vm_close().
+		 */
+		bool asid_removed_from_lookup;
 	} usm;
 
 	/** @error_capture: allow to track errors */
-- 
2.43.0

