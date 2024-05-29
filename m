Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958B2C27C43
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241C112C88;
	Wed, 29 May 2024 01:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RD3XBcia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6F4112C86
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944729; x=1748480729;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9iy40lAnV/CpwXq3peSR74cmc4z7KK6epNflSvY715I=;
 b=RD3XBciaecKI9NUQcmRumXKp0birWDbelAqpeNBUm2ApoXGHxPT+gCrg
 uKxo4g4YNXuHsmdHNLgoxYbxVqln2Fw7o/+Q1G1TpeOChOlVPmyZVyx7e
 tZMFPQyUGggWCJYrpwMajjQdG1ctFslbKP/ClS9neF2h/TciZePx6qruH
 V9Ulj33AK2veGjSll2RWR84eWCJrPFU50dBE0f4r5wD8lBM4PuMG7ZUcA
 +RUgf53vDGRjeXfGFO+Fp255vpIzjYs3JpoB1O/4lV60p3UmORYdoAmH0
 OaR0LXXzfYXmPVi157qmvR9VsHG1eDD5iRzMoEgkUy236pLr0WPP4mqUr A==;
X-CSE-ConnectionGUID: bUKcZ2GsSF2QbohSaEJZIg==
X-CSE-MsgGUID: cei8kYg3SRKyt5Q7M44U+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849792"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:18 -0700
X-CSE-ConnectionGUID: q1pA4CwHR12GMQl2vby/Rg==
X-CSE-MsgGUID: qwcsE8JtR/qvQ3a3DXY/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700499"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 12/26] drm/svm: Introduce helper to remap drm memory region
Date: Tue, 28 May 2024 21:19:10 -0400
Message-Id: <20240529011924.4125173-12-oak.zeng@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_svm.c | 50 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index 66d8f8a69867..c76e6e3bd604 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -13,6 +13,7 @@
 #include <linux/swap.h>
 #include <linux/bug.h>
 #include <linux/hmm.h>
+#include <linux/pci.h>
 #include <linux/mm.h>
 
 static u64 __npages_in_range(unsigned long start, unsigned long end)
@@ -227,3 +228,52 @@ int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u
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
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int drm_svm_register_mem_region(const struct drm_device *drm, struct drm_mem_region *mr)
+{
+	struct device *dev = &to_pci_dev(drm->dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   mr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	drm_devm_pagemap_ops.page_free = mr->mr_ops.drm_mem_region_free_page;
+	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
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
+				mr, ret);
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(drm, "Registered device memory [%llx-%llx] to devm, remapped to %pr\n",
+			mr->dpa_base, mr->dpa_base + mr->usable_size, res);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_svm_register_mem_region);
diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
index d7b9cf6b96c4..9d54475d8b5b 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -159,6 +159,8 @@ static inline u64 drm_mem_region_pfn_to_dpa(struct drm_mem_region *mr, u64 pfn)
 	return dpa;
 }
 
+int drm_svm_register_mem_region(const struct drm_device *drm, struct drm_mem_region *mr);
+
 /**
  * struct drm_hmmptr- hmmptr pointer
  *
-- 
2.26.3

