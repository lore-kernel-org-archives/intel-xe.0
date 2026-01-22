Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8200CA5FB6
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 12:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A09E10E99C;
	Thu, 22 Jan 2026 12:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/26r2sC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B335C10E999;
 Thu, 22 Jan 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769085455; x=1800621455;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=FFtXVaUub2Rc43F/UTMvzFwkypkgF+to4Xw2jMzIS4c=;
 b=Y/26r2sC1UxL8pwCiSvCtaEtIY3XO4Etrwr2X+0uduIBQN/8ZvwMOPwI
 I8T7Z08+mWqAY5KEwrw6vHh9oDtK9X9fzx5XOAb1uDJ4veILk2FMFmJkZ
 +GONivPmYPdtKPE2PNccQItxE9hH6EsFJNSNTjK6EfcK1egQYVk2b4ZHz
 xFRxL0/nmhFoDAm2c0bS5theZvAQc0m47nCnguqIGPgqF3R4e82UD2Zdk
 es6gv84tCQjHaS0cyiD8SWCH6IJkC8VLHHy/4Vd67kYImWzSCPrYElgmR
 SN0HB2Ydb1bQbBIFxACCG3InpcadFftiB3/R4vP9k5hLRkKOIFh3IsBAC A==;
X-CSE-ConnectionGUID: B/K2xOiSSk+YyNuVs3eqGQ==
X-CSE-MsgGUID: 4E2r7UInTkqIhSPgzxEjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69342943"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69342943"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:37:35 -0800
X-CSE-ConnectionGUID: JquDpZ/WTyuod/5E8wdymg==
X-CSE-MsgGUID: MxfLK4xQTNGVKU5JoXk4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206331384"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.110])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:37:34 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 22 Jan 2026 09:37:07 -0300
Subject: [PATCH] drm/i915/cdclk: Extend Wa_13012396614 to Xe3p_LPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-wa_13012396614-xe3p_lpd-v1-1-39d34a3a5b77@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMj3fLEeENjIMvY0szM0ES3ItW4ID6nIEU3xdTCwjAxydzQyNxECai
 7oCg1LbMCbHJ0bG0tAHE/52RpAAAA
X-Change-ID: 20260122-wa_13012396614-xe3p_lpd-d5881ab71274
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Xe3p_LPD also needs Wa_13012396614.  Update the conditions for that
workaround accordingly.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 581d943b9bdc..4ff690124b33 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -63,7 +63,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 {
 	switch (wa) {
 	case INTEL_DISPLAY_WA_13012396614:
-		return DISPLAY_VERx100(display) == 3000;
+		return DISPLAY_VERx100(display) == 3000 ||
+			DISPLAY_VERx100(display) == 3500;
 	case INTEL_DISPLAY_WA_14011503117:
 		return DISPLAY_VER(display) == 13;
 	case INTEL_DISPLAY_WA_14025769978:

---
base-commit: 75950b1567cb40a67e93cb3912e023219745ff60
change-id: 20260122-wa_13012396614-xe3p_lpd-d5881ab71274

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

