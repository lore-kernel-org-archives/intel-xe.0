Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6255C982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 19:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2FE10E1A1;
	Wed, 16 Sep 2026 19:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2+g2N0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B0E10E1A1;
 Wed, 16 Sep 2026 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789588583; x=1821124583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TgrCqqq59XWye+6Tt8w3ltDzujxorAMPOkoP/8AhOmM=;
 b=F2+g2N0jM7Ymawem6RSpo1NH+NTIX8PUkFU1Q/ZptP/sS/C1u78obwdg
 QOajfDvEE+dGciMXMP4S13xxtsNKXd5jtKo0wDbkm9CXYEZgEZoigO0Pi
 Vpm13VbobuBsvrpTIYXhdeLX3lGSs+RH+2KWuPu/+kVnPsbJObe6ouaFQ
 U8tOUgcNMDdBOJ5VM8SVDAlaZXzekaNDMumB5PBMObs41CNTdmixQ7mqI
 TB43bLvPwFrrJa4/zYL94dPPaCazXaKS5GSECFMv14+Ir8v+38lz9MVA2
 0b/wojgePAiEJG8Z5uAXHE2wPhSGVHbC/remxrr39ORmOdtsrWf2rpm7N w==;
X-CSE-ConnectionGUID: Jm9qWkcdQkmBRwwNC+FrrA==
X-CSE-MsgGUID: KvK5+PyCTzypJQkkXmb0sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112743765"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="112743765"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 12:56:22 -0700
X-CSE-ConnectionGUID: k4/PFWpqRWS0PrmcvBhCaA==
X-CSE-MsgGUID: eJgWv+rVQHWqkyzpfCuFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270805709"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.38])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 12:56:21 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
Subject: [RESEND PATCH] drm/i915/fbc: remove uint16 from supported fbc formats
 in xe3plpd
Date: Wed, 16 Sep 2026 22:56:02 +0300
Message-ID: <20260916195602.939242-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As UINT16 pixel formats are not listed as supported formats in any
of the display versions so far, there is no point is having these
formats listed as supported for FBC. So remove the UINT16 formats
from the supported formats for FBC.

v2: removed an unused variable

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index f61b4a218d6e..5694d20773f8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1196,23 +1196,13 @@ xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
 
 static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_state)
 {
-	const struct drm_framebuffer *fb = plane_state->hw.fb;
-
 	if (lnl_fbc_pixel_format_is_valid(plane_state))
 		return true;
 
 	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
 		return true;
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_XRGB16161616:
-	case DRM_FORMAT_XBGR16161616:
-	case DRM_FORMAT_ARGB16161616:
-	case DRM_FORMAT_ABGR16161616:
-		return true;
-	default:
-		return false;
-	}
+	return false;
 }
 
 bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
-- 
2.43.0

