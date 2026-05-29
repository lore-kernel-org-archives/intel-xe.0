Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA0CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 16:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B70C1121E4;
	Fri, 29 May 2026 16:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6Uivd2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A891121E3;
 Fri, 29 May 2026 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780071112; x=1811607112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fHopY0tRWr3ul1/rIAhcb/osqqlmB99thtv/u5Sb/uE=;
 b=m6Uivd2Zepc1o84qd6GpdRivHKnGb3LG7GAsxrpbAZFaxLz+sSPxx+gK
 sqIGR3L+/PDalX1osQ3YweknQ1qq9OsqcuKtMSmd1hN353z3l0ZSn5tI6
 UuQTpexr7E53J0LBXbdWpjzXgDMoCIaAtnAULlHdE9Hsje0e2SKHpFAGH
 ek2jMU2SmJ3lxqQ1xcHmnvy2ezfHIgMLQgIYcndEBuycAxzTJYn74pIxy
 49XK4WwUz9FoFXhqXfbfyjmJ+kc/TpDywpS+IG/FDK3icSJ4yaLOIA89f
 oinTeH8J3k4Xs+irgPersnMU23EDpdIJ8Sw4Q2wp7r2D8a8d8FCPAnEs3 w==;
X-CSE-ConnectionGUID: l2uEjekzQoyCYTzl8ese2g==
X-CSE-MsgGUID: 5sCC9b7lTbmXyBmo65epRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="83502040"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="83502040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:11:52 -0700
X-CSE-ConnectionGUID: Q4U8FkkuTWmKF+qtCySDDw==
X-CSE-MsgGUID: OIkERhTwTRuPffsSg53Wjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="236530176"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:11:51 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/de: Remove the 2 usec fast timeout
Date: Fri, 29 May 2026 19:11:47 +0300
Message-ID: <20260529161147.17573-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Currently any "slow" wait will first try a "fast" wait
with a 2 usec timeout, and then fall back to whatever
timeout was specified originally. The "slow" wait will
anyway start off with a mere 10 usec polling interval,
so basically we can only save 8 usec with the "fast" wait
(maybe a bit more given hrtimer setup costs etc.).

I don't think we really do any operations in the display
code where that kinds of 8 usec saving would be meaningful.
So just get rid of the whole "fast" wait complication and
go straight for the "slow" wait.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 40 ++++++-------------------
 1 file changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 6daee9e82503..a7417905192d 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -9,11 +9,11 @@
 
 #include "intel_de.h"
 
-static int __intel_de_wait_for_register(struct intel_display *display,
-					intel_reg_t reg, u32 mask, u32 value,
-					unsigned int timeout_us,
-					u32 (*read)(struct intel_display *display, intel_reg_t reg),
-					u32 *out_val, bool is_atomic)
+static int intel_de_wait_for_register(struct intel_display *display,
+				      intel_reg_t reg, u32 mask, u32 value,
+				      unsigned int timeout_us,
+				      u32 (*read)(struct intel_display *display, intel_reg_t reg),
+				      u32 *out_val, bool is_atomic)
 {
 	const ktime_t end = ktime_add_us(ktime_get_raw(), timeout_us);
 	int wait_max = 1000;
@@ -60,28 +60,6 @@ static int __intel_de_wait_for_register(struct intel_display *display,
 	return ret;
 }
 
-static int intel_de_wait_for_register(struct intel_display *display,
-				      intel_reg_t reg, u32 mask, u32 value,
-				      unsigned int fast_timeout_us,
-				      unsigned int slow_timeout_us,
-				      u32 (*read)(struct intel_display *display, intel_reg_t reg),
-				      u32 *out_value, bool is_atomic)
-{
-	int ret = -EINVAL;
-
-	if (fast_timeout_us)
-		ret = __intel_de_wait_for_register(display, reg, mask, value,
-						   fast_timeout_us, read,
-						   out_value, is_atomic);
-
-	if (ret && slow_timeout_us)
-		ret = __intel_de_wait_for_register(display, reg, mask, value,
-						   slow_timeout_us, read,
-						   out_value, is_atomic);
-
-	return ret;
-}
-
 int intel_de_wait_us(struct intel_display *display, intel_reg_t reg,
 		     u32 mask, u32 value, unsigned int timeout_us,
 		     u32 *out_value)
@@ -91,7 +69,7 @@ int intel_de_wait_us(struct intel_display *display, intel_reg_t reg,
 	intel_dmc_wl_get(display, reg);
 
 	ret = intel_de_wait_for_register(display, reg, mask, value,
-					 timeout_us, 0,
+					 timeout_us,
 					 intel_de_read,
 					 out_value, false);
 
@@ -109,7 +87,7 @@ int intel_de_wait_ms(struct intel_display *display, intel_reg_t reg,
 	intel_dmc_wl_get(display, reg);
 
 	ret = intel_de_wait_for_register(display, reg, mask, value,
-					 2, timeout_ms * 1000,
+					 timeout_ms * 1000,
 					 intel_de_read,
 					 out_value, false);
 
@@ -123,7 +101,7 @@ int intel_de_wait_fw_ms(struct intel_display *display, intel_reg_t reg,
 			u32 *out_value)
 {
 	return intel_de_wait_for_register(display, reg, mask, value,
-					  2, timeout_ms * 1000,
+					  timeout_ms * 1000,
 					  intel_de_read_fw,
 					  out_value, false);
 }
@@ -133,7 +111,7 @@ int intel_de_wait_fw_us_atomic(struct intel_display *display, intel_reg_t reg,
 			       u32 *out_value)
 {
 	return intel_de_wait_for_register(display, reg, mask, value,
-					  timeout_us, 0,
+					  timeout_us,
 					  intel_de_read_fw,
 					  out_value, true);
 }
-- 
2.53.0

