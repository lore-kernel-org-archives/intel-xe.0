Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A21C27C79
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 01:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506F310E013;
	Tue, 18 Jun 2024 01:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzRSDBlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398FD10E205
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718675181; x=1750211181;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HEvt7+Fn5xM/c7kQCEB/t9DSGnNYM0vqEAnWEL9I2YA=;
 b=gzRSDBlW4IotFMx//KEWGjs3KIE4VRkb6hMQqtMophO7Ai78eCLd7vRL
 PNWfuF8LpVOyxGJbP4J329Z+P+fp20JV89LNo52LA/8VPuiYwRtStnW21
 A176Ju+AKPfkZzPHY3YEO7updTjnk5woejD7WKBSTCW4AR+nWQTggLTw6
 gdWmCqV1WgQoid+Cu4Th3WUIyveqV7OrYDXs5xJVSbJsxbI4SepcyGPSF
 /t8Amu37mMsts3/dicKmlUxpuTOKAk4Otovn7gkftaAx4HIPfPaYoZdHW
 YCthyw5toQdiAmDFcz60QYKY6mx+i74W78+fp727jk5Js7QYEVgLI28jr g==;
X-CSE-ConnectionGUID: 7OmOcNKUQEil2p3ATOxE0g==
X-CSE-MsgGUID: l3sLCzGHSBe8EECIuY5pDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38051504"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="38051504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:46:20 -0700
X-CSE-ConnectionGUID: VtVBlcJcQuajAuGcZejpvg==
X-CSE-MsgGUID: u2QLbouPQbeNHnIHxuTakw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41314325"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:46:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/17] drm/xe/oa/uapi: OA buffer mmap
Date: Mon, 17 Jun 2024 18:46:05 -0700
Message-ID: <20240618014609.3233427-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240618014609.3233427-1-ashutosh.dixit@intel.com>
References: <20240618014609.3233427-1-ashutosh.dixit@intel.com>
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

Allow the OA buffer to be mmap'd to userspace. This is needed for the MMIO
trigger use case. Even otherwise, with whitelisted OA head/tail ptr
registers, userspace can receive/interpret OA data from the mmap'd buffer
without issuing read()'s on the OA stream fd.

v2: Remove unmap_mapping_range from xe_oa_release (Thomas H)
    Use vm_flags_mod (Umesh)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 038caeb7c9e7..00654213cd93 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -824,6 +824,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
+	/* mmap implementation requires OA buffer to be in system memory */
+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
 	return 0;
 }
@@ -1125,6 +1127,49 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	struct xe_bo *bo = stream->oa_buffer.bo;
+	unsigned long start = vma->vm_start;
+	int i, ret;
+
+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
+		return -EACCES;
+	}
+
+	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
+	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
+		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Only support VM_READ, enforce MAP_PRIVATE by checking for
+	 * VM_MAYSHARE, don't copy the vma on fork
+	 */
+	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
+		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
+		return -EINVAL;
+	}
+	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
+		     VM_MAYWRITE | VM_MAYEXEC);
+
+	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
+		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
+	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
+		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
+				      PAGE_SIZE, vma->vm_page_prot);
+		if (ret)
+			break;
+
+		start += PAGE_SIZE;
+	}
+
+	return ret;
+}
+
 static const struct file_operations xe_oa_fops = {
 	.owner		= THIS_MODULE,
 	.llseek		= no_llseek,
@@ -1132,6 +1177,7 @@ static const struct file_operations xe_oa_fops = {
 	.poll		= xe_oa_poll,
 	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
+	.mmap		= xe_oa_mmap,
 };
 
 static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
-- 
2.41.0

