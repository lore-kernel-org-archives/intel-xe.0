Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80317606A32E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mX0s1Rjd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE9310EDEF;
	Mon,  2 Nov 2026 13:03:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BDE10EDD9;
 Mon,  2 Nov 2026 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793624603; x=1825160603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=clckMM1fkRGFfGEKGI+1MKNqpb3FGuVOcJaLnrAUTXg=;
 b=mX0s1RjdtM2rD3z/e/5erHAGM4aaI0A50WqfD39yAlKPFgSjf2czD8kN
 s/QUbuIijGwLKln1DAEYScT46FOlKZjiUN2MoprabdXDhJGjTx/SD3WU1
 z/pwRl578zSd390iflubnJoauPwIzgZ+PYpOjBoKUfV08VBfQna7+1Dxs
 ecjpca6dIjGJFDH8jR3ouZnkr2MYKVJbpX/E9nsUvTqEWLZzYiY53vh2L
 sx3fUixNhfvE9wFe/BPXIGUz75ZhsAfauoET0lYH41Qh5ykeigJGnjJwi
 01uY8IhCFgmLSm5R+LM8/W4d0/gwhWvlQN8RWSqkUpp3TQw0Rpgzqp0+c w==;
X-CSE-ConnectionGUID: sHSV4MtcR2yf+79uWAQGtQ==
X-CSE-MsgGUID: ly6cTL2WRV2Ulb3H6hP+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2340416"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2340416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 05:03:23 -0800
X-CSE-ConnectionGUID: Dp3AUE0QRzio3BthjTuxdg==
X-CSE-MsgGUID: HSG5uK2QQy2AUbzSIN2+tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6204111"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 05:03:22 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915: Reject < 10 MHz dotclocks early
Date: Mon,  2 Nov 2026 15:03:19 +0200
Message-ID: <20261102130319.2747-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We don't want bogus modes with an unreasonably low dotclock
to reach the rest of the code so filter them out early.
Super low dotclocks could lead to overflow etc. issues
in various timing related calculations.

The actual PLL low limit for our hardware is platform
specific, and at least for the older platforms it's
generally around 20 MHz. Not sure about the more recent
platforms.

The lowest dotclock one can find in the drm_edid.c mode lists
is 13.5 MHz. Those are actually the modes that require
double clocking to reach above the DVI/HDMI specified minimum
of 25 MHz for the TMDS clock.

Our connector mode validation currently rejects:
- VGA/HDMI: < 25 MHz
- DP SST/MST: < 10 MHz
- SDVO: limits queried from SDVO device
- others: currently no limit

But do note that the user supplied mode during actual
modesets will not be checked against the connector
mode validation limits. HDMI does have somewhat reasonable
checks also for modeset time, but others perhaps do not.

Given all that let's choose a somewhat arbitrary 10 MHz
as our overall driver wide dotclock limit. This will now be
enforced not only during connector mode validation but also
as a hard limit for actual modesets.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5e40487e9ab0..b777d9c4dd4f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8395,6 +8395,13 @@ enum drm_mode_status intel_mode_valid(struct drm_device *dev,
 	if (mode->clock > max_dotclock(display))
 		return MODE_CLOCK_HIGH;
 
+	/*
+	 * Somewhat arbitrary low limit of 10 MHz to
+	 * reject completely bogus modes early on.
+	 */
+	if (mode->clock < 10000)
+		return MODE_CLOCK_LOW;
+
 	/* Transcoder timing limits */
 	if (DISPLAY_VER(display) >= 11) {
 		hdisplay_max = 16384;
-- 
2.56.0

