Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FDCD12A1
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D283112F14;
	Tue,  9 Apr 2024 20:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSTno4b7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95704112F1C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU28VFsryCLZoH+M4OGpXQtrM3oYoL7jb8jMsbd4k2U=;
 b=XSTno4b7aJ6H8BkkENTwMnDwgTsJl6ii/GQzL+Axh+6xNMi6r5Db4oEH
 MYLWObwqhygbvXdHG2UDwoKGURwz6D6/zl5cBZP+92l1FN2cGoAssxW3S
 dwWj+lwaKm0sTCgd/z177c+ZfX+WwKMHofBB8QcDwdRaHyfMDn3LVObqQ
 dELso6ZWhjVO3G55wmWKvMkJ3YqjjX6fbt7NG74Uz3Cw77V2eZefQ64hn
 VMogHUX4ut12xlYJ21H/ZZ5+wA6/gWZczP7+MUOaOPrWTi+lQftyAXp0+
 E/EBqoIo/XAyEJY9e/0nuaWqdVGCB2j8frR9saSIUbE7pl+WJcOjV4KuA Q==;
X-CSE-ConnectionGUID: g8MEOnhWS/6YinD4CLtVhA==
X-CSE-MsgGUID: 2Qb0+ePWTranlnBBtW8JGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803753"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: vYdzChLrRQeyn7lxh6SrRA==
X-CSE-MsgGUID: yjLDmBHhSg+DcOLuUiitzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773760"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 16/31] drm/xe/svm: Get xe memory region from page
Date: Tue,  9 Apr 2024 16:17:27 -0400
Message-Id: <20240409201742.3042626-17-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

For gpu vram page, we now have a struct page backing of
it. struct page's pgmap points to xe_memory_region's
pagemap. This allow us to retrieve xe_memory_region
from struct page.

v1: move the function to xe_svm.h

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 8a34429eb674..624c1581f8ba 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,6 +6,7 @@
 #ifndef __XE_SVM_H
 #define __XE_SVM_H
 
+#include <linux/mm_types.h>
 #include "xe_device_types.h"
 #include "xe_device.h"
 #include "xe_assert.h"
@@ -35,4 +36,14 @@ static inline u64 xe_mem_region_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
 void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
 
+/**
+ * xe_page_to_mem_region() - Get a page's memory region
+ *
+ * @page: a struct page pointer pointing to a page in vram memory region
+ */
+static inline struct xe_mem_region *xe_page_to_mem_region(struct page *page)
+{
+	return container_of(page->pgmap, struct xe_mem_region, pagemap);
+}
+
 #endif
-- 
2.26.3

