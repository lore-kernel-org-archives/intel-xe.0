Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE609C88E69
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FAE10E949;
	Sun, 13 Sep 2026 15:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXeZQlUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B9810E94B;
 Sun, 13 Sep 2026 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312418; x=1820848418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zw6XnIg5iDoWakYt0J60UruqYJDCBySNZyc82ySY6To=;
 b=VXeZQlUBwuSEnrOpjCM6lwLPyoZ11bEHbb2u2LQ0K7Pq6sw5yO745eOM
 P4iohBvMM5R7A092krxuEwiqu3T/U/RQ+RcwTfl6sqU8+/px8RPM9+iK+
 PbvxH+x9d/IKBhdcEjgKhsyqyr053glxdTYuXCLQYJI6q5EqV9nENZ+LW
 r84erSp+JhSkVg68jYJa3xWLM/24Y1DnhTdZIEOrYEWx7M/q7oDexUKfR
 dwj7EIqTfaXT+96/I6bYGaa/qq0s0cKtclLNvVuQQkLS4KWS4b69OMfuK
 6rfncn9aoNOYRUYdNyO580gn7Eh+H4VFA1LISUvjZ1nl8Vs2VldyEzvpy w==;
X-CSE-ConnectionGUID: uk4mrXvAQsiipRzJ8T22kg==
X-CSE-MsgGUID: AKGrVKpOSY2Rvv2o9bQLhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388775"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388775"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:38 -0700
X-CSE-ConnectionGUID: uihwnvhiTbWJkVwa4t2a0Q==
X-CSE-MsgGUID: BR7+n48oTQOyE9Der2/6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694171"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:36 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 09/13] drm/i915/dip: Store SDP transmission lines in
 crtc_state
Date: Sun, 13 Sep 2026 20:26:44 +0530
Message-ID: <20260913145649.3240904-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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
index bcaf42cefa17..105d25123db3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1012,6 +1012,12 @@ struct intel_dip {
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

