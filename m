Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EE9C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D201210E59E;
	Mon, 21 Sep 2026 09:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PA9ji15z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACAF10E5C1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789983235; x=1821519235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9uygdHxUNadxv5RSSkOc0HQG/O95OfhdJsqTEwjGEA=;
 b=PA9ji15zKK0Ol15pFwtdb7dz4i0jiMbf2OJ6ydeskYstVvQQkb+kt5n5
 U9Rz+rKThvQQh7ZmWf1JpS8OxxGDmj2WLaNRBk9ohQfVsALNQdQRYG8o/
 nehJg7J/1lm7Uscj9skU8upQpFzfKUSeIHnWJJMd+43wo+UHtbwz5JJ+5
 80WnixD5/JqJAJ1kZ2y94Pnx6cINeJ7OMDSmpGEgEx42+Z6lA0jREnETd
 aSNGkFF7YssGVTi8sfxO2WFwZhNMQdcD0JQoYESb6zb2tydXKR8bGPp0v
 34AUzUv5t/AAgNAPmbqCt53ZXEy60omNPos3qYHR9pQehhtfTI76d6ECc g==;
X-CSE-ConnectionGUID: yg8w7+2PT8CJs/aCteSGCw==
X-CSE-MsgGUID: 8HMDFdswRve+5LLvsrKWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="988888"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="988888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:33:55 -0700
X-CSE-ConnectionGUID: 4NpM0maQSIeNOaKRKl91Pw==
X-CSE-MsgGUID: lg+H1VM1RJW75pi5JV29cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272734483"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 02:33:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/4] drm/pagemap: Add helper to access backing devmem
 allocation
Date: Mon, 21 Sep 2026 15:06:53 +0530
Message-ID: <20260921093651.2995928-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
References: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
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

drm_pagemap_zdd is private, so add drm_pagemap_page_to_devmem() to let
callers get the drm_pagemap_devmem backing a device-private/coherent
page. Add a NULL stub for !CONFIG_ZONE_DEVICE.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 15 +++++++++++++++
 include/drm/drm_pagemap.h     |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 0867bfbde5c5..ee4c6448499e 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -1433,6 +1433,21 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
 
+/**
+ * drm_pagemap_page_to_devmem() - Return the devmem allocation backing a page
+ * @page: The struct page.
+ *
+ * Return: The &drm_pagemap_devmem backing @page. Undefined if @page was not
+ * populated from a &drm_pagemap.
+ */
+struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page)
+{
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
+
+	return zdd->devmem_allocation;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_page_to_devmem);
+
 /**
  * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
  * @dpagemap: Pointer to the drm_pagemap managing the device memory
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 95eb4b66b057..376d7d400c8e 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -257,6 +257,8 @@ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
 
 struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 
+struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page);
+
 void drm_pagemap_put(struct drm_pagemap *dpagemap);
 
 #else
@@ -266,6 +268,11 @@ static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page
 	return NULL;
 }
 
+static inline struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page)
+{
+	return NULL;
+}
+
 static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
 {
 }
-- 
2.43.0

