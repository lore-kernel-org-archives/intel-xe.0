Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB21CD5BD0
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 12:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5310E315;
	Mon, 25 May 2026 12:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQLstw9R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735FE10E315
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779713899; x=1811249899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QPsTRl1XUdhg49YSIDvACuosByMOQyXy31X7kUzeNag=;
 b=dQLstw9RD/J/U07p2NiPk5jCrKmgJivj6zJ7xM810J1y2ZeTxTYN1Udm
 2KWOtFPoVxiZOgS3uGXSwe9gWS03M/BRIPfGItf3+18gjusTpM5THO7Oi
 kOZey/rg8+osiGqAZYPnk/YS6GwHKN0eNBlRikY3+7n5zxbHQZhe0RRAl
 CWi8y4Okzzumue5UBvh0QEaG9AP3g7e7+yTG4x8xs5viFDUIPMthYZAgQ
 P6XjdhymlIov1IgGsTUFH7+FTw2eSsijViv6PHGZuKGj8q24jtEjxMzxS
 TWX2UEpyT9xFO1RI0p8MRUG3dANkVgi8rXx0wNUGF51WuuPrTswnHye56 A==;
X-CSE-ConnectionGUID: CLQFUQ/ySWafdf2sWF7oag==
X-CSE-MsgGUID: IhLAvNfQQVChR3URA9p34A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91223148"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91223148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:19 -0700
X-CSE-ConnectionGUID: G95luQixR5iC0MptW3UcWg==
X-CSE-MsgGUID: XBIX0QaHSVKE3hjYmp5olg==
X-ExtLoop1: 1
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:18 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH 1/4] drm/xe/mmio_gem: fix fault handling for split VMA
Date: Mon, 25 May 2026 15:58:03 +0300
Message-ID: <20260525125801.975038-7-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525125801.975038-6-ilia.levi@intel.com>
References: <20260525125801.975038-6-ilia.levi@intel.com>
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

The fault handler currently assumes it always operates on a VMA spanning
the entire GEM object. This does not hold when the VMA has been split,
e.g. by a partial munmap or mprotect. In that case the handler may map
wrong physical pages or cause SIGBUS.

Change the fault handler to map only the GEM subrange corresponding to
the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
because helpers like dma_mmap_pages() interpret vm_pgoff as an
intra-buffer page offset; leaving the DRM fake offset there would break
these helpers. Those drivers can get away with zeroing it because they
map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
is never consulted again. This driver does not use such helpers and
defers mapping to the fault handler, where vm_pgoff must be preserved:
when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
subtracts the GEM object's fake mmap offset to recover the page offset
within the object.

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 8c803ef233cc..48b3a993afcf 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
 struct xe_mmio_gem {
 	struct drm_gem_object base;
 	phys_addr_t phys_addr;
+	unsigned long pgoff;
 };
 
 static const struct vm_operations_struct vm_ops = {
@@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
 	if (err)
 		goto free_gem;
 
+	obj->pgoff = drm_vma_node_start(&base->vma_node);
+
 	err = drm_vma_node_allow(&base->vma_node, file);
 	if (err)
 		goto free_gem;
@@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
 
-	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
-	vma->vm_pgoff = 0;
 	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
 	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
 		     VM_DONTCOPY | VM_NORESERVE);
@@ -167,9 +168,8 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
 	struct drm_gem_object *base = vma->vm_private_data;
 	struct drm_device *dev = base->dev;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
+	unsigned long addr, pfn;
 	struct page *page;
-	unsigned long pfn;
-	unsigned long i;
 
 	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (!page)
@@ -181,9 +181,7 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
 	pfn = page_to_pfn(page);
 
 	/* Map the entire VMA to the same dummy page */
-	for (i = 0; i < base->size; i += PAGE_SIZE) {
-		unsigned long addr = vma->vm_start + i;
-
+	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
 		ret = vmf_insert_pfn(vma, addr, pfn);
 		if (ret & VM_FAULT_ERROR)
 			break;
@@ -199,7 +197,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 	struct drm_device *dev = base->dev;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
-	unsigned long i;
+	unsigned long addr, pfn;
+	unsigned long pgoff;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx)) {
@@ -212,13 +211,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 		return xe_mmio_gem_vm_fault_dummy_page(vma);
 	}
 
-	for (i = 0; i < base->size; i += PAGE_SIZE) {
-		unsigned long addr = vma->vm_start + i;
-		unsigned long phys_addr = obj->phys_addr + i;
+	pgoff = vma->vm_pgoff - obj->pgoff;
+	pfn = PHYS_PFN(obj->phys_addr) + pgoff;
 
-		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
+	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
+		ret = vmf_insert_pfn(vma, addr, pfn);
 		if (ret & VM_FAULT_ERROR)
 			break;
+
+		pfn++;
 	}
 
 	drm_dev_exit(idx);
-- 
2.43.0

