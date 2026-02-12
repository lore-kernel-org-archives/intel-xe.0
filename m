Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA92BEEA845
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BBB10E2A0;
	Thu, 12 Feb 2026 18:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRR9qlJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D286E10E297;
 Thu, 12 Feb 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770922108; x=1802458108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P7jStQXZx3dy75u9fXBsl4cs2NMK2M/zNcfOwiD7F7w=;
 b=nRR9qlJ7ASJS3/J4ZAwHD41QieOHtYUVCR9oxTX3+Fzo6HU0jHhlG/vc
 xB2JgJIbr8CuumrR6DC4eNE89Z6Hs9+ZB71ZZwbe/T0xHkcX9edkfWl6P
 RjXxgOvYe6Jo6z+Ubgqx4gMlg+b+ytBDb+QINjfjSpMuSUmgky5U39dPN
 YGjZ/+9hCMbIERMIa+xTz4G/mzax7RO8gC/tC6STR8bJDYYxBcaM2PeHS
 uoqwP8jl5kr/On8AXXLcf03PlGcmJn+GOEpoYFv5eBRbJtAL3NkNWglhN
 iL4ULnP/rYHcy7+06TY/Qr00TiSbxDUBVwogTqHkXMCp7SMlHQtS8uTln A==;
X-CSE-ConnectionGUID: H36hBt/QTu6uYtocMeGefQ==
X-CSE-MsgGUID: clTwJIphRJ6eAOanjL5gHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72204116"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72204116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:28 -0800
X-CSE-ConnectionGUID: pryc+TFJTaulN9kAkk49wA==
X-CSE-MsgGUID: hFrJnlkRS5uT3YO0YjcZHg==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.217])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:26 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 03/15] drm/i915/display: convert W/As in intel_cdclk.c to
 new framework
Date: Thu, 12 Feb 2026 20:46:01 +0200
Message-ID: <20260212184737.352515-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212184737.352515-1-luciano.coelho@intel.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c      | 2 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c | 3 +++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 29d90d612bb2..927b05038e2b 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -4006,7 +4006,7 @@ void intel_init_cdclk_hooks(struct intel_display *display)
 		display->cdclk.table = dg2_cdclk_table;
 	} else if (display->platform.alderlake_p) {
 		/* Wa_22011320316:adl-p[a0] */
-		if (display->platform.alderlake_p && IS_DISPLAY_STEP(display, STEP_A0, STEP_B0)) {
+		if (intel_display_wa(display, 22011320316)) {
 			display->cdclk.table = adlp_a_step_cdclk_table;
 			display->funcs.cdclk = &tgl_cdclk_funcs;
 		} else if (display->platform.alderlake_p_raptorlake_u) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 80eecfd33a28..f0311cd477a5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -104,6 +104,9 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return intel_display_needs_wa_16025573575(display);
 	case INTEL_DISPLAY_WA_22010178259:
 		return DISPLAY_VER(display) == 12;
+	case INTEL_DISPLAY_WA_22011320316:
+		return display->platform.alderlake_p &&
+			IS_DISPLAY_STEP(display, STEP_A0, STEP_B0);
 	case INTEL_DISPLAY_WA_22014263786:
 		return IS_DISPLAY_VERx100(display, 1100, 1400);
 	case INTEL_DISPLAY_WA_22021048059:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 54f5ea05b293..0d0501fc276f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -41,6 +41,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16023588340,
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_22010178259,
+	INTEL_DISPLAY_WA_22011320316,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
 };
-- 
2.51.0

