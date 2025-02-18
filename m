Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FDAC021B1
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 19:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC5910E754;
	Tue, 18 Feb 2025 19:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCuYjHLw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294A710E753
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739908459; x=1771444459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kcIhUOqsZVHGPBCvjiDmTbJHnLvssxMhADIip/qkWtw=;
 b=CCuYjHLwLhs5wDKxHyEYWsQs7MFCSUmIgzWY6mxNFwArVCe+DU04lcIX
 gWwFMU/WVyr5ppyvCphLxB1kl2EodARlk/PY585vW7X0fNCSTNQ9Wlli5
 UMZQcPrRi2fqBnpxoifi892IfQTTMfIwkT3TAax1cyERUve8Vqe3EiSNJ
 kCv4UyJchGxPJ1Ayiirkxv0UH+3gci0JWsK/uXNdbGBN/akx4q/Qexs4r
 2xwB5B0JT/1ZdZTzlljB4D1CU8V75lfiheT1XDvee5cEhGtHMN/VpShiL
 Nr6QuxU5qlICmfl2Xb+yL/aRp3SdkC6cdXXt4nKvawXZWdiYK1mae2od3 A==;
X-CSE-ConnectionGUID: OSb8kto6StqzhIku2SZKtQ==
X-CSE-MsgGUID: AoEnV9P3RESy/kCoaxNOoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44382058"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44382058"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:18 -0800
X-CSE-ConnectionGUID: eecrY3X5TveOEltzgfdkmw==
X-CSE-MsgGUID: QWf2DWxpQhqoh+lhybDBHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151706369"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:18 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v10 8/8] drm/xe/eustall: Add workaround 22016596838 which
 applies to PVC.
Date: Tue, 18 Feb 2025 11:53:58 -0800
Message-ID: <aefcbad7097ff2bbf53886607f8272e566791c46.1739906138.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739906138.git.harish.chegondi@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f82e9e47c3fa..b94585bdf91c 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include <drm/drm_drv.h>
+#include <generated/xe_wa_oob.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_bo.h"
@@ -22,6 +23,7 @@
 #include "xe_observation.h"
 #include "xe_pm.h"
 #include "xe_trace.h"
+#include "xe_wa.h"
 
 #include "regs/xe_eu_stall_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -615,6 +617,10 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
+
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
 		/* Clear any drop bits set and not cleared in the previous session. */
@@ -774,6 +780,10 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 
 	cancel_delayed_work_sync(&stream->buf_poll_work);
 
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
+
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 228436532282..8e2cae7f7135 100644
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
2.48.1

