Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11341C2BA18
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FB110E75D;
	Wed, 12 Jun 2024 02:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MX9Ap4Ot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F7610E77E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158541; x=1749694541;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Op4W08nrih7XiQLgGOKVQzpcy0t5WOloPwsRfGk3mwg=;
 b=MX9Ap4OtZxPfsazQTJk+aFazen+ZjvtaZdg0UnYqUyL/P1Wq2PEO4ZbX
 Oc1ieCG3Q2ypVeCol5oeCfrZFeq14hJpvtdYOi4gXGTyVx7V3k8yRdZfm
 ctOY07bES1URkM6khPRD8uNbZ5z6TN4492ffZt1+noZTKiHSX74b+t5LZ
 WNlJyGXqKiaqi7rceXEU/Kyj385XBDEbasKiarYOh9ZJNrtG4+WjzZ1ZA
 lmLaDIqUPFH+ZlN/9/CcKYySmAeUG2WGNPsi2wIuhB5NCLcqUhN/8CX3f
 5fOGi8oQyBcQ7BLV9TKYNHj1ACLfl+G5lytWuw4fxdwzae9iSjYb/oSbW A==;
X-CSE-ConnectionGUID: 54HmhVmzQHqIrYTyhogklA==
X-CSE-MsgGUID: L6BrcECBSUuOS9Njh4gnLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427822"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427822"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: jgSwLs/HTbOFKcW+qxFMJw==
X-CSE-MsgGUID: jhOiOe8oTz27dPx3h+W0zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763657"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 38/43] drm/xe/svm: Register xe memory region to drm layer
Date: Tue, 11 Jun 2024 22:26:00 -0400
Message-Id: <20240612022605.385062-38-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_tile.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 109f3118e821..5daf02f5d0be 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <drm/drm_svm.h>
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
@@ -14,6 +15,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_svm.h"
 
 /**
  * DOC: Multi-tile Design
@@ -142,6 +144,15 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
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
@@ -159,6 +170,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct drm_device *drm = &xe->drm;
 
 	err = tile_ttm_mgr_init(tile);
 	if (err)
@@ -172,6 +185,11 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	err = xe_tile_sysfs_init(tile);
 
+	if (xe->info.has_usm) {
+		__init_drm_mem_region_ops(&tile->mem.vram.drm_mr.mr_ops);
+		drm_svm_register_mem_region(drm, &tile->mem.vram.drm_mr);
+	}
+
 	return 0;
 }
 
-- 
2.26.3

