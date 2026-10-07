Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F09CA600E
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A480910E6EF;
	Wed,  7 Oct 2026 22:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffGn4A5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BFB10E6EF;
 Wed,  7 Oct 2026 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411806; x=1822947806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/UGfc8wwvuOmkikkyYSFKnzdrorbLxE2TeaTTaAKAIQ=;
 b=ffGn4A5St+PiosjWU4h+Q/jWmsoI1OzWAiBWUrYUUVRWn+6i1eSdGVmT
 M5BKX/wXXLmz75K+CkrWBpsJw+K/gSf6/qEWfTSaIPSsW5OS8pihjfzEn
 0zvUktCaJqL3ASOMK2g/hywKR2wa68f9SB4PGHTSIHDyOzgfId3Br32I2
 Bk0BnbZHhEn0qX+YzPJhR04Bvn21hy5GmZmMQ37wnlSdqDl0Ob22RKPrZ
 /5tokZg5B1kWD/WAGq5+IaKvDx3lcSYcYDzkm5Iqe45qRSKBTpth39gfQ
 d4GSjYB2qrCCPBJONu+9JZbd6f4TSJEbZIt7xkODxxmrXL8xPbp9uMLNA A==;
X-CSE-ConnectionGUID: ezQGGJE+T1+/JFAHsYcoEg==
X-CSE-MsgGUID: i/Aq2g4XTsKJOCDeNCsCMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="88783"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="88783"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:26 -0700
X-CSE-ConnectionGUID: 1ZTVQaCrRjGVTtNsJoPWKg==
X-CSE-MsgGUID: npDiuNq4QnqGXwE8LfCu3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="193214"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:25 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/gmbus: Handle the internal pullup disable bits
 more sensibly
Date: Thu,  8 Oct 2026 01:23:11 +0300
Message-ID: <20261007222314.5714-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
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

On gen2/3 platforms the GPIO register bits 5 and 13 are
documented to be either internal pullup disable bits, or
documented as reserved bits that must be preserved by software.
It seems to be that either way we want to preserve their
state always. That is, if they really are pullup disables, then
presumably the firmware has configured them appropriately for us.
So let's always preserve the state of these pins on gen2/3
platforms.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index d23422e12aa4..e808f5c4106b 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -251,11 +251,13 @@ static u32 get_reserved(struct intel_gmbus *bus)
 	struct intel_display *display = bus->display;
 	u32 preserve_bits = 0;
 
-	if (display->platform.i830 || display->platform.i845g)
-		return 0;
-
-	/* On most chips, these bits must be preserved in software. */
-	preserve_bits |= GPIO_DATA_PULLUP_DISABLE | GPIO_CLOCK_PULLUP_DISABLE;
+	/*
+	 * On gen2/3 these are either internal pullup disables, or
+	 * documented as reserved bits that need to be preserved.
+	 */
+	if (DISPLAY_VER(display) < 4)
+		preserve_bits |= GPIO_DATA_PULLUP_DISABLE |
+			GPIO_CLOCK_PULLUP_DISABLE;
 
 	/* Wa_16025573575: the masks bits need to be preserved through out */
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
-- 
2.55.0

