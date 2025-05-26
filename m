Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BBDC5AE59
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7AF10E327;
	Mon, 26 May 2025 12:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aU6Jnjnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A6D10E2E8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261133; x=1779797133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4fIY/hCnEmrYb5UaojdNfm8YF3t2MuzzudZ/yjjU+c=;
 b=aU6JnjnrvwQcKy+tXNnnhYWHk3xVtw0zPz+0Mde+A3nMzytvTmwgQmGA
 mFtrSYENE/BBZvVrUCi1q9mpGj/EDxvnVTghzNRT91lboqEhog4jONBaA
 /eDnFeSjGQ1pd+MRBUSjfsu0FdvXYpPk8bC6b37o3R9GTu1C3BcPiFHZH
 GU/XZPO/alKklRqC+wVIhwWIc89KCrenIkXtM0zkPK1H3AD5hSue4BwQX
 JB2SKnLraUZYFmMHJyaPuo1jVjo4Rkbo6q2QDW/fem8g3eR4wSLL0bApk
 9Ps0RELlp147qnNVUQnVMatf1upxWrKKjd1a6ocNeoWN2YxqDAUsxgXYs w==;
X-CSE-ConnectionGUID: rQlMOpCaTRK9E8xh0cS8ZA==
X-CSE-MsgGUID: iaK3R/3lQ2yRasgLRxhwbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492282"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:33 -0700
X-CSE-ConnectionGUID: SLW0N3SnQFu9gtqNT5I7vg==
X-CSE-MsgGUID: LPf8N8wiTwyGy07LyK7W2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576009"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:31 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 01/12] drm/panelreplay: Panel Replay capability DPCD
 register definitions
Date: Mon, 26 May 2025 15:05:01 +0300
Message-ID: <20250526120512.1702815-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add new definition for size of Panel Replay DPCD capability registers
area. Rename existing definitions to group capability registers together.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c |  8 ++++----
 include/drm/display/drm_dp.h             | 12 +++++++-----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index cd833b63ea6b..0cfdeff268f9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -516,7 +516,7 @@ static u8 intel_dp_get_su_capability(struct intel_dp *intel_dp)
 
 	if (intel_dp->psr.sink_panel_replay_su_support)
 		drm_dp_dpcd_readb(&intel_dp->aux,
-				  DP_PANEL_PANEL_REPLAY_CAPABILITY,
+				  DP_PANEL_REPLAY_CAP_CAPABILITY,
 				  &su_capability);
 	else
 		su_capability = intel_dp->psr_dpcd[1];
@@ -528,7 +528,7 @@ static unsigned int
 intel_dp_get_su_x_granularity_offset(struct intel_dp *intel_dp)
 {
 	return intel_dp->psr.sink_panel_replay_su_support ?
-		DP_PANEL_PANEL_REPLAY_X_GRANULARITY :
+		DP_PANEL_REPLAY_CAP_X_GRANULARITY :
 		DP_PSR2_SU_X_GRANULARITY;
 }
 
@@ -536,7 +536,7 @@ static unsigned int
 intel_dp_get_su_y_granularity_offset(struct intel_dp *intel_dp)
 {
 	return intel_dp->psr.sink_panel_replay_su_support ?
-		DP_PANEL_PANEL_REPLAY_Y_GRANULARITY :
+		DP_PANEL_REPLAY_CAP_Y_GRANULARITY :
 		DP_PSR2_SU_Y_GRANULARITY;
 }
 
@@ -676,7 +676,7 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 {
 	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
 			 sizeof(intel_dp->psr_dpcd));
-	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP,
+	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
 			  &intel_dp->pr_dpcd);
 
 	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SUPPORT)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3001c0b6e7bb..3371e2edd9e9 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -547,16 +547,18 @@
 /* DFP Capability Extension */
 #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
 
-#define DP_PANEL_REPLAY_CAP				0x0b0  /* DP 2.0 */
+#define DP_PANEL_REPLAY_CAP_SUPPORT			0x0b0  /* DP 2.0 */
 # define DP_PANEL_REPLAY_SUPPORT			(1 << 0)
 # define DP_PANEL_REPLAY_SU_SUPPORT			(1 << 1)
 # define DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT	(1 << 2) /* eDP 1.5 */
 
-#define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
-# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+#define DP_PANEL_REPLAY_CAP_SIZE	7
 
-#define DP_PANEL_PANEL_REPLAY_X_GRANULARITY		0xb2
-#define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY		0xb4
+#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
+# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+
+#define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
+#define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
 
 /* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
-- 
2.43.0

