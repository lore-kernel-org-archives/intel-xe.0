Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0252AD1A43B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 06:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C537310E287;
	Mon, 14 Oct 2024 06:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIXktGh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A33110E270
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 06:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728885644; x=1760421644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=csuhAAU7Fg/cYbnArYvOFJorvMme5LCWV1ERfT5N3Ic=;
 b=nIXktGh1VpwKdN93lOH0c/xpb89ZUpscA7ME39XtG9lPOsDHGD2iopTv
 1xYJW7JGW/l8UId91KPhlz2XgglV/h4AR8dMfxhf/mj70oEmZ/2RqYTmF
 dxCwFgPPV2u5YjhjDadBFJDt0jCL+1cvuWJEqS9VsucqEoEG/gAAlvALL
 aMEeE2FLrdMYikEClPm3psWBtXZcLQ/aN9XGHp4BO1zL5VeQmEP7bHtzP
 0o69hu63iwSxy3t8MQsBF6lEtP/xQmSOjgTtoyqjEFeZmAcwIfVmANMKZ
 IHBGCW641PF3BpMO6neAFgbkw4WQNfl1LO5FfIUyosxeToZsgnlOF3sDh g==;
X-CSE-ConnectionGUID: S/ga8FneQ+6hDFPBgEQx8w==
X-CSE-MsgGUID: ywYPgQUVTaaNINZOFPUZ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39599335"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39599335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:43 -0700
X-CSE-ConnectionGUID: 50WrkJraSKGW8BPyaPbDQQ==
X-CSE-MsgGUID: dtP0VqLVTDu5PItu/RgyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77575058"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:44 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 5/5] drm/xe/eustall: Add workaround 22016596838 which
 applies to PVC.
Date: Sun, 13 Oct 2024 23:00:36 -0700
Message-ID: <5365fb266d2d82d1face5c263686d2e5624dbea9.1728884074.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1728884074.git.harish.chegondi@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
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
index 1801b3c03f1f..9f21de7869d7 100644
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
 #define DEFAULT_POLL_FREQUENCY_HZ 100
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 
@@ -610,6 +613,14 @@ xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	xe_pm_runtime_get(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER));
 
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
@@ -641,6 +652,11 @@ xe_eu_stall_stream_disable(struct xe_eu_stall_data_stream *stream)
 	reg_value = gen_eustall_base(stream, false);
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
 
+	/* Wa_22016596838:pvc */
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER));
 	xe_pm_runtime_put(gt_to_xe(gt));
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 264d6e116499..a648dca61f30 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -4,6 +4,7 @@
 22011391025	PLATFORM(DG2)
 22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)
+22016596838	PLATFORM(PVC)
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
-- 
2.45.1

