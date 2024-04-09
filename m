Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870FCCD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6C112F11;
	Tue,  9 Apr 2024 20:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jheOwqH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87265112F2E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693098; x=1744229098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YiTlWfNtb7GC26sYbid8tLrFBX7ange4Un3Xfm/jcAw=;
 b=jheOwqH9fvp0q+vFJOa6kck7VCk67UyyRKe2MpohbudPkOVGKIPSLzsk
 KbhmNtNQm0duGLzdhhSE53bc9hM7xAa7UXKIu3reMcD7O6co+8Jo46Mkj
 +POltQXVpJYdZM/DBvpDhxV6J3sJmQgKU7qBWhJVMT4bmN2m735/o9qdC
 0V7GU8x4wAZelI85J4pTAGR4gcFPuyDGC/duOE75D1I2Xk3n6wt26KGmp
 QDKTXE//6k1gD1MzKdyhGmSDpDaBhN4GxCJC/EHQnfg2yJwwKyZOf7B+J
 hsIY2DSTzSeqPBwcBtlsoyjp/WRmI9szPk2wlZO93R8AG26YRi0ON0pJg A==;
X-CSE-ConnectionGUID: axfqZ1ncRnaTELS+fxhUlg==
X-CSE-MsgGUID: OyHimxysSjaatQyzvKxr8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803773"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803773"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:54 -0700
X-CSE-ConnectionGUID: 6fgDHIm4SUeh+U+lmVo+Eg==
X-CSE-MsgGUID: i3MgNdPtQZ2TBdZqa37JWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773805"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
 allocator
Date: Tue,  9 Apr 2024 16:17:42 -0400
Message-Id: <20240409201742.3042626-32-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

If applicable, migrate a vma from sram to vram for system allocator.
Traditional userptr is not migrated. Only userptr created during
fault (aka userptr splitted from system allocator vma) can be
migrated.

FIXME: The migration should be conditional on user memory attributes
setting. Add this logic when memory attributes are supported

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 9 ++++++++-
 drivers/gpu/drm/xe/xe_vm.c           | 4 ----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 668984f0769e..c6ba00049964 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -20,6 +20,7 @@
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
 #include "xe_trace.h"
+#include "xe_svm.h"
 #include "xe_vm.h"
 
 struct pagefault {
@@ -209,12 +210,18 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	if (xe_vma_is_userptr(vma) && write_locked) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+		struct xe_userptr *userptr = &uvma->userptr;
 
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_del_init(&uvma->userptr.invalidate_link);
+		list_del_init(&userptr->invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 
+		mmap_read_lock(userptr->notifier.mm);
+		/**FIXME: Add migration policy here*/
+		if (xe_vma_is_fault_userptr(vma))
+			xe_svm_migrate_vma_to_vram(vm, vma, tile);
 		ret = xe_vma_userptr_pin_pages(uvma);
+		mmap_read_unlock(userptr->notifier.mm);
 		if (ret)
 			goto unlock_vm;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 498b36469d00..8a58fe144a02 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -71,16 +71,12 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
-	struct xe_userptr *userptr;
 	int ret;
 
 	lockdep_assert_held(&vm->lock);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
-	userptr = &uvma->userptr;
-	mmap_read_lock(userptr->notifier.mm);
 	ret = xe_userptr_populate_range(uvma);
-	mmap_read_unlock(userptr->notifier.mm);
 
 	return ret;
 }
-- 
2.26.3

