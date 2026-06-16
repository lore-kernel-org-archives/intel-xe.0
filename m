Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE0CCD98E6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994FA10EAFE;
	Tue, 16 Jun 2026 12:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dd7Lz6MI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3DB10EAE1;
 Tue, 16 Jun 2026 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613926; x=1813149926;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mx8hXjQo7+ZTc96ngpbBEctHgdXN6ObmmfnPmfiCDYU=;
 b=Dd7Lz6MIlMRs6ks0UhYdLZM02mBoxqT7H3gRVxm4X+7k4LqKZ8e4SGIu
 0nC6PE1Jo3z+eMuo+1uUkx3ehtu2M7rWZfK8YqLine+oIvw3MGjnMRybt
 dRIcqR0e7bf4KsEa1yuyPYhd72QecByXd9juon8uwdqfD3dUqzSQu7Asp
 KUhaB3rxCBNJpRS+tfo8Rbuinl7z8dxab11qgGqfwqs1zRQmWfiHSt0Py
 3KW+GFXompa4Ebp4HJbJtzUoqRDrr3Rs/qPRpdqhC/bDS6hY2lcoP9/0H
 fOJvGinq1EdE7WdKuEADv3dpdral5dytWEP1noVpJmC22kbq86PRAR7HH A==;
X-CSE-ConnectionGUID: KLmICKp2SGan2bu8rIczPg==
X-CSE-MsgGUID: 9hWH5kiJTAOHI+eq1A9WsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513231"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:26 -0700
X-CSE-ConnectionGUID: PNUVfSm1TE2huh0d8jXzZw==
X-CSE-MsgGUID: W0ovHIxYRpeE1QzdJZLM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876259"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:25 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 06/39] drm/i915/display: Skip DP_MIN_HBLANK_CTL programming
 for CMTG transcoders
Date: Tue, 16 Jun 2026 18:13:42 +0530
Message-ID: <20260616124416.2442161-7-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

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
2.43.0

