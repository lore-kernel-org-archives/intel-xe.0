Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFBECD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 20:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6710FC04;
	Wed,  3 Jun 2026 20:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMK5JxP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC48010FC04;
 Wed,  3 Jun 2026 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780518385; x=1812054385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ScJyw7MZykPW/ZuKLVxn6+BdoM53hvQ66P76VJG+bEA=;
 b=FMK5JxP6t55osWTykVbnAv/grXaRsCClVAb5s2PcofN8+0MV+JNj2iYP
 SV9HudnUZvNHDCtDzv35U6UXHYe+pwpzukzw6zLofvF3FVb0j7pMuRif8
 h2fDdtuZyzpKvXKZOWt36zXAW1zn5WX/08bZRQDnACmfdy21mvCMxEoFf
 UvcImyvHsszqIk5sn946g6K7KqiZ8goURN+2Yk0GpRTKilFY2UwpaXGgf
 oQfRFEzkhW/KOWAlISbHfEMFIcS7HLovMX5kc7Y2Ehk1KomVYyJjYPDG/
 cNtaLmDenoP3Z/Z/oIj1+PLoKkilFnsvwg9srJTdEq36a7zgO9vhJnOj/ Q==;
X-CSE-ConnectionGUID: G4/SgRsDTS6cTc3HxbvyLg==
X-CSE-MsgGUID: Cx+BiwzUTK2nU4Nns3k0hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81337397"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81337397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:26:25 -0700
X-CSE-ConnectionGUID: YbCgwVb4SKuCQKAwmqwDqw==
X-CSE-MsgGUID: Or3KTDu8RJ6vNZWTAB17Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244424785"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa009.jf.intel.com with ESMTP; 03 Jun 2026 13:26:23 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v8 05/20] drm/i915/display: Skip DP_MIN_HBLANK_CTL programming
 for CMTG transcoders
Date: Thu,  4 Jun 2026 01:24:01 +0530
Message-Id: <20260603195416.91639-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260603195416.91639-1-animesh.manna@intel.com>
References: <20260603195416.91639-1-animesh.manna@intel.com>
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

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9031264a34fc..2c15dd4c6d66 100644
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

