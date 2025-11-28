Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB035CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 10:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196310E12F;
	Fri, 28 Nov 2025 10:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/u9RJGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290AD10E12F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764326810; x=1795862810;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KIoSHVSQGkcDIm2pemQ2Y7qe4DBMK5wwHlYWJE0vphA=;
 b=H/u9RJGPQSQJ4wy5goblOrDOdShMHEb9D69occ0q80kh/Wk5/AUvs1VL
 UAHEZ7FxwdYEIYrWuA3RaoI7YH+40igh0u1jMPu/iPo6ZvKXPXS6O2yiR
 m09cRDY9FHrMhlNUzikiLVfCny4feblfcykqNsMayG7SegEZmrSzrlTs1
 VUs/XZmi9LCO3EKf9s1xwj7ztr1zYsVyoWPVB34DArijr/4ymACeK4AJU
 qkRBdaKTa57cQfvK3IylPOEe+KUsrGKfOZRgPSc5lntwgeS/0Xta7gYY+
 gbxhOlPqYv5yMcWpYakNBFnFZ+bGDu7y5PkM0jLs4DQ0RNR+mx/Nju7sa w==;
X-CSE-ConnectionGUID: /8R6dO58RzKOv3nAHyMJUw==
X-CSE-MsgGUID: N+7dROeERgKgJUIYE9848A==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77719612"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="77719612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 02:46:49 -0800
X-CSE-ConnectionGUID: HPglHmG5TFip/PejxBEcXg==
X-CSE-MsgGUID: 45V2xtCRQrmQC75X+8IiKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="224139771"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.217])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 02:46:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
Date: Fri, 28 Nov 2025 11:46:23 +0100
Message-ID: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

The user can give advices as to how the CPU will access an
address range. Use those advices to determine the number of
bo pages to prefault on a page-fault.

Do this regardless of whether we can find a way to avoid the
fairly slow vm_insert_pfn_prot() to populate buffer
object maps.

Initially, fault up to 512 pages on sequential access and
a single page on random access.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fd6ce6c6586..07d0d954f826 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
 	return err;
 }
 
+/*
+ * Number of prefaulted pages for the MADV_SEQUENTIAL and
+ * MADV_RANDOM madvise() advices.
+ */
+#define XE_BO_VM_NUM_PREFAULT_SEQ  512
+#define XE_BO_VM_NUM_PREFAULT_RAND 1
+
 /* Call into TTM to populate PTEs, and register bo for PTE removal on runtime suspend. */
 static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
 {
+	const struct vm_area_struct *vma = vmf->vma;
+	pgoff_t num_prefault;
 	vm_fault_t ret;
 
 	trace_xe_bo_cpu_fault(bo);
 
+	if (vma->vm_flags & VM_SEQ_READ)
+		num_prefault = XE_BO_VM_NUM_PREFAULT_SEQ;
+	else if (vma->vm_flags & VM_RAND_READ)
+		num_prefault = XE_BO_VM_NUM_PREFAULT_RAND;
+	else
+		num_prefault = TTM_BO_VM_NUM_PREFAULT;
+
 	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT);
+				       num_prefault);
 	/*
 	 * When TTM is actually called to insert PTEs, ensure no blocking conditions
 	 * remain, in which case TTM may drop locks and return VM_FAULT_RETRY.
-- 
2.51.1

