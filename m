Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D283CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A826112624;
	Fri, 16 Oct 2026 07:19:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455C5112620
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135140; x=1823671140;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=t+sogV/9UNpcL26pZbsOHBRpvL/O60z6BNC/tsL2kS8=;
 b=UinG27QqkkSMQE0MLDRetntMbT0/wM22lI37htS9FaMvPEf+z5pD7W8H
 rOTVkKensDhhpRJEJxxIN+iVa4pKAQzvwYr7IL7UD9/y/1LitLaX/O0fl
 Hxk/+oEfJUkKMnlMyOyR4A3axODqZll5uWuUiHb5tZ0pPCeCZueRLPTl2
 rLiDNZ2uD+RdAeC2rBaW4zL17KlwTxDA3EL8dC4RQIbbekm3VRwltEs63
 xZUr8+bMGcl9S20lIYL24ZKQUsktVmzbRUgcGxQ8oyKgqBOhElk3OG+/9
 eSs/hdrYW050VZo7pWLskrQiGBtatrh/O3fv1SpOJMKsgvGyFQBlPVe2Q A==;
X-CSE-ConnectionGUID: 92hpbg0JSDGt9H3VB95LXA==
X-CSE-MsgGUID: 8Atnvk8eSFyheTsyTvaPAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813655"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813655"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:52 -0700
X-CSE-ConnectionGUID: zD32+aHRSZmeFZxKeNVL+g==
X-CSE-MsgGUID: aeyNKnHwQS6XUFl2wzmHww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787277"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:51 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 11/18] drm/xe: Reuse one dummy page per BO after wedge
Date: Fri, 16 Oct 2026 12:48:21 +0530
Message-ID: <20261016071832.222574-12-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

ttm_bo_vm_dummy_page() allocates a page and a managed cleanup action on
every call. These allocations remain until the DRM device is released,
so repeated fallback faults can retain many pages.

Keep one zeroed dummy page in each Xe BO and reuse it when device I/O is
blocked or the device is unplugged. Use cmpxchg() to handle concurrent
faults and free the page when the BO is destroyed.

A per-BO page also prevents writable mappings from different BOs from
sharing data.

Map only the faulting address and return the insertion result directly.
Other addresses fault on demand and reuse the same dummy page.
This avoids walking a potentially large VMA during a single fault.

v2:
 - Drop whole-VMA prefaulting and map only the faulting address to avoid
   long fault-handler runtimes on large mappings. (Sashiko)

v3:
 - Map the dummy RAM page with normal WB protection. (Sashiko)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 33 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h |  4 ++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7ee0eade172a..20dcaf4cb9f1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1994,6 +1994,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		list_del(&bo->vram_userfault_link);
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
+	if (bo->wedged_dummy_page)
+		__free_page(bo->wedged_dummy_page);
+
 	kfree(bo);
 }
 
@@ -2189,6 +2192,32 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
 	return ret;
 }
 
+static vm_fault_t xe_bo_vm_dummy_page(struct vm_fault *vmf, struct xe_bo *bo)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct page *page, *old;
+	pgprot_t prot = vm_get_page_prot(vma->vm_flags);
+	unsigned long pfn;
+
+	page = READ_ONCE(bo->wedged_dummy_page);
+	if (!page) {
+		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!page)
+			return VM_FAULT_OOM;
+
+		old = cmpxchg(&bo->wedged_dummy_page, NULL, page);
+		if (old) {
+			__free_page(page);
+			page = old;
+		}
+	}
+
+	pfn = page_to_pfn(page);
+
+	/* Map other addresses on demand instead of walking the whole VMA. */
+	return vmf_insert_pfn_prot(vma, vmf->address, pfn, prot);
+}
+
 static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -2204,7 +2233,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	int io_idx;
 
 	if (xe_device_io_get(xe, &io_idx))
-		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+		return xe_bo_vm_dummy_page(vmf, bo);
 
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
 	if (ret != VM_FAULT_RETRY)
@@ -2494,6 +2523,8 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 			return bo;
 	}
 
+	bo->wedged_dummy_page = NULL;
+
 	bo->ccs_cleared = false;
 	bo->tile = tile;
 	bo->flags = flags;
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8ec4a01a0092..80aeb4e31fe9 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -21,6 +21,7 @@ struct xe_device;
 struct xe_mem_pool_node;
 struct xe_vm;
 struct xe_exec_queue;
+struct page;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
@@ -112,6 +113,9 @@ struct xe_bo {
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 	struct list_head vram_userfault_link;
 
+	/** @wedged_dummy_page: Zeroed page used for faults after device wedge */
+	struct page *wedged_dummy_page;
+
 	/**
 	 * @min_align: minimum alignment needed for this BO if different
 	 * from default
-- 
2.43.0

