Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D574FE51F5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB7F10F48C;
	Fri, 24 Apr 2026 09:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nx47BqPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B087D10F477;
 Fri, 24 Apr 2026 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777023100; x=1808559100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HE73IoN21SAiR407neVozQ8QA+lJHkcqoWp2mIAwHRo=;
 b=nx47BqPfCbF597hllwUNajtWI2/Gq8/im0XDwYF/haf4vLqnGpSjoqw/
 oJK+ytgxvmku6wX4eprEPekdnT/Rw0eIgH7SXQkTVaX04hJ6zclorBu7D
 l51rVO3kSkqQIkg4dhgsVTO5AvE+HhCr7vZouLCsdICjpVT8ZlK3sfIeK
 sZBpMcheTh9L6iO9hpmHxInOo0Dm/s6W+BkJNsnlKvQDHY+R2a9enjGkR
 qswxVSpFUmxofzNPscRl0JI3tt83+v/F51u3P4n1WTTYDdZH2qJsu0ohF
 2IFElQM9NjqqSCKMWkfJV39L4Vka1jOxzyLq807qaxZWsd3wtSw2e+/kf w==;
X-CSE-ConnectionGUID: dmkmeSjDTaq1bLsY3rDbkA==
X-CSE-MsgGUID: DwcjByRfRIGxmY8LtfiPkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81859300"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="81859300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:31:40 -0700
X-CSE-ConnectionGUID: R+3mRlLVRX+iWgDJHLPJPQ==
X-CSE-MsgGUID: rDwfmFazT2+Yoh3JUr8Vbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="228572943"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:31:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 6/7] drm/dp: Add a helper to get the SDP type as a string
Date: Fri, 24 Apr 2026 14:46:45 +0530
Message-ID: <20260424091646.3060549-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260424091646.3060549-1-ankit.k.nautiyal@intel.com>
References: <20260424091646.3060549-1-ankit.k.nautiyal@intel.com>
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

Introduce dp_sdp_type_get_name() to get the SDP type as a string.
Use this to log the SDP type based on the sdp_type fields of the
VSC and AS SDPs instead of the hardcoded strings.

While at it, rename "SDP : AS_SDP" to "SDP : Adaptive Sync"

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 36 ++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e29958f8b0b6..102328d9022d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3487,10 +3487,38 @@ static const char *dp_content_type_get_name(enum dp_content_type content_type)
 	}
 }
 
+static const char *dp_sdp_type_get_name(unsigned char type)
+{
+	switch (type) {
+	case DP_SDP_AUDIO_TIMESTAMP:
+		return "Audio Timestamp";
+	case DP_SDP_AUDIO_STREAM:
+		return "Audio Stream";
+	case DP_SDP_EXTENSION:
+		return "Extension";
+	case DP_SDP_AUDIO_COPYMANAGEMENT:
+		return "Audio Copy Management";
+	case DP_SDP_ISRC:
+		return "ISRC";
+	case DP_SDP_VSC:
+		return "VSC";
+	case DP_SDP_PPS:
+		return "PPS";
+	case DP_SDP_VSC_EXT_VESA:
+		return "VSC EXT VESA";
+	case DP_SDP_VSC_EXT_CEA:
+		return "VSC EXT CEA";
+	case DP_SDP_ADAPTIVE_SYNC:
+		return "Adaptive Sync";
+	default:
+		return "Unknown";
+	}
+}
+
 void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
 {
-	drm_printf(p, "DP SDP: VSC, revision %u, length %u\n",
-		   vsc->revision, vsc->length);
+	drm_printf(p, "DP SDP: %s, revision %u, length %u\n",
+		   dp_sdp_type_get_name(vsc->sdp_type), vsc->revision, vsc->length);
 	drm_printf(p, "    pixelformat: %s\n",
 		   dp_pixelformat_get_name(vsc->pixelformat));
 	drm_printf(p, "    colorimetry: %s\n",
@@ -3505,8 +3533,8 @@ EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
 void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp)
 {
-	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
-		   as_sdp->revision, as_sdp->length);
+	drm_printf(p, "DP SDP: %s, revision %u, length %u\n",
+		   dp_sdp_type_get_name(as_sdp->sdp_type), as_sdp->revision, as_sdp->length);
 	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
 	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
 	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
-- 
2.45.2

