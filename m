Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01172C4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3610EB41;
	Tue, 21 Jul 2026 20:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVRPcqpC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814FB10EB41
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 20:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784667335; x=1816203335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rnkOBDkkNmqyi2+RsODYCXCbOHNGLVs4BEShX40tS4E=;
 b=jVRPcqpCe8qy6lnp0YKxB51plLpXTocnsV1/lfRQ5J9RRl4Of/evnU60
 v0DiTki0cl4rr0z7Z8Pg4lEMPr1Y000yVrOAgVha7x/fHmqAdGKaeRLlb
 6L7b707/ZbgKZcD8PBBDeyBM77Rb5b8ClDip6Od4IafLYex1QbIeB3pwZ
 SiOuFcYe+vYVI6xTTwW4KwJrVJDY5lCEawOtKbgWp70doFjfLgwtdcmth
 movcqZqCWv0fMXTTihxd6xsB9p0ck5mcAB10Mw8LPHBvhgNE2xBHDn3/P
 o/xcf/D1EpqtPvYxmVBhoDPGkkvav/fIoMGZ1ePelEHyC9jbonf7L+X8z Q==;
X-CSE-ConnectionGUID: EPDVFC/XQhCkHqFRaj6N9A==
X-CSE-MsgGUID: v83lPuQhTlypryP0PhhobA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108073972"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108073972"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 13:55:35 -0700
X-CSE-ConnectionGUID: l2uBT4bCS/S6fpjOwdSzaA==
X-CSE-MsgGUID: 0w2uFxM+Sg28bf7EZye4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262805947"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 13:55:33 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/3] drm/xe/vm: Fix SVM leak on resv obj alloc failure in
 xe_vm_create()
Date: Tue, 21 Jul 2026 20:55:14 +0000
Message-Id: <20260721205516.4058959-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721205516.4058959-1-shuicheng.lin@intel.com>
References: <20260721205516.4058959-1-shuicheng.lin@intel.com>
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

Commit 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm") made
xe_svm_init() unconditional in xe_vm_create() and extended it to also
initialize a "simple" gpusvm state for non-fault-mode VMs. The matching
xe_svm_fini() call in xe_vm_close_and_put() was updated to run
unconditionally, but the error unwind path in xe_vm_create() was not.

On the drm_gpuvm_resv_object_alloc() failure path, xe_svm_init() has
already succeeded but xe_svm_fini() is only called when
XE_VM_FLAG_FAULT_MODE is set. For non-fault-mode VMs this leaves
vm->svm.gpusvm partially initialized and leaks the resources allocated
by drm_gpusvm_init().

For fault-mode VMs, xe_svm_init() additionally acquires the pagemap
owner via drm_pagemap_acquire_owner() and the pagemaps via
xe_svm_get_pagemaps(). Those resources are released by xe_svm_close(),
not xe_svm_fini(). On the same error path, xe_svm_close() is not
called either, so fault-mode VMs leak the pagemap owner and pagemaps.

Fix both leaks:

- Call xe_svm_fini() unconditionally on the err_svm_fini path, matching
  the unconditional xe_svm_init() call. Move the vm->size = 0
  assignment out of the conditional so the xe_vm_is_closed() assert in
  xe_svm_fini() (and xe_svm_close()) holds for both modes.

- Call xe_svm_close() for fault-mode VMs before xe_svm_fini(), matching
  the ordering used in xe_vm_close_and_put().

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b9c8641e1e15..83f35d8f5323 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1825,10 +1825,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	return ERR_PTR(err);
 
 err_svm_fini:
-	if (flags & XE_VM_FLAG_FAULT_MODE) {
-		vm->size = 0; /* close the vm */
-		xe_svm_fini(vm);
-	}
+	vm->size = 0; /* close the vm */
+	if (flags & XE_VM_FLAG_FAULT_MODE)
+		xe_svm_close(vm);
+	xe_svm_fini(vm);
 err_no_resv:
 	mutex_destroy(&vm->snap_mutex);
 	for_each_tile(tile, xe, id)
-- 
2.43.0

