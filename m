Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFECD60A260C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i0k29hc5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE9910F1F5;
	Mon, 16 Nov 2026 14:01:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97B10EC55;
 Mon, 16 Nov 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794837657; x=1826373657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MkC0fFIRipKx2TJOk4KFMcHYeERDmUpCY2w+YtyzJ2k=;
 b=i0k29hc5US16y2UR2I4KJUCjDSjaSj5tindttexIGeO09EDrwxd4jMSw
 UHs2zWQFVac2+GPVDZdtCbUrdjgvc5dBLgS9WFfCow4+ZOQdrY6HjBS1r
 zlMobJn2evelLNWkyWojztAt1t3nXJkxWDH2Onz04ZCKQNziZ0exKKXJf
 jHLNAi86E79HwJdAWDYSVzWFKHQoHZ5nuXKDxX6n2ih6QAZA5Vfu+MldV
 hGoPGoXOEonITLMzbNvbEo2PxeU96P9m+2NguaMxtUz0AgSeAtMoFMul6
 TffDV5Unk83qP0zQvSyw54mmGJJsXCBA+XT/3XLE38oo6iZpxuThUahm/ A==;
X-CSE-ConnectionGUID: P/YMGBCqTvGtmcaV+IwZoA==
X-CSE-MsgGUID: VcD7XdW1RRWaKMHdKhCmmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3609183"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3609183"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:00:57 -0800
X-CSE-ConnectionGUID: 4O2ROdaGQ7+O8EhexrpR7g==
X-CSE-MsgGUID: 19maVlHfTCWp44OceKurAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9552052"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 06:00:55 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 2/4] drm/i915/bios: Parse eDP fast link training params
 only if enabled
Date: Mon, 16 Nov 2026 13:59:02 +0000
Message-ID: <20261116135904.59365-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116135904.59365-1-shawn.c.lee@intel.com>
References: <20261116135904.59365-1-shawn.c.lee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VBT eDP fast link training params are parsed regardless of the
per-panel fast link training enable bit (VBT 182+), which itself is not
parsed. Parse the enable bit into panel->vbt.edp.fast_link_training and
parse the params only if it is set.

Like the Windows driver, discard the params if the fast link training
rate exceeds the eDP max port link rate.

The VBT default fast link training lane count is 1, while hardly any
eDP panel uses a single lane, so treat a lane count of 1 as not
specified (0).

The params have no users yet; a follow-up patch uses them for eDP link
training.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 41 ++++++++++++++++++-
 .../drm/i915/display/intel_display_types.h    |  1 +
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 6b2924c56cae..3471a0128c51 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1448,6 +1448,10 @@ parse_edp_fast_link_params(struct intel_display *display,
 	const struct edp_fast_link_params *edp_link_params =
 		&edp->fast_link_params[panel_type];
 
+	if (display->vbt.version < 182 ||
+	    !panel_bool(edp->fast_link_training, panel_type))
+		return;
+
 	if (display->vbt.version >= 224) {
 		panel->vbt.edp.rate =
 			edp->edp_fast_link_training_rate[panel_type] * 20;
@@ -1526,6 +1530,38 @@ parse_edp_fast_link_params(struct intel_display *display,
 			    edp_link_params->vswing);
 		break;
 	}
+
+	/*
+	 * Like the Windows driver, discard the fast link training params if
+	 * the rate exceeds the eDP max port link rate.
+	 */
+	if (panel->vbt.edp.rate && panel->vbt.edp.max_link_rate &&
+	    panel->vbt.edp.rate > panel->vbt.edp.max_link_rate) {
+		drm_dbg_kms(display->drm,
+			    "VBT eDP fast link training rate %d exceeds max link rate %d, ignoring fast link training params\n",
+			    panel->vbt.edp.rate, panel->vbt.edp.max_link_rate);
+		panel->vbt.edp.rate = 0;
+		panel->vbt.edp.lanes = 0;
+		panel->vbt.edp.preemphasis = 0;
+		panel->vbt.edp.vswing = 0;
+		return;
+	}
+
+	/*
+	 * The VBT default fast link training lane count is 1, while hardly
+	 * any eDP panel uses a single lane. Treat a lane count of 1 as not
+	 * specified.
+	 */
+	if (panel->vbt.edp.lanes == 1)
+		panel->vbt.edp.lanes = 0;
+
+	panel->vbt.edp.fast_link_training = true;
+
+	drm_dbg_kms(display->drm,
+		    "VBT eDP fast link training enabled: rate %d, lanes %d, vswing %d, pre-emphasis %d\n",
+		    panel->vbt.edp.rate, panel->vbt.edp.lanes,
+		    panel->vbt.edp.vswing >> DP_TRAIN_VOLTAGE_SWING_SHIFT,
+		    panel->vbt.edp.preemphasis >> DP_TRAIN_PRE_EMPHASIS_SHIFT);
 }
 
 static void
@@ -1555,8 +1591,6 @@ parse_edp(struct intel_display *display,
 	vbt_edp_to_pps_delays(&panel->vbt.edp.pps,
 			      &edp->power_seqs[panel_type]);
 
-	parse_edp_fast_link_params(display, panel, edp);
-
 	if (display->vbt.version >= 173) {
 		u8 vswing;
 
@@ -1577,6 +1611,9 @@ parse_edp(struct intel_display *display,
 		panel->vbt.edp.max_link_rate =
 			edp->edp_max_port_link_rate[panel_type] * 20;
 
+	/* Depends on max_link_rate */
+	parse_edp_fast_link_params(display, panel, edp);
+
 	if (display->vbt.version >= 251)
 		panel->vbt.edp.dsc_disable =
 			panel_bool(edp->edp_dsc_disable, panel_type);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d29169c6..11f90ab1654c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -354,6 +354,7 @@ struct intel_vbt_panel_data {
 		int bpp;
 		struct intel_pps_delays pps;
 		u8 drrs_msa_timing_delay;
+		bool fast_link_training;
 		bool low_vswing;
 		bool hobl;
 		bool dsc_disable;
-- 
2.53.0

