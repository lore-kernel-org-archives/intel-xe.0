Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB67E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 09:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2D10E8D1;
	Tue, 17 Dec 2024 09:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRjcwNi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B854410E8D6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734428833; x=1765964833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=me5F5kmIhyujCwMOpdtVCeyiX/zjkr6Bw8cEpb+9vc8=;
 b=LRjcwNi3luPoKeCkEogIxN7yXyo4di9V9Qkvel8/8mfFgNM2vYm1ukyH
 txTEzt+SxnVK0xypdoGIrUFMmnDGue+BCldPExTWFi6r6ihXonr2qUBJF
 1fQ5eYw2mP/4e1UhOU2IR0ZsZThbnrPB1CyBOg26937SH2C7N0eq3mmSD
 lYWbnZ3dn7OZkjD53Np6Ty5fKa0DvtFgzvpvP5KYaPsB0o2qN5RMIIWCk
 v4Mq51d8p+/LtUFweIZj0Yq8RTginkkeBwdC+3wir7GL8qrrJRt9riq6E
 0WMUeS1acijd/jGC8ri6RlkGSohQG7yucDMTCdicfW/X0JsBKg83rhXp3 A==;
X-CSE-ConnectionGUID: 13nlpOxMSyaaw7rHYo2tCQ==
X-CSE-MsgGUID: 6PeGpI/RQkW/aNSfxUA1qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46238190"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46238190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:13 -0800
X-CSE-ConnectionGUID: tzxfQPJFS6qZB2L5eygvxQ==
X-CSE-MsgGUID: CUURcB2FRIuMsa5UVM23dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97364673"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:12 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v6 7/7] drm/xe/eustall: Add workaround 22016596838 which
 applies to PVC.
Date: Tue, 17 Dec 2024 01:46:57 -0800
Message-ID: <44c7de17872c816b990f9649420ec388c718b1d4.1734427624.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1734427624.git.harish.chegondi@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
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

Add PVC workaround 22016596838 that disables EU DOP gating
during EU stall sampling.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c   | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index d0f3a4568644..b745b87ed13d 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -13,6 +13,7 @@
 
 #include "xe_bo.h"
 #include "xe_pm.h"
+#include "xe_wa.h"
 #include "xe_trace.h"
 #include "xe_macros.h"
 #include "xe_device.h"
@@ -26,6 +27,8 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_eu_stall_regs.h"
 
+#include <generated/xe_wa_oob.h>
+
 #define POLL_FREQUENCY_HZ 100
 #define POLL_PERIOD_NS (NSEC_PER_SEC / POLL_FREQUENCY_HZ)
 
@@ -675,6 +678,14 @@ xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER))
 		xe_gt_err(gt, "Failed to get RENDER forcewake\n");
 
+	/*
+	 * Wa_22016596838:pvc
+	 * Disable EU DOP gating for PVC.
+	 */
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
+
 	reg_value = gen_eustall_base(stream, true);
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
 }
@@ -706,6 +717,11 @@ xe_eu_stall_stream_disable(struct xe_eu_stall_data_stream *stream)
 	reg_value = gen_eustall_base(stream, false);
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
 
+	/* Wa_22016596838:pvc */
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
+
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
 	xe_pm_runtime_put(gt_to_xe(gt));
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 3ed12a85cc60..c10be71ac766 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -5,6 +5,7 @@
 22011391025	PLATFORM(DG2)
 22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)
+22016596838	PLATFORM(PVC)
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
-- 
2.47.0

