Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32604C98338
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D541810FC77;
	Fri, 25 Sep 2026 20:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxNrIawN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662C110FC48
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367334; x=1821903334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iFqNVabzC3eQmzdZ+ccIpR0dPcaXmbUDmMa8tJeHT0I=;
 b=BxNrIawNh671dWRFcu+MObQS8Zx2gIJ2b3VygEq04YZ71/qYqTO8IxGZ
 JBNvuV18SPMD9uburXDYKP2r7VX0/0nPdbI0AD6rVUsSPWFb/GzHO3Ms+
 eRyPKarnKOCRzDh9BX1UwYPjkmB7bMjx/FThq1KAQbF3c30ig6uph9amG
 295XTE35bz/4oXw0bjlf628GOKDHqpBlRJ6v6DhRcQk7ePjZp2ay/q69b
 2fpCcBlRO7s/j1Gi6vQd7VuOIuhs0Ff1vt57jgoFItUvsreLwIurOqG5D
 vbAJTB30p76ChtaxlhrSTDqR5YdonzCuEOnWVYQ/RWY8B3d/lRTHlGqjv w==;
X-CSE-ConnectionGUID: xq9UMiiRTFOnHP2hOaQjAA==
X-CSE-MsgGUID: JqHDEqExTwe13JQ0QgVYyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377976"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377976"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
X-CSE-ConnectionGUID: TVeAJRgxTMCCA2XmvA1Ang==
X-CSE-MsgGUID: T5Is/P4rTQaE1BtsfbuHmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509902"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Date: Fri, 25 Sep 2026 13:15:24 -0700
Message-Id: <20260925201526.1355279-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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

Call xe_migrate_ulls_enter upon page fault or SVM prefetch in an
effort speed up these critical paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
 drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f9e5bd41cfd1..f219e9e3b73e 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -15,6 +15,7 @@
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
 #include "xe_log.h"
+#include "xe_migrate.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_pm.h"
@@ -281,6 +282,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
+
 	down_read(&vm->lock);
 
 	if (xe_vm_is_closed(vm)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f66bd1de2b70..425c678f4480 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2528,8 +2528,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			ctx.devmem_possible = IS_DGFX(vm->xe) &&
 					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 
-			for_each_tile(tile, vm->xe, id)
+			for_each_tile(tile, vm->xe, id) {
+				xe_migrate_ulls_enter(tile->migrate);
 				tile_mask |= 0x1 << id;
+			}
 
 			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
 				dpagemap = xe_vma_resolve_pagemap(vma,
-- 
2.34.1

