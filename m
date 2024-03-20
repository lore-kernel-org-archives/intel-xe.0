Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F6EC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8D10E4B1;
	Wed, 20 Mar 2024 03:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9np9Y9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BFF10E4B2
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710904361; x=1742440361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4E4oIDJdfwA0J7BT0iedgyky2D/c+Cj4Vuy3MmF5/s=;
 b=W9np9Y9ruHxtZUyyRmmxst+xwcz+g5Vd6bmjUBZ1XuW1gO7NQ3b6vD4Q
 PPSRCoypxoHUsc+cAYcZhtMM77dxi5l6P6b5slTEQqrsPnxp4tKL06ppz
 e32LyBVnw0q1uH7aobG0UkZqLm6O4cwn5Xza8hImGZ8IchkO24D8H6RdD
 p1nRhnEWd+G56+S4eeRA0qP1lN8khspvs90kGRumebiFv6DcqLUXkRqTP
 c6MAOvEHsaAmz7bVU8X1GKAOtspkGIZWlNTXAoCg5mOXTgH1ANzr8ckae
 JPWbj813IDDigw3Ps2r+70M3brKe10YE+hJwNMcwK+DxpZED7rIk9dPQn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16356330"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="16356330"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18666598"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:12:41 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 7/8] drm/xe: Introduce a helper to free sg table
Date: Tue, 19 Mar 2024 23:24:56 -0400
Message-Id: <20240320032457.1778608-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320032457.1778608-1-oak.zeng@intel.com>
References: <20240320032457.1778608-1-oak.zeng@intel.com>
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
index 829fdfe12d96..65739b3bef64 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/scatterlist.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dma-mapping.h>
 #include <linux/memremap.h>
@@ -108,6 +109,32 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
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
@@ -152,6 +179,9 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
 
+	if (userptr->sg)
+		xe_userptr_free_sg(uvma);
+
 	npages = xe_npages_in_range(start, end);
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
 	if (unlikely(!pfns))
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
index fa5ddc11f10b..037ed3bf76da 100644
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -8,3 +8,4 @@
 struct xe_userptr_vma;
 
 int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
+void xe_userptr_free_sg(struct xe_userptr_vma *uvma);
-- 
2.26.3

