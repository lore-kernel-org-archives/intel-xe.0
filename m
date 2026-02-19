Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06DAE9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A657710E699;
	Thu, 19 Feb 2026 09:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOCcz1lI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4E810E687
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492410; x=1803028410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rEedjHiHKxKcU/bX+vogCT3tplQenxUQpsmFd0gN4mQ=;
 b=SOCcz1lI19dn33xyopqk+adU2juPSt4GyEq+sIYeSpKMJILyPIjd8CqU
 BapgavFg2Fp2tB2SiDrFsJ/mjkAEOahISMGrx68Mm7qNmqkncZEvHl2tR
 irmk9X0I/LlfSJ+Z3bh+iaGZHJ5qQzQvqm+kmJXD5cCnueMdkijvNqQpa
 yJ4qOb5iJ5NGdZQIvoQ94CHysxUMLZBizLT/AIERBCjZECL1uvl4R0GyO
 KSESY/6VeA6kr6V8XiLWdMZhzZUPnBSTWO/ZiG0RDsWrkNPUZBOQ0OF28
 OsEezHz+1a06HoMVGPWeWRUmeOaI9v1Qj3Jrsj/aIogvV9pwRW7ahRpAs w==;
X-CSE-ConnectionGUID: jjfEr9fOT9ulhVyLaiDJRA==
X-CSE-MsgGUID: v01NAzUATieeHL7ofTKOlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637311"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637311"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:30 -0800
X-CSE-ConnectionGUID: z03fzC8YSLapR+Hgfth6LA==
X-CSE-MsgGUID: dMabdbUhSkayeD5BIUtz9w==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:29 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
Date: Thu, 19 Feb 2026 14:43:08 +0530
Message-ID: <20260219091312.796749-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Clear XE_VMA_CPU_AUTORESET_ACTIVE before installing GPU PTEs for CPU
address mirror VMAs.

This marks the one-way transition from CPU-only to GPU-touched so munmap
handling can switch from the MADVISE autoreset notifier to the existing
SVM notifier.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_vm.h  | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index cda3bf7e2418..b9dbbb245779 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1209,6 +1209,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
+	/* Invariant: CPU_AUTORESET_ACTIVE cleared before reaching here. */
+	WARN_ON_ONCE(xe_vma_has_cpu_autoreset_active(vma));
+
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
@@ -1360,6 +1363,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic)
 {
 	int need_vram, ret;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Transition CPU-only -> GPU-touched before installing PTEs. */
+	if (xe_vma_has_cpu_autoreset_active(vma))
+		xe_vma_gpu_touch(vma);
+
 retry:
 	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (need_vram < 0)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 7bf400f068ce..3dc549550c91 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -423,4 +423,15 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+/**
+ * xe_vma_gpu_touch() - Mark VMA as GPU-touched
+ * @vma: VMA to mark
+ *
+ * Clear XE_VMA_CPU_AUTORESET_ACTIVE. Must be done before first GPU PTE install.
+ */
+static inline void xe_vma_gpu_touch(struct xe_vma *vma)
+{
+	vma->gpuva.flags &= ~XE_VMA_CPU_AUTORESET_ACTIVE;
+}
 #endif
-- 
2.43.0

