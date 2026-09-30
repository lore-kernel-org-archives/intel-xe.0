Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06391CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 11:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0D10F333;
	Wed, 30 Sep 2026 11:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6poQJgh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCFD10F32F;
 Wed, 30 Sep 2026 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790769188; x=1822305188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ylyzEQcDk48NaOVN5fKUrglkXMxy03urjxfP8E2RkiI=;
 b=E6poQJghuB9oJs61UeBogIW+ofdx+aim0hETlMJZZGOcfAZECWG1QLFY
 hRAUJsrIamhVEASntxPac3ksUIsqshiZ0xWvtDcoTHJ78pxhs4ZZ+4GAL
 +XSTDK2Q9d7HWtH+5lPqdZTtU0K44Q4yyM1CnxVlIuB4ERunm8DlZLAvo
 Nd/oSiMMFZSsgwlYrx+/I+krzKK9Dpc3g95mc+13uBLcoGchymw0i8kKl
 64msbHKEzKRIb27JkhfObnkNWKMeLP5zVdqhylAI1midq25KkCJexMF/N
 sIChZ0EEDvAt8ZnQG38qUeZlGFGrLeNsvpKDBcRVcnfAWxztMn4RqQ55a Q==;
X-CSE-ConnectionGUID: UwCdwy60S0yItoRt101itg==
X-CSE-MsgGUID: qfEFIDdzToGkZsteNHVLjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93989575"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="93989575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:08 -0700
X-CSE-ConnectionGUID: 9n1Dc82/Ro2xfita9Dl4IA==
X-CSE-MsgGUID: oSr3N1m7SCqZqRKZui+HzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="303605282"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register
 accesses
Date: Wed, 30 Sep 2026 14:53:01 +0300
Message-ID: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
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

Switch the gmbus code over from _notrace() to _fw() register
accesses.

My original goal was just to eliminate the _notrace() variants
to shrink the intel_de.h API a bit, but while doing this I
stumbled on a huge performance issue with the current code;
Bit banging turns out to be extremely expensive on PCH
platforms while in DC5/6, and cause turns out not to be the
actual south GMBUS/GPIO register accesses, but rather the
extra north FPGA_DBG register access done from the non _fw()
register access functions. Those accesses cause a DC5/6 exit
which take a huge chunk of time.

$ time echo detect > /sys/class/drm/card0/HDMI-A-1/status
-real	0m16.281s
+real	0m1.459s
...

There does still seem to be a smallish (maybe ~15%) performance
penalty for accessing PCH registers while in DC5/6. Not really
sure what's causing it, but seems to be small enough to not cause
a huge performance problem for bit banging. When not in DC5/6
the same HDMI detect cycle takes ~1.25 seconds. If we want to
further speed that up we could completely disable DC5/6 during
big banged i2c transfers. Currently we only do that on BXT/GLK
because there the GMBUS hardware lives on the SoC and thus is
affected by DC states, even for non-bit banged transfers.

Note that by using the _fw() register accessors we also lose the
uncore.lock protection, but that's fine because everything is
already protected by the gmbus mutex, and nothing else should
live on the same cachelines of registers. So even platforms like
IVB/HSW which may have some issues with concurrent register
accesses to the same cacheline are still covered.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h    |  6 ++++
 drivers/gpu/drm/i915/display/intel_gmbus.c | 34 +++++++++++-----------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 102979019429..8144588d3cf7 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -158,6 +158,12 @@ intel_de_rmw_fw(struct intel_display *display, intel_reg_t reg, u32 clear, u32 s
 	return old;
 }
 
+static inline void
+intel_de_posting_read_fw(struct intel_display *display, intel_reg_t reg)
+{
+	intel_de_read_fw(display, reg);
+}
+
 static inline u32
 intel_de_read_notrace(struct intel_display *display, intel_reg_t reg)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 60a70dea5d85..09171f3db298 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -218,8 +218,8 @@ to_intel_gmbus(struct i2c_adapter *i2c)
 void
 intel_gmbus_reset(struct intel_display *display)
 {
-	intel_de_write(display, GMBUS0(display), 0);
-	intel_de_write(display, GMBUS4(display), 0);
+	intel_de_write_fw(display, GMBUS0(display), 0);
+	intel_de_write_fw(display, GMBUS4(display), 0);
 }
 
 static void pnv_gmbus_clock_gating(struct intel_display *display,
@@ -262,7 +262,7 @@ static u32 get_reserved(struct intel_gmbus *bus)
 		preserve_bits |= GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
 				 GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
 
-	return intel_de_read_notrace(display, bus->gpio_reg) & preserve_bits;
+	return intel_de_read_fw(display, bus->gpio_reg) & preserve_bits;
 }
 
 static int get_clock(void *data)
