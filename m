Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896DCCD11C2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 15:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42D810EC00;
	Thu, 21 Mar 2024 15:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzG/12eg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA710EBE9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711034264; x=1742570264;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nyyZeaNgbmIEevFgpzQe9GOEFHV56Ay+v9TsDym8Viw=;
 b=DzG/12eg0YNiENkpxBfwnx4/Y+eh8lYYBdr4j4RxblYEFQWleutlUtF6
 +aaOejty+LrVPWBh80FzXzGTXDRdes/4X/sqUrTdRe0q22evMCAITbkQh
 rGKIETZkK55kFARDzXgDFACU8CpxP+EKY4VtqPrG2hgz9fV0F34/PkfSL
 4TgVL7OQkWfu6pVMwKw9wxQeZcxzwZwD66KDNS9bKHG/ysVOKkMN0hRDR
 9mTueGeKgjHzsAkwbH6McwSlRaKe5F8ZV/sOGrcHbr7pxq0IJGReloCHP
 DOtE4qFHOEC84l5oq+CYCPaqBqFGBZE5J+v7sDd81YmbeoMMm2fxN0xzR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5862373"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5862373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19013167"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:17:41 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI  2/3] drm/xe: Introduce a helper to free sg table
Date: Thu, 21 Mar 2024 11:30:01 -0400
Message-Id: <20240321153002.2281670-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240321153002.2281670-1-oak.zeng@intel.com>
References: <20240321153002.2281670-1-oak.zeng@intel.com>
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

