Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70238CA5FBE
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1BE10F3B7;
	Wed, 30 Sep 2026 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuuFgdZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311A10F3AB;
 Wed, 30 Sep 2026 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790774185; x=1822310185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pTHxA5Uix5Sk53+J7tO+jblscwYMOH1HzoxTUBO9URw=;
 b=ZuuFgdZL1ymrb/mF5sxQcjR9SgNoHuWLzLLAvEmyUKF7fWsZXgjNYd3I
 1ooV2Zvb40Z4J+BBxYXfSrvr3USZ/+C+RCK2Q0xB+AvhSDJ0hiH1Brb76
 1JHHK+73cJ4x4pPnzkmIxB7MH+cZjfi6ks6FMqVeu2OgHL+AL047jhWFW
 PJLx4cXCP3tqS/k2Fu4mh3etgpwR+EMWJJfGVpWQ82NinWKVm3GwruDji
 VJGAZfIi3QDXCDrhgeuRF+7+cs3P1X3jdnXnBfIZMy4dyunGr3FQc80mP
 bMR8zrgNpvoZZ+eOb6rMcZ84xhqECRr6FpCrDm1RNTPJwU+EzfWeDyh81 w==;
X-CSE-ConnectionGUID: CpQqacgQTq+Awjhv4HV4pg==
X-CSE-MsgGUID: dM6wvTTFSyicoZloXw/u/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90561365"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90561365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:16:25 -0700
X-CSE-ConnectionGUID: kutx2qZ3S7u80Cno/5/paA==
X-CSE-MsgGUID: EBW4k6btQLqJegawxOBDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275241029"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:16:22 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register
 accesses
Date: Wed, 30 Sep 2026 16:16:19 +0300
Message-ID: <20260930131619.17218-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
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

v2: Drop the accidental wait_for_fw_ms()->wait_for_ms() change

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h    |  6 ++++
 drivers/gpu/drm/i915/display/intel_gmbus.c | 32 +++++++++++-----------
 2 files changed, 22 insertions(+), 16 deletions(-)

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
index 60a70dea5d85..13bc6ab6b2f6 100644
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
-- 
2.54.0

