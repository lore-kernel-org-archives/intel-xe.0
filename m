Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35847606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LyWmsu3N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE2C10F608;
	Tue, 27 Oct 2026 15:06:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEB110F608;
 Tue, 27 Oct 2026 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793113579; x=1824649579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ud1RMO5P7u1pRA/F4eBrcoKSrlqh5uQbhmX7+iE6Ync=;
 b=LyWmsu3NrWZ6Zfu9VQ69hif8FeiUbtM1rZbSsnUHr3L6htxo+exkiDSx
 iyjMsnpLqtwBEmfVh8mxIb5i/lTxhNcDJMWcomnJ8EaDH9Nz+Q/5+fnpM
 3IEhcaaGLsuLXqfw2/eb5FVg2gGTsWhl5skhl41UypubQd1fP/l0jYgLm
 Ov2oTyjxnsmJpbNPcOcNjPTgIV205JsWmOwLNf9A9raNY1iamNlumjGkI
 haBbheh70TBcH9DMyCUvSMkxcXmAT/hEFHUDRc1odhfYBxEb0wgWB7E3q
 ypKq2QH+/tkg4AYNsIzBH6Vr7xkZs9vcParaCSK3gs4wEOv+u3k7qy7E/ w==;
X-CSE-ConnectionGUID: 9iVwqXVaQSCCAbZp4OVZPQ==
X-CSE-MsgGUID: Dr3cYoMLSLm3TJV8yMOLXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1699689"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1699689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:06:19 -0700
X-CSE-ConnectionGUID: XOA6tNL7RYuva2+ZBcyeJw==
X-CSE-MsgGUID: dWfHy0I5So2XOXY3m4x7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4464260"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:06:16 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 juha-pekka.heikkila@intel.com
Subject: [PATCH v3 2/3] drm/i915/fbc: Apply Wa_14028723391
Date: Tue, 27 Oct 2026 17:05:43 +0200
Message-ID: <20261027150544.81548-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027150544.81548-1-vinod.govindapillai@intel.com>
References: <20261027150544.81548-1-vinod.govindapillai@intel.com>
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
    Wa condition to check pixel blend mode

v3: use fomrat_is_float()

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 22 +++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index cc0b28d524f6..3df25104fb12 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -159,6 +159,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return IS_DISPLAY_VERx100(display, 1100, 1400);
 	case INTEL_DISPLAY_WA_22021048059:
 		return IS_DISPLAY_VER(display, 14, 35);
+	case INTEL_DISPLAY_WA_14028723391:
+		return DISPLAY_VER(display) == 35;
 	default:
 		drm_WARN(display->drm, 1, "Missing Wa: %s\n", name);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 2086c7da710d..5514771f513b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -56,6 +56,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_22012358565,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
+	INTEL_DISPLAY_WA_14028723391,
 };
 
 bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name);
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b84fa350c433..f70f3e34d655 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1215,6 +1215,23 @@ static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *p
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
+	       format_is_float(plane_state) &&
+	       fb->format->has_alpha &&
+	       plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE;
+}
+
 bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
@@ -1679,6 +1696,11 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
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

