Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3566C10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAB910E9E5;
	Fri,  8 Dec 2023 06:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2279D10E9D7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017817; x=1733553817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wH81Si9qkfo3Txrn0lNBFhTqaXc4bZJim34sGK5At6o=;
 b=hIndbTF6xfjZKIEkuS5jL3Zibyp8+2TrHOmu61yqMh9PRkQlj6brxiOz
 yYemkZVBv3Jwq827R/9IFCR7M1eA0KQARCpDYX1spjq7TfiYzmvJlQ2hn
 ySdFxBdMXjfrFrSOvNL8DRF0kulgQ0SQW3cgHfj6k4qes6Mh6SjjIpTD0
 RQfNSjnnxZ7ROX3bdIyzannogc9v1h5DHFhaHUIrwaiFfZTYqKfHL8A9k
 zNARNQigbNw7upGnZP+3JT4gqcsrl0x40f8Mq8EfxZU43jATf0xbYujX9
 Qgmib9WVTSEvz0DPQwDPd/xuQsx+Vpo8Fb5ebh2JeNaM18vHuaFNqBLv8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866616"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866616"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699266"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699266"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:36 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 15/17] drm/xe/oa/uapi: OA buffer mmap
Date: Thu,  7 Dec 2023 22:43:27 -0800
Message-ID: <20231208064329.2387604-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 42f32d4359f2c..97779cbb83ee8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -898,6 +898,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
+	/* mmap implementation requires OA buffer to be in system memory */
+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
 	return 0;
 }
@@ -1174,6 +1176,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
+	/* Zap mmap's */
+	unmap_mapping_range(file->f_mapping, 0, -1, 1);
+
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
@@ -1184,6 +1189,53 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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
+	/* Only support VM_READ, enforce MAP_PRIVATE by checking for VM_MAYSHARE */
+	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
+		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
+		return -EINVAL;
+	}
+
+	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
+
+	/*
+	 * If the privileged parent forks and child drops root privilege, we do not want
+	 * the child to retain access to the mapped OA buffer. Explicitly set VM_DONTCOPY
+	 * to avoid such cases.
+	 */
+	vm_flags_set(vma, vma->vm_flags | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY);
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
@@ -1191,6 +1243,7 @@ static const struct file_operations xe_oa_fops = {
 	.poll		= xe_oa_poll,
 	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
+	.mmap		= xe_oa_mmap,
 };
 
 static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
-- 
2.41.0

