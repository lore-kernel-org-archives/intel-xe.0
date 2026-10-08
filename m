Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4F0CA5FFD
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 04:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C131F10FA7B;
	Thu,  8 Oct 2026 04:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6Ovcysk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F15010FA7B;
 Thu,  8 Oct 2026 04:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791433159; x=1822969159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CftBxbd902Wn6lSTnpIfX3tGl9M5MFemFzPadcohOZg=;
 b=S6OvcyskkXAiyMl087MCrkXlAkxW3RLSLiB1KkZUIyafFZ8tnWiIbpuK
 JPkTEb722zP4DqTAZrrxrmV5BUYLuHQphcLurSb+F/A1FkolwYXJle3gm
 58fQzZpH9fn9/kOdLwg+8w5svzZtv6PBHUcp7CKSUfRKFf3qgJWM1jxxV
 zge/Q7qLm2fUz9/nwH90krJeGboLfmou1PKq8QTQqastq+H9Fk1+1zdJC
 Rjt3jHkGgIWa5qdUdZaroJA/wqYKYe2SPqPx2GQOWC/qMQrRDE8YP86/W
 UydnBAYhK07xhCVpgXxw+/kHyHYQ9CRkdEYTV1WYN0nH11Gz+NeFzjY85 Q==;
X-CSE-ConnectionGUID: Cm4/5EENT3GT3tne0oaM8A==
X-CSE-MsgGUID: E5bKDmr4Qy+L5/abgntjcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="89053"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="89053"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 21:19:17 -0700
X-CSE-ConnectionGUID: dEDkVcCaQ4a9JWnBDIPi5Q==
X-CSE-MsgGUID: YwdmLAG4QhuRiaOGBr8ABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="228882"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2026 21:19:15 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, stable@vger.kernel.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/scaler: Prune YUV420 modes against the max source
 width
Date: Thu,  8 Oct 2026 09:48:09 +0530
Message-Id: <20261008041809.3674538-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

skl_scaler_mode_valid() compares the mode's hdisplay against the pipe
scaler maximum source height instead of the maximum source width, so
single pipe YUV420 modes are pruned against the wrong limit.

Compare against max_w instead of max_h.

Fixes: 3347b55f2c6c ("drm/i915/xe3lpd: Prune modes for YUV420")
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7994b983d509..7e65c4fffbc0 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -145,7 +145,7 @@ skl_scaler_mode_valid(struct intel_display *display,
 
 	if (num_joined_pipes < 2 && output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		skl_scaler_max_src_size(display, &max_w, &max_h);
-		if (mode->hdisplay > max_h)
+		if (mode->hdisplay > max_w)
 			return MODE_NO_420;
 	}
 
-- 
2.25.1

