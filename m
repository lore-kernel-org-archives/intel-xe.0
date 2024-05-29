Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69741C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12236112C85;
	Wed, 29 May 2024 01:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d74e1/2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E89E112C8B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944731; x=1748480731;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+4zSfa41VDiXUZ3Nayi4zyQ6Aopev+nxzG0byHObz4I=;
 b=d74e1/2KjIDev02Bh2F5jx7yJrMyFyQO6zxXICtUj89IMhUlIqYXztlq
 yMQQAYZc7B8MiW/SKBFkcTz2WYhHHzacUHDs/EKmnCLU7Ok7csYtKabWI
 ezRrh/K6ciJNEDpKQrKOW+j+Nr7T8lMlogeyQfhSNsc4S6rxhDAvZE/yp
 0i2CLG01+KgTkd/z665kdIlCJUsIJNJyrxJmUc0jF+abPw18LuBCiKvUo
 /abkOyJd/X6sK8szYROWr+fAkO6Mq9WuqbSJk+64OZu76c148fAshyu/5
 kBhd0M3pk6Ldvbh/KsBE8IPihJvHfKnAoom4Qdj7gdURpyebLhhrrgJM8 Q==;
X-CSE-ConnectionGUID: 4jattjbzQ2ey33B8AS2EUQ==
X-CSE-MsgGUID: gbSQyVjMQPWBUC1NBTnFSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849795"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:18 -0700
X-CSE-ConnectionGUID: lDBR9DW3SL2Y5vwyhQJY9g==
X-CSE-MsgGUID: JDmJIdCFTJW0PXUE3sPXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700502"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:18 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 14/26] drm/svm: Migrate a range of hmmptr to vram
Date: Tue, 28 May 2024 21:19:12 -0400
Message-Id: <20240529011924.4125173-14-oak.zeng@intel.com>
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
 drivers/gpu/drm/drm_svm.c | 122 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |   3 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index e18656bbd1fd..e93b9640913e 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -526,3 +526,125 @@ int drm_svm_register_mem_region(const struct drm_device *drm, struct drm_mem_reg
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
+ * @start: start(virtual address, inclusive) of the range to migrate
+ * @end: end(virtual address, exclusive) of the range to migrate
+ *
+ * Returns: negative errno on faiure, 0 on success
+ */
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,
+		struct drm_hmmptr *hmmptr, unsigned long start, unsigned long end)
+{
+	struct drm_device *drm = mr->mr_ops.drm_mem_region_get_device(mr);
+	struct drm_gpuva *gpuva = hmmptr->get_gpuva(hmmptr);
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
+	BUG_ON(start < GPUVA_START(gpuva));
+	BUG_ON(end > GPUVA_END(gpuva));
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
+		drm_warn(drm, "vma setup returned %d for range [%lx - %lx]\n",
+				ret, start, end);
+		goto free_buf;
+	}
+
+	/**
+	 * Partial migration is just normal. Print a message for now.
+	 * Once this behavior is verified, delete this warning.
+	 */
+	if (migrate.cpages != npages)
+		drm_warn(drm, "Partial migration for range [%lx - %lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);
+
+	ret = mr->mr_ops.drm_mem_region_alloc_pages(mr, migrate.cpages, migrate.dst);
+	if (ret) {
+		memset(migrate.dst, 0, sizeof(*migrate.dst));
+		goto migrate_pages;
+	}
+
+	__drm_svm_init_device_pages(migrate.dst, migrate.cpages);
+
+	src = __generate_migrate_vec_sram(dev, migrate.src, true, npages);
+	if (!src) {
+		ret = VM_FAULT_OOM;
+		goto free_device_pages;
+	}
+
+	dst = __generate_migrate_vec_vram(migrate.dst, false, migrate.cpages);
+	if (!dst) {
+		ret = VM_FAULT_OOM;
+		goto free_migrate_src;
+	}
+
+	fence = mr->mr_ops.drm_mem_region_migrate(src, dst);
+	if (IS_ERR(fence)) {
+		ret = VM_FAULT_SIGBUS;
+		goto free_migrate_dst;
+	}
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+free_migrate_dst:
+	__free_migrate_vec_vram(dst);
+free_migrate_src:
+	__free_migrate_vec_sram(dev, src, true);
+
+free_device_pages:
+	if (ret)
+		__drm_svm_free_pages(migrate.dst, migrate.cpages);
+migrate_pages:
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+free_buf:
+	kvfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_svm_migrate_hmmptr_to_vram);
diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
index 9d54475d8b5b..33709d8c5f35 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -210,3 +210,6 @@ int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
 void drm_svm_hmmptr_release(struct drm_hmmptr *hmmptr);
 int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner,
 		u64 start, u64 end, bool write);
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,
+		struct drm_hmmptr *hmmptr, unsigned long start, unsigned long end);
-- 
2.26.3

