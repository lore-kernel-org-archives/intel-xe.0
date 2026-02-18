Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8653E9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59510E5F8;
	Wed, 18 Feb 2026 15:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlS3xzoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122A610E5F6;
 Wed, 18 Feb 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428565; x=1802964565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9lmi4s7wZ26HYxVfRzdHnQyr2FAw+3RepXveL68Hcp4=;
 b=ZlS3xzoOWN9shZBvUzGnY37i7ambBwP1er2E162KWTllWLB+Ub/zDNSS
 gAO9r3Ye3RhA87hKCJ/GojNIBuwBydByhsHuEby0uY/XVZRsIHHq0YN03
 YvMC9mxS9cJRm/5PWNINbv7Y8GQl1iCDgY4jR2HiomzGHGIXK9sjce684
 /1zszFHl1va1nh9ZjQQVIXps/eEXuP9xlFmLpIHBDsAu2Hh4UH15rtIXH
 /QndH3Vgx7XasI3JbrAaLO8GFDIxisqU2IAFywrfLMV9h0c9eSQqTP/Tu
 lXyOIX8Q4aoBfq1ganrLYhmjhFgcX8LNh2togE8ZwAGtxAywQWwH0iL22 g==;
X-CSE-ConnectionGUID: 83AsLlzgSFSnFawsytLK3g==
X-CSE-MsgGUID: W6XalOtATviIy6iefkNJpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72495495"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72495495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:29:25 -0800
X-CSE-ConnectionGUID: fD5nOdnZSvOo4NUKPw9SZg==
X-CSE-MsgGUID: rEmcS7t5ScurkjI5uBUfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213302982"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:29:24 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 17/19] drm/i915/overlay: Don't use fetch_and_zero() in display
 code
Date: Wed, 18 Feb 2026 17:28:04 +0200
Message-ID: <20260218152806.18885-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

We don't have fetch_and_zero() on the display side, so stop
using it in the display side intel_overlay_cleanup(). Fortunately
we don't really have anything to do here apart from freeing the
data. And we'll keep on clearing the pointer, just in case something
somewhere cares about it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 8b06c2cff7f2..6a2af1f356ed 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1554,13 +1554,8 @@ static void i915_overlay_cleanup(struct drm_device *drm)
 
 void intel_overlay_cleanup(struct intel_display *display)
 {
-	struct intel_overlay *overlay;
-
-	overlay = fetch_and_zero(&display->overlay);
-	if (!overlay)
-		return;
-
 	i915_overlay_cleanup(display->drm);
 
-	kfree(overlay);
+	kfree(display->overlay);
+	display->overlay = NULL;
 }
-- 
2.52.0

