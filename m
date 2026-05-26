Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC4DCD5BD2
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA01510E4D3;
	Tue, 26 May 2026 12:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="An8z7S9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA1310E4D2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779799911; x=1811335911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSDG/AeqADF5xDoidU5BJtXLgeEOMmzWXQaHqWX4sNE=;
 b=An8z7S9WD3iJsVtO6xgIgvI9uTD0J95yljUR5HHiAEk6+mJ1iLKG6YKm
 HAWapVDZ1v6eyg9sZ04xRLjHCGu1mGKYOyO6ZxtZrhPJsnl9ifq14xo7c
 hgTPkZIXqUeo4ZAZgukJdqR1l2rgPV9zUBJbG24v+4zsL5MHXdw1EMhXV
 xxaUqQeVNYm4qIcqYSg8vZFHUiy51kWUk0vR3aa6OPj4nE/2crvIb/6x4
 U+slHO1X81B9scDuLcWXbuJdU50pO2V9eXjWtnAEo819GBjM8EOnBBc4P
 dunGhhWo47w2pHDiZ3QOIQavwdS601+7Fakm0pVh1cGdL/oHlWZNltIOQ w==;
X-CSE-ConnectionGUID: CFFgsrmMT26Ath7uLvKDDw==
X-CSE-MsgGUID: uCpHWF8kToGFqQMxN5xwDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92082770"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92082770"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:32 -0700
X-CSE-ConnectionGUID: sftV84VJS9SEcmhQEIO6rA==
X-CSE-MsgGUID: teR/P9NOQ+aDcYzpHW2AXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235554645"
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:30 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v2 5/5] drm/xe/mmio_gem: fix destroy flow
Date: Tue, 26 May 2026 15:51:12 +0300
Message-ID: <20260526125106.2806522-12-ilia.levi@intel.com>
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
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 2f2ebc4fd901..b91704c51a93 100644
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
+	 * object has been destroyed and provide the dummy page.
+	 * Now just zap existing PTEs to prevent continued access to the real
+	 * MMIO.
+	 */
+	drm_vma_node_unmap(&base->vma_node, dev->anon_inode->i_mapping);
+
+	drm_gem_object_put(base);
 }
 
 static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
@@ -196,6 +216,11 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 	unsigned long pgoff;
 	int idx;
 
+	guard(srcu)(&xe_mmio_gem_srcu);
+
+	if (obj->destroyed)
+		return xe_mmio_gem_vm_fault_dummy_page(vmf);
+
 	if (!drm_dev_enter(dev, &idx)) {
 		/*
 		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
-- 
2.43.0

