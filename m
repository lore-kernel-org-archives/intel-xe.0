Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55575C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 18:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4A410FEDF;
	Wed, 20 Mar 2024 18:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jloqPHa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4310FEDA
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710960008; x=1742496008;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8HmiO0JWa8R76U7X6MFMD2dJ7U1HscuV79ycWsQJnEU=;
 b=jloqPHa1EzzHfPH/tWvUOzq9dtq+YQsH8vxtszFODW4dBgQ5W0BIhfGx
 9Zy8WeTmQ603+BWbo/GKwqcmlPSh7A2cdA9TuTtovEY+y7LRWRAS6amq+
 5HgK9ixQu2Sbwz0XsogEDdUtw+myfHtsJcvwJ6C2LMJZH3HBWWYPkYYfm
 aaWHMHxBSE58BWAno4W3vSd6eC39utZU+YSbGgOLkdumE9qLf6AMUdtM4
 tQ1sugkiv4LrprI7A0tsK3GjkPMawZ04vh+sfgMOiBlmGhJHZrn4yXKVX
 bDYA0W8CcUV9EtQnqUYYFKrf7AIgURe6gLk7Mips1GL6+qnCHNwgHIURf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28382684"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="28382684"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14262463"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI  4/8] drm/xe: Introduce a helper to get dpa from pfn
Date: Wed, 20 Mar 2024 14:45:38 -0400
Message-Id: <20240320184542.2239076-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320184542.2239076-1-oak.zeng@intel.com>
References: <20240320184542.2239076-1-oak.zeng@intel.com>
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

