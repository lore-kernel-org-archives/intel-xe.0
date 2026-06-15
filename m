Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067ACD98E0
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C231B10E6D1;
	Mon, 15 Jun 2026 20:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6HGK9IP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E799210E6CC;
 Mon, 15 Jun 2026 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555761; x=1813091761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExyFgoMYt8x1uwsA/D+BNmaL7KtcBYIuIExK4DKxF64=;
 b=E6HGK9IPx4Ka9Lm2Dbccg/VBgdw6VSeGJ0Z4Iektj9HqAma+cW+3IKCK
 xFpnYMB0LDTAcG4EuLi04+Iws7E2fMPIxmuO2kRWjeaGHwVSVmEJ55sir
 UEqpTWPnbmHU25NnSllh7psjjxyySjg8ptQjtq6pFEOy0agcSDoYta657
 WPCDh8T9v4waf50MbbcklUlVZugGMmjWaQ9+Wwhcudg6+sWMg3FIYOd1w
 nXMCY4UzbBMMb4ZsGKzke4yHc0cUj+LATh4gVsgfM0fW9cYarxGDZigaf
 tcCoHtT4VN/DNaam05xRQKOoCE/L/AMZ3q3O8aCdvabYYoZAe/TP4exDJ w==;
X-CSE-ConnectionGUID: bKeheUHxQr2UqzfFW5DU0A==
X-CSE-MsgGUID: f2rCmyoZS+uoUR9prcFSGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694746"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694746"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:36:01 -0700
X-CSE-ConnectionGUID: SI/80vO/R6Wqf8o2n0tsyA==
X-CSE-MsgGUID: kp/7pxVtTwG6YlpTsVEnQA==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2026 13:35:59 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v9 06/22] drm/i915/display: Skip DP_MIN_HBLANK_CTL programming
 for CMTG transcoders
Date: Tue, 16 Jun 2026 01:33:23 +0530
Message-Id: <20260615200339.885190-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260615200339.885190-1-animesh.manna@intel.com>
References: <20260615200339.885190-1-animesh.manna@intel.com>
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

DP_MIN_HBLANK_CTL is a CPU transcoder register and must not be written
for the CMTG transcoders. Skip the programming when the target
transcoder is TRANSCODER_CMTG0 or TRANSCODER_CMTG1.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c11def137711..8f8e24565a6d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2761,7 +2761,9 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 			       VACTIVE(crtc_vdisplay - 1) |
 			       VTOTAL(crtc_vtotal - 1));
 
-	if (DISPLAY_VER(display) >= 30) {
+	if (DISPLAY_VER(display) >= 30 &&
+	    transcoder != TRANSCODER_CMTG0 &&
+	    transcoder != TRANSCODER_CMTG1) {
 		/*
 		 * Address issues for resolutions with high refresh rate that
 		 * have small Hblank, specifically where Hblank is smaller than
-- 
2.29.0

