Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8616CD6E75
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949B411A1DE;
	Thu,  4 Jun 2026 17:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GzpPl4M6";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F4711A1F6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593316;
 bh=UZN1sJw3p0drVWdRDOwFIV8Y7HTavCBW7jxE9mHs8DE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GzpPl4M64li3MHHXWnEnRv4fKstvL5wlP4gjVid9JsKZSgPDYtC9BzMD+tNJzGHau
 OTVwV3N3rC0LwvTFTjaYF11Fe8BEpsRCsSQY1aoGQhEiFkB2cCxFydOyQWLezKiuzn
 QI5FHdWocCdBOd+Oqn1OROJipZdDmoMSd88arN2RYGfPhpFBdKVExHwRsbgRY95tZM
 qPb5T91JsevMXOHZbi3w1Y7yQ5vLFqbHxd++pDOv7IP7h1cgTUQIyLYmn6BXusFqyU
 MNWe7KplbPHY+FFPF4ZhNYSraoylJJLmDyg7BznSKHVJ02hz67TAdLksnN6eEMp13B
 jIcNxwNbFIslg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 23/24] drm/xe: Enter ULLS for migration jobs upon page fault
 or SVM prefetch
Date: Thu,  4 Jun 2026 19:14:59 +0200
Message-ID: <20260604171502.84047-24-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Call xe_migration_ulls_enter upon page fault or SVM prefetch in an
effort speed up these critical paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-25-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
 drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a399..cec7a1e6caf4a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -14,6 +14,7 @@
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
+#include "xe_migrate.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
@@ -184,6 +185,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
+
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6e9400f32b907..679cce10cddd7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2486,8 +2486,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			ctx.devmem_possible = IS_DGFX(vm->xe) &&
 					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 
-			for_each_tile(tile, vm->xe, id)
+			for_each_tile(tile, vm->xe, id) {
+				xe_migrate_ulls_enter(tile->migrate);
 				tile_mask |= 0x1 << id;
+			}
 
 			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
 			op->prefetch_range.ranges_count = 0;
-- 
2.53.0

