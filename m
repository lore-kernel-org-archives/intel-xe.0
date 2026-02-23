Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C105EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CE610E44F;
	Mon, 23 Feb 2026 14:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEI9YKuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9267410E45A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855508; x=1803391508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9sbK9YCBzspHDkWy6nX41Bqvj3hab6R3al19OE2BbKE=;
 b=FEI9YKufS+Us6aogGLstrueiiS2+n2uz68bZTpea7gat+8Mnt9I2mcQx
 D6CbWy/EiEGjH/jAJFadc54paeD+2oLBdMjXzMYcZOi99mLJpHVEqYQSo
 eKFkMVw7yBcWlU6EV1aLMXrICh0jfHPPAKLMsO1VC1QzrrujB9r2uqsps
 uaRShQuJ8gF2iOBKwReAvj17NK/H+ftuYwYySCCde7trjFAkARqmTb6wG
 CJJ0XIfAHZEHBLzbM5rY7fOTqU7W7DX8F1d8PsIwI9vWDg44V/pcWNsdl
 /DbDtg13ProTB/KXmXJHO4MMgvRiH0udw70At2VE8l2EScUtIJAN0ie0c w==;
X-CSE-ConnectionGUID: GN12Dx8aRX2wqM9mjnx0Yw==
X-CSE-MsgGUID: xJsDBD2aShmDVGGNCIiSMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460993"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:05:08 -0800
X-CSE-ConnectionGUID: 55GRK1EPREanJjy2u0yWGA==
X-CSE-MsgGUID: 80f1mJNBRp6eqMnJer1I+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656714"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:05:04 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 22/22] drm/xe/eudebug: Enable EU pagefault handling
Date: Mon, 23 Feb 2026 16:03:17 +0200
Message-ID: <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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
(8) adapted to consumer/produced pagefaults

As designed this feature to only work when eudbug is enabled, it should
have no impact to regular recoverable pagefault code path.

v2: - pf->q holds the vm ref so drop it (Mika)
    - streamline uapi (Mika)
    - cleanup the pagefault through producer if (Mika)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++
 drivers/gpu/drm/xe/xe_pagefault.c       | 31 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index d48f6ed103bb..6adf3bf73b1c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -8,6 +8,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
+#include "xe_eudebug_pagefault.h"
 
 static void guc_ack_fault(struct xe_pagefault *pf, int err)
 {
@@ -37,8 +38,15 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
+static void guc_cleanup_fault(struct xe_pagefault *pf, int err)
+{
+	xe_eudebug_pagefault_service(pf);
+	xe_eudebug_pagefault_destroy(pf, 0);
+}
+
 static const struct xe_pagefault_ops guc_pagefault_ops = {
 	.ack_fault = guc_ack_fault,
+	.cleanup_fault = guc_cleanup_fault,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 72f589fd2b64..9dcd854e99f9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -10,6 +10,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
@@ -171,6 +172,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	xe_eudebug_pagefault_create(vm, pf);
+
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
@@ -184,9 +187,28 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
 	if (!vma) {
 		err = -EINVAL;
-		goto unlock_vm;
+		vma = xe_eudebug_create_vma(vm, pf);
+		if (IS_ERR(vma)) {
+			err = PTR_ERR(vma);
+			vma = NULL;
+		}
 	}
 
+	if (vma) {
+		/*
+		 * When creating an instance of eudebug_pagefault, there was
+		 * no vma containing the ppgtt address where the pagefault occurred,
+		 * but when reacquiring vm->lock, there is.
+		 * During not aquiring the vm->lock from this context,
+		 * but vma corresponding to the address where the pagefault occurred
+		 * in another context has allocated.
+		 */
+		err = 0;
+	}
+
+	if (err)
+		goto unlock_vm;
+
 	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
@@ -198,6 +220,10 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 unlock_vm:
 	if (!err)
 		vm->usm.last_fault_vma = vma;
+
+	if (err)
+		xe_eudebug_pagefault_destroy(pf, err);
+
 	up_write(&vm->lock);
 	xe_vm_put(vm);
 
@@ -268,6 +294,9 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		pf.producer.ops->ack_fault(&pf, err);
 
+		if (pf.producer.ops->cleanup_fault)
+			pf.producer.ops->cleanup_fault(&pf, err);
+
 		if (time_after(jiffies, threshold)) {
 			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 2bee858da597..9d2d29d35a4b 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -43,6 +43,15 @@ struct xe_pagefault_ops {
 	 * sends the result to the HW/FW interface.
 	 */
 	void (*ack_fault)(struct xe_pagefault *pf, int err);
+
+	/**
+	 * @cleanup_fault: Cleanup for producer, if any
+	 * @pf: Page fault
+	 * @err: Error state of fault
+	 *
+	 * Page fault producer received cleanup request from consumer
+	 */
+	void (*cleanup_fault)(struct xe_pagefault *pf, int err);
 };
 
 /**
-- 
2.43.0

