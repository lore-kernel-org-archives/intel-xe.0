Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F4606A326
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DFntUND+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5210EFA4;
	Tue, 10 Nov 2026 10:35:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656F10EFA4;
 Tue, 10 Nov 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794306928; x=1825842928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yPteFp1cDk+IUdWkYrFiD6yt+i+f1RegoqF8t35Oyx4=;
 b=DFntUND+onJwKv/p/grPRcAboRPJXFHNleiIj2sxV4f4g0JIhW3LreCW
 W8E7EI65Ma0VxEqN4uvx3+um4IWBPcGtqJEUavDo5j1Qq9THlcwR3UhlM
 m9/M1wKNSnwWpUGAfmSMXQjdhto3VpV5aEjvPni6yacxuyA75It9M1KlZ
 i1i5o5GcYxdAPSdxLRufiBSqrUpypyIPCuLg/jX3uqRsmWj6E9GJNXIL9
 ZXuNpNfd3AylK2k1S8lkMqD8gJLhW/EtGQxr9NnoVMenelX9EuP8u7rhJ
 akYDB1zx7s9IWOgbhPyGwIGzkjUkC8h4a0wXyAFmGKTncTti/na+vCnUK A==;
X-CSE-ConnectionGUID: h8zggiq1QzyvM/790BVyFg==
X-CSE-MsgGUID: C+7jWSDeTYW97tZbFAjeCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3131565"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3131565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:35:27 -0800
X-CSE-ConnectionGUID: ekEi59QQSSC3aBBJ/eJ5Kw==
X-CSE-MsgGUID: qowsiaAiQym+plsxHEz1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8116674"
Received: from alekseim-mobl.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:35:26 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 juha-pekka.heikkila@intel.com
Subject: [PATCH v4 1/2] drm/i915/fbc: update the supported FP16 formats
Date: Tue, 10 Nov 2026 12:35:12 +0200
Message-ID: <20261110103513.176529-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

FBC is supported with FP16 formats with or without alpha. Update
the platform specific format check function to list all the
supported formats as it is. Also add a separate function to check
if the format is float because the pixel normalizer block must be
active to have FBC enabled for FP16 formats.

v2: list the supported formats per platform as it is and introduce
    format_is_float() (Ville)

v3: update intel_fbc_need_pixel_normalizer()

Bspec: 68904
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 44 ++++++++++++++----------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5694d20773f8..2e437b969451 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1180,14 +1180,15 @@ static bool lnl_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_
 	}
 }
 
-static bool
-xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
+static bool format_is_float(const struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_ARGB16161616F:
+	case DRM_FORMAT_XRGB16161616F:
 	case DRM_FORMAT_ABGR16161616F:
+	case DRM_FORMAT_XBGR16161616F:
 		return true;
 	default:
 		return false;
@@ -1196,24 +1197,22 @@ xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
 
 static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_state)
 {
-	if (lnl_fbc_pixel_format_is_valid(plane_state))
-		return true;
-
-	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
-		return true;
-
-	return false;
-}
-
-bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
-{
-	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
-	if (HAS_PIXEL_NORMALIZER(display) &&
-	    xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
+	switch (fb->format->format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_ARGB16161616F:
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+	case DRM_FORMAT_XBGR16161616F:
 		return true;
-
-	return false;
+	default:
+		return false;
+	}
 }
 
 static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
@@ -1230,6 +1229,15 @@ static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
 		return i8xx_fbc_pixel_format_is_valid(plane_state);
 }
 
+bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+
+	return HAS_PIXEL_NORMALIZER(display) &&
+	       pixel_format_is_valid(plane_state) &&
+	       format_is_float(plane_state);
+}
+
 static bool i8xx_fbc_rotation_is_valid(const struct intel_plane_state *plane_state)
 {
 	return plane_state->hw.rotation == DRM_MODE_ROTATE_0;
-- 
2.43.0

