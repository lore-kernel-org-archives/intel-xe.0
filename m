Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C1EC98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 05:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2580F10E8EB;
	Thu, 24 Sep 2026 05:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmwxU9JP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5510E8EB;
 Thu, 24 Sep 2026 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790229506; x=1821765506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAKrsPbm5lr6CwrKpmq7Z8WFV9U5iOWO2pT7hemspNs=;
 b=AmwxU9JPhBSh7FMLKSY/b3/o5ln00Fpwou6DYTpnCoM5PO40kpfDoEWe
 3/dsM0R4WyGpgmN0ZJj9Vd/KnIGUqVdmTEnTHQwVAQAimE0sm4ncRAgX2
 bzA0IcRn/cmzYQLMC+Be1AQylAZWM9cUnsDUik+iQ4FAJNU7l78vAApBL
 nATMOoDP2EPJdc+9UgftYlBDCOaSeyabyIkBFU2OhW270FJeBaDWOx3/N
 CrJRQlANtGphW0AkOvhFJfnDtjPiKY4qZniwTus+oix62qYZMVh0NctpL
 EuNSqttS3ytKMuvu4txTtAcMy61krFt1gWYZhrx6S9C5A3Nz4Q2PgAcxV g==;
X-CSE-ConnectionGUID: GEZ1IeDhRy6juNwfEgSXEg==
X-CSE-MsgGUID: N34psKNYT6KYL554Sd2Hvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107375101"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="107375101"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:58:26 -0700
X-CSE-ConnectionGUID: 8i2O/PdBR9SDpaXIP1Lrvw==
X-CSE-MsgGUID: XRETbzM/RU66pROVFYGx+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="5170440"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 22:58:24 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 animesh.manna@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
Date: Thu, 24 Sep 2026 11:27:37 +0530
Message-Id: <20260924055734.2138787-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924055734.2138787-1-suraj.kandpal@intel.com>
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
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

Bspec allows transcoder A and transcoder B to drive either port A or
port B with DC3co, and CMTG doesn't restrict this. Requiring
a strict 1:1 mapping on Xe3p_LPD just loses DC3co on eDP panels wired to
the other port.

Bspec: 75253
Fixes: d75ea53314db ("drm/i915/display: Add DC3CO compute and set target state in commit tail")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 1b60ce2dd00c..4ce941319664 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -427,18 +427,14 @@ void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger
 static bool intel_dc3co_port_pipe_compatible(struct intel_dp *intel_dp,
 					     const struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 	enum port port = dig_port->base.port;
 	int num_pipes = intel_crtc_num_joined_pipes(crtc_state);
 
-	/* Need to follow 1:1 mapping because of CMTG restriction */
-	if (DISPLAY_VER(to_intel_display(crtc_state)) == 35)
-		return num_pipes == 1 &&
-		       ((pipe == PIPE_A && port == PORT_A) ||
-			(pipe == PIPE_B && port == PORT_B));
-	else
-		return num_pipes == 1 && pipe <= PIPE_B && port <= PORT_B;
+	return DISPLAY_VER(display) == 35 && num_pipes == 1 && pipe <= PIPE_B &&
+		port <= PORT_B;
 }
 
 void intel_display_power_dc3co_compute(struct intel_atomic_state *state)
-- 
2.34.1

