Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91B606A321
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmYmNj1L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D15112AD6;
	Fri, 23 Oct 2026 12:07:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9929910E2E0;
 Fri, 23 Oct 2026 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792757234; x=1824293234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcleyXCGLiEZMsyO5koOhtDdmA1GQN5WNnps6S4uqmo=;
 b=CmYmNj1LYsTfrcK7BjtB21jxUL/TJRpOLT9VJxUo9Gsqtwx29eOFNLV4
 x/H0A9BuKzAZcvHf6oVoFKPLk4pkwAQcyf7utNG+lae37Ywq4fCaX00xy
 7hBlEsYBEJiaKVVy3ALS3TBLNt+9qVgnL9tphiDew80ORPc5bbmunu5CZ
 fPNcscEkAUIJHUN4/xZWFcVqmt8IBAqvR2o9K7GU6TUdxdnSdrO7UOvHe
 FYogiFsuievhsU07RWKzx4iJ0l3IjpjY5TLJV4bWUEle62Uvr5DfLewje
 OkONXtnWvRgqOlp9Kl+BhTw8Ruh5TN2uHb4foyIdMNQqXFrJ/FQYw4Mkq w==;
X-CSE-ConnectionGUID: RT4Xkq6WRHyIo+icv1PB4A==
X-CSE-MsgGUID: Hk/WLpOpTJmPoN+QRIpgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1420348"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1420348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:07:13 -0700
X-CSE-ConnectionGUID: Q4xu3kHzR5GDYSwcGDGzKg==
X-CSE-MsgGUID: NS/GG5VWSM2Qd3FXE3nm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3726189"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:07:09 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
Subject: [PATCH] drm/i915/fbc: Apply Wa_14028723391
Date: Fri, 23 Oct 2026 15:06:53 +0300
Message-ID: <20261023120653.194313-1-vinod.govindapillai@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Disable FBC in XE3P_LPD for FP16 formats with Alpha.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c |  2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c        | 12 ++++++++++++
 3 files changed, 15 insertions(+)

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
index 5694d20773f8..80a7ae671179 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1687,6 +1687,18 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 		return 0;
 	}
 
+	/*
+	 * Wa_14028723391:
+	 * Fixes: Screen corruption with FBC enabled on a plane with the FP16
+	 * Workaround: Disable FBC for FP16+Alpha in xe3p_lpd
+	 */
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14028723391) &&
+	    xe3p_lpd_fbc_fp16_format_is_valid(plane_state) &&
+	    fb->format->has_alpha) {
+		plane_state->no_fbc_reason = "Wa_14028723391";
+		return 0;
+	}
+
 	if (DISPLAY_VER(display) < 20 &&
 	    plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
 	    fb->format->has_alpha) {
-- 
2.43.0

