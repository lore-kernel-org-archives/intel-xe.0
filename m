Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB1BD116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74510E63E;
	Tue,  2 Dec 2025 13:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FuHtSH7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4901A10E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683656; x=1796219656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bo7M4/FealuQxB/0I3rdMMAOjGlCrgsznPhPDr5DZ50=;
 b=FuHtSH7AphQauYqL1be6vixZusz6uVBqaoglUs+t/AK28hQqDOQ07cDb
 Zdrvv2C3t2WjhYeWbXxc6oWFaIf2QQFrjpr4qexFQxCAUDbhE7Zwf1uL/
 ha9tmGCTWERmSUv3wfiBCqUnWTOLbg5tpv4HHQYTUwnoaHaH2FSMuQPNM
 tlmPi7HwI4K1fraJlkk21D5keX+mDk8d1yb0X7TtB8HnRnF3oM0RnzZJf
 NhI3IxbR0XRwk9xz4UNlRWhn82FWUTJrBphCbeH6scUBnENuk/uWtZb0V
 xTOPiteMDSkh7UKTawaBRabMoxVc59vgqiUMRs2m2ZevNu4V7Fct7oAu9 A==;
X-CSE-ConnectionGUID: gybsH4rOQWKEMa6wg+UKLg==
X-CSE-MsgGUID: 1q6J/I4hRUOLLuZxR2iB0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537148"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:16 -0800
X-CSE-ConnectionGUID: oDc+1NHPT/OxH9ojPQcFxQ==
X-CSE-MsgGUID: 5CfBc98MQOKkMGBCOcSTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505819"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:12 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 20/20] drm/xe/eudebug: Enable EU pagefault handling
Date: Tue,  2 Dec 2025 15:52:39 +0200
Message-ID: <20251202135241.880267-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
index 719a18187a31..cd41023ebef9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -8,6 +8,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
+#include "xe_eudebug_pagefault.h"
 
 static void guc_ack_fault(struct xe_pagefault *pf, int err)
 {
@@ -36,8 +37,15 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
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
index afb06598b6e1..369749641f37 100644
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
 
@@ -266,6 +292,9 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		pf.producer.ops->ack_fault(&pf, err);
 
+		if (pf.producer.ops->cleanup_fault)
+			pf.producer.ops->cleanup_fault(&pf, err);
+
 		if (time_after(jiffies, threshold)) {
 			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index c89d7fb698e0..ce82e39015ae 100644
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

