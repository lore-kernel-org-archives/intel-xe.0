Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1026C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 03:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8922D10ED89;
	Fri, 22 Mar 2024 03:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzFeVP8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4CB10ED89
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711078979; x=1742614979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nyyZeaNgbmIEevFgpzQe9GOEFHV56Ay+v9TsDym8Viw=;
 b=TzFeVP8cMF47HC+mCvXsVZJ90CLWD8FD7CACUMl3RFj45s/HLbBQpfRN
 r50LIe36krugQU4oFUL3ch6NINuavxbS1J8NEzMPmEemqeA9QPwc2ITxo
 x4E+TZkSk+aM2nGVgr/gN3Mk8+5aU+RvMLMXiWmQqHWTCT+CWSxqmre5A
 oTtgkKW7BevzNNKKv9lavz9sLhPiOePOI+Tltc3AnroS2i/gpWt+KNsqF
 aJNNQQlTx615nPmTUs4dyyGZ9aLYXsCxi4HzDzqMC9jJTCYixZ2kt0Ala
 eL4oSbYZF6OoocId+/h27dWa8XIRpawBhHYlv11rWgO/t6mm04Q5wAmw6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5966231"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="5966231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="19317556"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:42:59 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/3] drm/xe: Introduce a helper to free sg table
Date: Thu, 21 Mar 2024 23:55:19 -0400
Message-Id: <20240322035520.2382600-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240322035520.2382600-1-oak.zeng@intel.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
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

