Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FB1CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7882510E670;
	Tue,  7 Oct 2025 11:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpaEHw2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A553510E683
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836410; x=1791372410;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=i5gPUGQmLoPYHZPRa4+zMFm5I5bWZT9S7D2ecPPBiBk=;
 b=PpaEHw2WlflbYtI1oll9mTIddY+l55myd5Rql6aCoqkTTUah5UsGoHAD
 ENQr/KvGCIdN2f9GeR/f0oD1zDjaiISVsl4xt640sLfPAOZT/DdlquIRr
 /cvsASGXsvnscqEaHvwTPYe1VIiXZLVxVv3mzVGyHpakEIrjr7ABpAphU
 iZcI8D9gJAVaaj8fjtJypwDjXk3IAqDhU3RyxX/dyxDcvAEzKfJrJiO+F
 H5Wc5vEhK73CfoXRd2Rh5jtVtEGqPIpKOGT28rf3cifHiIoRTgiJDjcSe
 GuJ+PJM4RkuFIrXS5/iNSl4d6IiXYQzJnwGKQv2I5ZC2+X5C1PWXtBm5s w==;
X-CSE-ConnectionGUID: dA1/VXDOTq+69zlXH2FAaQ==
X-CSE-MsgGUID: dfKPWCWoTsO325OUhkc+Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660687"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:50 -0700
X-CSE-ConnectionGUID: UeoeO5EOSk+W8rSJ1mYFSg==
X-CSE-MsgGUID: j8PUUKgYQfSYU9OhYvIHOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924009"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 17/32] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context
 register
Date: Tue,  7 Oct 2025 04:26:26 -0700
Message-Id: <20251007112641.2669655-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

The only case where the GuC submission backend cannot reason 100%
correctly is when a GuC context is registered during VF post-migration
recovery. In this scenario, it's possible that the GuC context register
H2G is processed, but the immediately following schedule-enable H2G gets
lost. The schedule-enable G2H "done" response is how the GuC state machine
determines whether context registration has completed.

A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
simply drops the duplicate H2G. To keep things simple, use
`GUC_HXG_TYPE_EVENT` for all context registrations on VFs.

v5:
 - Check for xe_sriov_vf_migration_supported (Tomasz)
v7:
 - Add comment about subsequent protocol failures (Tomasz)
 - Modify commit message (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9f0090ae64a6..f63ce0cec357 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -32,6 +32,7 @@
 #include "xe_guc_tlb_inval.h"
 #include "xe_map.h"
 #include "xe_pm.h"
+#include "xe_sriov_vf.h"
 #include "xe_trace_guc.h"
 
 static void receive_g2h(struct xe_guc_ct *ct);
@@ -736,6 +737,28 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
 	return seqno;
 }
 
+#define MAKE_ACTION(type, __action)				\
+({								\
+	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
+	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
+		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
+})
+
+static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
+{
+	/*
+	 * When resuming a VF, we can't reliably track whether context
+	 * registration has completed in the GuC state machine. It is harmless
+	 * to resend the request, as it will fail silently if GUC_HXG_TYPE_EVENT
+	 * is used. Additionally, if there is an H2G protocol issue on a VF,
+	 * subsequent H2G messages sent as GUC_HXG_TYPE_FAST_REQUEST will likely
+	 * fail.
+	 */
+	return IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe) &&
+		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
+		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
+}
+
 #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
 
 static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -807,18 +830,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
 		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
 	if (want_response) {
-		cmd[1] =
-			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
-				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
+		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
+	} else if (vf_action_can_safely_fail(xe, action[0])) {
+		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
 	} else {
 		fast_req_track(ct, ct_fence_value,
 			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
 
-		cmd[1] =
-			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
-			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
-				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
+		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
 	}
 
 	/* H2G header in cmd[1] replaces action[0] so: */
-- 
2.34.1

