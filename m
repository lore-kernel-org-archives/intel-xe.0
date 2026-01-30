Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85FED49C78
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6AA10E933;
	Fri, 30 Jan 2026 08:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQu1g4Hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AB910E930;
 Fri, 30 Jan 2026 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769762044; x=1801298044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dgkL8Mo6vBxATXoy/0hIq+Fl/QTWlzZGZIQHL7Sbu5w=;
 b=bQu1g4HcT4lQV6Qopctfhk34oukJfPy3X1UR0xqziU5biqUL4sgnsJos
 FIWW+8qiDqcXAPWw2ECQ0bFBzVnEgJtj7iFdjRIDAxh3NvM6bjF72R3Wn
 Y3LrHjnYD6KBOn1H0rNn5hBxzCkuUiHE6JtuKE4qwv6gIgBppG4ZQcvGS
 fHIcrXY08JqsyAex1yFBaUrYsHOHB0tqihdM3B6TMxyhGwl29NahGzrFW
 EAlTdljb1QebAIibu240KLUb0VHHGmfehb2s1fsGH2XV5PuI7xUMawEdW
 Ae4Nl2crVyTN3ZSnXWteViUMSqVH6t6JrJsGFo2cuJpihgqE5/dlenePc Q==;
X-CSE-ConnectionGUID: NlPu7WR7Q0Srn0x8pJHYvw==
X-CSE-MsgGUID: +Ip/GkX/QzKLPKDn7sT+ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74636608"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74636608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:03 -0800
X-CSE-ConnectionGUID: IwuQSCa6R9SoyTduVONVnA==
X-CSE-MsgGUID: Krcf4wjITait+NdBNAwBog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208910041"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:02 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/17] drm/i915/dp: Move num_joined_pipes and related checks
 together
Date: Fri, 30 Jan 2026 13:47:57 +0530
Message-ID: <20260130081812.32087-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
References: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
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

Move the calculation of `num_joined_pipes` and other constraints that
depend on it, into a single block.
This groups all joiner-dependent logic together, preparing the code for a
future loop-based evaluation of multiple joiner configurations.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 126da297efc5..c0a8ffac6312 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1472,20 +1472,9 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 		target_clock = fixed_mode->clock;
 	}
 
-	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
-						     mode->hdisplay, target_clock);
-	max_dotclk *= num_joined_pipes;
-
 	sink_format = intel_dp_sink_format(connector, mode);
 	output_format = intel_dp_output_format(connector, sink_format);
 
-	status = intel_pfit_mode_valid(display, mode, output_format, num_joined_pipes);
-	if (status != MODE_OK)
-		return status;
-
-	if (target_clock > max_dotclk)
-		return MODE_CLOCK_HIGH;
-
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
@@ -1496,6 +1485,17 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 					   target_clock, mode->hdisplay,
 					   link_bpp_x16, 0);
 
+	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
+						     mode->hdisplay, target_clock);
+	max_dotclk *= num_joined_pipes;
+
+	if (target_clock > max_dotclk)
+		return MODE_CLOCK_HIGH;
+
+	status = intel_pfit_mode_valid(display, mode, output_format, num_joined_pipes);
+	if (status != MODE_OK)
+		return status;
+
 	if (intel_dp_has_dsc(connector)) {
 		int pipe_bpp;
 
@@ -1538,14 +1538,14 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	if (intel_dp_joiner_needs_dsc(display, num_joined_pipes) && !dsc)
 		return MODE_CLOCK_HIGH;
 
-	if (mode_rate > max_rate && !dsc)
-		return MODE_CLOCK_HIGH;
-
-	status = intel_dp_mode_valid_downstream(connector, mode, target_clock);
+	status = intel_mode_valid_max_plane_size(display, mode, num_joined_pipes);
 	if (status != MODE_OK)
 		return status;
 
-	return intel_mode_valid_max_plane_size(display, mode, num_joined_pipes);
+	if (mode_rate > max_rate && !dsc)
+		return MODE_CLOCK_HIGH;
+
+	return intel_dp_mode_valid_downstream(connector, mode, target_clock);
 }
 
 bool intel_dp_source_supports_tps3(struct intel_display *display)
-- 
2.45.2

