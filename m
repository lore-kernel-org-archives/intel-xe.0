Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36210D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 04:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED69610E65C;
	Wed, 10 Dec 2025 04:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q32fsNeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B62610E65C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 04:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765341148; x=1796877148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yG4shqCVLIA0Y7K8LjkaRIBBT+/6lj7eARGCoZ0BjOg=;
 b=Q32fsNeSzcBSARgl5z44DyT6X6FqZ2vtKEuzUtJzXlspIoDJuka92rve
 ic+liZoXeOfPVS/pDvZdg+kjMy1ASmV16MzHJr7oLy2jSqM1QTtQzRkdO
 1UFG6D5gsxwg2YjgdCXI63yeyZHlcvSe7Ee99E3RCwhjoHzyMWNnaN5au
 d8bCAOx3vtWUkleH6iEwOa32I6tY6rzXUokca1ZqSj0j1B2ju6m93CrrM
 zXKKQ0myZPYp6TJ7xGipKjJVQRJ6MSP14CM7WV6vonJnAv8FM45xgEY2n
 oDMkAIOkxFoUCwnALXf/51Mj6xa4PKBm4yoKQ70wWWbA26Qd2ebu0Dnyw g==;
X-CSE-ConnectionGUID: lAm840P9RWa06+H9og0aGg==
X-CSE-MsgGUID: AFBwsAVsTgaIs51poP1WjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78000071"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78000071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:28 -0800
X-CSE-ConnectionGUID: 1iIfwQL1SpuBkhOIlex2LA==
X-CSE-MsgGUID: eBqtOoDlToyn3dwh9sH9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196466733"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:27 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v3 7/8] drm/xe/madvise: Block imported and exported dma-bufs
Date: Wed, 10 Dec 2025 10:00:51 +0530
Message-ID: <20251210043112.3267620-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 9f2d6c1d3062..868be570664d 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -159,6 +159,31 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
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
@@ -179,6 +204,10 @@ static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
 
 	dma_resv_assert_held(bo->ttm.base.resv);
 
+	/* External dma-bufs cannot be purgeable */
+	if (xe_bo_is_external_dmabuf(bo))
+		return false;
+
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
 		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
 			struct xe_vma *vma = gpuva_to_vma(gpuva);
-- 
2.43.0

