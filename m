Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4744BC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EE310E5E5;
	Thu, 23 Jul 2026 16:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuYkXj0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94F10F15B
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823559; x=1816359559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGiRf3y3tuLx9S3w4nxaflOacmxvKVA0be35FJOTJ/0=;
 b=QuYkXj0Bh/eTh7wsiw+snBNmLW5jIDpsWF3hnljX0BPOxkYrTErA+n6G
 VAekBxmicmRtNQtIvLNcOndooyiCMB8peCMCCaGCp2sc0SeUikvqq8HKM
 CS+2pwM337HLdNdvJxcLdvz6CuVjssO1HSuWEQ17UXG0kvtzSc42+hLL/
 his3oHdD0wNmRY7Gm8C9ovfu85VlDtgEmj2hmEzdvJhX7abIGykgBymQE
 pffZj9mbauaQ6f8PzK/cVdwVvIZRmcohaJ+VPCG8wUZH5yInKGX/jUs0Q
 HpDXYw2KsMs3Y6cK8PLWcaM3DdVJKu0ueY3cmaXIJytUuLYH3dtd4DJh4 A==;
X-CSE-ConnectionGUID: N8k3/6yBRmyf/TvpehZSNg==
X-CSE-MsgGUID: DGhdXuMrQhKBh/NiBlILXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88022926"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88022926"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:10 -0700
X-CSE-ConnectionGUID: wTRGxOG5Ru2za+5jKo68RA==
X-CSE-MsgGUID: Cr/hyOZYTsyS5yPDo+nicA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255086068"
Received: from lharel-mobl.ger.corp.intel.com (HELO
 soc-PF64PT41.clients.intel.com) ([10.245.129.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:08 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, meny.yossefi@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 5/7] drm/xe/mmio_gem: cache the dummy page per object
Date: Thu, 23 Jul 2026 19:18:30 +0300
Message-ID: <20260723161832.137153-6-ilia.levi@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260723161832.137153-1-ilia.levi@intel.com>
References: <20260723161832.137153-1-ilia.levi@intel.com>
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
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 2838fcb4ff9f..5bd2759fc876 100644
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
-		return VM_FAULT_OOM;
-
-	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
+	if (alloc_dummy_page_if_needed(base))
 		return VM_FAULT_OOM;
 
-	pfn = page_to_pfn(page);
+	pfn = page_to_pfn(obj->dummy_page);
 
 	return vmf_insert_pfn_prot(vma, vmf->address, pfn,
 				   vm_get_page_prot(vma->vm_flags));
-- 
2.49.1

