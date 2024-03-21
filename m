Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C8C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 02:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BED10E53E;
	Thu, 21 Mar 2024 02:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfYtYP0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4010E58C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710987442; x=1742523442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nyyZeaNgbmIEevFgpzQe9GOEFHV56Ay+v9TsDym8Viw=;
 b=cfYtYP0fFAqz7n+ZKOZ2q5Ir6zOEY17CmVoFAO7ZcAaP02gdlBO6qSU8
 6If5gh7/jRrOmMkGpRrjwhFG3orXO5CkpgYQjlAcQHlHwOi7F1h+hEctm
 fvqeRfWRStamQbSuYXJyMkWLV9pGlcSmQ8c9tDE7ghM+1AjE6vdwLSTI2
 XUPmuDrk24XVKygIrYIIFRLpZKbrInTGJp2ASxI+30v0fjSWvv9BvlcNq
 pu/yZSL7R2JgelQfBHHAhxgl/CVIAu6qvNgKWVTkQFPbBR3CQ2KrCJzWa
 BhP2Mv90yHoYbNK4sZ8hVSpAS8x1W5P7oyIKmCetrbwgqIjmm1ELf4VaB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28425117"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="28425117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 19:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14338474"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 19:17:20 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 2/4] drm/xe: Introduce a helper to free sg table
Date: Wed, 20 Mar 2024 22:29:37 -0400
Message-Id: <20240321022939.2279979-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240321022939.2279979-1-oak.zeng@intel.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce xe_userptr_free_sg helper to dma-unmap all
addresses in userptr's sg table and free sg table.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Suggested by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 4011207630a5..427c6bc49949 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/scatterlist.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dma-mapping.h>
 #include <linux/memremap.h>
@@ -107,6 +108,32 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
 	return ret;
 }
 
+/**
+ * xe_userptr_free_sg() - Free the scatter gather table of userptr
+ *
+ * @uvma: the userptr vma which hold the scatter gather table
+ *
+ * With function xe_userptr_populate_range, we allocate storage of
+ * the userptr sg table. This is a helper function to free this
+ * sg table, and dma unmap the address in the table.
+ */
+void xe_userptr_free_sg(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	bool write = !xe_vma_read_only(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+	struct device *dev = xe->drm.dev;
+
+	xe_assert(xe, userptr->sg);
+	dma_unmap_sgtable(dev, userptr->sg,
+			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
+
+	sg_free_table(userptr->sg);
+	userptr->sg = NULL;
+}
+
 /**
  * xe_userptr_populate_range() - Populate physical pages of a virtual
  * address range
@@ -156,6 +183,9 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
 	if (notifier_seq == userptr->notifier_seq)
 		return 0;
 
+	if (userptr->sg)
+		xe_userptr_free_sg(uvma);
+
 	npages = xe_npages_in_range(start, end);
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
 	if (unlikely(!pfns))
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
index 91686a751711..7bb49bbde5a4 100644
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -15,3 +15,4 @@ static inline int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
 	return -ENODEV;
 }
 #endif
+void xe_userptr_free_sg(struct xe_userptr_vma *uvma);
-- 
2.26.3

