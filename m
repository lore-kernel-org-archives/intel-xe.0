Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27746EDEC12
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 06:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC8410E0A2;
	Wed,  4 Mar 2026 06:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4mV2BIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005DB10E0A2;
 Wed,  4 Mar 2026 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772606411; x=1804142411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PAI+zyj+UyhHi8ft+VJXQTm/UdFKP74jA4J4chYgW54=;
 b=D4mV2BICD6GS0aUP3C8lSpDQ/qAz60dWxoIEwNHxq1KLKrZeL5Tj8l4y
 68gvNe7l809JGYTjHOfOkQe0URGqK+Y0JB8R+3gWEWoMVHE8hDBf9SA+P
 k+xABtJ/+tusuhUtOIXYMay3oGWzK7GEQ+/AiBM3a9/yAo1zNUPIQ5/xg
 iKls6Qr2foQwIKbje7MoG+ftx7Aejt+k+m77LMegl75LDW8dc8/6/tbYF
 Cvh1kUlWaOoyxvmquKQkqrYSg3R9q4DD0YrZ6VS14el37U12v9ALQg4xj
 6fOfE+VNnWAF5qWdEjEFwl69thWAR8jg+XfbmNRX2bY8yuMVY8aDQM8Qw Q==;
X-CSE-ConnectionGUID: jubra9n3QfaL1j9Hcq2S0A==
X-CSE-MsgGUID: 7aa7p05vTbCDjsHTMvpoCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84750278"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84750278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 22:40:10 -0800
X-CSE-ConnectionGUID: sNMqrdd+SFuAtzcd5SKLcw==
X-CSE-MsgGUID: xTJJF8iGRveJA0VBr+/HqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241258264"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2026 22:40:08 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 jouni.hogander@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv5] drm/i915/dp: Read ALPM caps after DPCD init
Date: Wed,  4 Mar 2026 12:08:19 +0530
Message-Id: <20260304063819.1120877-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260302033630.428913-1-arun.r.murthy@intel.com>
References: <20260302033630.428913-1-arun.r.murthy@intel.com>
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

For eDP read the ALPM DPCD caps after DPCD initalization and just before
the PSR init.

v2: Move intel_alpm_init to intel_edp_init_dpcd (Jouni)
v3: Add Fixes with commit-id (Jouni)
v4: Separated the alpm dpcd read caps from alpm_init and moved to
intel_edp_init_dpcd.
v5: Read alpm_caps always for eDP irrespective of the eDP version (Jouni)

Fixes: 15438b325987 ("drm/i915/alpm: Add compute config for lobf")
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 6 ------
 drivers/gpu/drm/i915/display/intel_dp.c   | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index b3334bc4d0f9..a7350ce8e716 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -44,12 +44,6 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 
 void intel_alpm_init(struct intel_dp *intel_dp)
 {
-	u8 dpcd;
-
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP, &dpcd) < 0)
-		return;
-
-	intel_dp->alpm_dpcd = dpcd;
 	mutex_init(&intel_dp->alpm.lock);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 025e906b63a9..37783b7e3bed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4709,6 +4709,7 @@ static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret;
 
 	/* this function is meant to be called only once */
 	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
@@ -4748,6 +4749,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	 */
 	intel_dp_init_source_oui(intel_dp);
 
+	/* Read the ALPM DPCD caps */
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP,
+				&intel_dp->alpm_dpcd);
+	if (ret < 0)
+		return false;
+
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
 	 * for SET_POWER_CAPABLE bit in intel_dp->edp_dpcd[1]
-- 
2.25.1

