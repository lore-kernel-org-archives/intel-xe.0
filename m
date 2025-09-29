Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8866CCCD184
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC7A10E31A;
	Mon, 29 Sep 2025 02:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYQJtgmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AEE10E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CM0fY+YK+2bQQqBMJqZsaDHM8rrke6zSSMJ29bxJrls=;
 b=mYQJtgmHQ2T4yrKsWVWY0FkPUVG/z8wCjfZRUgqjggnX0IC0ZAwWwZRE
 sk22wojDRjiHSUfhmhl0SjitNk0AmNTK2pN06QxHS+LJv3wrpB9C+HHjT
 mN0X4SoIKjLNEWNCHjxDdWn572CK05j696FZt756HtVUZc/Bc4blUZueI
 igXPu7GXZ6Ih25bV0M06IsIDVFnbRN9d1OjyPHb96KOzk7p30ou4lRp0a
 jySFoqoxPD1QM5G98P+shzaGeMEvfxLTRUifqxI2t61HYF5yEzjDSkMMH
 HL27yvycO2nbBEqGWNU4bgZPwgelHfwizejjM0fFewc/6CTqfInqxIPfK A==;
X-CSE-ConnectionGUID: u0AqGHe6RCeXBXLtWB+zSg==
X-CSE-MsgGUID: GafjsF2KSNOGigUSAN4org==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398538"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:51 -0700
X-CSE-ConnectionGUID: RQpeq9JaR9ustvcWz9bISA==
X-CSE-MsgGUID: J755hJtpStycJayOJUZXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529272"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 22/36] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context
 register
Date: Sun, 28 Sep 2025 19:55:28 -0700
Message-Id: <20250929025542.1486303-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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
index d0fde371fae3..d84de8544532 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -736,6 +736,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
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
@@ -807,18 +827,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
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

