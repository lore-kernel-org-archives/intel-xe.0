Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACF5D2ECF9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 06:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4BA10E4C4;
	Tue, 20 Jan 2026 06:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAlXhHCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6501710E4C9
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 06:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768889368; x=1800425368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kejxuc3+dRsAmVeo2rt8+vHHs69j8FE3wpYocnO7tec=;
 b=hAlXhHCYzJEjNeEBpeR3T+U1ZieX05kOCfJ0af1/0HF7gHqyZLVcXb5h
 68yP7jd8lwJuR6+PTkOx2nnSRNmrr/drU76+XhJKHgjYFhhPKl37Cd9xL
 N/pDeqreSS0qy6btzTtJoA1EdlmBPwgFzug75PtpMBZzg7gT8o7w1dvqW
 IbiJ4h54+/DsuFbyUDZJFPQZM33VGEXgyK7JcX8/JX3cRa43Vgkga/g2G
 rvHxu1Yqh61fvNQIWSrkTD1qO2WP4EzTpAJ8ZK/iJqNwkzfNsytloDrJU
 0MAToba3M9Y+K83xt+wZOxvvtsPtPHe7FSNkT3fYakbPSCYOxspgEuHBF g==;
X-CSE-ConnectionGUID: KIrGT5NlRuGJB+G5JmnY9Q==
X-CSE-MsgGUID: dX5MnHzNTs+reNlIuZf/Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72677008"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="72677008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:28 -0800
X-CSE-ConnectionGUID: 3eYaZxCcRj2cPetFTfuY1w==
X-CSE-MsgGUID: hODQUBIPSfqBSW6CB3mbzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205658616"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:27 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v4 7/8] drm/xe/madvise: Block imported and exported dma-bufs
Date: Tue, 20 Jan 2026 11:38:53 +0530
Message-ID: <20260120060900.3137984-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120060900.3137984-1-arvind.yadav@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Prevent marking imported or exported dma-bufs as purgeable.
External devices may be accessing these buffers without our
knowledge, making purging unsafe.

Check drm_gem_is_imported() for buffers created by other
drivers and obj->dma_buf for buffers exported to other
drivers. Silently skip these BOs during madvise processing.

This follows drm_gem_shmem's purgeable implementation and
prevents data corruption from purging actively-used shared
buffers.

v3:
   - Addresses review feedback from Matt Roper about handling
     imported/exported BOs correctly in the purgeable BO
     implementation.

v4:
   - Check should be add to xe_vm_madvise_purgeable_bo.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 27b6ad65b314..5808fef89777 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -180,6 +180,31 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/**
+ * xe_bo_is_external_dmabuf() - Check if BO is imported or exported dma-buf
+ * @bo: Buffer object
+ *
+ * Prevent marking imported or exported dma-bufs as purgeable.
+ * External devices may be accessing these buffers without our
+ * knowledge, making purging unsafe.
+ *
+ * Return: true if BO is imported or exported, false otherwise
+ */
+static bool xe_bo_is_external_dmabuf(struct xe_bo *bo)
+{
+	struct drm_gem_object *obj = &bo->ttm.base;
+
+	/* Imported from another driver */
+	if (drm_gem_is_imported(obj))
+		return true;
+
+	/* Exported to another driver */
+	if (obj->dma_buf)
+		return true;
+
+	return false;
+}
+
 /**
  * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked DONTNEED
  * @bo: Buffer object
@@ -200,6 +225,10 @@ static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
 
 	dma_resv_assert_held(bo->ttm.base.resv);
 
+	/* External dma-bufs cannot be purgeable */
+	if (xe_bo_is_external_dmabuf(bo))
+		return false;
+
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
 		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
 			struct xe_vma *vma = gpuva_to_vma(gpuva);
@@ -277,6 +306,10 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
 		/* BO must be locked before modifying madv state */
 		xe_bo_assert_held(bo);
 
+		/* Skip external dma-bufs */
+		if (xe_bo_is_external_dmabuf(bo))
+			continue;
+
 		/*
 		 * Once purged, always purged. Cannot transition back to WILLNEED.
 		 * This matches i915 semantics where purged BOs are permanently invalid.
-- 
2.43.0

