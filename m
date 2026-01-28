Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD7D340BF
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 00:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FF610E5DE;
	Wed, 28 Jan 2026 00:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SslhA3z8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D510E5DA;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561330; x=1801097330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UakjHOKvxmbHnRgtSTWMyDUgDcCPWCbr/y/uFRCHbbk=;
 b=SslhA3z8kVKz65/Q5PU5cLMMdqim+JuTRhq9Xvc07esoNXTrGlBzgPRt
 bEywyRcm9URrp3+7S3XJOToqUmd+fQINhZuJaZDTCV54sVlU4sx8OC0NR
 9Xg8yMM4K/Zz8RXco0FxOzvvXjs73NPZq5YglUbEVfwQykKtC5Ra6CVW1
 mwz0xmjFa4bGpvv0TWnkxqwqPemb2ulrH5ePydS/JoK9Bc8diHh7fx+Ux
 n8Qo5K8xBorqY1lEtPVvhIGg0dSbSt6cVzFG5UY9laumJ2pPEGm8/5/PO
 osnWV0KijEfKnVusSbvntm3KVYRB5mUbKhRwMRxHSGFvVQGLIVAEPPAQ8 w==;
X-CSE-ConnectionGUID: nHItj997SyegFMxTzMEu5Q==
X-CSE-MsgGUID: z7lcfWfCS3eTvw6Gi8j2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427521"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: Ig14AQglTJaIddw8PShHeg==
X-CSE-MsgGUID: 0om+/xEmRWKvxJSKpjBXsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822663"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 07/11] drm/xe: Stub out DRM pagemap IOVA alloc
 implementation
Date: Tue, 27 Jan 2026 16:48:37 -0800
Message-Id: <20260128004841.2436896-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
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

Stub out the minimal set of DRM pagemap IOVA vfuncs required for Xe.
This provides the basic scaffolding needed for functionality while the
full implementation is developed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..eb8d8fe6ff75 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1649,6 +1649,14 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 	return err;
 }
 
+static void *xe_drm_pagemap_device_iova_alloc(struct drm_pagemap *dpagemap,
+					      struct device *dev, size_t length,
+					      enum dma_data_direction dir)
+{
+	/* NIY */
+	return NULL;
+}
+
 static struct drm_pagemap_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
@@ -1720,6 +1728,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 }
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
+	.device_iova_alloc = xe_drm_pagemap_device_iova_alloc,
 	.device_map = xe_drm_pagemap_device_map,
 	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
-- 
2.34.1

