Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20A606A334
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c48ydGbu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592710E383;
	Mon, 26 Oct 2026 14:55:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7710110E383;
 Mon, 26 Oct 2026 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793026538; x=1824562538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SAwqLiINS69Zate7I+UPjZfELNLq+SPffVVvSI8I8NM=;
 b=c48ydGbuxru8Qee2Rb3utRMWA4d9OWHqsr2kYM+9r9/14dtKNqHMuR5x
 JcSFTnLg8bftxHwla+z2fYmVgJ4lLipO/wgMVs4+XIqeY3OzQZIHdWMBp
 fBlWEEwTvKlEz0Tx1gI3RZPzMezTdpVkOl++yZGQlXOOP4+gi7iKMts9p
 cR29n+Tlw+t6cd2SN/wlIRw5NUdjAjm+Rz4TLDTtBWB49rsZAxpFPCQxt
 9wnIH28V8G3dBIDYO8RF1E0vIFz0qTDNP21uJtLCajuXr2DHpY4/v5UfZ
 fBKfHCzvOtdd9dGEJuAttnRxpyY/9fBeIYjKF8Icm+uuDOJUxEHBwGUWX w==;
X-CSE-ConnectionGUID: yuBPnthfQPGA6MZ9/zBBDg==
X-CSE-MsgGUID: C2m2c/k9TzCvDWcRq20iqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1585455"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1585455"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:55:37 -0700
X-CSE-ConnectionGUID: Kcjbn3HoQJWQf7hSkJjmsA==
X-CSE-MsgGUID: tn4oN7N5ScenyA5k7Dw9Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4679899"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:55:35 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
Subject: [PATCH v2 2/3] drm/i915/fbc: Apply Wa_14028723391
Date: Mon, 26 Oct 2026 16:55:07 +0200
Message-ID: <20261026145508.235851-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026145508.235851-1-vinod.govindapillai@intel.com>
References: <20261026145508.235851-1-vinod.govindapillai@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Disable FBC in XE3P_LPD for FP16 formats with Alpha.

v2: Group the wa conditions as a separate function
    Wa cndition to check pixel blend mode

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 22 +++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 2e3ff4861ef4..82882fff5987 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -146,6 +146,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return IS_DISPLAY_VERx100(display, 1100, 1400);
 	case INTEL_DISPLAY_WA_22021048059:
 		return IS_DISPLAY_VER(display, 14, 35);
+	case INTEL_DISPLAY_WA_14028723391:
+		return DISPLAY_VER(display) == 35;
 	default:
 		drm_WARN(display->drm, 1, "Missing Wa: %s\n", name);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index b707147a7587..205605e0f941 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -53,6 +53,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_22012358565,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
+	INTEL_DISPLAY_WA_14028723391,
 };
 
 bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name);
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index dbb16a9ec69d..494bb7d852fc 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1195,6 +1195,23 @@ static bool intel_fbc_is_fp16_format(const struct intel_plane_state *plane_state
 	}
 }
 
+static bool
+intel_fbc_wa_14028723391_applies(const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+
+	/*
+	 * Wa_14028723391:
+	 * Fixes: Screen corruption with FBC enabled on a plane with the FP16
+	 * Workaround: Disable FBC for FP16+Alpha in xe3p_lpd
+	 */
+	return intel_display_wa(display, INTEL_DISPLAY_WA_14028723391) &&
+	       intel_fbc_is_fp16_format(plane_state) &&
+	       fb->format->has_alpha &&
+	       plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE;
+}
+
 static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_state)
 {
 	return lnl_fbc_pixel_format_is_valid(plane_state) ||
@@ -1665,6 +1682,11 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 		return 0;
 	}
 
+	if (intel_fbc_wa_14028723391_applies(plane_state)) {
+		plane_state->no_fbc_reason = "Wa_14028723391";
+		return 0;
+	}
+
 	if (!tiling_is_valid(plane_state)) {
 		plane_state->no_fbc_reason = "tiling not supported";
 		return 0;
-- 
2.43.0

