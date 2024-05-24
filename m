Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB76C27C42
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 19:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5C10F647;
	Fri, 24 May 2024 19:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALVe8AfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4C710F647
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 19:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716577301; x=1748113301;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LLgickb3GzHaqIMDh0mX3W3ME1UFEoKoC4fpFN9tCMY=;
 b=ALVe8AfUv0AwdkfXWEHHNJT7S8nyqzzcCtbhL4MWLXUdy/sBxi27U4vL
 5oORPDZF3aBSFNkbnbMD2hZmH3eCkfMBuHhsWq0ynN+7yAHPh6d1m7zne
 WBIvLXX2b1ozTMbb7JDbTkYItXvjB9JVxLh7NmQZ2wbML2/TYSt3sUKTT
 PTa9Yo7Sx/4Kypuy0KceI6//2kd7jEYsbrxNVwZJJ7iNdjV3bOkh5SDEf
 Yj0suWJ76dOBeF7T7X5JhrOZlLUyk9Pws1Rmva0O88AiIoPPsJLq+3lsv
 3E5VbPiaE7SxZDPoIdXNTWKPL1OWGxmBrd7Ca9XAchZF8p5olYoK1Pxle w==;
X-CSE-ConnectionGUID: J++SmG1BR+y+3/RDPDvY6w==
X-CSE-MsgGUID: 6kE64wfWRNCvzmvfIR+n8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13090721"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="13090721"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:01:40 -0700
X-CSE-ConnectionGUID: YDyJ+4RUSIC21oKv27Brcg==
X-CSE-MsgGUID: XACc4gL5Spq2M/ShHmxL7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38694595"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:01:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/17] drm/xe/oa/uapi: OA buffer mmap
Date: Fri, 24 May 2024 12:01:30 -0700
Message-ID: <20240524190134.134226-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524190134.134226-1-ashutosh.dixit@intel.com>
References: <20240524190134.134226-1-ashutosh.dixit@intel.com>
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
index 252088e18fb3..aa93a8bfdf11 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -822,6 +822,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
+	/* mmap implementation requires OA buffer to be in system memory */
+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
 	return 0;
 }
@@ -1123,6 +1125,49 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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
@@ -1130,6 +1175,7 @@ static const struct file_operations xe_oa_fops = {
 	.poll		= xe_oa_poll,
 	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
+	.mmap		= xe_oa_mmap,
 };
 
 static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
-- 
2.41.0

