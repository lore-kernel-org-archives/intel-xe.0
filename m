Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620C3C27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8454E112ECB;
	Thu, 30 May 2024 00:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZ8JN330";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDA310F0AF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029211; x=1748565211;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5rnCbKDRwyJzF6jCqHUK+RncNeELxddjqQCjIdwMZfs=;
 b=LZ8JN330EZvodjyVz7N8PgqHpAOXIIJ4V5OfFtra2EnUqVGPkagXo2Xf
 aWdZy66JaegZjWXxz3sNSE65t9ffh1fMtRUdRZuOOIuDxrk/b3V8u43lE
 wGjD0YjyQtXxp7pIPhmDBYI5/3UAYV5IJbUek8kp/TP4I+Zr51EcPsd6V
 YepC+2FBS8sJMfEylhE9pxRF1qdhel1M+/KZDs+Ub41TgE8I31n6bAG0h
 EmMkhIvjTVJ1kZY6O0dWTA6QltSz1jbwSgsyQkkAWaDHYWRQaBcqd39xR
 x9X5ZcaU/9Bi6D6w+/hs44K5PBp5ilbkoppQcz2TjATST5G9bEbSJnxSi A==;
X-CSE-ConnectionGUID: lFzEvznfSiikg8cFt4PTZA==
X-CSE-MsgGUID: 9g8CFnb1ROWqZVfg92UHbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975387"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:23 -0700
X-CSE-ConnectionGUID: d2bXaK60RiuKmR4CXRzRPA==
X-CSE-MsgGUID: VjgKUtosS1mGc/lee/TL8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088737"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 12/26] drm/svm: Introduce helper to remap drm memory region
Date: Wed, 29 May 2024 20:47:18 -0400
Message-Id: <20240530004732.84898-12-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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
index 588721edeeb1..f650235ec23a 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -13,6 +13,7 @@
 #include <linux/swap.h>
 #include <linux/bug.h>
 #include <linux/hmm.h>
+#include <linux/pci.h>
 #include <linux/mm.h>
 
 static u64 __npages_in_range(unsigned long start, unsigned long end)
@@ -252,3 +253,52 @@ int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u
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
index 8f699a75d6dd..fd257f25b415 100644
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

