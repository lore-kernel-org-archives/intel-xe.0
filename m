Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F7CD98F2
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 12:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6AB10EB26;
	Tue, 23 Jun 2026 12:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqIksUFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C35B10EB26;
 Tue, 23 Jun 2026 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782219082; x=1813755082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RdjN7KHB2mcazyCo6F3VWPrM55qMSOrJSjCQ8CEfu0g=;
 b=CqIksUFA+6RufqIMQJ+f8RMF/UhN32iTrOSehmlKsptfuzckqcfPQ5zP
 dXyCAXjXGA4XYiN4rYuZ73BpNZuggUGQneVGYVyinPH+F+QkG3RaSxxPn
 Z4yMluW8a5PKTpeq1P6XT1xLbONr6jkRHnw+3s56z2NNM1V19a4CtBSvb
 4QiIC/BQpy6N+vTWQIECvHvYF5gi483Eh2RfgN+ENuFPxG3h3w6bQr9U8
 u0nWSxpO67qAA43yILjh4ZJzDH4iSTINd8lmn359rpLYhlqbg5gOhtt5y
 JCg3c74WKyzyCPi94no/bQS6MK25oaGyUMpaVHb3f0R7Bsq5qfgHXHkdf g==;
X-CSE-ConnectionGUID: 4VSpT1uLTei1woB7Du+C8w==
X-CSE-MsgGUID: az92d8M0TqSu3xkhwnyWlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100387493"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="100387493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:21 -0700
X-CSE-ConnectionGUID: ZqnM4pIvTqq+qxV18TH5sw==
X-CSE-MsgGUID: EaxnHeK+TZW0BTJxBxnDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249624909"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915/gmbus: Rename GPIO pins
Date: Tue, 23 Jun 2026 15:51:06 +0300
Message-ID: <20260623125111.6632-2-ville.syrjala@linux.intel.com>
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

