Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CC010A1E68
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8195610E2EE;
	Thu, 26 Mar 2026 11:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Datylu8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027410E2C7;
 Thu, 26 Mar 2026 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774523909; x=1806059909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8v9ok7mjxzOm+nfGWfrCDEBM98BYv4zX0yMNSQho97A=;
 b=Datylu8KOc+pawsjIiwugJ1afRKKiXynLWF6Es4nb1A2e+o2uQ9wD9xO
 4w6Z5//iZCJAT3TNX6uJbQuG3XGjm182rCPBjbC2eYWR4rgFAYCaUIjEW
 L+xOvsX+Q/PZ1ImNSWJpPYdy4GgRzYq89A3ve2fUmclO22T6/NQgMvhSB
 07mrmOt4KwThBjk5DOVb2DhQsSxaSoEMy2lzt73WNGQWFDK+41d3nqhKB
 QG8PxKYz1Nipg6TV8ZZNe4eK7H1VeozWCHOhD3/xWaWcJfCV2am6vwjDn
 QVuRI4gMF0iX9Mst4F1/9RpewlnnzJZEpQNhSih2Jp0a9mlhbEzeHrsuj A==;
X-CSE-ConnectionGUID: AuH0exLESw2Grl1l1/fcew==
X-CSE-MsgGUID: /YPWG8nVQcqD8P/bwsF5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75692318"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75692318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:18:29 -0700
X-CSE-ConnectionGUID: CYLNEuTnTe65K4e4sa1vuw==
X-CSE-MsgGUID: ab+RMQUfT0yhum2pdC3jDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220127450"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:18:28 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/dsi: Make 'clock_stop' boolean
Date: Thu, 26 Mar 2026 13:18:12 +0200
Message-ID: <20260326111814.9800-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
References: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The DSI 'clock_stop' parameter is a boolean, so use a real
'bool' for it. And pimp the debug print while at it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
index 8e39d2b52c54..0023ac341aa0 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -81,7 +81,7 @@ struct intel_dsi {
 	int video_mode;
 
 	bool eot_pkt;
-	u8 clock_stop;
+	bool clock_stop;
 
 	u8 escape_clk_div;
 	u8 dual_link;
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 51f6a5b82cb2..23da7f5f9578 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -719,7 +719,7 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 	drm_printf(&p, "Burst mode ratio %d\n", intel_dsi->burst_mode_ratio);
 	drm_printf(&p, "Reset timer %d\n", intel_dsi->rst_timer_val);
 	drm_printf(&p, "EoT packet %s\n", str_enabled_disabled(intel_dsi->eot_pkt));
-	drm_printf(&p, "Clockstop %s\n", str_enabled_disabled(!intel_dsi->clock_stop));
+	drm_printf(&p, "Clock stop during BLLP %s\n", str_enabled_disabled(intel_dsi->clock_stop));
 	drm_printf(&p, "Mode %s\n", intel_dsi->operation_mode ? "command" : "video");
 	if (intel_dsi->dual_link == DSI_DUAL_LINK_FRONT_BACK)
 		drm_printf(&p, "Dual link: DSI_DUAL_LINK_FRONT_BACK\n");
@@ -771,7 +771,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 	drm_dbg_kms(display->drm, "\n");
 
 	intel_dsi->eot_pkt = !mipi_config->eot_pkt_disabled;
-	intel_dsi->clock_stop = mipi_config->enable_clk_stop ? 1 : 0;
+	intel_dsi->clock_stop = mipi_config->enable_clk_stop;
 	intel_dsi->lane_count = mipi_config->lane_cnt + 1;
 	intel_dsi->pixel_format =
 		vbt_to_dsi_pixel_format(mipi_config->videomode_color_format);
-- 
2.52.0

