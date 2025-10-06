Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BDFCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECF610E430;
	Mon,  6 Oct 2025 11:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqdChXiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8806B10E430
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749536; x=1791285536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xpgI0SsQDKS2slqalyu9qoxCP73Qe9cuhyA3Tq7MXXY=;
 b=dqdChXiBoaVs9/iJhgQ6uaXERp1ySlHNDVZXemgCbnGbuAsqp8ybElQF
 /Bam/JUPV/xyQ4ulOzQiW+mikpSu/El5P06967CwGoJg0pIfAtbZ6dow2
 BS4tV0vrslNssSOkC79+wePjzBCpPc6eEL1Nwbyzd1ScaFcv4z/cRAk0q
 ltuLiPOZKyV/mrPtfLC/NpYleaPtyzLGXr1Laj9k2ymIVwgqlBxCJSCrI
 qeryFnLBKZIZAblI1sMVcN9ogW05EwbsT7bnxo5ChkzRsfF9TFO/bt4MG
 u5OvDSCKfuBC5gUSSctNF+Xsnl3x7RG2xDqCipt8pXs0c5jXGwoGi6u6O g==;
X-CSE-ConnectionGUID: O2ge6AGgTiStJ0Tn6hkaCA==
X-CSE-MsgGUID: Gk2x52HpTeqe625EQudCBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825481"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:55 -0700
X-CSE-ConnectionGUID: 5M++dx+gTnK6xqRm3MzNVw==
X-CSE-MsgGUID: Afai8YBgSL6fSLRnuhABvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216947272"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:52 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 20/20] drm/xe/eudebug: Enable EU pagefault handling
Date: Mon,  6 Oct 2025 14:17:10 +0300
Message-ID: <20251006111711.201906-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. To solve this problem, enable
EU pagefault handling functionality, which allows to unhalt pagefaulted
eu threads and to EU debugger to get inform about the eu attentions state
of EU threads during execution.

If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
after handling the pagefault.

The pagefault handling is a mechanism that allows a stalled EU thread to
enter SIP mode by installing a temporal null page to the page table entry
where the pagefault happened.

A brief description of the page fault handling mechanism flow between KMD
and the eu thread is as follows

(1) eu thread accesses unallocated address
(2) pagefault happens and eu thread stalls
(3) XE kmd set an force eu thread exception to allow the running eu thread
    to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
    TD_CTL register)
    Not stalled (none-pagefaulted) eu threads enter SIP mode
(4) XE kmd installs temporal null page to the pagetable entry of the
    address where pagefault happened.
(5) XE kmd replies pagefault successful message to GUC
(6) stalled eu thread resumes as per pagefault condition has resolved
(7) resumed eu thread enters SIP mode due to force exception set by (3)

As designed this feature to only work when eudbug is enabled, it should
have no impact to regular recoverable pagefault code path.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 +++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index a054d6010ae0..873ffd982030 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -13,6 +13,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
+#include "xe_eudebug.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
@@ -173,10 +174,14 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 	return vm;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static int handle_pagefault_start(struct xe_gt *gt, struct pagefault *pf,
+				  struct xe_vm **pf_vm,
+				  struct xe_eudebug_pagefault **eudebug_pf_out)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
+	struct xe_eudebug_pagefault *eudebug_pf;
+	bool  destroy_eudebug_pf = false;
 	struct xe_vma *vma = NULL;
 	int err;
 	bool atomic;
@@ -189,6 +194,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	eudebug_pf = xe_eudebug_pagefault_create(gt, vm, pf->page_addr,
+						 pf->fault_type, pf->fault_level,
+						 pf->access_type);
+
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
@@ -201,8 +210,27 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
 	if (!vma) {
-		err = -EINVAL;
-		goto unlock_vm;
+		if (eudebug_pf)
+			vma = xe_vm_create_null_vma(vm, pf->page_addr);
+
+		if (IS_ERR_OR_NULL(vma)) {
+			err = -EINVAL;
+			if (eudebug_pf)
+				destroy_eudebug_pf = true;
+
+			goto unlock_vm;
+		}
+	} else {
+		/*
+		 * When creating an instance of eudebug_pagefault, there was
+		 * no vma containing the ppgtt address where the pagefault occurred,
+		 * but when reacquiring vm->lock, there is.
+		 * During not aquiring the vm->lock from this context,
+		 * but vma corresponding to the address where the pagefault occurred
+		 * in another context has allocated.
+		 */
+		if (eudebug_pf)
+			destroy_eudebug_pf = true;
 	}
 
 	atomic = access_is_atomic(pf->access_type);
@@ -217,11 +245,43 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (!err)
 		vm->usm.last_fault_vma = vma;
 	up_write(&vm->lock);
-	xe_vm_put(vm);
+
+	if (destroy_eudebug_pf) {
+		xe_eudebug_pagefault_destroy(gt, vm, eudebug_pf, false);
+		*eudebug_pf_out = NULL;
+	} else {
+		*eudebug_pf_out = eudebug_pf;
+	}
+
+	/* while the lifetime of the eudebug pagefault instance, keep the VM instance.*/
+	if (!*eudebug_pf_out) {
+		xe_vm_put(vm);
+		*pf_vm = NULL;
+	} else {
+		*pf_vm = vm;
+	}
 
 	return err;
 }
 
+static void handle_pagefault_end(struct xe_gt *gt, struct xe_vm *vm,
+				 struct xe_eudebug_pagefault *eudebug_pf)
+{
+	/* if there no eudebug_pagefault then return */
+	if (!eudebug_pf)
+		return;
+
+	xe_eudebug_pagefault_process(gt, eudebug_pf);
+
+	/*
+	 * TODO: Remove VMA added to handle eudebug pagefault
+	 */
+
+	xe_eudebug_pagefault_destroy(gt, vm, eudebug_pf, true);
+
+	xe_vm_put(vm);
+}
+
 static int send_pagefault_reply(struct xe_guc *guc,
 				struct xe_guc_pagefault_reply *reply)
 {
@@ -346,7 +406,10 @@ static void pf_queue_work_func(struct work_struct *w)
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
 	while (get_pagefault(pf_queue, &pf)) {
-		ret = handle_pagefault(gt, &pf);
+		struct xe_eudebug_pagefault *eudebug_pf = NULL;
+		struct xe_vm *vm = NULL;
+
+		ret = handle_pagefault_start(gt, &pf, &vm, &eudebug_pf);
 		if (unlikely(ret)) {
 			print_pagefault(gt, &pf);
 			pf.fault_unsuccessful = 1;
@@ -364,7 +427,12 @@ static void pf_queue_work_func(struct work_struct *w)
 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
 			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-		send_pagefault_reply(&gt->uc.guc, &reply);
+		ret = send_pagefault_reply(&gt->uc.guc, &reply);
+
+		if (unlikely(ret))
+			xe_gt_dbg(gt, "GuC Pagefault reply failed: %d\n", ret);
+
+		handle_pagefault_end(gt, vm, eudebug_pf);
 
 		if (time_after(jiffies, threshold) &&
 		    pf_queue->tail != pf_queue->head) {
-- 
2.43.0

