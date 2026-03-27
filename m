Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEC210BA431
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 07:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FC910E39C;
	Fri, 27 Mar 2026 07:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXLTiuc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8802110E39C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 07:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774596794; x=1806132794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S+GNzGsOmZuRBmqgVgbBJjaqiuA4qgy0z/D2BuZys9o=;
 b=YXLTiuc79sHWvewxotDu4Ob06o9UjkAke1KPWOugLd8FawMMChE379xs
 U6Ba8BcoGoA95wLmErx90WiuBRIbLiXmopigcYd/RDfZYknI3DPv92xpP
 5PN19IgeVp6A7NagewrsoqZYEdP5h+JwAYf27c65SUiKAp2jC6iYzQq65
 uNKljCI4n4TVtXt4yHZXxKwH3Z7af/LJAzFUKxeKxgG96nMr+rZtJKg+D
 3xBZY3+jSrDSn6Naox56IB823IX73Zk11EIH8wAYOR15MA0H6zyGoW7e7
 xfY+XEFBrTIGXJh1l5H+PDYwjPIV0gMbPoa9n+tXmPTOhRJ+BtjyLo6LN Q==;
X-CSE-ConnectionGUID: jVuXT0vOTmuEOkJQNX9G7w==
X-CSE-MsgGUID: BcxZcnECTL68SuW/+N6WjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93051063"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="93051063"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 00:33:13 -0700
X-CSE-ConnectionGUID: MQMSLtg7QNG3+jrkNuISsg==
X-CSE-MsgGUID: CmwO3pSlSd6NLCBdKJw/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="229323791"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 27 Mar 2026 00:33:12 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe: Add Wa_14026626235
Date: Fri, 27 Mar 2026 13:37:20 +0530
Message-ID: <20260327080719.2136248-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Wa_14026626235 requires two changes for graphics version 35.10:

1. Clear bit 6 (9th on state change mode) of PSS_CHICKEN (0x7044) via
   an LRC workaround applied per render context.

2. Disable preemption for the render engine by setting the GuC
   preemption timeout to 0. This prevents the HW from halting in the
   middle of a 3DPRIMITIVE command and inserting a flush.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   | 8 ++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
 4 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4ebaa0888a43..db45d7908ebb 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -167,6 +167,7 @@
 
 #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
 #define   FLSH_IGNORES_PSD			REG_BIT(10)
+#define   PSS_CHICKEN_9TH_ON_STATE_CHANGE	REG_BIT(6)
 #define   FD_END_COLLECT			REG_BIT(5)
 
 #define SC_INSTDONE				XE_REG(0x7100)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a145234f662b..d2bb574d422b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -12,6 +12,8 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_actions_slpc_abi.h"
 #include "abi/guc_klvs_abi.h"
@@ -44,6 +46,7 @@
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
 
@@ -531,6 +534,11 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
 		     !xe_exec_queue_is_multi_queue_secondary(q));
 
+	/* Wa_14026626235: Disable preemption for render engine */
+	if (q->class == XE_ENGINE_CLASS_RENDER &&
+	    XE_GT_WA(q->gt, 14026626235))
+		preempt_timeout_us = 0;
+
 	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
 		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 546296f0220b..fe9ca153b33d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -789,6 +789,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("14026626235"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(CLR(XEHP_PSS_CHICKEN, PSS_CHICKEN_9TH_ON_STATE_CHANGE))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 80b54b195f20..3f2582568171 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -58,3 +58,4 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14026626235	GRAPHICS_VERSION(3510)
-- 
2.50.1

