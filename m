Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D75C0219E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111AD10E555;
	Mon, 10 Feb 2025 13:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfDIATrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075C10E54B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739195219; x=1770731219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QGXnh775gvDzr4arl0QVbdhc52kvpbEPBrFbnlrzTHg=;
 b=BfDIATrE9v2XocDhlV4mFESrP4EdD9hBzkfUa8mdn6Qso8LZifPWlm8J
 oE3LwfIpR4xVbz0X3Q7iOsb8kUBnr2fMLPIR+rBKJNkrGza01i+SJWHfd
 sdO6WxywlpZ0XN5QW5L+YEs1oLskEUN+SCl0b2WNnCvMY3FYHognqGDI2
 Y7lc5X5UgAS/pOS8WpjtFRgvayDLckttOdxQ5AxDRwM3UCiUYVjEUgEXF
 x07r4vyXCigTeTzyzcFtvEdGpObvuyhoG4nZFnvPH+VBUCf0i1+eAQJ+n
 27PFK62e3rgfo0hWkwY3OeNAXolxsJj38jrMp81lBt86s9EFwhFwksTp8 A==;
X-CSE-ConnectionGUID: QPjy4hH1S923hVcSBL8oww==
X-CSE-MsgGUID: bd9fbjL/TOWH3T14pIPieg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27378428"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27378428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
X-CSE-ConnectionGUID: cQ/4OfKdRYmahUOCx22/pg==
X-CSE-MsgGUID: RkcCwmjHS6i2X4cT/VkNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149386853"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v9 8/8] drm/xe/eustall: Add workaround 22016596838 which
 applies to PVC.
Date: Mon, 10 Feb 2025 05:46:49 -0800
Message-ID: <49e73f762d5eabf587a251352a9b77056c47fe3a.1739193510.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739193510.git.harish.chegondi@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
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
 drivers/gpu/drm/xe/xe_eu_stall.c   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 4dce58f60405..6acb87a25f78 100644
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
@@ -658,6 +660,10 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_WA(gt, 22016596838))
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
+
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
 		/* Clear any drop bits set and not cleared in the previous session. */
@@ -816,6 +822,10 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 	queue_delayed_work(stream->buf_poll_wq, &stream->buf_poll_work, 0);
 	flush_delayed_work(&stream->buf_poll_work);
 
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

