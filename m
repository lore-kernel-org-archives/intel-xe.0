Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02559606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGNIPueD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4E112AA2;
	Fri, 20 Nov 2026 14:23:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1742110E913;
 Fri, 20 Nov 2026 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184594; x=1826720594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uq9V/leeYr2RwuAcHXxo761c2nk3wNDc8BuW7uJS1xc=;
 b=KGNIPueDsZoQrkbXgbcaM4OwzPobG0ab5fKPJigPRz+Ztw6824cZFuFZ
 wyuCyU3QUn/mouhlMB32AAQag995i6qRW7kqdIXiGnsFeRX3KqwYtMyfb
 4WyzwNwL8FwWpuLCLV9RbDOAh0o9Vbd1IKbS72cg9v6HOzgaP/6STBcoC
 4P1zhyzhQAlsXN5BNQ8EXq8MQosq76x75bQfzhNrYsH3Lxl0W+SM0lrgL
 bmHQbNDaiDyHLZvJUijGUO3I3LVnSh3+Y/pFQypEJ++cnwoT1I0Es5FNT
 WMYZFHLxhfmTnLpbwp4ATM6UyzDxzjpE81heIsVtDGRaETMTovA60fnki g==;
X-CSE-ConnectionGUID: 9crPqbgxTGSqPt8XcZnxxA==
X-CSE-MsgGUID: MAWslcApTfqSO10pGY9KVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090893"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090893"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:14 -0800
X-CSE-ConnectionGUID: ewPwyiFMT+6CKMpYv7Wb5g==
X-CSE-MsgGUID: Pwm1rv0fQOWi+B0SiSelgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12421989"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:12 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 03/29] drm/i915/dp: Add a wrapper to check frl/tmds downstream
 constraints
Date: Fri, 20 Nov 2026 19:37:03 +0530
Message-ID: <20261120140729.466177-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a wrapper function to check dp_downstream clock/bandwidth
constraints. Based on whether the sink supports FRL/TMDS the wrapper
calls the appropriate FRL/TMDS functions.

v2: Don't modify the dfp.maxdotclock check which deals with VGA.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 05d78763c716..82a4e3abf4ae 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1216,6 +1216,28 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	return MODE_OK;
 }
 
+static bool
+intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp)
+{
+	return intel_dp->dfp.pcon_max_frl_bw &&
+		intel_dp_hdmi_sink_max_frl(intel_dp);
+}
+
+static enum drm_mode_status
+intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
+		       int target_clock, int bpc,
+		       enum intel_output_format sink_format,
+		       bool respect_downstream_limits)
+{
+	if (intel_dp_pcon_sink_support_frl(intel_dp))
+		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
+					     sink_format,
+					     respect_downstream_limits);
+
+	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc, sink_format,
+					 respect_downstream_limits);
+}
+
 static enum drm_mode_status
 intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       const struct drm_display_mode *mode,
@@ -1223,21 +1245,13 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       enum intel_output_format sink_format)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
-
-	/*
-	 * If PCON supports FRL MODE, check FRL bandwidth constraints.
-	 * Assume 8bpc for the HDMI2.1 FRL BW check
-	 */
-	if (intel_dp->dfp.pcon_max_frl_bw && intel_dp_hdmi_sink_max_frl(intel_dp))
-		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8, sink_format, true);
+	int bpc = 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw check */
 
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
 
-	/* Assume 8bpc for the DP++/HDMI/DVI TMDS clock check */
-	return intel_dp_tmds_clock_valid(intel_dp, target_clock,
-					 8, sink_format, true);
+	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format, true);
 }
 
 static enum drm_mode_status
-- 
2.50.1

