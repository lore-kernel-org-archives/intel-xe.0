Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9223FC021BF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 01:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B235A10E832;
	Wed, 26 Feb 2025 01:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgUmhgVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823F210E82F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 01:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740534446; x=1772070446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mlPwGbi3pMY1rnULMpVi39WwXnTX1/WKtae+uiz3nMk=;
 b=OgUmhgVe9C0dengS8T+UARRHe3w2sExyYdAxtbXdQeB95Xdcg8WH8q/y
 DmSlstzKdMIA7x1lFM+LWBx9CMXsOBtIOpAUGazeEFGVNYXybXUWbFNUT
 lJuxoKEyIzOnVJlI+klbwfiAbRYEhG0B4zRn0g8tx74nL39vuSAP3H4fj
 /xSnnhLp/P8Zaa2dYEsp68EtClCzN7hU5b+ecshrZY8dbW7jwiCkTw8id
 jFI/KM2Q+D/E67wbF9t9EXehFNkqRDsB9WlfVYgmM4iGCSD6gWm3YKahU
 YNbkiZAlAaVYOlGYonhGoFeJSogtrkEipK3fdwmtF0Y7Tn6YdkBakAiZ1 g==;
X-CSE-ConnectionGUID: tb10MvDmTEidFokgi7j/eg==
X-CSE-MsgGUID: xrIPmTLyRlWpPl1NH2CRpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40602941"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="40602941"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 17:47:26 -0800
X-CSE-ConnectionGUID: /t/fzBp1Riy8SmkK1AxCxw==
X-CSE-MsgGUID: WCSvjKVTSZKReymqtC7Geg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117050237"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 17:47:26 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v12 8/8] drm/xe/eustall: Add workaround 22016596838 which
 applies to PVC.
Date: Tue, 25 Feb 2025 17:47:12 -0800
Message-ID: <062a12ed9e110fea420cd47cb70fb10136ee9132.1740533885.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740533885.git.harish.chegondi@intel.com>
References: <cover.1740533885.git.harish.chegondi@intel.com>
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
index 54a0d1f6a491..88a92baf5c95 100644
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
@@ -642,6 +644,10 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
+
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
 		/* Clear any drop bits set and not cleared in the previous session. */
@@ -793,6 +799,10 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 
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

