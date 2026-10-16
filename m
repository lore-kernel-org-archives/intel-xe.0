Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5234ACCA46D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0308411260A;
	Fri, 16 Oct 2026 07:19:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027AB112612
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135134; x=1823671134;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pV1p2Mg4xz3zkjioG93s/zSXrVcy8nInqSa4ZsvacD8=;
 b=I/dlHNmZME5oIySurBe4DGkE/wuqiqU0gFl/wcCy+HG7j/BJ3cP9Rx5O
 pW0TNNDuSfREyEGhTk6q+lr5ye3VvKcYAwpfQ1YbMPTpwVhIZ+HK1zfgC
 GuaH7R4lGejjwlYhQRxi0Og2m+8TFXeQejJ4HDv6GPxMiMZsnpBcwGSX5
 TLz8earoQ3hKAshiCMOWRWAR3rhW/s2Pl2WbsxRdTSuSs7etzkoUkloYR
 MZaGKEaDdgCjsP78pnUefSuji4GCvYet48PuZwPVz4kmHxVZ5hhnUifR+
 pMOjSNqPnDebg5AN+XDTmxNURJGiPimsixxPVP1nrRVK0MG+pwNi2S0fn g==;
X-CSE-ConnectionGUID: vZP4wJxcSR6s1XRoQB1NzA==
X-CSE-MsgGUID: 2Lb8JtR3THGaeLr0BQxp2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813645"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813645"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:48 -0700
X-CSE-ConnectionGUID: aL7jTYWnTeGBl9lIEivvaQ==
X-CSE-MsgGUID: bEzRupv0QDC8YQCOHwDi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787263"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:47 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 07/18] drm/xe: Stop VM work when device I/O is blocked
Date: Fri, 16 Oct 2026 12:48:17 +0530
Message-ID: <20261016071832.222574-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

SVM fault handling and VM rebind work may still run when PCI error
recovery starts or the device becomes permanently wedged. This work can
validate BOs, update page tables or submit migration work after device
I/O has been blocked.

Stop SVM fault handling, pagemap population, device-memory copies and
preempt rebind work when device I/O is blocked.

v2:
 - Protect VM and SVM hardware access with the common SRCU gate (Thomas)
 - Hold the gate across page-fault, migration and rebind work.
 - Remove the racy device state checks (Matt)

v3:
 - Use DRM device SRCU for VM and SVM hardware access.
 - Protect the SVM garbage collector worker with the common I/O gate.
 - Keep the original TLB invalidation warning because cancellation is
   converted to success by the lower layer.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 26 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c  | 11 +++++++++--
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 909a602d091e..226dfa57cc06 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -12,6 +12,7 @@
 #include <drm/ttm/ttm_bo.h>
 
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
 #include "xe_log.h"
@@ -457,9 +458,15 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm,
 					svm.garbage_collector.work);
+	int io_idx;
 
 	guard(rwsem_read)(&vm->lock);
+
+	if (xe_device_io_get(vm->xe, &io_idx))
+		return;
+
 	xe_svm_garbage_collector(vm);
+	xe_device_io_put(io_idx);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -600,6 +607,8 @@ static int xe_svm_copy(struct page **pages,
 #define XE_VRAM_ADDR_INVALID	~0x0ull
 	u64 vram_addr = XE_VRAM_ADDR_INVALID;
 	int err = 0, pos = 0;
+	bool io_held = false;
+	int io_idx;
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
 	ktime_t start = xe_gt_stats_ktime_get();
 
@@ -630,6 +639,12 @@ static int xe_svm_copy(struct page **pages,
 			vr = xe_page_to_vr(spage);
 			gt = xe_migrate_exec_queue(vr->migrate)->gt;
 			xe = vr->xe;
+
+			err = xe_device_io_get(xe, &io_idx);
+			if (err)
+				goto err_out;
+
+			io_held = true;
 		}
 		XE_WARN_ON(spage && xe_page_to_vr(spage) != vr);
 
@@ -750,6 +765,9 @@ static int xe_svm_copy(struct page **pages,
 	if (pre_migrate_fence)
 		dma_fence_wait(pre_migrate_fence, false);
 
+	if (io_held)
+		xe_device_io_put(io_idx);
+
 	/*
 	 * XXX: We can't derive the GT here (or anywhere in this functions, but
 	 * compute always uses the primary GT so accumulate stats on the likely
@@ -1124,8 +1142,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct xe_bo *bo;
 	int err = 0, idx;
 
-	if (!drm_dev_enter(&xe->drm, &idx))
-		return -ENODEV;
+	err = xe_device_io_get(xe, &idx);
+	if (err)
+		return err;
 
 	xe_pm_runtime_get(xe);
 
@@ -1167,7 +1186,8 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 		xe_bo_put(bo);
 	}
 	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
+
+	xe_device_io_put(idx);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 095f762bbb6f..a9882a22b34e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -512,6 +512,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	int err = 0;
+	int io_idx;
 	long wait;
 	int __maybe_unused tries = 0;
 
@@ -545,6 +546,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock_outer;
 
+	if (xe_device_io_get(vm->xe, &io_idx)) {
+		xe_validation_ctx_fini(&ctx);
+		err = 0;
+		goto out_unlock_outer;
+	}
+
 	drm_exec_until_all_locked(&exec) {
 		bool done = false;
 
@@ -552,8 +559,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
 		if (err || done) {
-			xe_validation_ctx_fini(&ctx);
-			goto out_unlock_outer;
+			goto out_unlock;
 		}
 	}
 
@@ -599,6 +605,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 out_unlock:
 	xe_validation_ctx_fini(&ctx);
+	xe_device_io_put(io_idx);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
-- 
2.43.0

