Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983C8C04AAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAF510E5D3;
	Thu, 21 Sep 2023 11:42:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2647A10E5D3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296536; x=1726832536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bp037IyZsMKOa2lB8UYEtYzi3O84BYXFvM49cgTZCyI=;
 b=ljiZflZP5iBMlI+3sMS/p2EBmwzlSDGNJ05/EgSnr0NKSObrTK847nRP
 uqjn8eQKr3WnCDVfihpVdifnzr518SrBx5Dp7iYfB2IWr58gfTCFjbBDx
 E8+erZMRyGXJsTLNPddv1JNkDPMrn751XTdqSqwtq6x5KwzhcxYvTPcYG
 0oVO2eTYOYAlwLwGtQqtxduPVo60L/9zTe0O0hXHiqFGE7oV3fVyASm/I
 k3X/BP5E44UP2oSEcJ9Xp8oMgiF8o8/DB/v1yRlevV9CSiCKid+KYGH5J
 UxFMmBProEK0FHpg0dOxP+MxokO+s6+3EL5mWbDeUrWwLRNoZLNLD6qeV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370812840"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370812840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696697347"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696697347"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 04:42:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 17:20:00 +0530
Message-Id: <20230921115002.22884-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 5/7] drm/xe: Track page table memory usage for
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
index ce8d9e9d1b61..aec469842471 100644
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

