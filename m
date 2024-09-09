Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4AEECE57E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 22:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EC610E375;
	Mon,  9 Sep 2024 22:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHuzz3d9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9AE10E375
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725921087; x=1757457087;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FUIK8t5l01QVBp2XuV4+DjjVJJOKQQXdJzV0XyMU3hQ=;
 b=FHuzz3d9iWI3WESDE6Giqv812ZKXKOjSKx24CITTYg3quaiiOUlAJz42
 jM32hSjwAOZuP6IheteeXIOKIxFxWOtCofnsv7DdU/zmwAFultH18cVDN
 dHM21uX7SRLKjESaFQrGFWZ0DtofNlDe2Tv6QnAqSNPs/j3I6iPI6lHkz
 JGBAHgU94S5pDgj0p3zw7ok+qde9BhTN+NYzqc+ztdK0ydXTFtP/1Ih7h
 F1TZMwKZp3zZL1lTLDor5Ucvy941h5+Mr9PqfHRnGmUeGbjY7FGgletrn
 kXAYmkgA77C/vpSQ21GMxNLLcmNHky8d2JbS9aXE1P/iE0RU4PL2GvuYz w==;
X-CSE-ConnectionGUID: ThYTlZ+IR+uzXzRYVj7AFA==
X-CSE-MsgGUID: grsQq3SYT1C9b5jJdkxXKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35309102"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="35309102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 15:31:27 -0700
X-CSE-ConnectionGUID: bPyyJ89ySKm/n2ElItIF2g==
X-CSE-MsgGUID: Elhmf1ltT+m7ui8D7SLHyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67073473"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 15:31:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe: Flush all page faults when closing a VM
Date: Mon,  9 Sep 2024 15:32:25 -0700
Message-Id: <20240909223225.665761-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909223225.665761-1-matthew.brost@intel.com>
References: <20240909223225.665761-1-matthew.brost@intel.com>
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

Ensure all page faults on VM are done when closing a VM before removing
page table memory.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c           |  7 +++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 730eec07795e..2dd7065ce54a 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -304,6 +304,21 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 		PF_MSG_LEN_DW;
 }
 
+/**
+ * xe_gt_pagefault_flush() - Flush page faults for a VM
+ * @gt: the GT object
+ * @vm: the VM objecy
+ *
+ * Ensure all page faults per GT and VM pair are done executing.
+ */
+void xe_gt_pagefault_flush(struct xe_gt *gt, struct xe_vm *vm)
+{
+	struct pf_queue *pf_queue = gt->usm.pf_queue +
+		(vm->usm.asid % NUM_PF_QUEUE);
+
+	flush_work(&pf_queue->worker);
+}
+
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 839c065a5e4c..9f4166617f04 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -10,8 +10,10 @@
 
 struct xe_gt;
 struct xe_guc;
+struct xe_vm;
 
 int xe_gt_pagefault_init(struct xe_gt *gt);
+void xe_gt_pagefault_flush(struct xe_gt *gt, struct xe_vm *vm);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7acd5fc9d032..5139a731ae79 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1543,6 +1543,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm)) {
+		struct xe_gt *gt;
+
+		/* Stop all async faults */
+		for_each_gt(gt, xe, id)
+			xe_gt_pagefault_flush(gt, vm);
+	}
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
-- 
2.34.1

