Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A24CDDE52
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 10:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FA310E34F;
	Wed, 23 Oct 2024 10:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrCjEJrA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CF410E34F
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729678065; x=1761214065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lxI79+WiTJvcV2o2/PHVy6EuXfmmsfRZJKTQkp2QH64=;
 b=NrCjEJrAGZeDH0eOe7PeGcJ4fS5OuLZ4TcDA6ZDqXoVjUHhk+6eT0P7c
 5ApFjrFF2QaqXQqRLFLuw+5evhtofZw1zLu9aigkCG0x3nYEmtfxPLRJu
 TMfSCVJ/+JVKzROgRZSPa9JyzKSdRmFmYPxzrUhxewFjL1vxyM9nZGeDf
 94P5dKkODQRkrI0RpLDZzuxAAxg7yfBGQC7RMzlBq2M/9fQBLIo9EkLW/
 Ad3xQiZPswwtQyJ1R3mepIX2U1d7wSiOZPsTJ2HhjTbP5FMWLlejNUjIJ
 FqH+D3Wiq30xEqhMXk0UWpXooa9q+KpF4+1Ddf14LjTm4xv/oaSboj+gt g==;
X-CSE-ConnectionGUID: g/4KSM+sT627nM/NP6tAzA==
X-CSE-MsgGUID: 39VMDy7XQy+LINLP8fPxTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29149251"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="29149251"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 03:07:44 -0700
X-CSE-ConnectionGUID: cG/uHJodR+eWtxVMC5CZew==
X-CSE-MsgGUID: OsYLIkJMSoqpAour1RakoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="84953762"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 03:07:42 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH V4] drm/xe/mmap: Add mmap support for PCI memory barrier
Date: Wed, 23 Oct 2024 15:41:21 +0530
Message-Id: <20241023101121.965590-1-tejas.upadhyay@intel.com>
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

For user to query special offset we are adding special flag in
mmap_offset ioctl which needs to be passed as follows,
 struct drm_xe_gem_mmap_offset mmo = {
                .handle = 0, /* this must be 0 */
                .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
        };
 igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
 map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);

Note: Test coverage for this is added by IGT
      https://patchwork.freedesktop.org/series/140368/  here.

V4(MAuld)
  - Add kernel-doc for uapi change
  - Restrict page size to 4K
V3(MAuld)
  - Remove offset defination from UAPI to be able to change later
  - Edit commit message for special flag addition
V2(MAuld)
  - Add fault handler with dummy page to handle unplug device
  - Add Build check for special offset to be below normal start page
  - Test d3hot, mapping seems to be valid in d3hot as well
  - Add more info to commit message

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c     |  10 ++-
 drivers/gpu/drm/xe/xe_bo.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c | 109 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |  13 +++-
 4 files changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d5d30a0ff1e7..078f92eb0947 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2132,9 +2132,17 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags))
+	if (XE_IOCTL_DBG(xe, args->flags &
+			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
+		if (XE_IOCTL_DBG(xe, args->handle))
+			return -EINVAL;
+		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
+		return 0;
+	}
+
 	gem_obj = drm_gem_object_lookup(file, args->handle);
 	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 41624159a291..b36d1fba54c1 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -63,6 +63,8 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
+#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
+
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2da4affe4dfd..5fee3d77a88d 100644
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
+	     address += SZ_4K)
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
+	if (vma->vm_end - vma->vm_start > SZ_4K)
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
+	BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
+		      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
+
+	switch (vma->vm_pgoff) {
+	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
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
index c4182e95a619..c476141f53b1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -819,7 +819,18 @@ struct drm_xe_gem_mmap_offset {
 	/** @handle: Handle for the object being mapped. */
 	__u32 handle;
 
-	/** @flags: Must be zero */
+/**
+ * For user to query special offset we are adding special flag in
+ * mmap_offset ioctl which needs to be passed as follows,
+ * struct drm_xe_gem_mmap_offset mmo = {
+ * 	.handle = 0, (this must be set to 0)
+ * 	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+ * };
+ * igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+ * map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
+*/
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
+	/** @flags: Flag to indicate if any special offset, zero otherwise */
 	__u32 flags;
 
 	/** @offset: The fake offset to use for subsequent mmap call */
-- 
2.34.1