Replace the alphabetical GPIOA,GPIOB,... with numeric
GPIO_0,GPIO_1,... This makes the naming scheme agree with
BSpec. No idea why the alphabetical naming was originally
chosen as BSpec never used that convention for the GPIO pins.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 124 ++++++++++-----------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 049157c41fe2..9990e6391b03 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -54,21 +54,21 @@ struct intel_gmbus {
 };
 
 enum gmbus_gpio {
-	GPIOA,
-	GPIOB,
-	GPIOC,
-	GPIOD,
-	GPIOE,
-	GPIOF,
-	GPIOG,
-	GPIOH,
-	__GPIOI_UNUSED,
-	GPIOJ,
-	GPIOK,
-	GPIOL,
-	GPIOM,
-	GPION,
-	GPIOO,
+	GPIO_0,
+	GPIO_1,
+	GPIO_2,
+	GPIO_3,
+	GPIO_4,
+	GPIO_5,
+	GPIO_6,
+	GPIO_7,
+	GPIO_8,
+	GPIO_9,
+	GPIO_10,
+	GPIO_11,
+	GPIO_12,
+	GPIO_13,
+	GPIO_14,
 };
 
 struct gmbus_pin {
@@ -78,77 +78,77 @@ struct gmbus_pin {
 
 /* Map gmbus pin pairs to names and registers. */
 static const struct gmbus_pin gmbus_pins[] = {
-	[GMBUS_PIN_SSC] = { "ssc", GPIOB },
-	[GMBUS_PIN_VGADDC] = { "vga", GPIOA },
-	[GMBUS_PIN_PANEL] = { "panel", GPIOC },
-	[GMBUS_PIN_DPC] = { "dpc", GPIOD },
-	[GMBUS_PIN_DPB] = { "dpb", GPIOE },
-	[GMBUS_PIN_DPD] = { "dpd", GPIOF },
+	[GMBUS_PIN_SSC] = { "ssc", GPIO_1 },
+	[GMBUS_PIN_VGADDC] = { "vga", GPIO_0 },
+	[GMBUS_PIN_PANEL] = { "panel", GPIO_2 },
+	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
+	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
 };
 
 static const struct gmbus_pin gmbus_pins_bdw[] = {
-	[GMBUS_PIN_VGADDC] = { "vga", GPIOA },
-	[GMBUS_PIN_DPC] = { "dpc", GPIOD },
-	[GMBUS_PIN_DPB] = { "dpb", GPIOE },
-	[GMBUS_PIN_DPD] = { "dpd", GPIOF },
+	[GMBUS_PIN_VGADDC] = { "vga", GPIO_0 },
+	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
+	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
 };
 
 static const struct gmbus_pin gmbus_pins_skl[] = {
-	[GMBUS_PIN_DPC] = { "dpc", GPIOD },
-	[GMBUS_PIN_DPB] = { "dpb", GPIOE },
-	[GMBUS_PIN_DPD] = { "dpd", GPIOF },
+	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
+	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
 };
 
 static const struct gmbus_pin gmbus_pins_bxt[] = {
-	[GMBUS_PIN_1_BXT] = { "dpb", GPIOB },
-	[GMBUS_PIN_2_BXT] = { "dpc", GPIOC },
-	[GMBUS_PIN_3_BXT] = { "misc", GPIOD },
+	[GMBUS_PIN_1_BXT] = { "dpb", GPIO_1 },
+	[GMBUS_PIN_2_BXT] = { "dpc", GPIO_2 },
+	[GMBUS_PIN_3_BXT] = { "misc", GPIO_3 },
 };
 
 static const struct gmbus_pin gmbus_pins_cnp[] = {
-	[GMBUS_PIN_1_BXT] = { "dpb", GPIOB },
-	[GMBUS_PIN_2_BXT] = { "dpc", GPIOC },
-	[GMBUS_PIN_3_BXT] = { "misc", GPIOD },
-	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
+	[GMBUS_PIN_1_BXT] = { "dpb", GPIO_1 },
+	[GMBUS_PIN_2_BXT] = { "dpc", GPIO_2 },
+	[GMBUS_PIN_3_BXT] = { "misc", GPIO_3 },
+	[GMBUS_PIN_4_CNP] = { "dpd", GPIO_4 },
 };
 
 static const struct gmbus_pin gmbus_pins_icp[] = {
-	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
-	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
-	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
-	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
-	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOK },
-	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOL },
-	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOM },
-	[GMBUS_PIN_13_TC5_TGP] = { "tc5", GPION },
-	[GMBUS_PIN_14_TC6_TGP] = { "tc6", GPIOO },
+	[GMBUS_PIN_1_BXT] = { "dpa", GPIO_1 },
+	[GMBUS_PIN_2_BXT] = { "dpb", GPIO_2 },
+	[GMBUS_PIN_3_BXT] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIO_9 },
+	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIO_10 },
+	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIO_11 },
+	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIO_12 },
+	[GMBUS_PIN_13_TC5_TGP] = { "tc5", GPIO_13 },
+	[GMBUS_PIN_14_TC6_TGP] = { "tc6", GPIO_14 },
 };
 
 static const struct gmbus_pin gmbus_pins_dg1[] = {
-	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
-	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
-	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
-	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
+	[GMBUS_PIN_1_BXT] = { "dpa", GPIO_1 },
+	[GMBUS_PIN_2_BXT] = { "dpb", GPIO_2 },
+	[GMBUS_PIN_3_BXT] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_4_CNP] = { "dpd", GPIO_4 },
 };
 
 static const struct gmbus_pin gmbus_pins_dg2[] = {
-	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
-	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
-	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
-	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
-	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
+	[GMBUS_PIN_1_BXT] = { "dpa", GPIO_1 },
+	[GMBUS_PIN_2_BXT] = { "dpb", GPIO_2 },
+	[GMBUS_PIN_3_BXT] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_4_CNP] = { "dpd", GPIO_4 },
+	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIO_9 },
 };
 
 static const struct gmbus_pin gmbus_pins_mtp[] = {
-	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
-	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
-	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
-	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
-	[GMBUS_PIN_5_MTP] = { "dpe", GPIOF },
-	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
-	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOK },
-	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOL },
-	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOM },
+	[GMBUS_PIN_1_BXT] = { "dpa", GPIO_1 },
+	[GMBUS_PIN_2_BXT] = { "dpb", GPIO_2 },
+	[GMBUS_PIN_3_BXT] = { "dpc", GPIO_3 },
+	[GMBUS_PIN_4_CNP] = { "dpd", GPIO_4 },
+	[GMBUS_PIN_5_MTP] = { "dpe", GPIO_5 },
+	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIO_9 },
+	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIO_10 },
+	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIO_11 },
+	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIO_12 },
 };
 
 static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
-- 
2.53.0

