Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D495DCDD543
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C5510E274;
	Wed, 18 Sep 2024 16:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDTFIkxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE87110E274
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726675442; x=1758211442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E51ZokQhQyqdBY53OCHQK7e9t4+Qs15TKgxffwXTTsk=;
 b=SDTFIkxjWTCpmbzDMRE0VJt5K/Et/LpCr1lBk9CFnDd3rXO76JShTwMH
 jJXIvQY5ppFnck2zUBp+sv8ZqRle0ddK7yS4HPK6UPTHbt4/py6L3rc3i
 zRJ6/SlBRvyluYhe2Aq7HWvla3Z7IigF5zthHvukUWzYNQhFvNRSCGigk
 xB7fmFbfh8FNRWFmj+f2dWoO3+rhFXnhljSbNkBsxiHgiz3bY05pnA2Hf
 Lo0D1YAuI8GSgrkhJUmr6pllhtVAFTK5eQYKsvJfrBHRQmaOfcX3nAdgJ
 BbAH/JwvGd2YcCkaBiDMAZ8Cg/3bpAGlpRr15GYmsd/eiWLgBtDByKh2r Q==;
X-CSE-ConnectionGUID: UpAp5ZYqSVqPFVU6PrBbOw==
X-CSE-MsgGUID: iAK21Da6QWOb2gilIndEBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25542292"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25542292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:04:02 -0700
X-CSE-ConnectionGUID: GJejPJj+TWykQnix1ZdpiQ==
X-CSE-MsgGUID: GrIAKG/NTc2yBaf7SnCp5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69256938"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:04:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe: Use helper for ASID -> VM in GPU faults and access
 counters
Date: Wed, 18 Sep 2024 09:05:03 -0700
Message-Id: <20240918160503.2021315-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Normalize both code paths with a helper. Fixes a possible leak access
counter path too.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 39 +++++++++++++++-------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5c3af2bb5402..79c426dc2505 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -185,6 +185,21 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	return err;
 }
 
+static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
+{
+	struct xe_vm *vm;
+
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, asid);
+	if (vm && xe_vm_in_fault_mode(vm))
+		xe_vm_get(vm);
+	else
+		vm = ERR_PTR(-EINVAL);
+	up_read(&xe->usm.lock);
+
+	return vm;
+}
+
 static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -197,16 +212,9 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (pf->trva_fault)
 		return -EFAULT;
 
-	/* ASID to VM */
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
-	if (vm && xe_vm_in_fault_mode(vm))
-		xe_vm_get(vm);
-	else
-		vm = NULL;
-	up_read(&xe->usm.lock);
-	if (!vm)
-		return -EINVAL;
+	vm = asid_to_vm(xe, pf->asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
 
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
@@ -548,14 +556,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	if (acc->access_type != ACC_TRIGGER)
 		return -EINVAL;
 
-	/* ASID to VM */
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
-	if (vm)
-		xe_vm_get(vm);
-	up_read(&xe->usm.lock);
-	if (!vm || !xe_vm_in_fault_mode(vm))
-		return -EINVAL;
+	vm = asid_to_vm(xe, acc->asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
 
 	down_read(&vm->lock);
 
-- 
2.34.1

