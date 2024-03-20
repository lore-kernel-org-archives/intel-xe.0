Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7EFCD11DC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39EE10E3EE;
	Wed, 20 Mar 2024 03:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIU7QcW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061CE10E0A8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710905530; x=1742441530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU28VFsryCLZoH+M4OGpXQtrM3oYoL7jb8jMsbd4k2U=;
 b=bIU7QcW/yUDD4jVyO18ML0/FzA79aUhJ1cDag3iZqxCkfkOPCPNxgLw1
 NfvHSnTG/8iHZvrfEerBBWPCRukpDAAs/zPqLhSksGjR4gqFOuLThMQ2h
 J//EwKKMrxCSjW2rgXqxwjBoD0rOOBxSDTsNj9s0pgYl8HNAseVSPWBax
 UVjd6prtMg4KpxJPXU/oXNDUOxAIxa1ye3zOtNaMhU2U8oZlVepyqrv+i
 QYFRMZvctZmVjAsYKaVe0o2joA6To0doW34E/BoETz0v1sP3ADv5loPIt
 P2vsQQg7ubppqHbSss1uQiL2aBvTQKWQRu4A3a0Tv1HtBmWzgoPdOo5TT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5688807"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5688807"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18599103"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:09 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 5/8] drm/xe/svm: Get xe memory region from page
Date: Tue, 19 Mar 2024 23:44:22 -0400
Message-Id: <20240320034425.1785007-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320034425.1785007-1-oak.zeng@intel.com>
References: <20240320034425.1785007-1-oak.zeng@intel.com>
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

