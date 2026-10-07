Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A1BCA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D1D10F809;
	Wed,  7 Oct 2026 22:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHYFicoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B894510E69C;
 Wed,  7 Oct 2026 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411815; x=1822947815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Jb5MaA4LRsAUkQMlQU4NppAnlGniokDYZVhcp3OKkM=;
 b=HHYFicoLJfeMtJ8JHK0EEsVH646jhq6zNdUjjiE60iSh7hUckJ0f1/BK
 8DU0fhHWDQSKbUK1oigUH+0LeBFcbQgXqrM1vHyJUgwHyJBKIqfCCac7r
 wNFfgzPNzkqLAP8SjFrtg2DZw6Y13NknAth8qEiBwvLAqitbRSxbVqAHZ
 u7q6KzhRkmpHEqDSTL9V3rrD3IT2H7GAj03Y0uRZ7wkV8kTQVhhlrdF3q
 wvHYHB/Krpf6WIYA2ChVW+sVdOyJb2ZcXyJHUnmDK8c4GcvT6QNKSJtRt
 NUmLLFiVGVxE3QtIFMEfRgXoi3xXBOe+ksqLX94PoCUmE2FJ+SIeQ3YOt A==;
X-CSE-ConnectionGUID: OiPnkHhaTK6OZa54MLjAFw==
X-CSE-MsgGUID: lGpHDQUjTrCsfaMg9LLNjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="88791"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="88791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:34 -0700
X-CSE-ConnectionGUID: yMLXAX1KRdenB3RVOO45tA==
X-CSE-MsgGUID: QF6LcioaTSucVHDtBRpulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="193224"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/gmbus: Fix i2c bit banging for PTL+
Date: Thu,  8 Oct 2026 01:23:13 +0300
Message-ID: <20261007222314.5714-5-ville.syrjala@linux.intel.com>
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

The current implementation of w/a 16025573575 does not actually work.
The GPIO register mask bits are write only, and thus he read-modify-write
cycles we do will not preserve them. Furthermore the implementation makes
no effort to preserve the actual direction/output value bits, which is
a must if all the mask bits were actually set all the time.

Rewrite the whole thing so that we always set all the mask bits,
and correctly preserve the previous state of the direction/output value
bits. And do that on all platforms so that we only have a single codepath
to worry about. As a bonus this approach will also make the code
work on upcoming platforms where the mask bits no longer even exist.

Smoke tested on alm,cl,tgl,lnl,ptl.

Fixes: 7565fd5dcb0b ("drm/i915/gmbus: Add Wa_16025573575 for PTL/WCL for bit-bashing")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 98 ++++++++++++++--------
 1 file changed, 61 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 854f439ac5ba..b6c63a466233 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -246,25 +246,45 @@ static void bxt_gmbus_clock_gating(struct intel_display *display,
 		     !enable ? BXT_GMBUS_GATING_DIS : 0);
 }
 
-static u32 get_reserved(struct intel_gmbus *bus)
+static u32 gpio_mask_bits(struct intel_display *display)
 {
-	struct intel_display *display = bus->display;
-	u32 preserve_bits = 0;
+	return GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
+		GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
+}
+
+static u32 gpio_preserved_bits(struct intel_display *display)
+{
+	u32 val = GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_VAL_OUT |
+		GPIO_DATA_DIR_OUT | GPIO_DATA_VAL_OUT;
 
 	/*
 	 * On gen2/3 these are either internal pullup disables, or
 	 * documented as reserved bits that need to be preserved.
 	 */
 	if (DISPLAY_VER(display) < 4)
-		preserve_bits |= GPIO_DATA_PULLUP_DISABLE |
+		val |= GPIO_DATA_PULLUP_DISABLE |
 			GPIO_CLOCK_PULLUP_DISABLE;
 
-	/* Wa_16025573575: the masks bits need to be preserved through out */
-	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
-		preserve_bits |= GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
-				 GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
+	return val;
+}
 
-	return intel_de_read_fw(display, bus->gpio_reg) & preserve_bits;
+static u32 gpio_read_reg(struct intel_gmbus *bus)
+{
+	struct intel_display *display = bus->display;
+	u32 val;
+
+	val = intel_de_read_fw(display, bus->gpio_reg);
+
+	val &= gpio_preserved_bits(display);
+
+	/*
+	 * Wa_16025573575:
+	 * The (write only!) masks bits need to be kept set through out
+	 * on PTL. Do it always to keep the code uniform for all platforms.
+	 */
+	val |= gpio_mask_bits(display);
+
+	return val;
 }
 
 static int get_clock(void *data)
