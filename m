Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E7BC27C79
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B7510E768;
	Wed, 12 Jun 2024 02:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqyWdwRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3918A10E767
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158538; x=1749694538;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BfoJ6J1tJcPdgxHmxY87hhVcgz8MLZQLRto3PI7ZXDY=;
 b=NqyWdwRR/OHqfiWGySqi64RA95XdstSV48xwkIQNiqK/E9U6yxkhuWrp
 eirfBNTWHTbfN498IGQpzLeuy+O3kAdXM3SF+hUXgFIE0u+S6nYzap0WB
 o1Ba3WQDykVPVA2YDpFFzJyPn/N+LpPnu8Pz2pHm8vIeBeOXp2zK3jlSF
 aqRx2MFFhYLtz4CKGW176GvLpsdWDdt3orqCwLRtsXQAOWfm/puGMwnyq
 lGjla8Pa5PcUiJjSGBLamfOfxutk5JR1oGjVEq2a/5aXiJeVIR9eddw+P
 g40RLwvMEPTOI0/hrapcyWbhg7EFQjdfFQgZ4zNS3zIB5qHsWRo9/Cys/ g==;
X-CSE-ConnectionGUID: THqXbK7oRi6IwWqxlmX+/Q==
X-CSE-MsgGUID: FcppvsrPSCmjhMJkzckwoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427798"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: Iefn8bwPRnKr9GhiX/GvZA==
X-CSE-MsgGUID: HAWQ3OpBSeSmeD8waPqmnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763630"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 14/43] drm/svm: Migrate a range of hmmptr to vram
Date: Tue, 11 Jun 2024 22:25:36 -0400
Message-Id: <20240612022605.385062-14-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

Introduce a helper function drm_svm_migrate_hmmptr_to_vram to migrate
any sub-range of a hmmptr to vram. The range has to be at page boundary.
This supposed to be called by driver to migrate a hmmptr to vram.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_svm.c | 121 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |   3 +
 2 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index ee6d932f434f..0a79b7800400 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -624,3 +624,124 @@ int drm_svm_register_mem_region(const struct drm_device *drm, struct drm_mem_reg
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_svm_register_mem_region);
+
+static void __drm_svm_init_device_pages(unsigned long *pfn, unsigned long npages)
+{
+	struct page *page;
+	int i;
+
+	for(i = 0; i < npages; i++) {
+		page = pfn_to_page(pfn[i]);
+		zone_device_page_init(page);
+		pfn[i] = migrate_pfn(pfn[i]);
+	}
+}
+
+/**
+ * drm_svm_migrate_hmmptr_to_vram() - migrate a sub-range of a hmmptr to vram
+ * Must be called with mmap_read_lock held.
+ *
+ * @vm: the vm that the hmmptr belongs to
+ * @mr: the destination memory region we want to migrate to
+ * @hmmptr: the hmmptr to migrate.
+ * @start: start(CPU virtual address, inclusive) of the range to migrate
+ * @end: end(CPU virtual address, exclusive) of the range to migrate
+ *
+ * Returns: negative errno on faiure, 0 on success
+ */
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,
+		struct drm_hmmptr *hmmptr, unsigned long start, unsigned long end)
+{
+	struct drm_device *drm = mr->mr_ops.drm_mem_region_get_device(mr);
+	struct mm_struct *mm = vm->mm;
+	unsigned long npages = __npages_in_range(start, end);
+	struct vm_area_struct *vas;
+	struct migrate_vma migrate = {
+		.start		= ALIGN_DOWN(start, PAGE_SIZE),
+		.end		= ALIGN(end, PAGE_SIZE),
+		.pgmap_owner	= mr->mr_ops.drm_mem_region_pagemap_owner(mr),
+		.flags          = MIGRATE_VMA_SELECT_SYSTEM,
+	};
+	struct device *dev = drm->dev;
+	struct dma_fence *fence;
+	struct migrate_vec *src;
+	struct migrate_vec *dst;
+	int ret = 0;
+	void *buf;
+
+	mmap_assert_locked(mm);
+
+	BUG_ON(start < __hmmptr_cpu_start(hmmptr));
+	BUG_ON(end > __hmmptr_cpu_end(hmmptr));
+
+	vas = find_vma_intersection(mm, start, end);
+	if (!vas)
+		return -ENOENT;
+
+	migrate.vma = vas;
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src), GFP_KERNEL);
+	if(!buf)
+		return -ENOMEM;
+
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+	ret = migrate_vma_setup(&migrate);
+	if (ret) {
+		drm_warn(drm, "vma setup returned %d for range [0x%lx - 0x%lx]\n",
+				ret, start, end);
+		goto free_buf;
+	}
+
+	/**
+	 * Partial migration is just normal. Print a message for now.
+	 * Once this behavior is verified, delete this warning.
+	 */
+	if (migrate.cpages != npages)
+		drm_warn(drm, "Partial migration for range [0x%lx - 0x%lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);
+
+	ret = mr->mr_ops.drm_mem_region_alloc_pages(mr, migrate.cpages, migrate.dst);
+	if (ret)
+		goto migrate_finalize;
+
+	__drm_svm_init_device_pages(migrate.dst, migrate.cpages);
+
+	src = __generate_migrate_vec_sram(dev, migrate.src, true, npages);
+	if (!src) {
+		ret = -EFAULT;
+		goto free_device_pages;
+	}
+
+	dst = __generate_migrate_vec_vram(migrate.dst, false, migrate.cpages);
+	if (!dst) {
+		ret = -EFAULT;
+		goto free_migrate_src;
+	}
+
+	fence = mr->mr_ops.drm_mem_region_migrate(src, dst);
+	if (IS_ERR(fence)) {
+		ret = -EIO;
+		goto free_migrate_dst;
+	}
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+	migrate_vma_pages(&migrate);
+
+free_migrate_dst:
+	__free_migrate_vec_vram(dst);
+free_migrate_src:
+	__free_migrate_vec_sram(dev, src, true);
+free_device_pages:
+	if (ret)
+		__drm_svm_free_pages(migrate.dst, migrate.cpages);
+migrate_finalize:
+	if (ret)
+		memset(migrate.dst, 0, sizeof(*migrate.dst)*migrate.cpages);
+	migrate_vma_finalize(&migrate);
+free_buf:
+	kvfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_svm_migrate_hmmptr_to_vram);
diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
index cb1edb6a993e..805f066ef3ff 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -223,4 +223,7 @@ void drm_svm_hmmptr_map_dma_pages(struct drm_hmmptr *hmmptr, u64 page_idx, u64 n
 void drm_svm_hmmptr_unmap_dma_pages(struct drm_hmmptr *hmmptr, u64 page_idx, u64 npages);
 int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u64 end,
             bool write, bool is_mmap_locked);
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,
+		struct drm_hmmptr *hmmptr, unsigned long start, unsigned long end);
 #endif
-- 
2.26.3

