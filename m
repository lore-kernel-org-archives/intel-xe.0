Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C166ECA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDAB10E40C;
	Tue, 12 Sep 2023 11:45:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07310E40B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519106; x=1726055106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZWEd8PLI3p5RV1oJ7/ixY0SLxMC39sNrt7cTns07hu0=;
 b=OEvzMQEDg4I959T+OyZmY3FyFUxCqYFwK7NhM6/J5Pefhz1E1dF37pIO
 2VYZTxklm3JecFssFuhSZi9ns+VbjVUGh1WFyU2tXRXrOMY+cyxc8hpS4
 RVgkgmXFpZ5PsIQ6GMqzn04fTbnyoboBXuz1Rx6VbsA+Ca4Gi9vXnVj2S
 OMoBFSdf7SVrawNhqZdGymato7Utd5ktZB3aC0yex4Wg+cRZJYZqwv8ub
 +ad4HmnGPIa0tib9v4Oy+cutsD3AZU40xINccvK2my9vrkE1fFBgYos+s
 yA7a0fAMYIbTYQczmKuLWizu80Gu51/R5geLs3gRpFTen63cRibYusK6R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381050215"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381050215"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743700069"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743700069"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 04:45:04 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 17:22:37 +0530
Message-Id: <20230912115239.3554341-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 5/7] drm/xe: Track page table memory usage for
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 +++-
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

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
index 92d8c78c9284..4eae641fc79f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -19,6 +19,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
@@ -1974,6 +1975,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
+	struct xe_tile *tile;
 	struct xe_vm *vm;
 	u32 id, asid;
 	int err;
@@ -2052,7 +2054,10 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	args->vm_id = id;
 	vm->xef = xef;
-
+	/* Record BO memory for VM pagetable create against client */
+	for_each_tile(tile, xe, id)
+		if (vm->pt_root[id])
+			xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
-- 
2.25.1

