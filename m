Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C75C2BA16
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44310EAC4;
	Thu, 13 Jun 2024 15:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4DkW4aw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16C010EAC2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292043; x=1749828043;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jR6Ze7ImgG7AqysrtmRLIfYjq86G2fDZ3TLKE2UhhCk=;
 b=L4DkW4awCL4SJQzC+sa8XvrqVodq29YIzqo0mO64kVcidXRl6Gm3vfMG
 Ei0L3i0lNKOUWfaBtji6RSAfNq7/wYGtnzQWqopRxu3yznxWiHFuItYEf
 AUK+Gqqj5RODNRfDDS3Tp+IMkeoFKBZTAzR41saCBBruzKW0x6ZcxWDWR
 Ig242H+ZzshuP+bZ3qlMeSly42oUjuSLtTMEg4C+t+9AFbWaB0jvRFnMO
 v9suW95BGhv766w0UN3PJYcr+4YcVf10t+qWhAuhaNpbjOib88YpcUAgQ
 O/TYBRpUIQFOgW+FB8VTPfpRF0qHMNhovUeNq6ebSdKZNYMthaTsBZWFB A==;
X-CSE-ConnectionGUID: x7s1ds2PTwW5u4lg0XrYlA==
X-CSE-MsgGUID: BkMMsQO7Q4O8YGDoOdQclQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348640"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
X-CSE-ConnectionGUID: v6/V2gJcSlO+nxT1JNBLgw==
X-CSE-MsgGUID: Hsq+yPgMTr63CTvtCd8FmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135083"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 09/42] drm/svm: introduce drm_mem_region concept
Date: Thu, 13 Jun 2024 11:30:55 -0400
Message-Id: <20240613153128.681864-9-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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
both CPU (hpa_base) and GPU (dpa_base) perspectives. It has a pagemap
member which is used to memremap memory region to ZONE_DEVICE. It also
has some interfaces for drm to callback driver to allocate/free memory from
this region, migrate data to/from this memory region, get a pagemap
owner of a memory region, and get the drm device which own the memory
region.

This is introduced for system allocator implementation, so the memory
allocation and free interfaces are page based.

A few helper functions are also introduced:
1) drm_mem_region_page_to_dpa: calculate device physical address for
   a page
2) drm_page_to_mem_region: retrieve drm memory region that a page
   resides in

v1: use page parameter instead of pfn (Matt)
Add BUG_ON(mr != drm_page_to_mem_region(page)) (Matt)

Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 include/drm/drm_svm.h | 162 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 include/drm/drm_svm.h

diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
new file mode 100644
index 000000000000..a383c7251e2b
--- /dev/null
+++ b/include/drm/drm_svm.h
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2024 Intel Corporation
+ */
+
+#ifndef _DRM_SVM__
+#define _DRM_SVM__
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
+ * drm_mem_region_page_to_dpa() - Calculate page's device physical address
+ *
+ * @mr: The memory region that page resides in
+ * @page: page to calculate dpa for
+ *
+ * Returns: the device physical address of the page
+ */
+static inline u64 drm_mem_region_page_to_dpa(struct drm_mem_region *mr, struct page *page)
+{
+	u64 pfn = page_to_pfn(page);
+	u64 offset;
+	u64 dpa;
+
+	BUG_ON(mr != drm_page_to_mem_region(page));
+	BUG_ON((pfn << PAGE_SHIFT) < mr->hpa_base );
+	BUG_ON((pfn << PAGE_SHIFT) >=  mr->hpa_base + mr->usable_size);
+	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;
+
+	return dpa;
+}
+#endif
-- 
2.26.3

