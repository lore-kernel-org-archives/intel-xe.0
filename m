Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C77FC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 18:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB93A10FED7;
	Wed, 20 Mar 2024 18:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtHZAJBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B110FEDC
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710960008; x=1742496008;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GcXNbsBvYK3p7nYSTxcc9hgCXy3FNh6SRBtcW03yMp8=;
 b=BtHZAJBmQqb1ZtzQhRGNg6oIvh4yIiXdxZiNxfhapAK9h5OTDrLLTuDr
 BKqovb48q4fOh5Bn0+0QWpELUDw7DNTDB+JsGovVVLXdNsecgCCEMudGw
 /Rx3fAsjDXw4J/Khd1wGhGOo7tebpwNx1JML0HAXQTNgW6rPEdOY+TWoT
 ZpBuP3rn/uyh/rbSVsw2pmkTP5kkUNPwlGWlatP0TINwmSMblDvR+M06Y
 WKgmYcFw5x7vduHa3MvNixcuSOI141KH68uwEjQ0S7s/kez4b89LOSCx8
 Wvzpdg+okwd8X9KHA9OFCBFJgk7zsOHO1X8R2X9VFyDh2LEuZtpMJasuG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28382687"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="28382687"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14262466"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:33:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI  7/8] drm/xe: Introduce a helper to free sg table
Date: Wed, 20 Mar 2024 14:45:41 -0400
Message-Id: <20240320184542.2239076-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320184542.2239076-1-oak.zeng@intel.com>
References: <20240320184542.2239076-1-oak.zeng@intel.com>
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
index e5719cab0c3d..5c0c3d277096 100644
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
@@ -157,6 +184,9 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
 	if (notifier_seq == userptr->notifier_seq)
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

