Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3565E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 08:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D91210E0D1;
	Thu, 19 Feb 2026 08:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcFhE2Y/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF3410E0D1;
 Thu, 19 Feb 2026 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771490016; x=1803026016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iPzD1yVq7RudhIWMyC/sCYcnZKK6Buj3b2o1VZl8O70=;
 b=VcFhE2Y/eUE32aj0BZ7sKXKkDYx7h7mqylC4mmn/O6OXjodvhS6Qo6ks
 eDhUzcfqF77O9o6q+cYPsT7ETIYCVNiGW636ZQbO+cMXvLUZdQf9tXT3l
 U3Y6xZ/RmYZ9H5ARZ6EVTY1DeMyUlHby19zULiIARXC8hYdb0pJrWyPXp
 gmxZ0d04un8bjCg/SZYO6UHWwnBgTcqCyBdZgqGfroi0m5hr2JxzM/x8w
 GP0H3ModHAmtQ9be7trwXhgJ9+8dtwmCsbmbpmpMlPNWfQoYbNx243zek
 KnC5dg3tnsqNezgo4/tEx9vJCgnMUHFCUogcUBikUPCFuaVphJlY3iG1v g==;
X-CSE-ConnectionGUID: biaDmS99TpacuKvfiyMYew==
X-CSE-MsgGUID: 0tEU7+ydQ4+TFT2viHkScg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72666597"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72666597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 00:33:36 -0800
X-CSE-ConnectionGUID: 94YnVToxRiSl5oBP0pmsSw==
X-CSE-MsgGUID: k/QXeCikRl+gtSGTb+9saw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213076659"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2026 00:33:34 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/display/dp: On dpcd init/caps wake the dprx
Date: Thu, 19 Feb 2026 14:02:19 +0530
Message-Id: <20260219083219.32256-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Before reading the dpcd caps for eDP wake the sink device and for DP
after reading the lttpr caps and before reading the dpcd caps wake up
the sink device.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |  1 +
 .../drm/i915/display/intel_dp_link_training.c |  3 ++
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 454e6144ee4e..4d86826dba1b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4705,6 +4705,32 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 	intel_edp_set_data_override_rates(intel_dp);
 }
 
+void intel_dp_wake_sink(struct intel_dp *intel_dp)
+{
+	u8 value = 0;
+	int ret = 0, try = 0;
+
+	intel_dp_dpcd_set_probe(intel_dp, false);
+
+	/*
+	 * Wake the sink device
+	 * Spec section 2.3.1.2 if AUX CH is powered down by writing 0x02 to
+	 * DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
+	 */
+	while (try < 10 && ret < 0) {
+		ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_SET_POWER, &value);
+		if (value)
+			break;
+		fsleep(1000);
+		try++;
+	}
+	/* After setting to D0 need a min of 1ms to wake(Spec sec 2.3.1.2) */
+	drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	fsleep(1000);
+
+	intel_dp_dpcd_set_probe(intel_dp, true);
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
@@ -4713,6 +4739,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
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

