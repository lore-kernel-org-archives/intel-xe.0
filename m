Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD1606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BjZfq7zq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5D10EA17;
	Thu, 26 Nov 2026 18:49:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB6A10EA17;
 Thu, 26 Nov 2026 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795718950; x=1827254950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ziSeXISeoB5JnU3m7EO3SqqXPxF1FCUkxTOhHjEEJ+k=;
 b=BjZfq7zqTbeW20jpk1TuIqGzs03uTa8YZBrxjPf+/jNZ+zCHTVscd2HK
 XHdrEgrd6cH4uMGXyMd4dJq09NyCaePx7jnIVWMuxrTUUR66iuE9tzQDe
 HXe6WutajXdWOrvh36HX28XiaJB8ULNBjOOse9emOqwM7VwOMMY6Z/kM3
 h/Kr6OClP5GCEpwjw0qH5e0pCwIj93ulGe6c5+eSmwRfBAjrJ645kPVYb
 BFFufDrHBV9pu8GWOPDzyk1YD355TXkM7vbwim5mjrndfwoYTu2z/p7dg
 sRENiOm8/RmceU0O2Qq2zm8UyOIMN0OXr5p116Q9sNbB9oIOAarP6dghG A==;
X-CSE-ConnectionGUID: Pw1zr+k2QeKJ7iMiuexspQ==
X-CSE-MsgGUID: wR71wWNFSLyfSHilqb/eEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4478864"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4478864"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:49:09 -0800
X-CSE-ConnectionGUID: XMidqCanR7uVUpx/8kNFZA==
X-CSE-MsgGUID: SzfFBa7HS3KsdZFAK4NyJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12120363"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 10:49:08 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] drm/i915/cdclk: Fix 2 PPC hscale adjustment for min CDCLK
Date: Fri, 27 Nov 2026 00:40:32 +0530
Message-ID: <20261126191032.1961148-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The horizontal scaler filter works at 2 PPC, but still needs a full
clock for a fractional shift of just one pixel. It doesn't shift by
two pixels and re-align the taps, so the extra clock doesn't average
out.

Bspec now documents the downscale amount used for the min CDCLK
calculation as:

  hscale_ppc = int(hscale) + min(1, ppc * frac(hscale))
  downscale  = max(hscale_ppc, hscale * vscale)

Compared to the empirical formula we have now, the fractional penalty
is capped at one extra clock, and since the scaler filters vertically
first the penalty does not multiply with the vertical downscale factor.
Update the code to match.

Platforms without 2 PPC (ppc == 1) are unaffected as the formula then
reduces to hscale * vscale.

Bspec: 68858
Fixes: f69946f6d891 ("drm/i915/cdclk: Deal with 2 PPC hscale issues when calculating min CDCLK")
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 42 ++++++++++++++--------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index d23de0f34e4b..4a430d6a0ba9 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -266,25 +266,28 @@ unsigned int intel_adjusted_rate(const struct drm_rect *src,
 }
 
 static unsigned int hscale_cdclk(const struct drm_rect *src,
-				 const struct drm_rect *dst,
-				 unsigned int ppc)
+				 const struct drm_rect *dst)
 {
 	unsigned int hscale;
 
 	hscale = drm_rect_calc_hscale(src, dst, 0, INT_MAX);
 	hscale = max(hscale, 0x10000);
 
-	/*
-	 * Double the fractional part due to some 2 PPC granularity issue
-	 *
-	 * FIXME: BSpec calls for doubling only the <0.5 fractional part,
-	 * and rounding it down to a unit fraction. In practice that is
-	 * not sufficient, and we need a more aggressive CDCLK bump in
-	 * many cases. The updated formula was derived empirically.
-	 * This may need to be updated once we have better undestading
-	 * of what's happening in the hardware...
-	 */
-	return (hscale & ~0xffff) + ppc * (hscale & 0xffff);
+	return hscale;
+}
+
+/*
+ * Bspec: 68858
+ *
+ * The horizontal filter works at 2 PPC but still needs a full clock
+ * for a fractional shift of just 1 pixel, so the fractional part of
+ * the horizontal downscale factor costs PPC times more, but at most
+ * one full extra clock.
+ */
+static unsigned int hscale_ppc_cdclk(unsigned int hscale,
+				     unsigned int ppc)
+{
+	return (hscale & ~0xffff) + min(ppc * (hscale & 0xffff), 0x10000);
 }
 
 static unsigned int vscale_cdclk(const struct drm_rect *src,
@@ -303,10 +306,19 @@ unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
 				       unsigned int rate,
 				       unsigned int ppc)
 {
-	unsigned int hscale = hscale_cdclk(src, dst, ppc);
+	unsigned int hscale = hscale_cdclk(src, dst);
 	unsigned int vscale = vscale_cdclk(src, dst);
+	u64 scale;
+
+	/*
+	 * The scaler filters vertically first, so the horizontal
+	 * PPC inefficiency doesn't multiply with the vertical
+	 * downscale factor. .32 fixed point.
+	 */
+	scale = max((u64)hscale_ppc_cdclk(hscale, ppc) << 16,
+		    mul_u32_u32(hscale, vscale));
 
-	return DIV64_U64_ROUND_UP((u64)rate * hscale * vscale, 1ull << 32);
+	return DIV64_U64_ROUND_UP(rate * scale, 1ull << 32);
 }
 
 unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
-- 
2.50.1

