Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E146EDF153
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A8910E7E7;
	Fri, 13 Feb 2026 10:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbfeM90n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089710E7E6;
 Fri, 13 Feb 2026 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770978327; x=1802514327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7JgCsgjLUDDHunI67wlRAJ4BhpOYLmH2phr7+1grwo=;
 b=TbfeM90nWzh6XOa4Er0/iEIkb3U70TdFbUKHvaiLvHYItBsdotK+rWKr
 +tq7aLGk3v3K3RvXKKB5d5pQ0bvEixcDmM9IO5RIWzuMeB9WpTYVtl1EJ
 gsd7EjX++4+u0ztt+FXKFUHxoEwF6Zf6XPdEQU0giQF5dQbV7FXBI668h
 45oBsLUCN3maQiLQ+H9/8NN8bAfRu79sbOQzD9tGG54WPW4z/wvcOYX8v
 IdADOLfyc9mUnW6MXTgHn6iThi3RHVFvP4cW0TaUwU79JOhtty38K2T1d
 vsvKcl+O6u9tMepl4UcBSvb92PQpucsdYtIjNhSp1x0K+3b/MC8x6/KTK Q==;
X-CSE-ConnectionGUID: BQv6Kk2xQ42tVoKyl5AvGQ==
X-CSE-MsgGUID: 2YrZBZ28Tyi6GaykBvpQTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72150697"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72150697"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:25:27 -0800
X-CSE-ConnectionGUID: 3uyO4vtpQB+5JzPeLWvfiQ==
X-CSE-MsgGUID: TzL/GTG2Rn2Q3/CHB91GnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212919680"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:25:26 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 09/16] drm/i915/display: convert W/As in intel_dp_mst.c to
 new framework
Date: Fri, 13 Feb 2026 12:23:37 +0200
Message-ID: <20260213102500.406925-10-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260213102500.406925-1-luciano.coelho@intel.com>
References: <20260213102500.406925-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c     | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 2934331d905f..be37a23edce4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -94,6 +94,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_14011765242:
 		return display->platform.alderlake_s &&
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
+	case INTEL_DISPLAY_WA_14014143976:
+		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
 	case INTEL_DISPLAY_WA_14020863754:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index b781a3c6d803..dc1a187fd0a1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -36,6 +36,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14011503117,
 	INTEL_DISPLAY_WA_14011508470,
 	INTEL_DISPLAY_WA_14011765242,
+	INTEL_DISPLAY_WA_14014143976,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15013987218,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 29713075e413..e67c2e5356da 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -43,6 +43,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dp.h"
 #include "intel_dp_hdcp.h"
 #include "intel_dp_link_training.h"
@@ -1274,7 +1275,7 @@ static void enable_bs_jitter_was(const struct intel_crtc_state *crtc_state)
 		set |= DP_MST_FEC_BS_JITTER_WA(crtc_state->cpu_transcoder);
 
 	/* Wa_14014143976:adlp */
-	if (IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER)) {
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014143976)) {
 		if (intel_dp_is_uhbr(crtc_state))
 			set |= DP_MST_SHORT_HBLANK_WA(crtc_state->cpu_transcoder);
 		else if (crtc_state->fec_enable)
-- 
2.51.0

