Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B26F36B94
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 23:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6FE10E873;
	Thu,  9 Apr 2026 23:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXLTGiR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C8C10E873
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775776679; x=1807312679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uhCKdwVTm7ErN3iifMbR3ECF0OCV/e7MRW8Moc7T16U=;
 b=jXLTGiR5jYPSNMFxIGk0PZxvMt9nMEsYzvDF0pQndAmGGOTByXH+LOLO
 u7cXRRtZjDODPrKn5RCUiSrH1JMHzayLjHafYiX8gANryX6gCvkAnFCLn
 6acEbc0VtlWeX//5CJO7/f+3F+PfqcbOkYzViRj0Ve3mHeufAI9ObtBqw
 4Psrw8YFlBZn9srGQyV7xQDG7CJYOHYCl7XBusE6DBXF56U/7oP5+/Dnc
 KyAOxvctt+4O2lFHVHTj+XOpg/VG9GSDCghMzZ/f5WR6kx++BZDZEep6L
 IEQGGOlGUETd93QLfMmEGI/wNYYZ1/WhLfUxAklw7ZetaOVejXfrGJcnm g==;
X-CSE-ConnectionGUID: Y9z3b0Q5SuuC/0MYz61NVg==
X-CSE-MsgGUID: Rq6v0UBhQ8acMv1WodtGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80654740"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="80654740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:17:59 -0700
X-CSE-ConnectionGUID: 04h95bSgRt6AEQpE5WW4QA==
X-CSE-MsgGUID: 735YCROxRwGwPUHqnCAX7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="252268987"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:17:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
Date: Thu,  9 Apr 2026 16:17:53 -0700
Message-ID: <20260409231754.528518-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260409231754.528518-1-ashutosh.dixit@intel.com>
References: <20260409231754.528518-1-ashutosh.dixit@intel.com>
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

OA buffer mmap can currently only mmap OA buffer in system memory. CRI
MERTOA buffer can be located in device memory. Switch OA buffer mmap to
using drm_gem_mmap_obj, which can handle mmap's of both system and device
memory buffers.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ff2ddec8ffa65..b24aae055c7df 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -9,6 +9,7 @@
 #include <linux/poll.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
@@ -910,8 +911,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
-	/* mmap implementation requires OA buffer to be in system memory */
-	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
 	return 0;
 }
 
@@ -1693,8 +1692,6 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_bo *bo = stream->oa_buffer.bo;
-	unsigned long start = vma->vm_start;
-	int i, ret;
 
 	if (xe_observation_paranoid && !perfmon_capable()) {
 		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
@@ -1702,7 +1699,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
-	if (vma->vm_end - vma->vm_start != xe_bo_size(stream->oa_buffer.bo)) {
+	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
 		return -EINVAL;
 	}
@@ -1718,17 +1715,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
 		     VM_MAYWRITE | VM_MAYEXEC);
 
-	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages == vma_pages(vma));
-	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
-		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
-				      PAGE_SIZE, vma->vm_page_prot);
-		if (ret)
-			break;
-
-		start += PAGE_SIZE;
-	}
-
-	return ret;
+	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
 }
 
 static const struct file_operations xe_oa_fops = {
-- 
2.48.1

