Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BECCA6009
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8617B10F81C;
	Wed,  7 Oct 2026 22:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcN5nzIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959010F810;
 Wed,  7 Oct 2026 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411811; x=1822947811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6sttHJs7jAXszBeTkG9YoMape6jBbER4It5EHiuHHf4=;
 b=lcN5nzIUzEbF+a+2ovTRwOM7ov3zjQgnZgp8ZEUO+uejEtTl358SUSgI
 3QiyL1b/Iol3a46J0394nNI2SckA49TV2+u0/WXh/uMFmCmJp552Zq0HL
 a22eErr90204wH3ApsyXiMr9Fn6gl/dGZAc6LmHzjl6n+ApJw7MCwHtWf
 HHSQMj/ixl9w30kh96abAXASlUn998YptFCadd4WwvM129EP05ykOc1wh
 L+KNTNNXx4dSyvbEulVm/BQWFL8dDHDj6x8WVkmxzTUE+C1E8FtUprIHS
 kVyY/CDb057PgpIjb6fcsgn8ggyLBtsWDRl4FGYQDGw0exZEEsUHXIZEH g==;
X-CSE-ConnectionGUID: BnTloN/qRj+yL2ISr1PRew==
X-CSE-MsgGUID: Yj5lYwFoQGe1ZyzZpL0HYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="88785"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="88785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:30 -0700
X-CSE-ConnectionGUID: QCzq4J59SKWx9XmijmCgWQ==
X-CSE-MsgGUID: VZojqnILQ3mm+5PDTOhjVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="193218"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/gmbus: Reorder the PNV clock gating GPIO w/a
Date: Thu,  8 Oct 2026 01:23:12 +0300
Message-ID: <20261007222314.5714-4-ville.syrjala@linux.intel.com>
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

Move the PNV bit banging clock gating toggle to be the
outermost operation in the pre/post xfer hooks. We don't
want the clock gating to kick in once we've touched something
in the GPIO registers. Right now this doesn't really matter,
but upcoming changes to the GPIO register mask handling will
need this.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index e808f5c4106b..854f439ac5ba 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -339,11 +339,11 @@ intel_gpio_pre_xfer(struct i2c_adapter *adapter)
 	struct intel_gmbus *bus = to_intel_gmbus(adapter);
 	struct intel_display *display = bus->display;
 
-	intel_gmbus_reset(display);
-
 	if (display->platform.pineview)
 		pnv_gmbus_clock_gating(display, false);
 
+	intel_gmbus_reset(display);
+
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
 		ptl_handle_mask_bits(bus, true);
 
@@ -362,11 +362,11 @@ intel_gpio_post_xfer(struct i2c_adapter *adapter)
 	set_data(bus, 1);
 	set_clock(bus, 1);
 
-	if (display->platform.pineview)
-		pnv_gmbus_clock_gating(display, true);
-
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
 		ptl_handle_mask_bits(bus, false);
+
+	if (display->platform.pineview)
+		pnv_gmbus_clock_gating(display, true);
 }
 
 static void
-- 
2.55.0

