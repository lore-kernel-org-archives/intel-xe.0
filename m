Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B2FCD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A9210F609;
	Fri, 12 Jun 2026 17:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jtr0rWkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2207710F600;
 Fri, 12 Jun 2026 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285823; x=1812821823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fWGC81irtc3FgYuB6Oqyxu4N6KlX3XgoGRaqoZ8sNCg=;
 b=Jtr0rWkNoSOeoiWCFOD1PItHrZ3A+Ee5zVkGrPFL//ORSZ1ykimdSOMj
 m/3aCOjYZDNuYiOMIhB4SOBEVY7KKmMu6SanSooS8c1tioghiYEz55TjC
 OE40t146OYYQg8wQ1ZOnlhddm006yD0OylqxcQQCu25zcv7RxuvLqdB8c
 EBuparYnEgR3Igv0ZiZx8G3SNWfQ7kmptGmK0XjMU7IKPYOkOJgQmvhDJ
 1Dc+4geaGdsADITp4MlyNGQjr/wKhH2K9hvI9gPsyfdEG/aeSCtjC1Ttj
 WAhzufJ5i2ofxb2YDAcv6C3wdhAfDAGI6+ng5CRorPOOsfqP5GqLvtPJK g==;
X-CSE-ConnectionGUID: sFYz1bkFT3ykiryqOZu84Q==
X-CSE-MsgGUID: Jh9aY1wyTBuLfon/B3ZHiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107555869"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="107555869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:03 -0700
X-CSE-ConnectionGUID: hRIYg1gNQzu6H3erCyUynA==
X-CSE-MsgGUID: 363cRv/xQWCKR4Wrij7ZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="242500638"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:01 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full
 PLL re-enable
Date: Fri, 12 Jun 2026 20:36:48 +0300
Message-ID: <20260612173653.7830-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
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

The GOP (and even Bspec on some platforms) is a bit inconsistent
on what the CDCLK_FREQ_DECIMAL divider should be. Currently any
mismatch there causes a full CDCLK PLL disable+re-enable, which
we really don't want to do if any displays are currently active.
Let's instead just reprogram CDCLK_FREQ_DECIMAL when that is the
only thing amiss. For any other (more serious) mismatch we still
punt to the full PLL reprogramming.

We also need to tweak the bxt_cdclk_cd2x_pipe() stuff a bit to
consistently select pipe==NONE since we have no idea which pipes
are enabled at this point. Since we're not actually changing the
CDCLK frequency here we don't need to sync the update to any
pipe.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16209
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 41 ++++++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 189ae2d3cfc9..7bc9b956554b 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1256,9 +1256,22 @@ static void skl_sanitize_cdclk(struct intel_display *display)
 	cdctl = intel_de_read(display, CDCLK_CTL);
 	expected = (cdctl & CDCLK_FREQ_SEL_MASK) |
 		skl_cdclk_decimal(display->cdclk.hw.cdclk);
-	if (cdctl == expected)
-		/* All well; nothing to sanitize */
-		return;
+
+	if (cdctl != expected) {
+		cdctl &= ~CDCLK_FREQ_DECIMAL_MASK;
+		cdctl |= expected & CDCLK_FREQ_DECIMAL_MASK;
+
+		if (cdctl != expected)
+			goto sanitize;
+
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK decimal divider (CDCLK_CTL 0x%x, expected 0x%x)\n",
+			    intel_de_read(display, CDCLK_CTL), expected);
+
+		intel_de_write(display, CDCLK_CTL, expected);
+	}
+
+	/* All well; nothing to sanitize */
+	return;
 
 sanitize:
 	drm_dbg_kms(display->drm, "Sanitizing cdclk programmed by pre-os\n");
@@ -2354,11 +2367,25 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	 * (PIPE_NONE).
 	 */
 	cdctl &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
-	expected &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
 
-	if (cdctl == expected)
-		/* All well; nothing to sanitize */
-		return;
+	if (cdctl != expected) {
+		if (DISPLAY_VER(display) < 20) {
+			cdctl &= ~CDCLK_FREQ_DECIMAL_MASK;
+			cdctl |= expected & CDCLK_FREQ_DECIMAL_MASK;
+		}
+
+		if (cdctl != expected)
+			goto sanitize;
+
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK decimal divider (CDCLK_CTL 0x%x, expected 0x%x)\n",
+			    intel_de_read(display, CDCLK_CTL), expected);
+
+		intel_de_write(display, CDCLK_CTL, expected);
+	}
+
+	/* All well; nothing to sanitize */
+	return;
 
 sanitize:
 	drm_dbg_kms(display->drm, "Sanitizing cdclk programmed by pre-os\n");
-- 
2.53.0

