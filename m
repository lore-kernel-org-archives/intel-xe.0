Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A642FC0218A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09310EA83;
	Fri, 17 Jan 2025 07:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXH9zgwq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CA410EA7D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100058; x=1768636058;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GwFBFf1TyTZ/tKM1emj2QXoeiWqsNEUyH3tIUQNn82g=;
 b=MXH9zgwqAQbuFRjeajyhQuRGAPmEJCuST41SRkQ26Fe1s3UGSIFw5Izq
 IjbeLkrDMD70h2RDC/CEzJ0nGzmi56doPG7/pY9U73lYQj9apHzm/oCCX
 1pAUBfg1uYLjE0qL9pRozw3kioP7RlCPoEnKEnvYxteemFpuPNX4ovPZE
 cJYdcziDsmGtXfVD6e1o69UAs6QXIg+gxDGPn0pt7RRrDgC1eYuq6QUbS
 eI2zo0IAuQoc/AaSuUSeP+F5iLqFVAHYCMPLAe04BCvd3PipuJGXFzOR+
 A1FWAb2z0m2ENRuX+ErRO3V/8hfUaXz60zR3janD1CNXP7fO6I8FPCPyP g==;
X-CSE-ConnectionGUID: sGbez5YlSJClm+zXG6UVHA==
X-CSE-MsgGUID: /nkVIDJ2TUu4llq5lQ4l0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37760748"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37760748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:37 -0800
X-CSE-ConnectionGUID: Oj7je2IaQzKggMYjBpHXTQ==
X-CSE-MsgGUID: 7qsKAE0dSvOftoZB7w1z9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105687938"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 23:47:37 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 3/7] drm/i915/scaler: Refactor max_scale computation
Date: Fri, 17 Jan 2025 13:14:17 +0530
Message-ID: <20250117074422.3965519-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Refactor max scaling factor computation into a reusable
function for scalers.

--v2:
- Add missing comment. [Ankit]

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 70 +++++++++++++----------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 12efa4008027..a832cdccd9fa 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -319,6 +319,44 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 	return -1;
 }
 
+static void
+calculate_max_scale(struct intel_crtc *crtc,
+		    bool is_yuv_semiplanar,
+		    int scaler_id,
+		    int *max_hscale, int *max_vscale)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	/*
+	 * FIXME: When two scalers are needed, but only one of
+	 * them needs to downscale, we should make sure that
+	 * the one that needs downscaling support is assigned
+	 * as the first scaler, so we don't reject downscaling
+	 * unnecessarily.
+	 */
+
+	if (DISPLAY_VER(display) >= 14) {
+		/*
+		 * On versions 14 and up, only the first
+		 * scaler supports a vertical scaling factor
+		 * of more than 1.0, while a horizontal
+		 * scaling factor of 3.0 is supported.
+		 */
+		*max_hscale = 0x30000 - 1;
+
+		if (scaler_id == 0)
+			*max_vscale = 0x30000 - 1;
+		else
+			*max_vscale = 0x10000;
+	} else if (DISPLAY_VER(display) >= 10 || !is_yuv_semiplanar) {
+		*max_hscale = 0x30000 - 1;
+		*max_vscale = 0x30000 - 1;
+	} else {
+		*max_hscale = 0x20000 - 1;
+		*max_vscale = 0x20000 - 1;
+	}
+}
+
 static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 				     int num_scalers_need, struct intel_crtc *crtc,
 				     const char *name, int idx,
@@ -388,35 +426,9 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 		const struct drm_rect *dst = &plane_state->uapi.dst;
 		int hscale, vscale, max_vscale, max_hscale;
 
-		/*
-		 * FIXME: When two scalers are needed, but only one of
-		 * them needs to downscale, we should make sure that
-		 * the one that needs downscaling support is assigned
-		 * as the first scaler, so we don't reject downscaling
-		 * unnecessarily.
-		 */
-
-		if (DISPLAY_VER(display) >= 14) {
-			/*
-			 * On versions 14 and up, only the first
-			 * scaler supports a vertical scaling factor
-			 * of more than 1.0, while a horizontal
-			 * scaling factor of 3.0 is supported.
-			 */
-			max_hscale = 0x30000 - 1;
-			if (*scaler_id == 0)
-				max_vscale = 0x30000 - 1;
-			else
-				max_vscale = 0x10000;
-
-		} else if (DISPLAY_VER(display) >= 10 ||
-			   !intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
-			max_hscale = 0x30000 - 1;
-			max_vscale = 0x30000 - 1;
-		} else {
-			max_hscale = 0x20000 - 1;
-			max_vscale = 0x20000 - 1;
-		}
+		calculate_max_scale(crtc,
+				    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier),
+				    *scaler_id, &max_hscale, &max_vscale);
 
 		/*
 		 * FIXME: We should change the if-else block above to
-- 
2.48.1

