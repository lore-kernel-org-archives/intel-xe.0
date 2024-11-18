Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2E1D43FFD
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5B810E46D;
	Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+mGSMka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A556810E45B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920847; x=1763456847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKwTnDklzqL2xHkhtHQcdZi+VzRZ4uIofXID7Xq6NM8=;
 b=Y+mGSMkaeRTpiAMdzo/Xle/yVXex6uCbaQhlntMJeaWFL5kpRH1LAnJE
 TYvLnu8tJWCWiys19xcntLeRmjNAtVr00g56F4DgyQysVuL1ySsq28jHQ
 0r+FPL3g//ay7kaSCSGYMS3Dw6IIIXmw1emSvPaHBzyRaSJE4G/f0+eU0
 J7n9m5QkDZ05z47NYywGhbG5LxAiaMgx3TqwYP3s6hIQWegdyLJyRvWsv
 p+7YpqO96kgplfBITzWm4Mi4YIxZOPqY8kUzt4WZDF7eufA8XkN9ty3gR
 AArt2Qgt/MVden6IElVDDOwlq/dsco/VKBgxAN2fj3GSP54QdohDsyI0r Q==;
X-CSE-ConnectionGUID: MP54xGLaTPmu2PhyjG3WZQ==
X-CSE-MsgGUID: T13N/PHcTiOyrlYpp7uLUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31242930"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31242930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
X-CSE-ConnectionGUID: S4CQ480MQYuEcEsejDd5lg==
X-CSE-MsgGUID: MczLZorER0SJbM6BknFQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="126705164"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 7/7] drm/xe/eustall: Add workaround 22016596838 which
 applies to PVC.
Date: Mon, 18 Nov 2024 01:07:19 -0800
Message-ID: <5d1d420e1041cd381513c7b8d3f86bcdd492a0de.1731919693.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
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
index 297b36910296..9050f687cace 100644
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
 
@@ -631,6 +634,14 @@ xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
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
@@ -662,6 +673,11 @@ xe_eu_stall_stream_disable(struct xe_eu_stall_data_stream *stream)
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
2.45.1

