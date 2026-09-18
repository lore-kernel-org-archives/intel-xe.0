Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADC2C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19C810F17B;
	Fri, 18 Sep 2026 06:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djnfvfv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BF910F17B;
 Fri, 18 Sep 2026 06:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789711471; x=1821247471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GYS/WhhQrnBA3UPAs+tZnetuNaPKLOAVApiOpGHlawE=;
 b=djnfvfv4KxvPM83ThkUORO+ktvnP3EruYrSm7WOet6p8uGLRxXB3L2F1
 GsDlSV2GaitVYzG8zi2ZxndBD6Vp2vTfBt52VSsIfZEXqJrSQeRxnaYj/
 Th36CV+rabjupNQJLVyrr9oG/7UFMVwhSDycFFEWIyNSo8+3Qj1OC17Xi
 t7NhdhMTMf+lShmOm9Go6BZi/Zw0p2Idw4+L8794WFs7sGJebpWZ4m5Rd
 H7yOpVzNwEH8/1R3eX0P0ZU7wcS7U+KCP8KWvi1/kgtgYL8NNaAVxozUj
 95yLvIh3KJIzLLZ/eHL15ffe73eZxW5sNyeR9y0JsTLTm/zmVSH5zno9m g==;
X-CSE-ConnectionGUID: c77dRZOvRCazchmvO3UC/A==
X-CSE-MsgGUID: UiKGY8pdQAiiZs7qmqYmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90059892"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208,223";a="90059892"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 23:04:30 -0700
X-CSE-ConnectionGUID: HTxuxdCbRCitSvHNIyCfUg==
X-CSE-MsgGUID: UJcUXLY7Rmm/IsNLfbdtrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
 d="scan'208,223";a="276203068"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2026 23:04:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: [PATCH] drm/i915/dp: Disable DC5/6 before AUX programming
Date: Fri, 18 Sep 2026 11:34:26 +0530
Message-Id: <20260918060426.1162123-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
which powers down the PHY. Which means we need to make sure Step 4
of AUX Programming sequence is honored.
Disable Dc5/6 when programming AUX.

Bspec: 68851, 68967
Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 3cb07b0a901c..350dac72c996 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	u32 aux_clock_divider;
 	enum intel_display_power_domain aux_domain;
 	struct ref_tracker *aux_wakeref;
+	struct ref_tracker *dc_off_wakeref = NULL;
 	struct ref_tracker *pps_wakeref = NULL;
 	int i, ret, recv_bytes;
 	int try, clock = 0;
@@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	aux_wakeref = intel_display_power_get(display, aux_domain);
 
+	(HAS_LT_PHY(display))
+		dc_off_wakeref = intel_display_power_get(display, POWER_DOMAIN_DC_OFF);
+
 	/*
 	 * The PPS state needs to be locked for:
 	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
@@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	if (pps_wakeref)
 		intel_pps_unlock(intel_dp, pps_wakeref);
 
+	if (dc_off_wakeref)
+		intel_display_power_put(display, POWER_DOMAIN_DC_OFF, dc_off_wakeref);
+
 	intel_display_power_put_async(display, aux_domain, aux_wakeref);
 out_unlock:
 	intel_digital_port_unlock(encoder);
-- 
2.34.1

