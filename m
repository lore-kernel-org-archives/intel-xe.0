Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE3606A327
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOSkk4le
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9448210EF47;
	Mon, 26 Oct 2026 14:55:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7910110EF5F;
 Mon, 26 Oct 2026 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793026533; x=1824562533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uRv+fLe3/of8WoyCAxuEIK1UREMENqnGLhaFqg9G0Vw=;
 b=eOSkk4leXScRu2tIIcfiueWBIyqoa++2Cxr/PReRpgS57SydG9o3fr52
 5TAay0W0yfUlFZit6HNZZtYTuxpI9Rrn8m8hVCCTrjp6SngZWA2FES7eT
 08vfL3LWcSFSZvSXlb2TqP+oHiJNXSUcmApBAzU7ckoSzUleogbLQFZbR
 yz8Q23V7efjfylfikoQuTU8gKRJ+1p/RB0CrKjNRCV4kVEithyup5Ia2L
 MI8v9G9Poh+FbqC+MsQhPlD8PS6Y4pgYGkzL5krmM+yh3f0NHfNgIjcP9
 +mFxal9uLx4HBi8WhPbPsB/4zoeHaSCcBO+YCuUdH0TkHOIwmogGqxm5D A==;
X-CSE-ConnectionGUID: I70SjMruR9K69WbobJ/f7w==
X-CSE-MsgGUID: NW7YxfpgSnKhU6xioldOKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1585452"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1585452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:55:32 -0700
X-CSE-ConnectionGUID: r/gSX7hlRGK+4rDZswc4fA==
X-CSE-MsgGUID: nCdVhi1gThKPadH7cUjBVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4679880"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:55:29 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
Subject: [PATCH v2 1/3] drm/i915/fbc: update the supported FP16 formats
Date: Mon, 26 Oct 2026 16:55:06 +0200
Message-ID: <20261026145508.235851-1-vinod.govindapillai@intel.com>
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

FBC is supported with FP16 formats with or without alpha. At the
same time modify the function name for the FP16 format check and
simplify the FP16 format check calls.

Bspec: 68904
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5694d20773f8..dbb16a9ec69d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1180,14 +1180,15 @@ static bool lnl_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_
 	}
 }
 
-static bool
-xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
+static bool intel_fbc_is_fp16_format(const struct intel_plane_state *plane_state)
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
@@ -1196,24 +1197,16 @@ xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
 
 static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_state)
 {
-	if (lnl_fbc_pixel_format_is_valid(plane_state))
-		return true;
-
-	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
-		return true;
-
-	return false;
+	return lnl_fbc_pixel_format_is_valid(plane_state) ||
+	       intel_fbc_is_fp16_format(plane_state);
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
+	       intel_fbc_is_fp16_format(plane_state);
 }
 
 static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
-- 
2.43.0

