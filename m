Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB1FEF4EC2
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403E110E219;
	Mon,  6 Apr 2026 08:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8H2bR9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250710E219
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465928; x=1807001928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yccwJZVdV6gwP/vOLaNFlOsXqsu15m6hfrdntY2A9E=;
 b=W8H2bR9otTlZva9v7QJHdFekxEzBrX6qtd2o29br8xeKn3H1lNWn6UwH
 LcLzH4xkXZzxjcInbepRYvyfu+vbpYyJkfcSZrNSCZcDcjB950Vq3/o2a
 9NLYF6ab3zSFz0vLzVnwnwSnbTW1v7tfIErJJJgun/Flljw+n9VBp0v5l
 XW9jvk9AqjoKHe0Yumjr8lw2uBFAzLBSQP35rAcdRhgJFiU2ALu7M2fP9
 QoG2iV+Xeiq6bF43qHA4lV3LGje+t3yCpy67ILtJ/6lY/n0oq8/Lej69B
 vSN1fVXrUjqvbc12Z29ASLSVuukqT4S2ctC6oUUmF6c8DTDb22UsJ8H5d Q==;
X-CSE-ConnectionGUID: 0If5H0h2Siu/tsaUGLuDuQ==
X-CSE-MsgGUID: yQJEDtprQhua9hJpEbK58A==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012887"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:48 -0700
X-CSE-ConnectionGUID: QG1LrTmFRaqcAFqmMaJKsg==
X-CSE-MsgGUID: 4Y0yE60FQe+hvrvlDNTO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775181"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:46 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
Date: Mon,  6 Apr 2026 14:28:26 +0530
Message-ID: <20260406085830.1118431-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

CPU address mirror VMAs start with cpu_autoreset_active set, indicating
they are still CPU-only.

Clear cpu_autoreset_active after the first successful GPU fault so
subsequent munmap follows the SVM path instead of the autoreset path.

Do this in xe_svm_handle_pagefault() on the success path only.
Prefetch faults that install no PTEs must not transition this state.

v2:
  - Move xe_vma_gpu_touch() to the success path in
    xe_svm_handle_pagefault() so prefetch faults that find no range do
    not transition the state. (Matt)
  - Add xe_vma_gpu_touch() helper in xe_vm.h and use
    vma->cpu_autoreset_active instead of vma->gpuva.flags. (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_vm.h  | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5933b2b6392b..fd57c9d41db8 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1388,6 +1388,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic)
 {
 	int need_vram, ret;
+
+	lockdep_assert_held_write(&vm->lock);
+
 retry:
 	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (need_vram < 0)
@@ -1406,6 +1409,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 		goto retry;
 	}
+
+	/*
+	 * Mark the VMA as GPU-touched only after a successful fault-in.
+	 * Prefetch faults that find no range must not transition this state.
+	 */
+	if (!ret && xe_vma_has_cpu_autoreset_active(vma))
+		xe_vma_gpu_touch(vma);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index bdf42083da86..8d45f896f90b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -441,4 +441,17 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+/**
+ * xe_vma_gpu_touch() - Mark a VMA as no longer CPU-only
+ * @vma: VMA to update
+ *
+ * Clear cpu_autoreset_active after the first successful GPU fault-in.
+ * Caller must hold vm->lock in write mode.
+ */
+static inline void xe_vma_gpu_touch(struct xe_vma *vma)
+{
+	lockdep_assert_held_write(&xe_vma_vm(vma)->lock);
+	vma->cpu_autoreset_active = false;
+}
 #endif
-- 
2.43.0

