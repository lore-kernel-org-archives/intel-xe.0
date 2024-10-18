Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D2D2FFE6
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 10:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869D510E8E6;
	Fri, 18 Oct 2024 10:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKob33xH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C194C10E8E6
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729248200; x=1760784200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DIREdEVmdIyrmHh6rMpR05X6R+jFFWYCTX0vkfSWbrU=;
 b=kKob33xH7hO9TjY+9c8E1m7rSy1KO2ViejRQgg+1PeEIRsSTIOiddH3Q
 7DRs+t91I5W3S/9Z8MJeC8xZhmBtqpg3Qpy6IdvBtqwFgXFwuDLa4AUhY
 Jy/tUjOTnUhIZnqmmrwkLyD/VhYVaF0oXQGuvZ6QNe1UsuXhvt8ZvGWVm
 8GOIKLHW6CiVDvIMIIZynNENOSDCuF04DxUZ5Zj2VRGLZETgVuTbvFj5j
 tyaFGn0U7Sk8qtnovw5O3tyRswXEXumA3liuh+0XYEVrWn4w7eVRn4eoD
 pRXMBp+4LFoymSXEI/k5YsgV4NfTTY2osLD88ocNySm2bSkORz68NEK5f Q==;
X-CSE-ConnectionGUID: 8KmnhVTFQOaY5kEIqnifHg==
X-CSE-MsgGUID: 9o9fnvGbQKCs5qNYzlmthw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28866118"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="28866118"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 03:43:19 -0700
X-CSE-ConnectionGUID: vyVpnmo5QnaaXGI2tGlTog==
X-CSE-MsgGUID: GOWbsJk3TaC3K26qz5nhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83413666"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 03:43:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH V2] drm/xe/mmap: Add mmap support for PCI memory barrier
Date: Fri, 18 Oct 2024 16:16:39 +0530
Message-Id: <20241018104639.855216-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

In order to avoid having userspace to use MI_MEM_FENCE,
we are adding a mechanism for userspace to generate a
PCI memory barrier with low overhead (avoiding IOCTL call
as well as writing to VRAM will adds some overhead).

This is implemented by memory-mapping a page as uncached
that is backed by MMIO on the dGPU and thus allowing userspace
to do memory write to the page without invoking an IOCTL.
We are selecting the MMIO so that it is not accessible from
the PCI bus so that the MMIO writes themselves are ignored,
but the PCI memory barrier will still take action as the MMIO
filtering will happen after the memory barrier effect.

When we detect special defined offset in mmap(), We are mapping
4K page which contains the last of page of doorbell MMIO range
to userspace for same purpose.

Note: Test coverage for this is added by IGT
      https://patchwork.freedesktop.org/patch/618931/  here.

V2(MAuld)
  - Add fault handler with dummy page to handle unplug device
  - Add Build check for special offset to be below normal start page
  - Test d3hot, mapping seems to be valid in d3hot as well
  - Add more info to commit message

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 109 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |   3 +
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd241a8e1838..c1c82bd2d681 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -239,12 +239,119 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 #define xe_drm_compat_ioctl NULL
 #endif
 
+static void barrier_open(struct vm_area_struct *vma)
+{
+	drm_dev_get(vma->vm_private_data);
+}
+
+static void barrier_close(struct vm_area_struct *vma)
+{
+	drm_dev_put(vma->vm_private_data);
+}
+
+static void barrier_release_dummy_page(struct drm_device *dev, void *res)
+{
+	struct page *dummy_page = (struct page *)res;
+
+	__free_page(dummy_page);
+}
+
+static vm_fault_t barrier_fault(struct vm_fault *vmf)
+{
+	struct drm_device *dev = vmf->vma->vm_private_data;
+	struct vm_area_struct *vma = vmf->vma;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	unsigned long address;
+	unsigned long pfn;
+	struct page *page;
+	pgprot_t prot;
+
+	prot = vm_get_page_prot(vma->vm_flags);
+
+	/* Allocate new dummy page to map all the VA range in this VMA to it*/
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!page)
+		return VM_FAULT_OOM;
+
+	/* Set the page to be freed using drmm release action */
+	if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
+		return VM_FAULT_OOM;
+
+	pfn = page_to_pfn(page);
+
+	/* Prefault the entire VMA range right away to avoid further faults */
+	for (address = vma->vm_start; address < vma->vm_end;
+	     address += PAGE_SIZE)
+		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
+
+	return ret;
+}
+
+static const struct vm_operations_struct vm_ops_barrier = {
+	.open = barrier_open,
+	.close = barrier_close,
+	.fault = barrier_fault,
+};
+
+static int xe_pci_barrier_mmap(struct file *filp,
+			       struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+	unsigned long pfn;
+	pgprot_t prot;
+
+	if (vma->vm_end - vma->vm_start > PAGE_SIZE)
+		return -EINVAL;
+
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
+	if (vma->vm_flags & (VM_READ | VM_EXEC))
+		return -EINVAL;
+
+	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+#define LAST_DB_PAGE_OFFSET 0x7ff001
+	pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
+			LAST_DB_PAGE_OFFSET);
+	if (vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
+				pgprot_noncached(prot)) != VM_FAULT_NOPAGE)
+		return -EFAULT;
+
+	vma->vm_ops = &vm_ops_barrier;
+	vma->vm_private_data = dev;
+	drm_dev_get(vma->vm_private_data);
+	return 0;
+}
+
+static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+
+	if (drm_dev_is_unplugged(dev))
+		return -ENODEV;
+
+	BUILD_BUG_ON(((DRM_XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
+		      XE_PAGE_SIZE) >= DRM_FILE_PAGE_OFFSET_START);
+
+	switch (vma->vm_pgoff) {
+	case DRM_XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
+		return xe_pci_barrier_mmap(filp, vma);
+	}
+
+	return drm_gem_mmap(filp, vma);
+}
+
 static const struct file_operations xe_driver_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release_noglobal,
 	.unlocked_ioctl = xe_drm_ioctl,
-	.mmap = drm_gem_mmap,
+	.mmap = xe_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
 	.compat_ioctl = xe_drm_compat_ioctl,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c4182e95a619..c21dd66c3846 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -829,6 +829,9 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
+/** Special offset to create mapping for pci memory barrier purpose */
+#define DRM_XE_PCI_BARRIER_MMAP_OFFSET		(0x50 << XE_PTE_SHIFT)
+
 /**
  * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
  *
-- 
2.34.1

