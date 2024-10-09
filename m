Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C68CEFC5D
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 10:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A110E6BA;
	Wed,  9 Oct 2024 10:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6v6ZcJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474FB10E6BA
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728468399; x=1760004399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w3d6b5GA0Se9XM8Y6tK8f49zs+b4llJo9u5GAHfwxlU=;
 b=N6v6ZcJrCWBGqdwwxolShqrCRoWsANf+uHYQsTNxJ/PlsL86thTclgCh
 vM9HTwWoeNue+wHPz72l1ApVtmkC7ZVZ6oG+63/j3wcXxc/PDQemUJOb/
 Ey2OODI5vtcUGzAlAfU+/IwKFggl0B/mKU1NSNghZeAokNGo+vv9qrPNn
 6bzrxsCQIZpiHLEGmbvaIin+pio8W5k2cT76ZM8DTa7nY1c0zvxhE3SPb
 vbQrkvHQLQJ/ZdBFJ9O0CF7dyBwxI48qzzE56SMRtvOphw9UdfMUNgX+9
 tV5Rijsif6uy2pH1oLofbJvvBSEMAW+yH4oi2QWsvmVgnF2kzGUVK3Qwe Q==;
X-CSE-ConnectionGUID: YWfaUk2NQaOdjO04mV/W8g==
X-CSE-MsgGUID: 21+xZLDBRiSjrYuOICLUOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39114344"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39114344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:06:39 -0700
X-CSE-ConnectionGUID: utvykz90QFip9qmcpqOyiQ==
X-CSE-MsgGUID: Ud4RzRsZQACMtDfb/OMjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80183239"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:06:38 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
Date: Wed,  9 Oct 2024 15:40:04 +0530
Message-Id: <20241009101004.664216-1-tejas.upadhyay@intel.com>
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
PCI memory barrier with low overhead (avoiding IOCTL call).

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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 68 +++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd241a8e1838..c97a4d1f0a98 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -239,12 +239,78 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
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
+static const struct vm_operations_struct vm_ops_barrier = {
+	.open = barrier_open,
+	.close = barrier_close,
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
+#define XE_PCI_BARRIER_MMAP_OFFSET (0x50 << PAGE_SHIFT)
+	switch (vma->vm_pgoff) {
+	case XE_PCI_BARRIER_MMAP_OFFSET >> PAGE_SHIFT:
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
-- 
2.34.1

