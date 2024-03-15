Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E71C54E72
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F036D10FF40;
	Fri, 15 Mar 2024 01:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO3AukK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524C10FF3F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710466528; x=1742002528;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1Ryq656JRX3hh0K8IZIU1bxJWyYoEXbPJxXiRGmsEZk=;
 b=SO3AukK2O9AMdSoCxyQz4/8RK2L3aiMwJD/gknom8bKK/00iiIY+Mi2X
 B3010WtE++gK3AwH7+19gxjNIBB0vjHQipz28WmioZnYPa6CpBfymeqEr
 3T3pFLc0/GI36l9HbIR2ZixVuVhBVXUW/orAL9bK8RCsBBFL3MiTj29Vr
 boYG+cdajIw/AZPtPSsR3FPBJckUYPSezuF7PKA7HLAMvCdL0EEtiFROL
 CnKWywGvvG1CudWpOcgC/LGOjTyIEidSHBVWNO8tmF134OgPrQNpbOJGr
 EjaLBbidjH7RV4LNxuCghpz3rvyjmKSUBXoK56OVex0/b8m7NEYUIgDlv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15963135"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15963135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43397270"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/17] drm/xe/oa/uapi: OA buffer mmap
Date: Thu, 14 Mar 2024 18:35:14 -0700
Message-ID: <20240315013518.2848986-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
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

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b8d880797c16..f59d08894cd3 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -791,6 +791,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
+	/* mmap implementation requires OA buffer to be in system memory */
+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
 	return 0;
 }
@@ -1085,6 +1087,49 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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
@@ -1092,6 +1137,7 @@ static const struct file_operations xe_oa_fops = {
 	.poll		= xe_oa_poll,
 	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
+	.mmap		= xe_oa_mmap,
 };
 
 static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
-- 
2.41.0

