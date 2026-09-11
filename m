Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90306C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7510F0D2;
	Fri, 11 Sep 2026 04:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+8zDnsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF310F4DB;
 Fri, 11 Sep 2026 04:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100109; x=1820636109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sIiabFvaaK8sPGSJLfvBye6NKoYH64y3TuVGI3yHXuk=;
 b=M+8zDnsH3UdxhDyTzkdCHt9aTfc6LZxwFC4GmJepYaTjDQFayt8EgoR9
 pq18nJmqBM1Qu/YeU5sP646EwNhnLFJz/en9EC6cnZtN5tF2h7g4oIn99
 k/1ThNSYC1mAnMFnttOzayLQrDXzwWpfIS3MF3BHPgWN9xkBvEgGO9abh
 wYuYy1/bQgKBhKBNYT0KPjtVtk9a2F5lhxJtLs1ZieVcnw+zQVS7s00Hw
 BV4T/MSXlS8DP0aqvSX6KpZORSMLtuOvzzaHtdV5la6KOVX1Z6u3uM6cl
 XWo5aYVfbozBZb0szEQ3noo5ZE9/UW3YEN2K2RRibrbqalVcoK2KmvbQ7 A==;
X-CSE-ConnectionGUID: o4Oi+NpTSt+iNyWVRaZ5PA==
X-CSE-MsgGUID: bVbpYFvnQE2R/od5vEyPKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599958"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:09 -0700
X-CSE-ConnectionGUID: osbncnHQRaa2YDEbgZvFdA==
X-CSE-MsgGUID: T70qNTkTS4usJC05aNZ3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334457"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:15:08 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/10] drm/i915/display_wa: Add support for Wa_14021768792
Date: Fri, 11 Sep 2026 09:44:45 +0530
Message-Id: <20260911041449.3699400-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911041449.3699400-1-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Some BMG ultrajoiner configurations require support for Link M/N ratios
between 10.0 and 15.0. This range is not natively supported and requires
a workaround.

Wa_14021768792 enables this support by utilizing HDMI_EMP_DATA,
CHICKEN_TRANS and the extended bits in the LINK_N register.

Add the necessary logic to enable the workaround on applicable platforms.
The underlying mechanism comes from the display C0,
so it is gated on display stepping C0 and later.

v2:
-Don't include i915_drv.h and don't use struct drm_i915_private under
display/. Use display->platform.battlemage, which names the affected
platform directly, instead of IS_DGFX() combined with a display version
check. (Jani)
-Rebase on the reworked display WA framework, where the condition goes
directly into the __intel_display_wa() switch.

Bspec: 49266
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 9 +++++++++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 888676693f5e..7456194216be 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -111,6 +111,15 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
 			DISPLAY_VERx100(display) == 1401;
+	/*
+	 * Wa_14021768792:
+	 * Fixes: Limitation of Link M/N ratio > 10 for specific Xe2HPD platforms.
+	 * Workaround: Use HDMI_EMP_DATA, CHICKEN_BITs and extended bits in LINK_N
+	 * registers to support LINK M/N ratios from > 10 but < 15.
+	 */
+	case INTEL_DISPLAY_WA_14021768792:
+		return display->platform.battlemage &&
+			IS_DISPLAY_STEP(display, STEP_C0, STEP_FOREVER);
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_14026643300:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 425a300840aa..b8f2f9363498 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -33,6 +33,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14014143976,
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
+	INTEL_DISPLAY_WA_14021768792,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_14026643300,
 	INTEL_DISPLAY_WA_15013987218,
-- 
2.34.1

