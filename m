Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D405C27C78
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D4210E048;
	Thu, 13 Jun 2024 04:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hc48mMdD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1CE10E96A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252032; x=1749788032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EzLfd4+G92QB3jZd+UOrLcq9tvY+B/2b+7VOHkEaPxA=;
 b=hc48mMdDlPXTQH5rbTv+SkPfyyUdFPTN3R6w8F8TGwStQ4eunxkEZfpr
 mMkMHZhG8Z+bo+TeX4YqCRuxzXSScXNX2AzsGBAlYqDadstwI0LsX1yln
 5co2MgwK4Dt5yOq6RKrqgKzUZtMK2ZGiJEIMJERtuEcAX6UZ7ue/U+t7p
 rh5PVNcf8OYYdDF+RcC3Pt0bbwn/c8jXAu/bRGbVVzTtdWkX98NyLa6Hm
 yKFdxHkvRxbdsScsT2HTZXgtm3FCrfYmi3cLBO+BWVNzwisd1EBSpRDS4
 wZ5iaBFAUWYSJpC8OZx5v7Eqk0k/kC/W9T9Hko6pBnAwJOfkQ731Ge4YT Q==;
X-CSE-ConnectionGUID: 6teahCU0RFuWkpKL8gSrFw==
X-CSE-MsgGUID: vud/ROBkSemaYjIpJ4ZwWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847989"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847989"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: mkX2V0krRrGCRuapHo5aUQ==
X-CSE-MsgGUID: pyp6QL9IRka21C7OWG7Pcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476363"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 37/42] drm/xe/svm: Register xe memory region to drm layer
Date: Thu, 13 Jun 2024 00:24:24 -0400
Message-Id: <20240613042429.637281-37-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

