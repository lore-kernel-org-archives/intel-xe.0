Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ABA6MlyA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF2810E9D9;
	Thu, 26 Nov 2026 18:07:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3D10EA0A;
 Thu, 26 Nov 2026 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716414; x=1827252414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MoVi4ABJUw6O1U0zfUP3uuAuUzmjgIgwNFOxqIZUFbA=;
 b=ABA6MlyAiPkEhLgRe5I/5OelnD0Fww9QGYyysqew1YYUF/nfKdx1KYbc
 GkopcZNpaTdE4hZwDDSWy1XIbUFCZlSYuu2L+UAp0n8bDRGeqLlss4pST
 r/GGXwuOSRrVPcvSzP7xuPTiCEarqy3dZc2/ZaBtH4fLjNO4SaQ160O/z
 XbbW3jESznRVkilKypGMOU6BiI4sbFCyS37m8BtK8Tu1v4YR4xDb7p8zB
 +79V16Gmzadk+dnSEXhu6Fg9/NFXeY+rXC1UUJKZ8UB2LXAbmuFNlsk0U
 3Su3p7tbg9+QLK388SM5maKDXF4wSoysWlu6hMK3XJSz+4Ia4ra3FF5gH Q==;
X-CSE-ConnectionGUID: qUoJcYHsQpOg3XdHUfovqw==
X-CSE-MsgGUID: b83K0RVfSy+v7yQ7Avk3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702459"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:53 -0800
X-CSE-ConnectionGUID: fy3gtWoFSMaGezVZeg73qQ==
X-CSE-MsgGUID: hlbQ8cqjTNiJwSw3ZRD03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12454551"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:51 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 1/4] drm/i915/display: remove edp_vswing modparam
Date: Thu, 26 Nov 2026 19:06:11 +0100
Message-ID: <20261126180614.224327-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
References: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

edp_vswing overrides low/high vswing detection from VBT. This provides
limited help during debugging as a module parameter. Moreover the
comment states that module parameter is a workaround and is to be
removed.

Process low/high vswing from VBT without considering edp_vswing. Remove
the module parameter as well.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c           | 10 ++--------
 drivers/gpu/drm/i915/display/intel_display_params.c |  6 ------
 drivers/gpu/drm/i915/display/intel_display_params.h |  1 -
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index b77d1599482a7..01ba0372bbe47 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1552,14 +1552,8 @@ parse_edp(struct intel_display *display,
 	if (display->vbt.version >= 173) {
 		u8 vswing;
 
-		/* Don't read from VBT if module parameter has valid value*/
-		if (display->params.edp_vswing) {
-			panel->vbt.edp.low_vswing =
-				display->params.edp_vswing == 1;
-		} else {
-			vswing = (edp->edp_vswing_preemph >> (panel_type * 4)) & 0xF;
-			panel->vbt.edp.low_vswing = vswing == 0;
-		}
+		vswing = (edp->edp_vswing_preemph >> (panel_type * 4)) & 0xF;
+		panel->vbt.edp.low_vswing = vswing == 0;
 	}
 
 	panel->vbt.edp.drrs_msa_timing_delay =
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 8c073b07daa2b..20398deaa4878 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -81,12 +81,6 @@ intel_display_param_named_unsafe(invert_brightness, int, 0400,
 	"to dri-devel@lists.freedesktop.org, if your machine needs it. "
 	"It will then be included in an upcoming module version.");
 
-/* WA to get away with the default setting in VBT for early platforms.Will be removed */
-intel_display_param_named_unsafe(edp_vswing, int, 0400,
-	"Ignore/Override vswing pre-emph table selection from VBT "
-	"(0=use value from vbt [default], 1=low power swing(200mV),"
-	"2=default swing(400mV))");
-
 intel_display_param_named(enable_dpcd_backlight, int, 0400,
 	"Enable support for DPCD backlight control"
 	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enable, 2=force VESA interface, 3=force Intel interface)");
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index bcbca95318d6c..50096a5c961cb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -36,7 +36,6 @@ struct drm_printer;
 	param(int, disable_power_well, -1, 0400) \
 	param(bool, enable_ips, true, 0600) \
 	param(int, invert_brightness, 0, 0600) \
-	param(int, edp_vswing, 0, 0400) \
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(bool, load_detect_test, false, 0600) \
 	param(bool, force_reset_modeset_test, false, 0600) \
-- 
2.45.2

