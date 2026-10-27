Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55550606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/jDJZcS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0416710E0F2;
	Tue, 27 Oct 2026 02:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E83B10E0F2;
 Tue, 27 Oct 2026 02:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793069977; x=1824605977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wc/sJiss4XXnfSr8lhZWbdzeiQIHLn0r4nsyG5FYmPU=;
 b=A/jDJZcSqPTvbaJZvvUM5XCQ/9MZb/gE8aTVQjM9HxtzKy2qh+TBXvHK
 lK4ox0ea47eb3GoYT9qeaaHzAqDYXP79gEyPmPhN1V4cFzRNIvTWwZX0S
 J6RxICJooVPpcJATp7ouRj3oEyHfCLtaJ5d9CYpiLqh4gGVgtdrFEvSUq
 8kUW50Te5/7e6eUB2d1VQthaFC8Cs40gAaf9LHZuRoK9AdNtabDrRVCLh
 SB1sDVYgw++mFd9D7jtRe5rqbxH7zgqXxl+kPMOK92l9NK4SYGX0ezDQ5
 G58fDdDhbkQMyImwQhH0htjpCea8CbPJl5Bf0Jidu46ITvUJbMKOReWH1 g==;
X-CSE-ConnectionGUID: A5bOAtGbSTKNE/Gyca4PtA==
X-CSE-MsgGUID: 3LK1xbY3QH2YJVVPwEwitg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1761312"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1761312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 19:59:35 -0700
X-CSE-ConnectionGUID: ANN6JCqKRVahYn8RXDaO/A==
X-CSE-MsgGUID: 3HlD0sPcT8eoRuQHWmeUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4823163"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 19:59:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/dp: Add quirk to allow eDP joiner on ASUS ROG Strix
 SCAR 18
Date: Tue, 27 Oct 2026 08:13:34 +0530
Message-ID: <20261027024334.1140596-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Arrow Lake, VBT defaults the eDP pipe joiner enable bit to
disabled, and commit 650471948e49 ("drm/i915/dp: Avoid joiner for
eDP if not enabled in VBT") made the driver honor that default.

On the ASUS ROG Strix SCAR 18 (G835LXG), the bit in VBT is left to
the platform default instead of enabling it, even though the
3840x2400@240Hz panel requires the joiner to reach its native
mode. As a result the mode is pruned and the panel is limited to
120Hz.

Since the VBT bit cannot be relied upon globally for ARL (it is
needed to block the joiner on at least one other machine), add a
machine-specific quirk, to bypass the VBT restriction and allow the
joiner on this machine.

Fixes: 650471948e49 ("drm/i915/dp: Avoid joiner for eDP if not enabled in VBT")
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: <stable@vger.kernel.org> # v7.1+
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16854
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  3 ++-
 drivers/gpu/drm/i915/display/intel_quirks.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 00e02e019d25..7b83cc83eede 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -476,7 +476,8 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
 		return false;
 
 	if (intel_dp_is_edp(intel_dp)) {
-		bool pipe_joiner_enable = connector->panel.vbt.edp.pipe_joiner_enable;
+		bool pipe_joiner_enable = connector->panel.vbt.edp.pipe_joiner_enable ||
+					  intel_has_quirk(display, QUIRK_ALLOW_EDP_JOINER);
 
 		if (connector->force_joined_pipes > 1)
 			pipe_joiner_enable = true;
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 7d7db774d8c7..ba7bce7f2827 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -100,6 +100,16 @@ static void quirk_disable_psr2(struct intel_display *display)
 	drm_info(display->drm, "PSR2 support not currently available for this setup, applying disable PSR2 quirk\n");
 }
 
+/*
+ * VBT on some machines defaults the eDP pipe joiner to disabled even though
+ * the panel requires it to achieve its native mode, so allow it regardless.
+ */
+static void quirk_allow_edp_joiner(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_ALLOW_EDP_JOINER);
+	drm_info(display->drm, "Applying allow eDP joiner quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -262,6 +272,9 @@ static struct intel_quirk intel_quirks[] = {
 
 	/* Xiaomi Book Pro 14 2026 */
 	{ 0xb081, 0x1d72, 0x2424, quirk_disable_psr2 },
+
+	/* ASUS ROG Strix SCAR 18 G835LXG */
+	{ 0x7d67, 0x1043, 0x3b29, quirk_allow_edp_joiner },
 };
 
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 970a4fe52faf..84f31809011c 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -23,6 +23,7 @@ enum intel_quirk_id {
 	QUIRK_EDP_LIMIT_RATE_HBR2,
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
 	QUIRK_DISABLE_PSR2,
+	QUIRK_ALLOW_EDP_JOINER,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.50.1

