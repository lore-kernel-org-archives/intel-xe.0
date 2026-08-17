Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A0C5DF7E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5F410E704;
	Mon, 17 Aug 2026 09:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+ClGXvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A1410E6FE;
 Mon, 17 Aug 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786958973; x=1818494973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtqXf44R1KrH5lF2LxJhi5q1T6PKoIM2uPcxiV8ltIE=;
 b=k+ClGXvHvGBGUag1fH7BooAoGmqr7TDv50UFHNXcy8+DJEf+MTEKojS0
 Pb62FVNyBN6l9DXpPMLJyfjWZQy7vanmzQZrrwao46Z383RN5dvAd0y5K
 AK0OQCWHoSolII42nl8FvUOKVVdZystbQ+vMD+2RMyfKjNcdRCXl9yiyK
 kjFE49bsibnKTyLEpt2JiKgTnQX9PCCzuGOqB9HTrtSUk5hZY0Qxf7M13
 i58atHm8BspgXdfwXQ6Ia3aiJh9D35pE3UPGo5KOQN9nXylY5BlJs5vS5
 Yj/71+uV0VCTpu5gGSkdd7sJbzM3UoKvdr6fvLgHiz++XdL5+B6TbDvGi w==;
X-CSE-ConnectionGUID: +8DIG7l0Td2TcUryLnP+sQ==
X-CSE-MsgGUID: U+DSGPAWSU222lhl/71gGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87189999"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87189999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:32 -0700
X-CSE-ConnectionGUID: GshPt11SS3GCFAUtgogrTw==
X-CSE-MsgGUID: GBBN2oJCRIqjsOSuFEugJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268348880"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.136])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:31 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v3 4/5] drm/i915/display: add a way to restore only
 display/pch registers in clock_gating
Date: Mon, 17 Aug 2026 12:26:23 +0300
Message-ID: <20260817092911.342072-5-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817092911.342072-1-luciano.coelho@intel.com>
References: <20260817092911.342072-1-luciano.coelho@intel.com>
MIME-Version: 1.0
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

We are currently calling intel_clock_gating_init() when disabling PC8
in the display code.  This adds an unnecessary dependency to the core
i915 code.  Only the display and PCH registers need to be restored
here, so we can do this directly in the display code, removing the
dependency.

Add intel_display_restore_clock_gating() to do this.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_clock_gating.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_clock_gating.h | 1 +
 drivers/gpu/drm/i915/display/intel_display_power.c        | 4 ++--
 drivers/gpu/drm/xe/Makefile                               | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index ef1ee72494df..6716c377ef93 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -11,6 +11,7 @@
 #include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
+#include "intel_pch.h"
 
 static void intel_display_gen9_init_clock_gating(struct intel_display *display)
 {
@@ -305,3 +306,9 @@ void intel_display_init_clock_gating(struct intel_display *display)
 	else if (display->platform.i965gm)
 		intel_display_i965gm_init_clock_gating(display);
 }
+
+void intel_display_restore_clock_gating(struct intel_display *display)
+{
+	intel_display_init_clock_gating(display);
+	intel_pch_init_clock_gating(display);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index dbfa5892cffe..074708a22436 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -9,5 +9,6 @@
 struct intel_display;
 
 void intel_display_init_clock_gating(struct intel_display *display);
+void intel_display_restore_clock_gating(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 0ebec6e0c240..aab934f43530 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -12,7 +12,7 @@
 
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
-#include "intel_clock_gating.h"
+#include "intel_display_clock_gating.h"
 #include "intel_combo_phy.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
@@ -1588,7 +1588,7 @@ static void hsw_disable_pc8(struct intel_display *display)
 	intel_init_pch_refclk(display);
 
 	/* Many display registers don't survive PC8+ */
-	intel_clock_gating_init(display->drm);
+	intel_display_restore_clock_gating(display);
 }
 
 static void intel_pch_reset_handshake(struct intel_display *display,
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 92134709d998..b4c90bf50951 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -258,6 +258,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_de.o \
 	i915-display/intel_display.o \
+	i915-display/intel_display_clock_gating.o \
 	i915-display/intel_display_conversion.o \
 	i915-display/intel_display_device.o \
 	i915-display/intel_display_driver.o \
-- 
2.53.0

