Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22819C54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 02:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1B010ECF3;
	Tue, 19 Mar 2024 02:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RS9zJ6kP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600C610E0A5
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710816177; x=1742352177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8HmiO0JWa8R76U7X6MFMD2dJ7U1HscuV79ycWsQJnEU=;
 b=RS9zJ6kPzI/pUIU4UW3NDDaBYXkmt9Yucuc8fGfZW89aznHEa0Tiy5P6
 1MT+GfyxsaZ/+9lUrfFJZudLHhm1wvxwhmnVdfDiKWh1jeWYYyp7KATZo
 /GtYtwMYlAyApRfBcipnExl68JZZwNSP3VYjNWozjU/0b2SprJ78MaE6Y
 kcBPz+HgJA44nc4HbR9cl2s70xDqm6riQJA8CkNKzEw7WmC/6pzhuG8ky
 qjTOGnqeV1+js+fMfc1n//wuk7ST9G0RbqDmEeG09FJFKs7GCsc9L5zFp
 kCMzuyc4DctCzwnewVTdHLaJm9jTRBg+wRotFWZUKDtYlBq35KDM2V4ZM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5540740"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5540740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="14130199"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:42:56 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 4/8] drm/xe: Introduce a helper to get dpa from pfn
Date: Mon, 18 Mar 2024 22:55:07 -0400
Message-Id: <20240319025511.1598354-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240319025511.1598354-1-oak.zeng@intel.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
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

Since we now create struct page backing for each vram page,
each vram page now also has a pfn, just like system memory.
This allow us to calcuate device physical address from pfn.

v1: move the function to xe_svm.h (Matt)
    s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa (Matt)
    add kernel document for the helper (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index e944971cfc6d..8a34429eb674 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,8 +6,31 @@
 #ifndef __XE_SVM_H
 #define __XE_SVM_H
 
-struct xe_tile;
-struct xe_mem_region;
+#include "xe_device_types.h"
+#include "xe_device.h"
+#include "xe_assert.h"
+
+/**
+ * xe_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
+ *
+ * @mr: The memory region that page resides in
+ * @pfn: page frame number of the page
+ *
+ * Returns: the device physical address of the page
+ */
+static inline u64 xe_mem_region_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
+{
+	u64 dpa;
+	struct xe_tile *tile = xe_mem_region_to_tile(mr);
+	struct xe_device *xe = tile_to_xe(tile);
+	u64 offset;
+
+	xe_assert(xe, (pfn << PAGE_SHIFT) >= mr->hpa_base);
+	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;
+
+	return dpa;
+}
 
 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
 void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
-- 
2.26.3

