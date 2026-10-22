Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F496606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 04:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nDCn+YzR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA2C10E2AB;
	Thu, 22 Oct 2026 04:06:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DC810E212;
 Thu, 22 Oct 2026 04:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792641958; x=1824177958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kyLi2W2Qa1zn/A1W/GB2a6VRdM2KktpkNGecrz/qtbI=;
 b=nDCn+YzRXRQ3buW3hq9QhNDZ7qJrOg79cWXseu4o7pz8effFGBYhzUeX
 YS3HlHYfwggzp2dTna9f5tHGNrGoUkjZKLWR3bUI45K1YpzvSa5nUCmOQ
 /74vORdUQta5M2rOsQFvjjl716WY+W870TpGd7NS2BXLQLk4GFPIbe7QA
 G0mPR5MhR+0Ud3cpl49XsdXUkv4D5SYWXKgEEF0TxaLzhFBErVsVn+jgZ
 hVNW/+6Y8hM7oyc55P+l1Ev57SPo3Zo1g2X3+N0UbE6Vd+bzRBR0wzPnQ
 QRTd78ofyrGtJJ7Lyhkx0S6UWgWkOh/nn/YiGTvYW/5BXfqI0TB4AW3bV g==;
X-CSE-ConnectionGUID: JKhBBnUDSKOWjpyV7HBKEw==
X-CSE-MsgGUID: 9x+uyOOyQimjS7/XVhEm6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1415568"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1415568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:05:57 -0700
X-CSE-ConnectionGUID: htiQ2XM+SnCQ437tzIzwnQ==
X-CSE-MsgGUID: egdf+++hR9uyWPUkIPBb0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3661216"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 21:05:56 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/display: Limit NVL TRANS_VTOTAL.Vtotal skip to A-step
Date: Thu, 22 Oct 2026 09:35:29 +0530
Message-Id: <20261022040528.1403569-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware issue which required us to keep vtotal as 0 has since been
fixed on B0 well, so applying the workaround there is no longer correct
and causes issues on B-stepping.
Restrict the workaround to A-step only, in both transcoder timing paths
and in the crtc_vtotal readout fixup in intel_vrr_get_config().

Fixes: a78d11e7859b ("drm/i915/display: Skip TRANS_VTOTAL.Vtotal write on NVL pre-C0")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_vrr.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7602f633f49d..de7168fbb220 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2844,7 +2844,7 @@ void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
 		       HSYNC_END(adjusted_mode->crtc_hsync_end - 1));
 
 	if (display->platform.novalake &&
-	    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
+	    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
 		crtc_vtotal = 1;
 
 	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
@@ -2941,7 +2941,7 @@ void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
 	 * is the transcoder's undelayed vblank.
 	 */
 	if (display->platform.novalake &&
-	    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
+	    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
 		crtc_vtotal = 1;
 
 	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d43a06907d18..b14750692ae0 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1147,7 +1147,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 		}
 
 		if (display->platform.novalake &&
-		    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
+		    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
 			crtc_state->hw.adjusted_mode.crtc_vtotal =
 				intel_vrr_vmin_vtotal(crtc_state);
 
-- 
2.34.1

