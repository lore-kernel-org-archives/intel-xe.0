Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B047C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 10:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B51810E207;
	Wed,  5 Jun 2024 10:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lu/X5gai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7135B10E207
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717583460; x=1749119460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r7Qn1jMH+d9BcXLUOmMpMHpLoVr0ReYw+U9kS8b+VhE=;
 b=lu/X5gaieT45hACSss40VSx+eAMrYPiMvrYrz/ibx+ebUMDEQtJlATHS
 ImyQhoG/Ht1nKRf9EreCpD2Vg9fWMloJ1BqjIRxOryNEPCTYzT9AgWemo
 psgcNKWC8il5WOOw9BoTRGEFOIQNfIF9aG2YprsXm4lcZVfYEkWOno/p7
 EEJ265OKSRYNFqNMnqXTlxL8iMkhpSSozqq8qoFS3pKtGLFj1WNtADDT9
 r+YZkgkPcKUCIsVsODsOK/sQ/mKztFcDVHsHXr6U6vBJgJhAF9UEYCxob
 7L5QB6+OF27IW6IHhbj0q4K/PovNK7Bt2RfSu5jmxTRYJqaZAccChG+1k w==;
X-CSE-ConnectionGUID: 1dH+XbrsTe+WTuXLFYuaQw==
X-CSE-MsgGUID: DNmhwgLzTuKgHWioelC1wA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14296983"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14296983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 03:31:00 -0700
X-CSE-ConnectionGUID: 8RaMitypSeyZHMRVdFLevQ==
X-CSE-MsgGUID: mPQ43aLyQVuU7coogY90lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="42663600"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 03:30:59 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Subject: [RFC] drm/xe: Ensure write lock is held when calling xe_vma_rebind()
Date: Wed,  5 Jun 2024 12:16:07 +0200
Message-ID: <20240605101607.29931-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_vma_rebind() expects write vm lock is held so start out with a
read lock and upgrade if a vma rebind is required.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1894
Fixes: bf69918b7199 ("drm/xe: Use xe_vma_ops to implement page fault rebinds")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..543cfa9892f6 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -153,24 +153,15 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		return -EINVAL;
 
 retry_userptr:
-	/*
-	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
-	 * start out read-locked?
-	 */
-	down_write(&vm->lock);
-	write_locked = true;
+	/* start out with read-locked and upgrade of vma is needed a rebind */
+	down_read(&vm->lock);
+	write_locked = false;
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
 		ret = -EINVAL;
 		goto unlock_vm;
 	}
 
-	if (!xe_vma_is_userptr(vma) ||
-	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
-		downgrade_write(&vm->lock);
-		write_locked = false;
-	}
-
 	trace_xe_vma_pagefault(vma);
 
 	atomic = access_is_atomic(pf->access_type);
@@ -179,9 +170,14 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (vma_is_valid(tile, vma) && !atomic)
 		goto unlock_vm;
 
+	/* xe_vma_rebind() expects a write lock so upgrade the vm lock */
+	up_read(&vm->lock);
+	down_write(&vm->lock);
+	write_locked = true;
 	/* TODO: Validate fault */
 
-	if (xe_vma_is_userptr(vma) && write_locked) {
+	if (xe_vma_is_userptr(vma) &&
+	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
 		spin_lock(&vm->userptr.invalidated_lock);
@@ -191,9 +187,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		ret = xe_vma_userptr_pin_pages(uvma);
 		if (ret)
 			goto unlock_vm;
-
-		downgrade_write(&vm->lock);
-		write_locked = false;
 	}
 
 	/* Lock VM and BOs dma-resv */
-- 
2.42.0

