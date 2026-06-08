Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDAFCD8CAB
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DC410F766;
	Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbbOxuD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FC910F768
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937687; x=1812473687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S9i8VFdaJHwNBvUgYTTNEuFFypRnQ72HRubH9/LHE3k=;
 b=CbbOxuD2ytWwFNxpRYxAR61Whjt++tS7/gcP5d6dWyLazETxBnWEfS1t
 tkZ6SWnTaCyCbOLQ7hxIRt6UtDIGJPB6z8BVVcguDqAm85IBaEm79vLGt
 5tKquqDhelEELXBjbcH2M6bzw+f2uWTwFIljfoZQGflv9iDc+uACwuSJI
 TjAZzQmCnE5vBCNoi+JCf1E48s9g4uXUEuCnOEXnW6rogpamafNLLbPvn
 2gI9AyHcIJ9UdfNfDhm5VxnZC1FXCt0ZZ8dkK+SvIMfSGLA5dF8KSd+jW
 HTughC43J6eIkA2BKENQmunnv2Qn6g4e4I8Fc+GAMAwDnAfX9/3kgpYHt g==;
X-CSE-ConnectionGUID: lmTb906GTwiYCU4lPFqRrA==
X-CSE-MsgGUID: 2FwxHTqjRW2gE8ITT/DOqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744532"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744532"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:43 -0700
X-CSE-ConnectionGUID: Zz0V8NapS9+AJG/EtOMxtw==
X-CSE-MsgGUID: 2rjMmj7gSK28dzW6HqDxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467524"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 02/16] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
Date: Mon,  8 Jun 2026 18:54:15 +0200
Message-ID: <20260608165429.587-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

This will allow us to simplify our custom release action where we
will keep only zeroing of the xe->mmio.regs as we rely on it in
asserts during all xe_mmio operations. While around, add missing
kernel-doc for the function and update error message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
v2: keep fini action to zero xe->mmio.regs (Matthew)
---
 drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index fa9cdcf09b32..51db46d13757 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -16,6 +16,7 @@
 #include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
@@ -79,27 +80,30 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 static void mmio_fini(void *arg)
 {
 	struct xe_device *xe = arg;
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 
-	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	xe->mmio.regs = NULL;
-	root_tile->mmio.regs = NULL;
 }
 
+/**
+ * xe_mmio_probe_early() - Probe and initialize device's MMIO
+ * @xe: the &xe_device
+ *
+ * Map the entire GTTMMADR_BAR and initialize the first tile's MMIO instance.
+ *
+ * The first 16MB of the GTTMMADR_BAR always belongs to the root tile, and
+ * includes: registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_mmio_probe_early(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	/*
-	 * Map the entire BAR.
-	 * The first 16MB of the BAR, belong to the root tile, and include:
-	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
-	 */
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
-	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
+	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
-		drm_err(&xe->drm, "failed to map registers\n");
+		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
-- 
2.47.1

