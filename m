Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63666CD98F2
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 12:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEBE10EB26;
	Tue, 23 Jun 2026 12:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmuNig3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6310EB26;
 Tue, 23 Jun 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782219097; x=1813755097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nOu5fE+ZconjAR1qxkLdrSVTchJLkNg2Pvth5m/p5IQ=;
 b=hmuNig3Z/HXnbkWbslhadb6CMSxIM7MNgLfCv/k3JzQ0ShtF6vRmtV1e
 ZOuJv1YcGjWU6SedvQeKQ6wCGVgeDTk3/hBhvQYZm239uSr3nYheVonuD
 0K6DNU3nx7TGNGVGk825M5KXS7TWkF/xTWc8rm5EEYMXtCXneabSsLjR0
 mVudNE2spWnGtj9D/fXSk5agiEDJEALBnjL8SUWk0XDW12Ix6FPJCfWIQ
 Lb7aGjLZKB6LdIE9UseUwClWLxsQv0ceAYnjacL5gszZ4SFrhe3em/p8D
 vGPJzzGjpeppkLhzfxCld8Ay4ZQG1EYwcSMF/fHC6NXKL1gyMd0JosOeK g==;
X-CSE-ConnectionGUID: CgKhgmCVRty4MQhJfQ3YEQ==
X-CSE-MsgGUID: P0yJqmhdTQm28U9/aVLYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100387513"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="100387513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:36 -0700
X-CSE-ConnectionGUID: yf5XhQLxSyeBdDRG5gb6xA==
X-CSE-MsgGUID: SWjxmHr1QjaEVPl8xLJ6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249624927"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:34 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/gmbus: s/gmbus_pins_skl/gmbus_pins_spt/
Date: Tue, 23 Jun 2026 15:51:09 +0300
Message-ID: <20260623125111.6632-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
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

The GMBUS pin pair <-> GPIO mapping is purely a property
of the PCH (on the platforms where GMBUS lives in the PCH).
So rename gmbus_pins_skl[] to gmbus_pins_spt[] and apply
it based on the presence of the correct PCH type.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index f69b8841c5dd..dec0f66f756f 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -98,7 +98,7 @@ static const struct gmbus_pin gmbus_pins_lpt_lp[] = {
 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
 };
 
-static const struct gmbus_pin gmbus_pins_skl[] = {
+static const struct gmbus_pin gmbus_pins_spt[] = {
 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
@@ -180,9 +180,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
 	} else if (display->platform.geminilake || display->platform.broxton) {
 		pins = gmbus_pins_bxt;
 		size = ARRAY_SIZE(gmbus_pins_bxt);
-	} else if (DISPLAY_VER(display) == 9) {
-		pins = gmbus_pins_skl;
-		size = ARRAY_SIZE(gmbus_pins_skl);
+	} else if (HAS_PCH_SPT(display)) {
+		pins = gmbus_pins_spt;
+		size = ARRAY_SIZE(gmbus_pins_spt);
 	} else if (HAS_PCH_LPT_LP(display)) {
 		pins = gmbus_pins_lpt_lp;
 		size = ARRAY_SIZE(gmbus_pins_lpt_lp);
-- 
2.53.0

