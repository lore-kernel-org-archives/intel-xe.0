Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD56C0219E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 21:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FF610EBB5;
	Fri,  7 Feb 2025 21:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvYJ2GR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D15C10E143;
 Fri,  7 Feb 2025 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738965256; x=1770501256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TqUMTmzfEm/PeH+Au1QbItA0agM1UFJ21xwmXN6vAq8=;
 b=SvYJ2GR2uQyrKdRSTFQrB9KDUoO+okm9etttpP5tFfgmTAPSkktqaep5
 EuE5nKSMGoow1LO+YoACZCPAxYKceNdZewfQdL5sNSJfFkPa2SiNHI1DX
 uzZ2eEWJKZ13PzVvwlzyb4DCERpmMhyuo6wjj2Keg1tdduXBrE/uKRuAJ
 J84STAY54xk0g5ZHfb6sBO8O+zVJLJxy4HzhnVTt1oBbCdJsYqQaJN2fx
 xisTrOC63Xk0OlqniJFfwyTkdqz/zbnFyOoJRUiDByRsb1O4bbWg/n+Bu
 tE41/iIRaY7WTU+8eFaAOkbZ0hQ6Lqhx+SW93VPJ7MbyungnBeeVkYVKG A==;
X-CSE-ConnectionGUID: EOzN7US2Qsqm4JiqyWJ32g==
X-CSE-MsgGUID: c84TdoAKRT21iCbXkzgtLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39745989"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="39745989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 13:54:16 -0800
X-CSE-ConnectionGUID: ucpQBYXKQW+k4UgM24KtsQ==
X-CSE-MsgGUID: uRbXBfaoRFidhX0Qfiw6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111851041"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Feb 2025 13:54:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2025 23:54:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Reverse the scanline_offset if ladder
Date: Fri,  7 Feb 2025 23:54:05 +0200
Message-ID: <20250207215406.19348-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250207215406.19348-1-ville.syrjala@linux.intel.com>
References: <20250207215406.19348-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make intel_crtc_scanline_offset() a bit less confusing by
fully reordering the if ladder to use the new->old platform
order.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 7b240ce681a0..dd928d890e3a 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -224,12 +224,12 @@ int intel_crtc_scanline_offset(const struct intel_crtc_state *crtc_state)
 	 */
 	if (DISPLAY_VER(display) >= 20 || display->platform.battlemage)
 		return 1;
-	else if (DISPLAY_VER(display) == 2)
-		return -1;
 	else if (HAS_DDI(display) && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
 		return 2;
-	else
+	else if (DISPLAY_VER(display) >= 3)
 		return 1;
+	else
+		return -1;
 }
 
 /*
-- 
2.45.3

