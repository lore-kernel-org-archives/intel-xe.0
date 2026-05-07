Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB0CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDDF10F20B;
	Thu,  7 May 2026 16:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDKgk4bD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA7B10F206
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170826; x=1809706826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Me1jr7vEsGL11uaOrYDKgHAkvycp2johpgwT5brL9uI=;
 b=VDKgk4bDzoatRPKzIO1rqvFz3dFIat4gzSfIC8JP66Xe1EcTys0qIuFh
 tt3pqxmIvdAskuCoK/dOhQdGwx4IXKOFoDo7+53dWV84Ny7Xz9Oicj3aK
 NAykMNr+vILkl+Z+VOn2LRACYMSUJcdeAw4gmPCB2bI9k5PIJFcsjDXmM
 2CBcvezFh517oZAAJIC6b/NPQoeE4v9eCO5vX83AafOUjl42FboYC+Ywe
 aPtNV2/qdA+IW4JZWLE13dWamXc96oruXoW1McSpqE3l/UvaFSK7SdHhR
 Hr02XlGtO94xPje/G3hs48Vd5Ajk9lw2kzVh9hYHtjrBdwNOya+Ni4xEh g==;
X-CSE-ConnectionGUID: E0MFFbL7Sy+dSYDGc3dYHw==
X-CSE-MsgGUID: L29HrSSZS1GOvni8y832Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063610"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: xLXlDoy3TI+5p/wmjYEagQ==
X-CSE-MsgGUID: yMkIl5nWTpSql8NJPe14zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876596"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 11/11] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Date: Thu,  7 May 2026 09:20:28 -0700
Message-ID: <20260507162016.3888309-24-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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

In a multi-queue use case, when a job is running on the secondary queue,
the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
the QUEUE TIMESTAMP to check how long the job ran. For user space to see
the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
register.

Compute PR: https://github.com/intel/compute-runtime/pull/923

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)

v3: (Niranjana)
- s/multiq/multi_queue/
- Base the condition on multi_queue_engine_class_mask

v4: s/xe_gt_hwe_class_supports_multi_queue/xe_gt_supports_multi_queue/
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 8cc313182968..fb65940848d7 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -9,6 +9,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
 #include "xe_platform_types.h"
@@ -33,6 +34,13 @@ static bool match_has_mert(const struct xe_device *xe,
 	return xe_device_has_mert((struct xe_device *)xe);
 }
 
+static bool match_multi_queue_class(const struct xe_device *xe,
+				    const struct xe_gt *gt,
+				    const struct xe_hw_engine *hwe)
+{
+	return xe_gt_supports_multi_queue(gt, hwe->class);
+}
+
 static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multi_queue_class)),
+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 	{ XE_RTP_NAME("16014440446"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
-- 
2.51.0

