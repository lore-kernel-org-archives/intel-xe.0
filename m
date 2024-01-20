Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320DC47DDE
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2209810EAF3;
	Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95B210EAD7
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5t3tBseC9EwumudvljU1nCIB5JAENIXQXocjaYAHrp0=;
 b=Kc0t4SlyYX6T0IeFEkJE/lblL9U2pzOnxjBAs9Nzahe5v9Hui/17jQol
 DPAsHM0X+t/Lh5hRkbYVGYk9f16AEwf7A+BUrfs5PB5RK4BOCcVc3SlsU
 ZGHGNM0Cl19E81mSiBf/kQzn5iAOEPrVvT25BIeSLM4ed1R4pqhChNE0J
 1ECcmooo8s4rKFqhrpIVP1Z//vPIvufI6uRxEr6qGIMCUuTvRIe0qiU1f
 4aiB4zZMo3cwk+cpXKtLKUMg4WymRMAtA3OehPGgbeEolvfkBZ9tX1rYH
 cWXS0Km2n6tCfMp6UWVH4XJbFsXWnXpOq4I+VUTDyUjnGwQ7iL2RofKO2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472949"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472949"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125730"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125730"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/16] drm/xe/oa/uapi: OA buffer mmap
Date: Fri, 19 Jan 2024 18:00:24 -0800
Message-ID: <20240120020026.1261201-15-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eed89649daa08..fd34314563dbf 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -808,6 +808,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
+	/* mmap implementation requires OA buffer to be in system memory */
+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
 	return 0;
 }
@@ -1074,6 +1076,49 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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
@@ -1081,6 +1126,7 @@ static const struct file_operations xe_oa_fops = {
 	.poll		= xe_oa_poll,
 	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
+	.mmap		= xe_oa_mmap,
 };
 
 static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
-- 
2.41.0

