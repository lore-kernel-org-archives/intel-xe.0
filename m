Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2972BC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B308810E90A;
	Wed, 16 Sep 2026 09:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ik2jsF7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68310E7CD;
 Wed, 16 Sep 2026 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789549811; x=1821085811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sIiabFvaaK8sPGSJLfvBye6NKoYH64y3TuVGI3yHXuk=;
 b=ik2jsF7DdmgfsybhvNUm9X5WD2H1gC3imwq0NQbtb0jIipKeOIbl3ZUR
 kO3eFoUGIVHak32ljpM8xd1EqdXkiZ+Ac82ysGRf4YPtuoTH9ccOw3nq9
 zhTN07g+AbOWnu3QjPF17jGPayQDq+YtgOlxMg/IgJXOQzDl17+WqeJf8
 ntZ2pqzd10TaNLjIQrdty98z/3Jo+wWkB93RtMxgJJM2e7GtouPVzvMIv
 3eVy9WAvyfGLI2NxDaQKWAAjEP+jXswXzWYSWaCYivmVadHXR1g/jUtTM
 b9FuiYToEvf/A3zm3QSPgvvj6Ks7AaP05MFd4KzAcx/T/C3W/xmlDDWv7 Q==;
X-CSE-ConnectionGUID: OfVYVItVT36eOVLpLRRdVA==
X-CSE-MsgGUID: hZTntnZwR/er5ektWqHfDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88858880"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88858880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:10:02 -0700
X-CSE-ConnectionGUID: N+vkaDW2Q++2+aoDG1Wvig==
X-CSE-MsgGUID: rYk2AuAzSzuKozcuOLqtfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277030224"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 16 Sep 2026 02:10:01 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 06/10] drm/i915/display_wa: Add support for Wa_14021768792
Date: Wed, 16 Sep 2026 14:39:42 +0530
Message-Id: <20260916090946.677564-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916090946.677564-1-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
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

