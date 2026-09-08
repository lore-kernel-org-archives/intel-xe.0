Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96584C79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 16:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC3210ED2C;
	Tue,  8 Sep 2026 16:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwJyWLzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14BF10ED0F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788886276; x=1820422276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCYSR84/iwOE1DvspWaKdF1gYHL8e4uVRAl4vMRdwcg=;
 b=QwJyWLzxhA7Nst95YcSJdgwF8tNP7JNp6KSO9n3S08vS+wRgOK+Tz+qY
 wa8NO9G2vrtGfjCy8nAhwgOO5OcyQ92V3y6hVIxYHSmi9HcbqESNm4Dd4
 +6ImvdKlWCwvLROTX7qfBWfz90/UnESLHYUw0C3/zAngLuR/IW2w/v5Kf
 lVzsc0BB2IYWV/ZpQPVDG7eZ1Q9x3U2YuX74ywG+4Np4toQnV9GKYW7id
 XoRCoG5Wru/ENKkOh9WsQrI5yoVvJAxS0FjU3OOmw/l/+5AMbpUtejr0Q
 oWiC4yPAyI67j2tA5jTWcEpYGVCXSYSiEkvSm3JaeVXm13DldKHl82Hp9 w==;
X-CSE-ConnectionGUID: KqmZ7iaZQoKJwF7De56VMQ==
X-CSE-MsgGUID: 6U0un76OQfmwESyc3zYF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99888275"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="99888275"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:16 -0700
X-CSE-ConnectionGUID: bbm7u5IaTT2WexZDPa6MaQ==
X-CSE-MsgGUID: Hgf1kP0vT5qNxceJcfdZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="272995695"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v5 5/8] drm/xe/mmio_gem: cache the dummy page per object
Date: Tue,  8 Sep 2026 17:50:52 +0100
Message-ID: <20260908165046.1393557-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908165046.1393557-10-matthew.auld@intel.com>
References: <20260908165046.1393557-10-matthew.auld@intel.com>
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

From: Ilia Levi <ilia.levi@intel.com>

Currently, when the fault handler provides a dummy page, it
allocates a new one on every invocation and ties its lifetime to
the drm_device via drmm_add_action_or_reset(). Concurrent faults
after hot-unplug therefore accumulate pages that persist until
device teardown.

Cache a single dummy page in the xe_mmio_gem object and use dma_resv
lock to protect its allocation. Free it with the object.

v2: use dma_resv lock to protect the allocation (Matt Auld)

Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 3c42d8358c7d..970b1e2f4981 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -5,9 +5,9 @@
 
 #include "xe_mmio_gem.h"
 
+#include <linux/dma-resv.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_managed.h>
 
 #include "xe_device_types.h"
 
@@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
 struct xe_mmio_gem {
 	struct drm_gem_object base;
 	phys_addr_t phys_addr;
+	struct page *dummy_page; /* protected by the GEM's dma_resv */
 };
 
 static int xe_mmio_gem_vm_may_split(struct vm_area_struct *area, unsigned long addr)
@@ -131,6 +132,8 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
 {
 	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 
+	if (obj->dummy_page)
+		__free_page(obj->dummy_page);
 	drm_gem_object_release(base);
 	kfree(obj);
 }
@@ -169,27 +172,29 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
 	return 0;
 }
 
-static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
+static int alloc_dummy_page_if_needed(struct drm_gem_object *base)
 {
-	__free_page((struct page *)res);
+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
+
+	dma_resv_lock(base->resv, NULL);
+	if (!obj->dummy_page)
+		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	dma_resv_unlock(base->resv);
+
+	return obj->dummy_page ? 0 : -ENOMEM;
 }
 
 static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *base = vma->vm_private_data;
-	struct drm_device *dev = base->dev;
-	struct page *page;
+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 	unsigned long pfn;
 
-	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	if (alloc_dummy_page_if_needed(base))
 		return VM_FAULT_OOM;
 
-	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
-		return VM_FAULT_OOM;
-
-	pfn = page_to_pfn(page);
+	pfn = page_to_pfn(obj->dummy_page);
 
 	return vmf_insert_pfn_prot(vma, vmf->address, pfn,
 				   vm_get_page_prot(vma->vm_flags));
-- 
2.55.0

