Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D47CD98F2
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 12:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0B10EB2F;
	Tue, 23 Jun 2026 12:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT0XBvdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF2510EB32;
 Tue, 23 Jun 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782219092; x=1813755092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VIK2R5YGk0udPMUKwl/ehWsl1szN1wcl55Kfb3QlU7w=;
 b=eT0XBvdXIeJhsehZ20qHX8VotH0KZ8yRx9Hg+GWmqSuh8zXnKMjQkPmC
 +BgAJxnzJoMIVgpW65FoMkS7JI27Y5j1+w/j2kYdXAsYiV2v9zopBh967
 cFUCi3n4emvcuxX9DjI4XA4BJvvJ3Iv/pM9FQjpTJhQHN9CDC/Nwg1qPZ
 kzek5IS/R2N7+6pcwSsTGXaK2WqbWloUK4sJc/nUtHIxiDeIFYxMb0jFS
 02dfBWxZcFY1SMHBkeRQX8srjLPq/1Rnf+02gWtOFJvXNjbJa7TMYvlsP
 o5UD0aS9Q/DQRoXIljvXJ0a8dqpfYSh7qCYu/0oulOJiOA5LOTLCiVtQL g==;
X-CSE-ConnectionGUID: pHz/jXMQTx6fDGoUaUMtzw==
X-CSE-MsgGUID: mA0qP8Z4Q8iYrTG09frRAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82065358"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82065358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:31 -0700
X-CSE-ConnectionGUID: Ap1q4ndGTemhmRktjbXiZA==
X-CSE-MsgGUID: /C6+AX1qR3C2ZIJAAIwPIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249368451"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:30 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/gmbus: Add gmbus_pins_lpt_lp[]
Date: Tue, 23 Jun 2026 15:51:08 +0300
Message-ID: <20260623125111.6632-4-ville.syrjala@linux.intel.com>
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

LPT/WPT-LP don't have as many GOIO pins as the -H variants.
Add proper mapping for the -LP PCHs so that we can't end up
poking at non-existent GPIOs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 2869ec23e1ec..f69b8841c5dd 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -86,13 +86,18 @@ static const struct gmbus_pin gmbus_pins[] = {
 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
 };
 
-static const struct gmbus_pin gmbus_pins_lpt[] = {
+static const struct gmbus_pin gmbus_pins_lpt_h[] = {
 	[GMBUS_PIN_VGADDC] = { "vga", GPIO_0 },
 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
 };
 
+static const struct gmbus_pin gmbus_pins_lpt_lp[] = {
+	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
+};
+
 static const struct gmbus_pin gmbus_pins_skl[] = {
 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
@@ -178,9 +183,12 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
 	} else if (DISPLAY_VER(display) == 9) {
 		pins = gmbus_pins_skl;
 		size = ARRAY_SIZE(gmbus_pins_skl);
+	} else if (HAS_PCH_LPT_LP(display)) {
+		pins = gmbus_pins_lpt_lp;
+		size = ARRAY_SIZE(gmbus_pins_lpt_lp);
 	} else if (HAS_PCH_LPT(display)) {
-		pins = gmbus_pins_lpt;
-		size = ARRAY_SIZE(gmbus_pins_lpt);
+		pins = gmbus_pins_lpt_h;
+		size = ARRAY_SIZE(gmbus_pins_lpt_h);
 	} else {
 		pins = gmbus_pins;
 		size = ARRAY_SIZE(gmbus_pins);
-- 
2.53.0

