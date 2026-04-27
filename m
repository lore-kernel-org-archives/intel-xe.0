Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350B8FF886D
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9BF10E8F5;
	Mon, 27 Apr 2026 19:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1YfS1mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D9D10E8F3
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777316548; x=1808852548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5GqsKY3st77FaaHLA8b+CgOvvs8Cupxfd/I4MzQtQZM=;
 b=B1YfS1mfMfyI0wrHzvJ08xhzSkJ2UyX4GEMGAhv55Wk/hW/HnArrDasI
 KYzMivGPNKrMSByBDn2/5sjB2k712SMnkMdOeqntjn+y5t7d0iV7Y9rLW
 9W3sx7VMsZAJsUG+v2oV1MkVwIlpjASGI8mEIisR22AVlXwPdhKgb5pws
 Gezvc1UrpptDkUpiTSTdH485VOZLo4jfnIPw0kvW9f+RfLLWZNvGafiwd
 Tt5JTT4fYam+YvIh4eiRkKTHO8vrZMPUZxavJ0+Pvt/mbcul23kPlSaTO
 hLBkBjQngIJWbtpvxVnk6/rkEPRxZt+Jc+O6/EZuWRula2JdRnbiy1aQ+ Q==;
X-CSE-ConnectionGUID: qOGJEbyESNGSLdhka6FKWA==
X-CSE-MsgGUID: AUOfLOxfSfuS33ygIqtnzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78108218"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78108218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:02:28 -0700
X-CSE-ConnectionGUID: kyDiVc5FQ5KIzoeradhaHw==
X-CSE-MsgGUID: OC9YQnYlTPqZ/8zq8YU5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="232723308"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:02:28 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
Date: Mon, 27 Apr 2026 12:02:22 -0700
Message-ID: <20260427190223.2487665-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427190223.2487665-1-ashutosh.dixit@intel.com>
References: <20260427190223.2487665-1-ashutosh.dixit@intel.com>
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
index 1fff0e8e9e78e..d3994ae8bc82d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -9,6 +9,7 @@
 #include <linux/poll.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
@@ -900,9 +901,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 
 	stream->oa_buffer.bo = bo;
 
-	/* mmap implementation requires OA buffer to be in system memory */
-	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
-
 	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
 	if (!stream->oa_buffer.bounce) {
 		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
@@ -1690,8 +1688,6 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_bo *bo = stream->oa_buffer.bo;
-	unsigned long start = vma->vm_start;
-	int i, ret;
 
 	if (xe_observation_paranoid && !perfmon_capable()) {
 		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
@@ -1699,7 +1695,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
-	if (vma->vm_end - vma->vm_start != xe_bo_size(stream->oa_buffer.bo)) {
+	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
 		return -EINVAL;
 	}
@@ -1715,17 +1711,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
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

