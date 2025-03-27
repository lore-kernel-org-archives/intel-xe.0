Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DC9C36011
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 18:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F97410E93D;
	Thu, 27 Mar 2025 18:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLmJIcio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9C810E93D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743101771; x=1774637771;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oS1P058XFmvp4ZEiYzVoB4nHMzWPL3UXnmPTrbUr+gs=;
 b=PLmJIcioUfiaU1sbzIwmjOmzG6XkGeJ+ONecCXw6gFc3K3X83SWA4WVm
 1/966x6qbO7dND40tb3ihrD3QWDN8tUEi+VrPhxDH1LgMQFfj/Wy/la66
 KKux0cz3iei4CEoeVPa95DubgUjlxRdYsQUGay2loy7z4tDXWsRLhAY6a
 a+jq3sos4oX/2A4g4u8h4p6L4OSRmozcbfnjSAjidQLpRUWHr6DB0lwtG
 6o5q3uCU5opYHAVuYINR6WVjRANKde0vnpTdVyDka7oP7v9BfvLj/zEah
 EGsHM5kQm4XL+dpm4g1DNt3Est47q54I2rIrznnFoPw5GPi4QgnZepMHJ Q==;
X-CSE-ConnectionGUID: 63eP361FQU6NSYO8hlJ8Mw==
X-CSE-MsgGUID: pWYAHtwZQ0e3rCntSUcl+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55823723"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="55823723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 11:56:11 -0700
X-CSE-ConnectionGUID: A3J7fFGUQH2AIIqs5G3udw==
X-CSE-MsgGUID: OpaiVifdQv6df4adapOWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="126147559"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 11:56:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Ensure fixed_slice_mode gets set after ccs_mode
 change
Date: Thu, 27 Mar 2025 11:56:04 -0700
Message-ID: <20250327185604.18230-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

The RCU_MODE_FIXED_SLICE_CCS_MODE setting is not getting invoked
in the gt reset path after the ccs_mode setting by the user.
Add it to engine register update list (in hw_engine_setup_default_state())
which ensures it gets set in the gt reset and engine reset paths.

v2: Add register update to engine list to ensure it gets updated
after engine reset also.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c05fd30b7df..93241fd0a4ba 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -389,12 +389,6 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 				 blit_cctl_val,
 				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
-		/* Use Fixed slice CCS mode */
-		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
-		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
-		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
-					   RCU_MODE_FIXED_SLICE_CCS_MODE))
-		},
 		/* Disable WMTP if HW doesn't support it */
 		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
 		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
@@ -461,6 +455,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Use Fixed slice CCS mode */
+		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
+		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
+		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
+					   RCU_MODE_FIXED_SLICE_CCS_MODE))
+		},
 	};
 
 	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
-- 
2.43.0

