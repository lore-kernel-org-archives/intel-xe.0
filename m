Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC27C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B1F10E301;
	Fri, 17 Jul 2026 15:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVsv/XcZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4620C897FD;
 Fri, 17 Jul 2026 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784303473; x=1815839473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GYJP/Qkkuv8SC1nesZ+zygEQnpqogv4O8mP20JmumIg=;
 b=DVsv/XcZMtxM+DT0l5WQNZjQ7iRbsrxicVgnMCjUurmIixEsrhnecbat
 JXkR00azxQH6aggPQ8yonltu55EutQ6sr32FSFxLEpq9t1ryIEQj0FpIO
 fB758zN9oZ9jVX9o+c8ai+fWqMRGidoDETjogSRmIfKsSi0MIYVqKu0Xj
 EXpAfVCq8I6Nfa5ej9iNPSycV6P1G3aMguA59lTXs/tKam/YRBYpo4nCr
 uT9Tjx9kiqppdXRfDt4r6cxSWre6SoG75D4kvP3bLJ9zyutW0V8Pc2l91
 9zSFppgvMXntFOfoJmMfxElqhTOxQvdF5jYDrqJEjqvo1x2/Nq2ni02db A==;
X-CSE-ConnectionGUID: EaPEFabxQa64iYun4ftLFA==
X-CSE-MsgGUID: RgDnNRPZSoq+Xx8fJnzy4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96112551"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96112551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:51:12 -0700
X-CSE-ConnectionGUID: 05KjFR8HTwO1JHWIrXr50g==
X-CSE-MsgGUID: nAsNTk8cRAmFYlI9eCCxng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="257452336"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:51:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+
Date: Fri, 17 Jul 2026 18:51:06 +0300
Message-ID: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Apparently PTL+ no longer has the cd2x pipe select field in
CDCLK_CTL. Take that into account during CDCLK sanitization.

This currently triggers a spurious CDCLK sanitization during
driver load on PTL+ which will causes a visible glitch on all
active displays.

Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8550
Fixes: 3f9de66f8acb ("drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index a53d88727177..9e5e15b0c4d1 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2381,8 +2381,10 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	 * dividers both syncing to an active pipe, or asynchronously
 	 * (PIPE_NONE).
 	 */
-	cdctl &= ~bxt_cdclk_cd2x_pipe_mask(display);
-	cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	if (DISPLAY_VER(display) < 30) {
+		cdctl &= ~bxt_cdclk_cd2x_pipe_mask(display);
+		cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	}
 
 	if (cdctl != expected) {
 		if (DISPLAY_VER(display) < 20) {
-- 
2.54.0

