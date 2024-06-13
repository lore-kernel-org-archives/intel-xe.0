Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08594C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C2010EAC2;
	Thu, 13 Jun 2024 15:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyl9Jhbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC7510EAE4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292046; x=1749828046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EzLfd4+G92QB3jZd+UOrLcq9tvY+B/2b+7VOHkEaPxA=;
 b=lyl9Jhbx6EuUfdi6fdP+3ZelZNqr3GWR7HDVZ7L2gprRgDbDrI4LGlWn
 +vkj+mO3IaW1dMqGRpONDSyKjr/2pzdV25xwL1GzWBzwG4+zswZkBBtdd
 Zrtvb5BzcO1gHPm93JUOVGmoGdHxZ/iUMnmn4idzZ0EnWKzwdRQ3NxwmG
 3eWOTkshyBDKUlA36d2JXCEiJDX4Z4/8qSK0EOUB3t+2+c+kPlEDBG1Ui
 7qF0XKKfjPpWIQ61oJAWb3F1TArBHcVKdBjCQSjZZtgMSywIhPiV45QV+
 abo9HP61+IEOqQMuW4QMtKE7HF1sViy/FHVzZqiq2BEQXcHkotshZLayc Q==;
X-CSE-ConnectionGUID: idI09p5rSFeQfgpQ90TEZg==
X-CSE-MsgGUID: SeoFoYBcRfWooxJTv5nPQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348671"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:43 -0700
X-CSE-ConnectionGUID: Ro+YDlReQDiAnM7J3q8o1Q==
X-CSE-MsgGUID: 2HYJX07PRnum1yFhLpbIcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135126"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:43 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 37/42] drm/xe/svm: Register xe memory region to drm layer
Date: Thu, 13 Jun 2024 11:31:23 -0400
Message-Id: <20240613153128.681864-37-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

