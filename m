Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCE6CD5BD0
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 12:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CFB10E31F;
	Mon, 25 May 2026 12:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbpoQvF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8699E10E31B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779713904; x=1811249904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPULLc1pknRgHDe1HRB9YajYbzcWou7MrACk0r+mLPk=;
 b=DbpoQvF+D54F3jb4pguvZ7V5A3Yqy9klhVQSvK/eKm1XgRxUxeeAzXRp
 B++u23SZSMX3rvqfkM+bP18/+kldZsez/s4J93+qQIH+O2T5RNY4deV1D
 acE8FpvV4Fmil1vGPjYSJG21VdSCromoX/HtQ1KNYkEZ/V4r75OiFhY8A
 4z82LtleaT1U3QS4DLPbe1MOjYgnvWhuLt8uUc7Z/+SXLeqBqA0vtFeFP
 5jnCSZpB0Tb6w7b3CQleZtuLqAF2l1T1XEJBD2hHel7rp41LCO3tUqHuA
 C/gBwjONEVjfCmC3X7mG+qD3GSIWggvRdTPCrgjifEvsPkYN241Xb9g+7 Q==;
X-CSE-ConnectionGUID: h9UTOq6VSdO5T8V1C3G4vw==
X-CSE-MsgGUID: EiG/zVcPTb+AAnuHhoG9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91223154"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91223154"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:24 -0700
X-CSE-ConnectionGUID: Hfgqb03ZRLewzBUlfnyypw==
X-CSE-MsgGUID: Tfj8ocXhRGm0Ck0mO2P1eg==
X-ExtLoop1: 1
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:23 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH 4/4] drm/xe/mmio_gem: fix destroy flow
Date: Mon, 25 May 2026 15:58:06 +0300
Message-ID: <20260525125801.975038-10-ilia.levi@intel.com>
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

xe_mmio_gem_destroy() currently frees the GEM object directly, bypassing
reference counting.  Since existing VMAs hold a reference and the fault
handler accesses the object through vma->vm_private_data, this is
use-after-free.  Additionally, nothing prevents the fault handler from
installing PTEs to the real MMIO after destroy.

Use SRCU to ensure the fault handler sees the 'destroyed' flag
(mirroring the drm_dev_enter/exit pattern for hot-unplug), then zap
existing PTEs to prevent continued access to the real MMIO. Use
drm_gem_object_put() to respect the reference count.

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index cd3e7e3ca898..b488e99a97a0 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -5,11 +5,15 @@
 
 #include "xe_mmio_gem.h"
 
+#include <linux/srcu.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 
 #include "xe_device_types.h"
 
+DEFINE_STATIC_SRCU(xe_mmio_gem_srcu);
+
 /**
  * DOC: Exposing MMIO regions to userspace
  *
@@ -39,6 +43,7 @@ struct xe_mmio_gem {
 	unsigned long pgoff;
 	struct mutex dummy_page_lock; /* protects dummy page allocation */
 	struct page *dummy_page;
+	bool destroyed;
 };
 
 static const struct vm_operations_struct vm_ops = {
@@ -145,8 +150,23 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
  */
 void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file)
 {
+	struct drm_gem_object *base = &gem->base;
+	struct drm_device *dev = base->dev;
+
 	drm_vma_node_revoke(&gem->base.vma_node, file);
-	xe_mmio_gem_free(&gem->base);
+
+	gem->destroyed = true;
+	synchronize_srcu(&xe_mmio_gem_srcu);
+
+	/*
+	 * At this point every subsequent fault handler will see that the
+	 * objecthas been destroyed and provide the dummy page.
+	 * Now just zap existing PTEs to prevent continued access to the real
+	 * MMIO.
+	 */
+	drm_vma_node_unmap(&base->vma_node, dev->anon_inode->i_mapping);
+
+	drm_gem_object_put(base);
 }
 
 static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
@@ -204,6 +224,11 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 	unsigned long pgoff;
 	int idx;
 
+	guard(srcu)(&xe_mmio_gem_srcu);
+
+	if (obj->destroyed)
+		return xe_mmio_gem_vm_fault_dummy_page(vma);
+
 	if (!drm_dev_enter(dev, &idx)) {
 		/*
 		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
-- 
2.43.0

