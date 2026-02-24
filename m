Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE946EFB813
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 07:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2423410E274;
	Tue, 24 Feb 2026 07:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/Loht5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A1510E246;
 Tue, 24 Feb 2026 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771919388; x=1803455388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFZFXjzxaTZPVPXTfUGRTfvmH+H2l3fEyZe7TCxEQVE=;
 b=J/Loht5vPuqo9VQ+CkkSlEr/bHVDW7zap5hE8rOO6x9RODYPg+9ABq8p
 KL0mhGGwm10RRtpNBY5M1m4SrIq7eeU2oXq6BB6du7MQ+cIw38PaEZQKn
 Se1KsLVBjkZQXCHY1zGXoqyIx9GHvErIxnAfOdlXvu4hbfCGsGcDAK0is
 GMZE8MmwbN/9e4IV5dFqmV5q+697+hmNYlA7bDlKxE9d5Az8P3qfe6WTN
 rt1feXp+OrZHQCqqlsJrcWLlulgP4Q65oFR/wAKHp/GsBSPGqNUvvt18+
 LFBtf7yM+44O9PrxU9/icSPpygrratbDlI/Htm5pL7w9AIerWFfY3Bnqd w==;
X-CSE-ConnectionGUID: hor3pc0NRXW607CiHhBi1g==
X-CSE-MsgGUID: nkzMI2bZR52hWUm92X8uAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73033804"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73033804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:49:47 -0800
X-CSE-ConnectionGUID: +JfDwG1ZSpaKA++xweGSrA==
X-CSE-MsgGUID: VHf7qzyKSbmmL8B/Bk80rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="243826659"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 23:49:45 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, suraj.kandpal@intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2] drm/i915/dp: On DPCD init/caps wake the DPRx
Date: Tue, 24 Feb 2026 13:18:30 +0530
Message-Id: <20260224074831.374990-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219094326.34922-1-arun.r.murthy@intel.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
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

Its observed that on AUX_CH failure, even if the retry is increased to
1000, it does not succeed. Either the command might be wrong or sink in
an unknown/sleep state can cause this. So try waking the sink device.
Before reading the DPCD caps wake the sink for eDP and for DP after
reading the lttpr caps if present and before reading the dpcd caps wake
up the sink device.

v2: Use poll_timeout_us (Jani N)
    Add the reason, why this change is required (Ville)

Closes: https://issues.redhat.com/browse/RHEL-120913
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 38 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |  1 +
 .../drm/i915/display/intel_dp_link_training.c |  3 ++
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 025e906b63a9..fa0730f7b92a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4705,6 +4705,42 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 	intel_edp_set_data_override_rates(intel_dp);
 }
 
+/* Spec says to try for 3 times, its doubled to add the software overhead */
+#define AUX_CH_WAKE_RETRY	6
+
+void intel_dp_wake_sink(struct intel_dp *intel_dp)
+{
+	u8 value = 0;
+	int ret = 0;
+
+	intel_dp_dpcd_set_probe(intel_dp, false);
+
+	/*
+	 * Wake the sink device
+	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
+	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
+	 */
+	ret = poll_timeout_us(ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_SET_POWER, &value),
+			      ret > 0,
+			      1000, AUX_CH_WAKE_RETRY * 1000, true);
+
+	/*
+	 * If sink is in D3 then it may not respond to the AUX tx so
+	 * wake it up to D3_AUX_ON state
+	 * If the above poll_timeout_us fails, try waking the sink.
+	 */
+	if (value == DP_SET_POWER_D3 || ret < 0) {
+		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1 sec 2.3.1.2) */
+		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
+				   DP_SET_POWER_D0);
+		fsleep(1000);
+		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
+				   DP_SET_POWER_D3_AUX_ON);
+	}
+
+	intel_dp_dpcd_set_probe(intel_dp, true);
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
@@ -4713,6 +4749,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	/* this function is meant to be called only once */
 	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
 
+	intel_dp_wake_sink(intel_dp);
+
 	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
 		return false;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index b0bbd5981f57..3f16077c0cc7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -232,6 +232,7 @@ bool intel_dp_dotclk_valid(struct intel_display *display,
 bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 				     int hdisplay,
 				     int num_joined_pipes);
+void intel_dp_wake_sink(struct intel_dp *intel_dp);
 
 #define for_each_joiner_candidate(__connector, __mode, __num_joined_pipes) \
 	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 54c585c59b90..cbb712ea9f60 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -270,6 +270,9 @@ int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
 		lttpr_count = intel_dp_init_lttpr(intel_dp, dpcd);
 	}
 
+	/* After reading LTTPR wake up the sink before reading DPRX caps */
+	intel_dp_wake_sink(intel_dp);
+
 	/*
 	 * The DPTX shall read the DPRX caps after LTTPR detection, so re-read
 	 * it here.
-- 
2.25.1

