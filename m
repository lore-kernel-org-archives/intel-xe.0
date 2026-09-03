Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A0AC79F89
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A17910F808;
	Thu,  3 Sep 2026 23:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ke13mFS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621110E198
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EdbOEE6NZllVbs2UTkSdMK2lFK5bvBikDlnvXW/N18w=;
 b=ke13mFS5GsOxZj/fFFdX/b6aCnLtb2wRxnkRXk7GcPXcd99PkvnYuyO/
 H7XOnP3XQ2cw/4Y7ndQNxfhMWEP/XsyDPSvQXtONCzdwu3ogD7rTIiRdg
 ko6LgQtfXnwT7ilDh5H2WOe+jsUiPgZ+XuGqBL8uj67jux+z3cdpTeudF
 vi78Bm9wywe3VIIpIJldt1AjzlONKoPD1BMF9DWsjJxLr4klxUDQRckO3
 mjbEzF5CWI1+bQs9ZVkS3Y779F7MHJFa3kYaBLlBfQmJis7vu73fkNx+u
 qKXCGhSdEvR23LuuR+Ou8rBjGioD3zGbZZJpR2fAFAOiwQ2qPuNgX1Nrl Q==;
X-CSE-ConnectionGUID: BJ2ZnsOCQ/CEsyvRVEO1qg==
X-CSE-MsgGUID: O0JpenV2RqKm2sKddrV5ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637823"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: aVxo2XcLRkCIN4lf6W+fCA==
X-CSE-MsgGUID: iQf25a3qRKmL7xk5lrUcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029065"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 23/25] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Date: Thu,  3 Sep 2026 16:58:40 -0700
Message-Id: <20260903235842.3401722-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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

Call xe_migration_ulls_enter upon page fault or SVM prefetch in an
effort speed up these critical paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-25-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c   | 4 ++--
 drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
 drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1fa236eb1a26..80efa67fc2e1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -114,8 +114,8 @@ static void xe_migrate_fini(void *arg)
 	disable_delayed_work_sync(&m->ulls.exit_work);
 	mutex_lock(&m->job_mutex);
 	if (m->ulls.enabled) {
-		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
 		xe_pm_runtime_put(xe);
+		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
 		m->ulls.enabled = false;
 	}
 	mutex_unlock(&m->job_mutex);
@@ -589,8 +589,8 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 		xe_sched_job_put(job);
 	if (!m->ulls.enabled) {
 		/* Pairs with PM gets on enter */
-		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
 		xe_pm_runtime_put(xe);
+		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
 
 		cancel_delayed_work(&m->ulls.exit_work);
 		xe_dbg(xe, "Migrate ULLS mode exit");
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index e81ca24df37f..ecf2530f0284 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -15,6 +15,7 @@
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
 #include "xe_log.h"
+#include "xe_migrate.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
@@ -262,6 +263,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
+
 	down_read(&vm->lock);
 
 	if (xe_vm_is_closed(vm)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0e6ec05de551..25425b57ceaa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2526,8 +2526,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
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

