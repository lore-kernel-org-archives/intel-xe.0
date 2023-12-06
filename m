Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C55C10F05
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 13:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B1710E10B;
	Wed,  6 Dec 2023 13:25:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D79A10E704
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701869143; x=1733405143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UyHQFo2mk4KxFU4IrzZ1n6D+aiwGb+VHJ/PVRDFwuSk=;
 b=lSd3TnjrJUJCWTxfIFbBT/6kJyf6sGO+w5oKUY3etcOp5Gwao7F5cLvu
 5nLR9bbGQJvOUqoM2mZNYbSLxkzouNlllbOGPQFL7OTwxrD/SL1m2QBAb
 cGxuRHnvZ1zDCNmQwbkWZ4S6tHF2Hv+eYBPlZ3xaUzJRLPwpc55hquXq5
 S+i0sWl1/RCUF4iXZqNRuormi8/gRM9B2Sfxas4ZNqoHOzWG0olCR7bzt
 WYpAGDdvjHwMxsXb6chC63Kbr9D9+cPPaO2aLOxi3RANeCXqf0WwhSG7d
 vmg21lqF7JPW+WslxT87mGSYMZbZ6L261N2CaaALDXO54AQgWF6Eb3iy3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12773273"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="12773273"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771303840"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="771303840"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:25:41 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 19:04:20 +0530
Message-Id: <20231206133421.3295163-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206133421.3295163-1-badal.nilawar@intel.com>
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/dgfx: Block rpm for active mmap
 mappings
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
Cc: matthew.auld@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Block rpm for discrete cards when mmap mappings are active.
Ideally rpm wake ref should be taken in vm_open call and put in vm_close
call but it is seen that vm_open doesn't get called for xe_gem_vm_ops.
Therefore rpm wake ref is being get in xe_drm_gem_ttm_mmap and put
in vm_close.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 72dc4a4eed4e..5741948a2a51 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -15,6 +15,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 
+#include "i915_drv.h"
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -1158,17 +1159,47 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static void xe_ttm_bo_vm_close(struct vm_area_struct *vma)
+{
+	struct ttm_buffer_object *tbo = vma->vm_private_data;
+	struct drm_device *ddev = tbo->base.dev;
+	struct xe_device *xe = to_xe_device(ddev);
+
+	ttm_bo_vm_close(vma);
+
+	if (tbo->resource->bus.is_iomem)
+		xe_device_mem_access_put(xe);
+}
+
 static const struct vm_operations_struct xe_gem_vm_ops = {
 	.fault = xe_gem_fault,
 	.open = ttm_bo_vm_open,
-	.close = ttm_bo_vm_close,
+	.close = xe_ttm_bo_vm_close,
 	.access = ttm_bo_vm_access
 };
 
+int xe_drm_gem_ttm_mmap(struct drm_gem_object *gem,
+			struct vm_area_struct *vma)
+{
+	struct ttm_buffer_object *tbo = drm_gem_ttm_of_gem(gem);
+	struct drm_device *ddev = tbo->base.dev;
+	struct xe_device *xe = to_xe_device(ddev);
+	int ret;
+
+	ret = drm_gem_ttm_mmap(gem, vma);
+	if (ret < 0)
+		return ret;
+
+	if (tbo->resource->bus.is_iomem)
+		xe_device_mem_access_get(xe);
+
+	return 0;
+}
+
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
 	.close = xe_gem_object_close,
-	.mmap = drm_gem_ttm_mmap,
+	.mmap = xe_drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
 };
-- 
2.25.1

