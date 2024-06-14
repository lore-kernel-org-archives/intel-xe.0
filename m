Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABA5C2BA2B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35C710E2B7;
	Fri, 14 Jun 2024 21:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Szo9rzrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A375310E2B3
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401658; x=1749937658;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EzLfd4+G92QB3jZd+UOrLcq9tvY+B/2b+7VOHkEaPxA=;
 b=Szo9rzrBFsC9+w3HLqtR2AKmufajjbrgdvS6nIuyGg6JshPyxSbx35xF
 uq6qZEHbnxzSBjile8dFMtEaoSzs5/V1Wy970apaYsPhn8YXep+bSy2qV
 cwHUaOQp0nxrPOhv2yq38TYXySkJQ/5c46lfm/uzJ0A3DRxCps1fD/Bj4
 5S4Jja3nAoqGBlD7tKIkRZ/jLL0W7glrHbizvyIQPkOZK5dlfozRV0Odp
 BHl7YrJwbl3AQ5ITZg1DqEYQHcLYD7v99xnYa42x/PMsd6p+mWrcy7Ylu
 OvV6rSNTW6HUqeb+biXzYXmMiN7/1+I+4fcCcbfiADXpnzl7e/YHbJMQU A==;
X-CSE-ConnectionGUID: kpBBJTePQiiqJEQVwapWiw==
X-CSE-MsgGUID: WCwXROP5QimJCbE+7CDDqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886598"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886598"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: 9BwXXZgJS9iVBqVWiVCy/Q==
X-CSE-MsgGUID: Zb8SSRC4QN2NQd8nMmkflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572433"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 39/44] drm/xe/svm: Register xe memory region to drm layer
Date: Fri, 14 Jun 2024 17:58:12 -0400
Message-Id: <20240614215817.1097633-39-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Register xe memory region to drm layer for SVM purpose.
This will essentially create struct page backing for
xe device memory, which will be used by SVM functions.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 109f3118e821..6c50df281b11 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -3,7 +3,9 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/memremap.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_svm.h>
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
@@ -14,6 +16,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_svm.h"
 
 /**
  * DOC: Multi-tile Design
@@ -142,6 +145,15 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	return 0;
 }
 
+static void __init_drm_mem_region_ops(struct drm_mem_region_ops *ops)
+{
+	ops->drm_mem_region_alloc_pages = &xe_svm_alloc_pages;
+	ops->drm_mem_region_free_page = &xe_svm_free_page;
+	ops->drm_mem_region_migrate = &xe_svm_migrate;
+	ops->drm_mem_region_pagemap_owner = &xe_svm_mem_region_to_pagemap_owner;
+	ops->drm_mem_region_get_device = &xe_mem_region_to_device;
+}
+
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -159,6 +171,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct drm_device *drm = &xe->drm;
 
 	err = tile_ttm_mgr_init(tile);
 	if (err)
@@ -172,6 +186,11 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	err = xe_tile_sysfs_init(tile);
 
+	if (xe->info.has_usm) {
+		__init_drm_mem_region_ops(&tile->mem.vram.drm_mr.mr_ops);
+		drm_svm_register_mem_region(drm, &tile->mem.vram.drm_mr, MEMORY_DEVICE_PRIVATE);
+	}
+
 	return 0;
 }
 
-- 
2.26.3

