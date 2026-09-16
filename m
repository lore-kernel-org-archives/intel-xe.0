Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D9C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521BD10E37D;
	Wed, 16 Sep 2026 11:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V87lOaMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5567C10E37D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557909; x=1821093909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aKCIW0HJlohZfNDARRK7A7V8Itrb+RHYWkODgUl3zpE=;
 b=V87lOaMAThPdQy7cicaiiFmCj0cTEZnGi3OFi8h5T8DwApPAcoLVMDNh
 RzbcYRIn/9RcJg9hHk5BaT4EPVPBUpk5XzxDbd2LhpYvdBdCjo5v4okGD
 MDW28hoCMA7Flp57w2U3eWMhe0w9096VgHXkOcDX354GB5LfMfGzA0gMJ
 qirOaGgrzPg/W70k/eron9SqXQqf1yO3w17DaP6HQLJXiz6ODamGlZCXd
 VZoCsYPp+xszUadmWWYjIi4e8lpzatuYcsuB1kdBowbSPgHsahqvf2PIC
 Pp8gf5Xjq/axRZ4or1mxqGPMPze4oYME96U6StJ+4UCVsgZlOS1NCy5Dh g==;
X-CSE-ConnectionGUID: THHt+rVBQYGh0jb3y3XfxA==
X-CSE-MsgGUID: QWHDOaG2Rkehz47bmvyikQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89067446"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89067446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:25:09 -0700
X-CSE-ConnectionGUID: VYJTslheQ5aRLL8NK7y6Ow==
X-CSE-MsgGUID: PKrxUOaMROqWs3xuhOLJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275276311"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2026 04:25:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 1/4] drm/pagemap: Add helper to access backing devmem allocation
Date: Wed, 16 Sep 2026 16:58:30 +0530
Message-ID: <20260916112828.2528881-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/drm_pagemap.c | 15 +++++++++++++++
 include/drm/drm_pagemap.h     |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 892b325fa99b..fc1a2825c807 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -1432,6 +1432,21 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
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

