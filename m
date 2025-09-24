Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BDDCAC5AC
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C305310E6B0;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPJQTamk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4669410E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676571; x=1790212571;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RKt+B3e6Ndj4fTs97t2Tr5DtrCz1NiLQcLXQLsUZ7C8=;
 b=TPJQTamkpL/NhyXSog7/dr/nF56dwYy2XscPF0IpgdfAH829PMRDo0d3
 vjqk365PoNs/9jWo5S0YVicFH1UTkxZ5zC7EJu0H7DNyp2wBSfdVvGRVm
 lYTh24ywGLM2IH3ZjmgD44nm99ZxrjyTWHiY3OmBNBmT030Mp5E9Kjhcq
 HTq1aNCjxdOfxiX7KwGAdd7P0v+Fc7gcQDkzmBJCwEXxp1ENsetpVP3TD
 vGS0lIx/7lMsrfs4CxbsIGuJfo39yxGNy9bipw3ufIdDRvaZS4NZwvCOM
 E61P60FWTlnInOwSiecsfLA5zqbGw8vQekfg4ptj3WJnJ1jq9VjtyU0zm Q==;
X-CSE-ConnectionGUID: GNSze8oXQoqOgB6wgGy0SQ==
X-CSE-MsgGUID: d21FykFyTaC5yEhvA1HxBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908270"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
X-CSE-ConnectionGUID: G95U65R3SZylp6yvtH0MVQ==
X-CSE-MsgGUID: w9T089COTfWt/AUvWZIchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841800"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 20/34] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context
 register
Date: Tue, 23 Sep 2025 18:15:47 -0700
Message-Id: <20250924011601.888293-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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
lost.

A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
simply drops the duplicate H2G. To keep things simple, use
`GUC_HXG_TYPE_EVENT` for all context registrations on VFs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 661ab1bf4502..aa9fb08f7856 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -737,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
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
+	 * If we are VF resuming, we can't exactly track if a context
+	 * registration has been completed in the GuC state machine, it is
+	 * harmless to resend as it will just fail silently if
+	 * GUC_HXG_TYPE_EVENT is used.
+	 */
+	return IS_SRIOV_VF(xe) &&
+		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
+		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
+}
+
 #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
 
 static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -808,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
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

