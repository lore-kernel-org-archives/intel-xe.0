Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE39EC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A510E4B6;
	Tue, 15 Sep 2026 17:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQjgQw0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F13410E4B6;
 Tue, 15 Sep 2026 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491829; x=1821027829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjNIVqFPNdGXkDZPXifcbIRad+DSSkpD1frfhBNa8PU=;
 b=MQjgQw0hWKtFaSydA8WkMOuwaf96SqomEWNEyn/q7wqTaoFU3jlfFNSN
 FAal7Tzz+Pgzz3LDeIiqEw4Ey2ck3DLIYtF0BhWNvbOdK+aWULNymqgoy
 pwDbSQDVKw4HC2VBv5Ap64FCU9joR8HKDUoj3/VeIXGrZB6EaeUmlBeu9
 ryVpRJbiVLJp++KAkY2Zaz043JSWu+crXkA2aklwHWGiwHVZ68M5Yo0Mq
 wfXy5ATgCy6qv5I2YyYFvBnb4WSG4iftlHnzHtqW7wwastG8bXnPavZLl
 oMQiCO/6hnw72mC6X2E7InFKZVaqZbC6Kv9y3cHXD+GOOuyT38rkGpf3R w==;
X-CSE-ConnectionGUID: 4wVn026nSGWVsgkPLuHFMg==
X-CSE-MsgGUID: BfsvdG29RBeQLho2i9tyIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371896"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:49 -0700
X-CSE-ConnectionGUID: +5cOIZe0QqylbOGaXeRwfQ==
X-CSE-MsgGUID: XyPFGO4+T3yMvXViKh2h1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443920"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:47 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 09/14] drm/i915/dip: Store SDP transmission lines in
 crtc_state
Date: Tue, 15 Sep 2026 22:16:50 +0530
Message-ID: <20260915164657.3429075-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

Currently the driver only programs the transmission line for the
Adaptive-Sync SDP, while the hardware controls the transmission lines for
other SDPs.

Starting with Xe3p_lpd, the hardware allows the driver to program
transmission lines for additional DP SDPs. Prepare for this by adding
fields to struct intel_crtc_state to store SDP transmission lines, and
include them in pipe config comparison.

The SDP transmission line fields track vrr.vsync_start/vtotal, which are
allowed to change during a seamless LRR fastset. Guard their pipe config
comparison under !fastset, same as vrr.vsync_start/vsync_end, so a fastset
is not unnecessarily turned into a full modeset.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c       | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_types.h | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5e8f2e48e95b..e052c5ad99d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5603,6 +5603,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.dc_balance.max_decrease);
 		PIPE_CONF_CHECK_I(vrr.dc_balance.vblank_target);
 		PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
+		PIPE_CONF_CHECK_I(dip.gmp_sdp_tl);
+		PIPE_CONF_CHECK_I(dip.pps_sdp_tl);
+		PIPE_CONF_CHECK_I(dip.vsc_sdp_tl);
+		PIPE_CONF_CHECK_I(dip.vsc_ext_sdp_tl);
+		PIPE_CONF_CHECK_I(dip.cmn_sdp_tl);
 	}
 
 	if (!fastset || intel_vrr_always_use_vrr_tg(display)) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 334179685ea2..79f30660c2b6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1013,6 +1013,12 @@ struct intel_dip {
 	 * The programmed transmit line is (Vtotal - value)
 	 */
 	u16 emp_as_sdp_tl;
+	u16 gmp_sdp_tl;
+	u16 pps_sdp_tl;
+	u16 vsc_sdp_tl;
+	u16 vsc_ext_sdp_tl;
+	/* Common SDP Base transmission line (Xe3p_lpd+) */
+	u16 cmn_sdp_tl;
 };
 
 struct intel_crtc_state {
-- 
2.50.1

