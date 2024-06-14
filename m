Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB1DC2BA18
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB31710EE85;
	Fri, 14 Jun 2024 21:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0l85Mo+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290010E2B7
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401653; x=1749937653;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SJwljeFqB+ZAlgKKuGqgEU6WHWXkwhc9Xhoct1pllb0=;
 b=h0l85Mo+5RixY0VRtUXC4+mdumIat1dHw24AQjgt3y5Y3DDvoIpVOlhJ
 OeaUqJHWE1VaAHLiN5wTmBJP/Gmi1EKJJJw2Oxw30hdBha7zlpL95Sauq
 TRlTWWQk9UKIg67x1yFrGZ7Ipa8d9206sv7LwGN2xle0d2yxrGWp9n3dS
 qE//XS+nxiEhRvzzVuvF11uLViN8W8tvYNKs73pJSWUlh+fTtkMXVPKHZ
 WuX+S1a7wXCm5psuvz+J4sKBfzsQnuQFXt5snmSnrqHh285zzR+3u0CDY
 J5352uV/UY1nRugoZqP4KPk4P15W6ArJpiiWxhxqAjq4eT2aA291QWZ5b w==;
X-CSE-ConnectionGUID: Q1v6ZETDSYSItXxbcnUVZg==
X-CSE-MsgGUID: nlQkZKPPRUa8snOlGQ6XZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886572"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886572"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: yojH3/5hSpufqKFpR1hsaA==
X-CSE-MsgGUID: L8boA25bSFiDlobvJ3wTfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572404"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 12/44] drm/svm: Introduce helper to remap drm memory region
Date: Fri, 14 Jun 2024 17:57:45 -0400
Message-Id: <20240614215817.1097633-12-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

Helper function drm_svm_register_mem_region to remap GPU vram
using devm_memremap_pages, so each GPU vram page is backed by
struct page.

Those struct pages are created to allow hmm migrate buffer b/t
GPU vram and CPU system memory using existing Linux migration
mechanism (i.e., migrating b/t CPU system memory and hard disk).

This is prepare work to enable svm (shared virtual memory) through
Linux kernel hmm framework. The memory remap's page map type is set
to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
vram page get a struct page and can be mapped in CPU page table,
but such pages are treated as GPU's private resource, so CPU can't
access them. If CPU access such page, a page fault is triggered
and page will be migrate to system memory.

For GPU device which supports coherent memory protocol b/t CPU and
GPU (such as CXL and CAPI protocol), we can remap device memory as
MEMORY_DEVICE_COHERENT. This is TBD.

v1: Support a memory type interface for register_mem_region (Himal)

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_svm.c | 57 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |  4 +++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index b88616491409..2c0cb2f82b28 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -12,6 +12,7 @@
 #include <linux/swap.h>
 #include <linux/bug.h>
 #include <linux/hmm.h>
+#include <linux/pci.h>
 #include <linux/mm.h>
 
 static u64 __npages_in_range(unsigned long start, unsigned long end)
@@ -323,3 +324,59 @@ int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u
 	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_svm_hmmptr_populate);
+
+static struct dev_pagemap_ops drm_devm_pagemap_ops;
+
+/**
+ * drm_svm_register_mem_region: Remap and provide memmap backing for device memory
+ * @drm: drm device who want to register a memory region
+ * @mr: memory region to register
+ * @type: ZONE_DEVICE memory type
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int drm_svm_register_mem_region(const struct drm_device *drm,
+				struct drm_mem_region *mr,
+				enum memory_type type)
+{
+	struct device *dev = &to_pci_dev(drm->dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	/**FIXME: support MEMORY_DEVICE_COHERENT in the future*/
+	if (type != MEMORY_DEVICE_PRIVATE)
+		return -EINVAL;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   mr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	drm_devm_pagemap_ops.page_free = mr->mr_ops.drm_mem_region_free_page;
+	mr->pagemap.type = type;
+	mr->pagemap.range.start = res->start;
+	mr->pagemap.range.end = res->end;
+	mr->pagemap.nr_range = 1;
+	mr->pagemap.ops = &drm_devm_pagemap_ops;
+	mr->pagemap.owner = mr->mr_ops.drm_mem_region_pagemap_owner(mr);
+	addr = devm_memremap_pages(dev, &mr->pagemap);
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(drm, "Failed to remap memory region %p, errno %d\n",
+			mr, ret);
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(drm, "Registered device memory [%llx-%llx] to devm, remapped to %pr\n",
+		 mr->dpa_base, mr->dpa_base + mr->usable_size, res);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_svm_register_mem_region);
diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
index 0914b10e0954..40849c16062b 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -166,6 +166,10 @@ static inline u64 drm_mem_region_page_to_dpa(struct drm_mem_region *mr, struct p
 	return dpa;
 }
 
+int drm_svm_register_mem_region(const struct drm_device *drm,
+				struct drm_mem_region *mr,
+				enum memory_type type);
+
 /**
  * struct drm_hmmptr- hmmptr pointer
  *
-- 
2.26.3

