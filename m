Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47160CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0780110E4A8;
	Tue, 26 May 2026 12:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUzJ50Ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C76F10E4D2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779799912; x=1811335912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcVoINcYE0ZL7QUxeKuTpThTFrQdGcfDqqm4ZE5x1HI=;
 b=NUzJ50AgJr9Lx8kAd6Xf9kUPy0HAuFPGDjnjq5YSE9qLXzH4TzW7PZI6
 hMPZoCbpCwDPmfm2qxOKW8wrg/vKz4DDVQlUGpmzLxUztcA3IbRyFgsk8
 CV+8F3pM7lxGXt8NXmwZJ2QxqfGYXcMN5SslkQFb7DTOB4KIOVtwHsy/N
 yXU/dH5rQmJ9GUmCfOTCUpd0h1fIls7DbgN5N15P14qMZmODj/xtaqL+K
 A6MgBPYzb5ruyapP9bwgNk5bQtFvNDRLaOynCkxzRbAz1axtV+yTYTHX9
 V+jVwwkTTJ3Z8cmI/Vc2Sx+q0JRIbP8dQw19/6bwgiBtcuBPD6ilhGm7L w==;
X-CSE-ConnectionGUID: 1oaRvZlbQ2SagUgd57npsA==
X-CSE-MsgGUID: +5Ed2oXDT8aC+xiqNXO6Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92082769"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92082769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:31 -0700
X-CSE-ConnectionGUID: ub26IoR2QhCq4Bv0LC5rSA==
X-CSE-MsgGUID: EybENzCcQaabMrw1zExXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235554615"
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:28 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v2 4/5] drm/xe/mmio_gem: cache the dummy page per object
Date: Tue, 26 May 2026 15:51:11 +0300
Message-ID: <20260526125106.2806522-11-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526125106.2806522-7-ilia.levi@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
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

Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 330ba3552e12..2f2ebc4fd901 100644
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
@@ -160,27 +165,21 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
 	return 0;
 }
 
-static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
-{
-	__free_page((struct page *)res);
-}
-
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
-		return VM_FAULT_OOM;
-
-	pfn = page_to_pfn(page);
+	scoped_guard(mutex, &obj->dummy_page_lock) {
+		if (!obj->dummy_page) {
+			obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			if (!obj->dummy_page)
+				return VM_FAULT_OOM;
+		}
+		pfn = page_to_pfn(obj->dummy_page);
+	}
 
 	return vmf_insert_pfn_prot(vma, vmf->address, pfn,
 				   vm_get_page_prot(vma->vm_flags));
-- 
2.43.0

