Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADD8CCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122D810ED39;
	Mon, 19 Oct 2026 13:53:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D3F10ED4B;
 Mon, 19 Oct 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418024; x=1823954024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pBIoWVZiRi7gLDZTP+JHhG53Yml4KFrs+N0wdCkNP4=;
 b=LTHvwsfHsFV01dhjFnruz3uPGrbXXq629kUf9juCXs+82EsGL6WJ5jHZ
 zEg9hfy0qlAwUdcc1E3/RxSXjEhTbS+ZUqVwz34WnklvIAZrKMexdx9K4
 cShUr8FARjjsv/l/eK4YfyeobUle4Al5UfNAyyreqMFhE4YvNSYhdO4jo
 Q13ZIBPnvCWYodxeYEqsVuQxQ6mp1m+fHRLXJKXG14EBBLHf+pSIUJ7IJ
 VQEMWdFYIvOrb5TT5QXlocleNz5fsenuNYTusXF0yUUUSAl2nl2pZfZgf
 tUE6Btw1GxFw6TSc0DtbLhlqhVWYZG3VFZ0t/3lGlsAzrpJSOODft/1hV Q==;
X-CSE-ConnectionGUID: W5qMTSwdQxyGIahmBuPX5A==
X-CSE-MsgGUID: AsEtw31xRRia68UAlfFYlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085129"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:43 -0700
X-CSE-ConnectionGUID: l5YCnQwqTnCneUMWekIlew==
X-CSE-MsgGUID: bbgiJ0mgQ3+wWMbwkOwMDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844406"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:41 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/15] drm/i915/pfit: Unconfuse panel_fitter_scaling()
Date: Mon, 19 Oct 2026 16:53:02 +0300
Message-ID: <20261019135309.23578-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
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

panel_fitter_scaling() apparently tries to implemnt
DIV_ROUND_CLOSEST() by hand, but in a somewhat weird way
where the division and rounding are done as separate steps.
Just use the real DIV_ROUND_CLOSEST() instead.

This does in fact match how the i965+ hardware calculates
the automagic scaling factors, which will be important
for upcoming readout support.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 82804159d0a1..5d519f45adbe 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -350,15 +350,7 @@ centre_vertically(struct drm_display_mode *adjusted_mode,
 
 static u32 panel_fitter_scaling(u32 source, u32 target)
 {
-	/*
-	 * Floating point operation is not supported. So the FACTOR
-	 * is defined, which can avoid the floating point computation
-	 * when calculating the panel ratio.
-	 */
-#define ACCURACY 12
-#define FACTOR (1 << ACCURACY)
-	u32 ratio = source * FACTOR / target;
-	return (FACTOR * ratio + FACTOR/2) / FACTOR;
+	return DIV_ROUND_CLOSEST(source << 12, target);
 }
 
 static void i965_scale_aspect(struct intel_crtc_state *crtc_state,
-- 
2.55.0

