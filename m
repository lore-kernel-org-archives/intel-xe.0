Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56583C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A9210E5D7;
	Thu, 31 Aug 2023 08:58:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F3710E5DC
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472298; x=1725008298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUfX+8/WFlt9qQclkzifyHdp8Nvik+flzRiQy0Pd7Fs=;
 b=ZXePLL8JcGOdcruiEM8MobhKgFAXV6qFQpt+S90Rlv0bSQDvZQcjTmW8
 VXAmPn3uQ+3YUyc5wmMor0oVqqu4DX1jEohtXOeF/dApT+mDyJqx2f2OC
 1B7HSKPMHJghBY4EDMztFcsGRMj9BTaWcT1X+lx3GhAjYbt0ra0Pmem7l
 Xfv4+D869zurf84bFO1GnIcw80zm4ujlqoerOFBKbVCKiLje+gIlkqMHD
 ND9gcSB1eO6ibE9eArGbak0MHkaeiVORO+nYhB1G9AOQCMpeUIbTdZCKw
 6Nmk9XsUQjejDcWLQE4fN9DEJX4Plh+NJZGoKMN4iCy5YHcAM4x8WG5lk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814188"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814188"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257387"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257387"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:16 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:34 +0530
Message-Id: <20230831090536.2949934-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] drm/xe: Track page table memory usage for
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 +++-
 drivers/gpu/drm/xe/xe_vm.c | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5709518e314b..8df83241c5fe 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -7,6 +7,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
@@ -195,7 +196,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	pt->bo = bo;
 	pt->level = level;
 	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
-
+	if (vm->xef)
+		xe_drm_client_add_bo(vm->xef->client, pt->bo);
 	XE_WARN_ON(level > XE_VM_MAX_LEVEL);
 
 	return pt;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f5f832c8ed42..84fb1069fdbb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -18,6 +18,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
@@ -1980,6 +1981,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
+	struct xe_tile *tile;
 	struct xe_vm *vm;
 	u32 id, asid;
 	int err;
@@ -2058,7 +2060,12 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	args->vm_id = id;
 	vm->xef = xef;
-
+	/* Record BO memory for VM pagetable create aginst client */
+	for_each_tile(tile, xe, id) {
+		if (!vm->pt_root[id])
+			continue;
+		xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
+	}
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
-- 
2.25.1

