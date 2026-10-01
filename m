Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF9CCA5FC4
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5DB10E121;
	Thu,  1 Oct 2026 03:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i41PNtIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD2110E046
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790825547; x=1822361547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HGH7nWjgSanG3Tv5z4XJioQL63YqHJ36nr/1VGBNfw=;
 b=i41PNtILgMW9O/fVHT47R35D2bU3thNSz7UjbjSQcfWU9TmBFvF8n7m7
 xBs2dYIX/SFfBiik3sQvsLO0aVTFo6m+3rRi+AQizc2M53Y9f+aou/hS8
 moziH9sS4hHTHxGIzVcaE2TgygWjRvZj9gCVcAPl0RRa+O5XOaPhATwHd
 MIM9BVyHJPAfncxUOexeuXY26lL7wIN/NdGh8xuv/o9/RO5LZ6kNXJZWe
 DXhdZirh55Ns3YRbA6kuKnLAg9VZY58hqg2aZaz6TtGhglCqVcncoBO0a
 7GzywWxIkGMSwFPa9VHr+mOG76/5oFor1iA2uKuaz1jurhnts9By49Vq9 Q==;
X-CSE-ConnectionGUID: PsP6uwznSWuCsuxADylWIA==
X-CSE-MsgGUID: Awdmwh5SQOaP9p0bWcjalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113362882"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="113362882"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 20:32:27 -0700
X-CSE-ConnectionGUID: UmIen1leT/+pabhwbZCZzA==
X-CSE-MsgGUID: hhUWG3AuTvSyVxRPyKOuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="275909701"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 20:32:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 1/4] drm/pagemap: Add helper to access backing devmem
 allocation
Date: Thu,  1 Oct 2026 09:06:04 +0530
Message-ID: <20261001033602.3166274-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
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
index ba97daedcd49..da58422801d1 100644
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

