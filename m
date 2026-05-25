Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B6DCD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 12:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39CE10E31B;
	Mon, 25 May 2026 12:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIOeIUyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EC110E319
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779713903; x=1811249903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysEaMSNH5ItZxcxa5M+g3J8KpW3OBroS/fk7ToLj2wg=;
 b=VIOeIUyViHXB3lNoiY14VJvT5+VWNLUPeFeXrzrTh5fPF6G9j6f/f5/z
 pKNDT9MX8RhcOJ+JkDzFDvO/CMX9geNHTfEpUUBNQxPX7cYB4oFBHmC0J
 Zv9MR2LUb6S9bKGH0SS/v4vgPycH7WRdhIPgXbyTy/GtMkuEXNr9eQqgN
 ANtBy9QbYjZvQ6hAkpjZinNFQbX4hilqMaSghhHgjad2UlrjThSXmRMaq
 KMMK/ge9LB6RDg/CYS8Mbyg5C5d7uXt+uM8KOJsEAwGK+ylK6AtMpf/dp
 sG8zHhuxDbUrpj3ccaE+xWyema9a95x3C4uEsleJgx5uhEIUKJfpaCfLP Q==;
X-CSE-ConnectionGUID: 8mhpmV83RRms/zqi/wuvVQ==
X-CSE-MsgGUID: ByQCSGtZRXO1wIofcgI/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91223153"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91223153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:22 -0700
X-CSE-ConnectionGUID: xM14GapdQCSP2+tCENUeIA==
X-CSE-MsgGUID: rulf0qbWRb6H/PCiBL/Rtg==
X-ExtLoop1: 1
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:21 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH 3/4] drm/xe/mmio_gem: cache the dummy page per object
Date: Mon, 25 May 2026 15:58:05 +0300
Message-ID: <20260525125801.975038-9-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525125801.975038-6-ilia.levi@intel.com>
References: <20260525125801.975038-6-ilia.levi@intel.com>
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

Cache a single dummy page in the xe_mmio_gem object; a mutex
serializes its allocation. Free it with the object.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 07ae21dc6211..cd3e7e3ca898 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -7,7 +7,6 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_managed.h>
 
 #include "xe_device_types.h"
 
@@ -38,6 +37,8 @@ struct xe_mmio_gem {
 	struct drm_gem_object base;
 	phys_addr_t phys_addr;
 	unsigned long pgoff;
+	struct mutex dummy_page_lock; /* protects dummy page allocation */
+	struct page *dummy_page;
 };
 
 static const struct vm_operations_struct vm_ops = {
@@ -86,6 +87,7 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
 	base = &obj->base;
 	base->funcs = &xe_mmio_gem_funcs;
 	obj->phys_addr = phys_addr;
+	mutex_init(&obj->dummy_page_lock);
 
 	drm_gem_private_object_init(&xe->drm, base, size);
 
@@ -124,6 +126,9 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
 {
 	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 
+	if (obj->dummy_page)
+		__free_page(obj->dummy_page);
+	mutex_destroy(&obj->dummy_page_lock);
 	drm_gem_object_release(base);
 	kfree(obj);
 }
@@ -160,27 +165,23 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
 	return 0;
 }
 
-static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
-{
-	__free_page((struct page *)res);
-}
-
 static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *base = vma->vm_private_data;
-	struct drm_device *dev = base->dev;
+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 	vm_fault_t ret = VM_FAULT_NOPAGE;
 	unsigned long addr, pfn;
-	struct page *page;
 
-	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
-		return VM_FAULT_OOM;
+	scoped_guard(mutex, &obj->dummy_page_lock) {
+		if (obj->dummy_page)
+			break;
 
-	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
-		return VM_FAULT_OOM;
+		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!obj->dummy_page)
+			return VM_FAULT_OOM;
+	}
 
-	pfn = page_to_pfn(page);
+	pfn = page_to_pfn(obj->dummy_page);
 
 	/* Map the entire VMA to the same dummy page */
 	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
-- 
2.43.0