@@ -271,10 +271,10 @@ static int get_clock(void *data)
 	struct intel_display *display = bus->display;
 	u32 reserved = get_reserved(bus);
 
-	intel_de_write_notrace(display, bus->gpio_reg, reserved | GPIO_CLOCK_DIR_MASK);
-	intel_de_write_notrace(display, bus->gpio_reg, reserved);
+	intel_de_write_fw(display, bus->gpio_reg, reserved | GPIO_CLOCK_DIR_MASK);
+	intel_de_write_fw(display, bus->gpio_reg, reserved);
 
-	return (intel_de_read_notrace(display, bus->gpio_reg) & GPIO_CLOCK_VAL_IN) != 0;
+	return (intel_de_read_fw(display, bus->gpio_reg) & GPIO_CLOCK_VAL_IN) != 0;
 }
 
 static int get_data(void *data)
@@ -283,10 +283,10 @@ static int get_data(void *data)
 	struct intel_display *display = bus->display;
 	u32 reserved = get_reserved(bus);
 
-	intel_de_write_notrace(display, bus->gpio_reg, reserved | GPIO_DATA_DIR_MASK);
-	intel_de_write_notrace(display, bus->gpio_reg, reserved);
+	intel_de_write_fw(display, bus->gpio_reg, reserved | GPIO_DATA_DIR_MASK);
+	intel_de_write_fw(display, bus->gpio_reg, reserved);
 
-	return (intel_de_read_notrace(display, bus->gpio_reg) & GPIO_DATA_VAL_IN) != 0;
+	return (intel_de_read_fw(display, bus->gpio_reg) & GPIO_DATA_VAL_IN) != 0;
 }
 
 static void set_clock(void *data, int state_high)
@@ -302,8 +302,8 @@ static void set_clock(void *data, int state_high)
 		clock_bits = GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_DIR_MASK |
 			     GPIO_CLOCK_VAL_MASK;
 
-	intel_de_write_notrace(display, bus->gpio_reg, reserved | clock_bits);
-	intel_de_posting_read(display, bus->gpio_reg);
+	intel_de_write_fw(display, bus->gpio_reg, reserved | clock_bits);
+	intel_de_posting_read_fw(display, bus->gpio_reg);
 }
 
 static void set_data(void *data, int state_high)
@@ -319,15 +319,15 @@ static void set_data(void *data, int state_high)
 		data_bits = GPIO_DATA_DIR_OUT | GPIO_DATA_DIR_MASK |
 			GPIO_DATA_VAL_MASK;
 
-	intel_de_write_notrace(display, bus->gpio_reg, reserved | data_bits);
-	intel_de_posting_read(display, bus->gpio_reg);
+	intel_de_write_fw(display, bus->gpio_reg, reserved | data_bits);
+	intel_de_posting_read_fw(display, bus->gpio_reg);
 }
 
 static void
 ptl_handle_mask_bits(struct intel_gmbus *bus, bool set)
 {
 	struct intel_display *display = bus->display;
-	u32 reg_val = intel_de_read_notrace(display, bus->gpio_reg);
+	u32 reg_val = intel_de_read_fw(display, bus->gpio_reg);
 	u32 mask_bits = GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
 			GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
 	if (set)
@@ -335,8 +335,8 @@ ptl_handle_mask_bits(struct intel_gmbus *bus, bool set)
 	else
 		reg_val &= ~mask_bits;
 
-	intel_de_write_notrace(display, bus->gpio_reg, reg_val);
-	intel_de_posting_read(display, bus->gpio_reg);
+	intel_de_write_fw(display, bus->gpio_reg, reg_val);
+	intel_de_posting_read_fw(display, bus->gpio_reg);
 }
 
 static int
@@ -454,7 +454,7 @@ gmbus_wait_idle(struct intel_display *display)
 	add_wait_queue(&display->gmbus.wait_queue, &wait);
 	intel_de_write_fw(display, GMBUS4(display), irq_enable);
 
-	ret = intel_de_wait_fw_ms(display, GMBUS2(display), GMBUS_ACTIVE, 0, 10, NULL);
+	ret = intel_de_wait_ms(display, GMBUS2(display), GMBUS_ACTIVE, 0, 10, NULL);
 
 	intel_de_write_fw(display, GMBUS4(display), 0);
 	remove_wait_queue(&display->gmbus.wait_queue, &wait);
-- 
2.54.0

