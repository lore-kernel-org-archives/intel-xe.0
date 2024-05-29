Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED83FC27C44
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED18112C86;
	Wed, 29 May 2024 01:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3NEykwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317E112C91
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944728; x=1748480728;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0RZkghL0gJTreqNfBpg1kA+Nq3zeaJRZB1ktEY083uw=;
 b=F3NEykwWs652X4krX/brSLMqB4XX7NQXhJZHeyHeoQNR0h6QX6AooxuX
 KPf1dMPVB8awF3tgqmkZ/FV1WpUCDWJp0OyCKiInExcqsR/e2uF2zUwcQ
 eW1/5JTuGpyfuEOjF2J0EFayanC/oQdxeg5cn6jl1ccZoXzJaTUKtKYmd
 Kjyev6rsNp4GQc2EMyzuBoEA5RhRZpax6SuCxkyH1D0aP6dduHPC13PeN
 r2UJ4OhAlqpOBq1WPbmuwxnGdIZQ1ohu7CYlOldfpCfTxRPQ94/XbrgKP
 hVspOV+X6NFgiTHMgIvDT9zmjlMYpyaWfVRt5yG57BR+bd6Ut0khNL6Tc A==;
X-CSE-ConnectionGUID: 4PDKPCiQQAKc2Nv5j0LEOg==
X-CSE-MsgGUID: jfHcqCJrT9CabiErApsuww==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849789"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
X-CSE-ConnectionGUID: 4ZVRhNQFRDuIlW1I2MttOA==
X-CSE-MsgGUID: WjqJY4dAS8iKGSvHXBpw3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700497"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 10/26] drm/svm: introduce drm_mem_region concept
Date: Tue, 28 May 2024 21:19:08 -0400
Message-Id: <20240529011924.4125173-10-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
References: <20240529011924.4125173-1-oak.zeng@intel.com>
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

As its name indicates, a drm_mem_region represent a memory region on
a drm device, e.g., a GPU's HBM memory.

In a memory region, we have address information of this region, from
both CPU (hpa_base) and GPU (dpa_base) perspectives. It also has some
interfaces for drm to callback driver to allocate/free memory from
this region, migrate data to/from this memory region, get a pagemap
owner of a memory region, and get the drm device which own the memory
region

This is introduced for system allocator implementation, so the memory
allocation and free interfaces are page based.

A few helper functions are also introduced:
1) drm_mem_region_pfn_to_dpa: calculate device physical address from
   a page's pfn
2) drm_page_to_mem_region: retrieve drm memory region that a page
   resides in

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 include/drm/drm_svm.h | 156 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 include/drm/drm_svm.h

diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
new file mode 100644
index 000000000000..2f8658538b4b
--- /dev/null
+++ b/include/drm/drm_svm.h
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2024 Intel Corporation
+ */
+
+#include <linux/compiler_types.h>
+#include <linux/memremap.h>
+#include <linux/types.h>
+
+struct dma_fence;
+struct drm_mem_region;
+
+/**
+ * struct migrate_vec - a migration vector is an array of addresses,
+ * each of which represents one page.
+ * When it is system memory page, the address is a dmap-mapped address.
+ * When it is vram page, the address is device physical address.
+ */
+struct migrate_vec {
+	/**
+	 * @mr: the memory region that pages reside.
+	 * When it is system memory page, mr is NULL.
+	 */
+	struct drm_mem_region *mr;
+	/** @npages: number of pages */
+	u64 npages;
+	/**
+	 * @addr_vec: address vector
+	 * each item in addr_vec is an address of a page
+	 */
+	union {
+		/** @dma_addr: dma-mapped address of the page, only valid for system pages*/
+		dma_addr_t dma_addr;
+		/** @dpa: device physical address of the page, only valid for vram page*/
+		phys_addr_t dpa;
+	} addr_vec[1];
+};
+
+/**
+ * struct drm_mem_region_ops - memory region operations such as memory allocation
+ * and migration etc. Driver is supposed to implement those operations.
+ */
+struct drm_mem_region_ops {
+	/**
+	 * @drm_mem_region_alloc_pages: Called from drm to driver to allocate
+	 * device VRAM memory
+	 * @mr: The memory region where to allocate device VRAM memory from
+	 * @npages: number of pages to allocate
+	 * @pfns: Used to return pfns of each page
+	 */
+	int (*drm_mem_region_alloc_pages) (struct drm_mem_region *mr,
+						unsigned long npags, unsigned long *pfns);
+	/**
+	 * @drm_mem_region_free_page: Called from drm to free one page of device memory
+	 * @page: point to the page to free
+	 */
+	void (*drm_mem_region_free_page) (struct page *page);
+	/**
+	 * @drm_mem_region_migrate: Called from drm to migrate memory from src to
+	 * dst. Driver is supposed to implement this function using device hardware
+	 * accelerators such as DMA. DRM subsystem call this function to migrate
+	 * memory b/t system memory and device memory region
+	 *
+	 * @src_vec: source migration vector
+	 * @dst_vec: destination migration vector
+	 */
+	struct dma_fence* (*drm_mem_region_migrate)(struct migrate_vec *src_vec,
+			struct migrate_vec *dst_vec);
+	/**
+	 * @drm_mem_region_pagemap_owner: Return the pagemap owner of a memory
+	 * region. Pagemap owner is the owner of the device memory. It is
+	 * defined by device driver and opaque to drm layer. Drm uses pagemap
+	 * owner to set up page migrations (see hmm function migrate_vma_setup)
+	 * and range population (see hmm functio hmm_range_fault). Driver has
+	 * the freedom to choose the right pagemap owner.
+	 *
+	 * @mr: the memory region which we want to get the page map owner
+	 */
+	void* (*drm_mem_region_pagemap_owner)(struct drm_mem_region *mr);
+	/**
+	 * @drm_mem_region_get_device: Return the drm device which has this memory
+	 * region.
+	 *
+	 * @mr: the memory region
+	 */
+	struct drm_device* (*drm_mem_region_get_device)(struct drm_mem_region *mr);
+};
+
+/**
+ * struct drm_mem_region - memory region structure
+ * This is used to describe a memory region in drm
+ * device, such as HBM memory or CXL extension memory.
+ *
+ * drm_mem_region is converted from the xe_mem_region
+ * concept. xe_mem_region is moved to drm layer and renamed
+ * as drm_mem_region.
+ *
+ * drm_mem_region is supposed to be embedded in some driver struct such as
+ * "struct xe_tile" or "struct amdgpu_device"
+ */
+struct drm_mem_region {
+	/** @dev_private: device private data which is opaque to drm layer */
+	void *dev_private;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+	/**
+	 * @mr_ops: memory region operation function pointers
+	 */
+	struct drm_mem_region_ops mr_ops;
+};
+
+/**
+ * drm_page_to_mem_region() - Get a page's memory region
+ *
+ * @page: a struct page pointer pointing to a page in vram memory region
+ */
+static inline struct drm_mem_region *drm_page_to_mem_region(struct page *page)
+{
+	return container_of(page->pgmap, struct drm_mem_region, pagemap);
+}
+
+/**
+ * drm_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
+ *
+ * @mr: The memory region that page resides in
+ * @pfn: page frame number of the page
+ *
+ * Returns: the device physical address of the page
+ */
+static inline u64 drm_mem_region_pfn_to_dpa(struct drm_mem_region *mr, u64 pfn)
+{
+	u64 dpa;
+	u64 offset;
+
+	BUG_ON((pfn << PAGE_SHIFT) < mr->hpa_base );
+	BUG_ON((pfn << PAGE_SHIFT) >=  mr->hpa_base + mr->usable_size);
+	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;
+
+	return dpa;
+}
-- 
2.26.3

