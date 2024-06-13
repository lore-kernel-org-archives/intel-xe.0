Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91E9C2BA18
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5628810E967;
	Thu, 13 Jun 2024 04:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgnO3gkH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2B10E048
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252029; x=1749788029;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v3Of0hZHT8c/8WCiJz5FPNFG7GD+WG7HzYVxvgzY8Vs=;
 b=ZgnO3gkHqBQPlNn6bImFwlI9Me0mDKsf7XRYR4NONBYLtFSuog8vrd56
 WJLWjlLdX9tbdEKnlaJ6eu+oxW5i4G3jCHAXNLeqkxrnp0T9ohR72TKFx
 WFeWwba9mLvmWjHCiMrLBs0EaCZdPpX569oq7qmeL99EodAXEgW+IrZeh
 42S5sl9xonhaJA+NW8kLso6PCNmO5TDXN+9I+nlAkbJ/mi16en46qLQEg
 fDpZHz/aMchtvvypNYwcpl2K9Rfp+DswGKpt8QIbVowWdku7lyWuKrj86
 iBGNJNRgpQIbdShMRZQ80QO/XEkeboElO0d0g5NzTXjgyPx0kHmN6+p3q A==;
X-CSE-ConnectionGUID: 4cBLEuvrT7GSr9YoA/xX/Q==
X-CSE-MsgGUID: QIXLZ0piRzSU5Jl3UUifjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847962"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847962"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: wLbVcxvhRCK9mlr1/7NXwQ==
X-CSE-MsgGUID: J6VW7AK4RNORh7jShWVgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476327"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 11/42] drm/svm: Introduce helper to remap drm memory region
Date: Thu, 13 Jun 2024 00:23:58 -0400
Message-Id: <20240613042429.637281-11-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/drm_svm.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |  3 +++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index 9a164615f866..741874689e32 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -13,6 +13,7 @@
 #include <linux/swap.h>
 #include <linux/bug.h>
 #include <linux/hmm.h>
+#include <linux/pci.h>
 #include <linux/mm.h>
 
 static u64 __npages_in_range(unsigned long start, unsigned long end)
@@ -314,3 +315,58 @@ int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u
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
+		struct drm_mem_region *mr, enum memory_type type)
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
index d443f20b5510..04552cc1c67f 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -164,6 +164,9 @@ static inline u64 drm_mem_region_page_to_dpa(struct drm_mem_region *mr, struct p
 	return dpa;
 }
 
+int drm_svm_register_mem_region(const struct drm_device *drm,
+		struct drm_mem_region *mr, enum memory_type type);
+
 /**
  * struct drm_hmmptr- hmmptr pointer
  *
-- 
2.26.3

