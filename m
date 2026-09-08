Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9009EC79FAB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29CC10EA02;
	Tue,  8 Sep 2026 06:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeNqOuRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F270410E9F4;
 Tue,  8 Sep 2026 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849558; x=1820385558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5nu4Lhj+BTHMcew7BoW9erWPeh2ZnOVyuNLjlyyKIM=;
 b=jeNqOuRE05xGM0Zqa2aK/AUtBKku5O27Jd9TwyEn287vyRvhvwEGXSzU
 yPIZC6+/JdJ5Z0EWbuSRKPYOvSRokBJKcxes2u6DHAiEh4jXqCowM+UPy
 cDDXP2ExjP35Ju/TeTN2pRpOg7cZ1/qTMpJtldVcUTx4tIkBOetbbJiHg
 zdpi//VWrHACXOXuDPU1vkgh9WD94W28OUWeJdJOcLIJjVYrDH3CiInMk
 9hvjnAeuQhApTHEsBYyE+Yb0qJoXbPr0NtaW3gXpvhLMIqcFMaVRmD/k6
 Uvl0LP9edFYsm+6/5cKrzGTuAPl5gtQWRMALxFNz6fth0+kIrD0X0R6j9 Q==;
X-CSE-ConnectionGUID: bD+XcU5tQueMqn/oiI8c0Q==
X-CSE-MsgGUID: 3I305Q6dTyGdfnTiONahqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061799"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061799"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:18 -0700
X-CSE-ConnectionGUID: kFJkTdliTjOZWpMFNXrqJQ==
X-CSE-MsgGUID: OTvqi+oCSIiUU3v/jiUGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702473"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:15 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 09/12] drm/i915/dip: Store SDP transmission lines in
 crtc_state
Date: Tue,  8 Sep 2026 11:52:20 +0530
Message-ID: <20260908062224.2897987-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.h     | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index e9959356226e..03ef749a79ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -51,6 +51,12 @@ struct intel_dip {
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
 
 void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6dd2626256cf..9f4be9bf150e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5604,6 +5604,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(set_context_latency);
 
 	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.gmp_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.pps_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.vsc_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.vsc_ext_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.cmn_sdp_tl);
 
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
-- 
2.50.1

