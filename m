Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91729FF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 20:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534C110E915;
	Mon, 27 Apr 2026 20:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUcqWE+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0B10E06C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 20:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777321621; x=1808857621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JFcCPehoI8gcU/r8Dzo8Fd3jzZjnBCGIN5/BSzAmt0s=;
 b=DUcqWE+jHFTh3PTtyHUofjsecD8pEEfkpQF8VJS0mz7QXUwYZQnIX41b
 f4coyFldHcDtC5nqnV5eHvPT/IeCcfGcQ5L8hL4nkEheRxMAlr9AroAgy
 tRIUVmLPQO2Mk+H5PFHCxUWWk3JUJBt3bakytzsbmRoG8uPHrdkt/0fxU
 LjdykqOdSIKHzJ6CDS4M+avhilEDDRqtKN5MQ6R2nWVchdsERIbnevoG1
 EfwBwBRR73VregCi9Mg3EsIVhTmaYzBMpXy8OKNtLUqGW53Ss8kdYl2Fm
 FY7JH6acAbDRmxykQB+GRB8MqzXNY9EhMo8Xigii6UP60qiLgecG5nXSH g==;
X-CSE-ConnectionGUID: uY2U4bG3TjW742EjPlBrEQ==
X-CSE-MsgGUID: SkI/yibKSy6NkmjnCHi0+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78114619"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78114619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:27:00 -0700
X-CSE-ConnectionGUID: cB/l2kLKTOu8U8n8/PJhaw==
X-CSE-MsgGUID: 7iNoMdybQN+KfnMeVyOq9A==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:26:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
Date: Mon, 27 Apr 2026 13:26:54 -0700
Message-ID: <20260427202655.2493474-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
References: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
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
 drivers/gpu/drm/xe/xe_oa.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6ded3c2fce34e..83797c9479f7c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -9,6 +9,7 @@
 #include <linux/poll.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
@@ -902,9 +903,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 
 	stream->oa_buffer.bo = bo;
 
-	/* mmap implementation requires OA buffer to be in system memory */
-	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
-
 	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
 	if (!stream->oa_buffer.bounce) {
 		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
@@ -1692,8 +1690,6 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_bo *bo = stream->oa_buffer.bo;
-	unsigned long start = vma->vm_start;
-	int i, ret;
 
 	if (xe_observation_paranoid && !perfmon_capable()) {
 		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
@@ -1701,7 +1697,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
-	if (vma->vm_end - vma->vm_start != xe_bo_size(stream->oa_buffer.bo)) {
+	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
 		return -EINVAL;
 	}
@@ -1717,17 +1713,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
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
2.54.0

