Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D18C27C65
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 18:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3710E22D;
	Sun,  9 Jun 2024 18:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWJMixqK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1680210E22D
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717957189; x=1749493189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uD1lnizQNqQQpZ2wwvA8nqqsM/GybaZs0nWQYHbIJNc=;
 b=eWJMixqKqs0//mvYrriVdDhuzswPEDpLzdnCAloSz+iJpqRon0E/Tr4p
 cvudvdsPXBBLKOQKoS9AJBI5RHldT68M/3d2DgqNzxuSn4gvyQI7TOB15
 4vMxyedTuF6xojWA4/wteM3g/MGzpfQwvsWNP0Y4b1lUJ3xVzWjJaAJW/
 HVh+RwC5Elj6cTVXyeiHEXAY1DSRQx4y3gD8jbneMXeC7C3dNJck7CGUF
 FvztGj5o/7Jt89uRUqsheHS5RH9fL87djqD8cmGG8nbLyIlJlWdUYRCLG
 ElQA/3TDtM6odENMGOUuUFy6xxU390aT6dSErFuA4S+QTiZazvBss8bkO w==;
X-CSE-ConnectionGUID: WYSWDY8NQImWhCzvRA/49Q==
X-CSE-MsgGUID: 17wUn6OWR1OWP/J8JKxuMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25192324"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="25192324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:49 -0700
X-CSE-ConnectionGUID: 5Dv7eU9BTRKidEE+444OWA==
X-CSE-MsgGUID: /kC6KwmyS8OMjWX1+9meCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="38969117"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Move H2G SETUP_PC_GUCRC definition to SLPC ABI
Date: Sun,  9 Jun 2024 20:19:29 +0200
Message-Id: <20240609181931.1724-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240609181931.1724-1-michal.wajdeczko@intel.com>
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
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

We already have a dedicated file for GuC SLPC ABI definitions.
Move definition of the SETUP_PC_GUCRC action and related enum
to that file, rename them to match format of other new ABI
definitions and add simple kernel-doc.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |  6 -----
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 22 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                |  7 +++---
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 79ba98a169f9..43ad4652c2b2 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -128,7 +128,6 @@ enum xe_guc_action {
 	XE_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
 	XE_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
 	XE_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES = 0x100B,
-	XE_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
 	XE_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
 	XE_GUC_ACTION_GET_HWCONFIG = 0x4100,
 	XE_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
@@ -153,11 +152,6 @@ enum xe_guc_action {
 	XE_GUC_ACTION_LIMIT
 };
 
-enum xe_guc_rc_options {
-	XE_GUCRC_HOST_CONTROL,
-	XE_GUCRC_FIRMWARE_CONTROL,
-};
-
 enum xe_guc_preempt_options {
 	XE_GUC_PREEMPT_OPTION_DROP_WORK_Q = 0x4,
 	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index c165e26c0976..85abe4f09ae2 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -246,4 +246,26 @@ struct slpc_shared_data {
 #define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	(0xffu << 0)
 #define HOST2GUC_PC_SLPC_REQUEST_MSG_N_EVENT_DATA_N	GUC_HXG_REQUEST_MSG_n_DATAn
 
+/**
+ * DOC: SETUP_PC_GUCRC
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_FAST_REQUEST_                            |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC` = 0x3004      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **MODE** = GUCRC_HOST_CONTROL(0), GUCRC_FIRMWARE_CONTROL(1)  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
+#define GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC		0x3004u
+#define   GUCRC_HOST_CONTROL				0u
+#define   GUCRC_FIRMWARE_CONTROL			1u
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 508f0d39b4ad..b57207bb1f11 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -9,7 +9,6 @@
 
 #include <drm/drm_managed.h>
 
-#include "abi/guc_actions_abi.h"
 #include "abi/guc_actions_slpc_abi.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
@@ -195,7 +194,7 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 {
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	u32 action[] = {
-		XE_GUC_ACTION_SETUP_PC_GUCRC,
+		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
 		mode,
 	};
 	int ret;
@@ -758,7 +757,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (xe->info.skip_guc_pc)
 		return 0;
 
-	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
+	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
 	if (ret)
 		return ret;
 
@@ -861,7 +860,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
-	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
+	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
 
 out:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-- 
2.43.0