@@ -287,16 +307,16 @@ static void set_clock(void *data, int state_high)
 {
 	struct intel_gmbus *bus = data;
 	struct intel_display *display = bus->display;
-	u32 reserved = get_reserved(bus);
-	u32 clock_bits;
+	u32 val;
 
-	if (state_high)
-		clock_bits = GPIO_CLOCK_DIR_IN | GPIO_CLOCK_DIR_MASK;
-	else
-		clock_bits = GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_DIR_MASK |
-			     GPIO_CLOCK_VAL_MASK;
+	val = gpio_read_reg(bus);
 
-	intel_de_write_fw(display, bus->gpio_reg, reserved | clock_bits);
+	val &= ~(GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_VAL_OUT);
+
+	if (!state_high)
+		val |= GPIO_CLOCK_DIR_OUT;
+
+	intel_de_write_fw(display, bus->gpio_reg, val);
 	intel_de_posting_read_fw(display, bus->gpio_reg);
 }
 
@@ -304,32 +324,36 @@ static void set_data(void *data, int state_high)
 {
 	struct intel_gmbus *bus = data;
 	struct intel_display *display = bus->display;
-	u32 reserved = get_reserved(bus);
-	u32 data_bits;
+	u32 val;
 
-	if (state_high)
-		data_bits = GPIO_DATA_DIR_IN | GPIO_DATA_DIR_MASK;
-	else
-		data_bits = GPIO_DATA_DIR_OUT | GPIO_DATA_DIR_MASK |
-			GPIO_DATA_VAL_MASK;
+	val = gpio_read_reg(bus);
 
-	intel_de_write_fw(display, bus->gpio_reg, reserved | data_bits);
+	val &= ~(GPIO_DATA_DIR_OUT | GPIO_DATA_VAL_OUT);
+
+	if (!state_high)
+		val |= GPIO_DATA_DIR_OUT;
+
+	intel_de_write_fw(display, bus->gpio_reg, val);
 	intel_de_posting_read_fw(display, bus->gpio_reg);
 }
 
 static void
-ptl_handle_mask_bits(struct intel_gmbus *bus, bool set)
+gpio_set_mask(struct intel_gmbus *bus, bool enable)
 {
 	struct intel_display *display = bus->display;
-	u32 reg_val = intel_de_read_fw(display, bus->gpio_reg);
-	u32 mask_bits = GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
-			GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
-	if (set)
-		reg_val |= mask_bits;
+	u32 val;
+
+	val = gpio_read_reg(bus);
+
+	val &= ~(GPIO_DATA_DIR_OUT | GPIO_CLOCK_DIR_OUT |
+		 GPIO_DATA_VAL_OUT | GPIO_CLOCK_VAL_OUT);
+
+	if (enable)
+		val |= gpio_mask_bits(display);
 	else
-		reg_val &= ~mask_bits;
+		val &= ~gpio_mask_bits(display);
 
-	intel_de_write_fw(display, bus->gpio_reg, reg_val);
+	intel_de_write_fw(display, bus->gpio_reg, val);
 	intel_de_posting_read_fw(display, bus->gpio_reg);
 }
 
@@ -344,8 +368,8 @@ intel_gpio_pre_xfer(struct i2c_adapter *adapter)
 
 	intel_gmbus_reset(display);
 
-	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
-		ptl_handle_mask_bits(bus, true);
+	if (gpio_mask_bits(display))
+		gpio_set_mask(bus, true);
 
 	set_data(bus, 1);
 	set_clock(bus, 1);
@@ -362,8 +386,8 @@ intel_gpio_post_xfer(struct i2c_adapter *adapter)
 	set_data(bus, 1);
 	set_clock(bus, 1);
 
-	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
-		ptl_handle_mask_bits(bus, false);
+	if (gpio_mask_bits(display))
+		gpio_set_mask(bus, false);
 
 	if (display->platform.pineview)
 		pnv_gmbus_clock_gating(display, true);
-- 
2.55.0

