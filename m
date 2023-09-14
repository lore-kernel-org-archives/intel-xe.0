Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A31EDE9B4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 12:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E910E56E;
	Thu, 14 Sep 2023 12:11:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05310E56F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694693493; x=1726229493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lIzl0PD7HGvXueFhP/AWf33ajvKm1gpufIHEq6dwcgA=;
 b=n775QFj+neTX+NuwTLLLGX0sjA3tDIuW/cCyg9nI2vX8CPB3K1PQyCBT
 bgYKF7AZivjFCoOGmISgkZST3rroshnPpLvi2VPwP5bJ4aLNjaCq0RYTK
 +QexS/htyyvAtQhlZ4inVRL6bT1zTfiEdaVBhELyjX5H36RDGXG8k8ncM
 u9tFQUMr67yR/7MOmhzZYF3ZlYM+W/aUNrdYst6QYKvHW4p4vEYyeOdnU
 hrcvHk9exyYY4ezBfHZa8uhQfoSKt0aIarK4J9uLfdbzu0fFkavlXJZgH
 hIBCnhETPaR/5+/0vetkSGBBzVkzKaQKZB5hZ4S6IkJIVENbEfUz82m18 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377838153"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="377838153"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918223780"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918223780"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 05:11:31 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 17:49:07 +0530
Message-Id: <20230914121909.3860392-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
References: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 5/7] drm/xe: Track page table memory usage for
 client
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

Account page table memory usage in the owning client
memory usage stats.

V2:
  - Minor tweak to if (vm->pt_root[id]) check - Himal

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 +++
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d1e06c913260..051c51083b7d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -7,6 +7,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
@@ -196,6 +197,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	pt->level = level;
 	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
 
+	if (vm->xef)
+		xe_drm_client_add_bo(vm->xef->client, pt->bo);
 	xe_tile_assert(tile, level <= XE_VM_MAX_LEVEL);
 
 	return pt;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9a993dff98c1..861d050871bb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -19,6 +19,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
@@ -1979,6 +1980,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
+	struct xe_tile *tile;
 	struct xe_vm *vm;
 	u32 id, asid;
 	int err;
@@ -2058,6 +2060,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	args->vm_id = id;
 	vm->xef = xef;
 
+	/* Record BO memory for VM pagetable created against client */
+	for_each_tile(tile, xe, id)
+		if (vm->pt_root[id])
+			xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
-- 
2.25.1

