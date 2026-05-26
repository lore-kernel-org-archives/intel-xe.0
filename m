Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B03ACD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FE710E4D2;
	Tue, 26 May 2026 12:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkSBFbmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE2010E49D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779799911; x=1811335911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7d7iiW0lFuOUrF8umsJ2Mm6M9BYGL9oTgrPHSSV7D3c=;
 b=PkSBFbmvOGm4bbQZPv5vCTlBVuy5dxCBS+YA/wlDYKgxTCMvywxgzku7
 lA5FCDQBjrQnoOFoBZ9N5gboXlSs+3BA4d7ZPb4Jw9CkHgEy9WPpLBm8k
 kN6YMiXZHS1aDI/AUgsVPjdN545mBMRgcQ+Iy6czE1eiqo/AGsSXwct5I
 164r2cRtNIwaObMqTKdPL3Ya5k9wNXE1/QAvFh4E6VeB//DJk2w4BkF+C
 uibu2drORdj/k+R4W7aYwsQx48L/8+IK+YAQwc6lxqxw0TQ2Nl/XU7Bfi
 k/hdKsusWIZDRmNYJnUvR1wU/cULkUEzN+Og/hziGhQwf2Lyu5QbYCeU3 A==;
X-CSE-ConnectionGUID: lcggVrKvRFqBYSSMkKRb/w==
X-CSE-MsgGUID: ULZ/l4HXT6SrlsF1HaFj9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92082765"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92082765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:29 -0700
X-CSE-ConnectionGUID: dGWXkRm5TS+bTZvbKEG3ZA==
X-CSE-MsgGUID: f9t9EjZYTpGUDt5bX69B6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235554572"
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:24 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
Date: Tue, 26 May 2026 15:51:09 +0300
Message-ID: <20260526125106.2806522-9-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526125106.2806522-7-ilia.levi@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
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
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index c22a38e5616b..15e884ad3f1c 100644
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
@@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 	struct drm_device *dev = base->dev;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
-	unsigned long i;
+	unsigned long addr, pfn;
+	unsigned long pgoff;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx)) {
@@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 		return xe_mmio_gem_vm_fault_dummy_page(vmf);
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

