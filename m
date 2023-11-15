Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3DCC47074
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9910E4F0;
	Wed, 15 Nov 2023 06:32:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DAC10E4EF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 06:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700029948; x=1731565948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DDSwvP41uVsCnnrWDLmp/2Ekg0FxfQCEAGUKQrurtwQ=;
 b=MIuTg8XN8A4mN2RdP4ww1f+xdybBX3WFvPfv9UimTu2S9eI0pdY/uwDg
 oyqR+Hj1f53fGfty38lPSiisdRaDlLFDNCTBN7COq1md8kvpEM3dEfdq2
 wMyfqmrVI/noDbQYCx8R/4k6ev7h+k2dFqMd6dGZQD+REmT7kOiab2P19
 2s/epIeUxwyNsc0BRQO12pQF1P0pt4RitpiQu71IPzIsVjp5EKj0Z9fyw
 zgQ5gTfAqP4XOC2EibGUW9ZAwgdbf0vXf7eq3Q7rOzTkIgq32XWN/Vu0+
 Aak9JXUndEh/NbweZp1pU1XSjEtgkzHQe9GgCfjT+BZgAfFbHSACy6UA1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390616492"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="390616492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938389722"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="938389722"
Received: from tmagriss-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.218.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:26 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:32:02 +0200
Message-Id: <20231115063210.3112123-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/9] Revert "FIXME: drm/i915/display: Allow
 fbdev to allocate stolen memory"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a3cd4a944a2dcd58a46a7e62d834fbdbbd4e49ed.

This FIXME patch can be now reverted as we are about to introduce
common and xe/i915 implementation without ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 48 ++++++++--------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index b7976706bc68..28b9aa9d52c2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -48,7 +48,6 @@
 #include "gem/i915_gem_mman.h"
 #else
 #include "xe_gt.h"
-#include "xe_ttm_stolen_mgr.h"
 #endif
 
 #include "i915_drv.h"
@@ -193,8 +192,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-	obj = ERR_PTR(-ENODEV);
 #ifdef I915
+	obj = ERR_PTR(-ENODEV);
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
 						  I915_BO_ALLOC_CONTIGUOUS |
@@ -213,23 +212,11 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 			obj = i915_gem_object_create_shmem(dev_priv, size);
 	}
 #else
-	if (!IS_DGFX(dev_priv)) {
-		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
-					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					   XE_BO_CREATE_STOLEN_BIT |
-					   XE_BO_CREATE_PINNED_BIT);
-		if (!IS_ERR(obj))
-			drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
-		else
-			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
-	}
-	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
-					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
-					  XE_BO_CREATE_PINNED_BIT);
-	}
+	/* XXX: Care about stolen? */
+	obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
+				   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
 #endif
 
 	if (IS_ERR(obj)) {
@@ -365,23 +352,24 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	}
 
 #else
-	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
-		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
-			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
-		else
-			info->fix.smem_start =
-				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, XE_PAGE_SIZE);
+	/* XXX: Could be pure fiction.. */
+	if (obj->flags & XE_BO_CREATE_VRAM0_BIT) {
+		struct xe_gt *gt = to_gt(dev_priv);
+		bool lmem;
 
+		info->fix.smem_start =
+			(unsigned long)(gt->mem.vram.io_start + xe_bo_addr(obj, 0, 4096, &lmem));
 		info->fix.smem_len = obj->ttm.base.size;
+
 	} else {
-		/* XXX: Pure fiction, as the BO may not be physically accessible.. */
-		info->fix.smem_start = 0;
+		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+
+		info->fix.smem_start = pci_resource_start(pdev, 2) + xe_bo_ggtt_addr(obj);
 		info->fix.smem_len = obj->ttm.base.size;
 	}
 
-	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
-	vaddr = obj->vmap.vaddr_iomem;
+	/* TODO: ttm_bo_kmap? */
+	vaddr = obj->vmap.vaddr;
 #endif
 	if (IS_ERR(vaddr)) {
 		drm_err(&dev_priv->drm,
-- 
2.34.1

