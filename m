Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28319606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VRwFlMm4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBDF10F647;
	Tue, 27 Oct 2026 15:06:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4DB10F645;
 Tue, 27 Oct 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793113574; x=1824649574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jIjjoEVgI/3xKX6Jzzuq0YpDW+cfjDAT8R616rqaEWA=;
 b=VRwFlMm4wudnbh1fl9kidQG472uUrIzP5hQhBB+iKI3afSwk5NMUqPwU
 YHKoKLmMTrLnx458brwng0TWefkgqT5iiiml3BQOwLGE/SOiXMqZIvKTV
 OvJPrzt47mn7NMxqK0CbpjIV3rM6EklmjPbQeY10BeTj96zSjx+djgN1m
 9TNaSzeU2H+ZELqPN9liyPCTpxd+pIPPUhNZWHno0jDkGIsS6anDMnR1c
 ZYVu1b7Qt/Pbf+PLuD8/DZ6k6o/Kz7IJhvJBAqaHvEpqR5s7A1pgqlrT5
 e5poiOXOA29UfJFGr6OWReX0tttSirCJSZdD3G+oUEbfVUcRyViJXxSgE g==;
X-CSE-ConnectionGUID: pj8W4Sj3Qouw13/L8PjRLg==
X-CSE-MsgGUID: 0eqY/nvsSQ6IOXZSlEmfdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1699680"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1699680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:06:14 -0700
X-CSE-ConnectionGUID: ifGzP3iGRBqzlkboN0A4Jg==
X-CSE-MsgGUID: GnhaQFSsTT2C5he4Rbc86w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4464237"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:06:10 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 juha-pekka.heikkila@intel.com
Subject: [PATCH v3 1/3] drm/i915/fbc: update the supported FP16 formats
Date: Tue, 27 Oct 2026 17:05:42 +0200
Message-ID: <20261027150544.81548-1-vinod.govindapillai@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FBC is supported with FP16 formats with or without alpha. Update
the platform specific format check function to list all the
supported formats as it is. Also add a separate function to check
if the format is float because the pixel normalizer block must be
active to have FBC enabled for FP16 formats.

v2: list the supported formats per platform as it is and introduce
    format_is_float() (Ville)

Bspec: 68904
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 31 +++++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5694d20773f8..b84fa350c433 100644
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
@@ -1196,24 +1197,30 @@ xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
 
 static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_state)
 {
-	if (lnl_fbc_pixel_format_is_valid(plane_state))
-		return true;
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
-	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
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
 
 bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
 
-	if (HAS_PIXEL_NORMALIZER(display) &&
-	    xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
-		return true;
-
-	return false;
+	return HAS_PIXEL_NORMALIZER(display) &&
+	       format_is_float(plane_state);
 }
 
 static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
-- 
2.43.0

