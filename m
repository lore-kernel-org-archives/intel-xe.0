Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC83C55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B8B10E0A6;
	Mon,  3 Aug 2026 21:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6htguUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C9810E0A6;
 Mon,  3 Aug 2026 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785793835; x=1817329835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BvIsLVTjnGJia0JRVDwn/6xLfIgXvHaA7kvj6aaYSEA=;
 b=l6htguUU+up0cPCZvzVHGBZCfLMySqJE9wApcmOyR6Lztig3NFxOCgMW
 kLCn3S6NYbRicUseUcoqxAMob6USCC30Gf1aNqOKX6eXdO7jeQYbdBeJo
 VLspSYnR65w204hTX44KnYCPfpkWok1CHLIctQGlWTJjXYcny+u6eGttL
 wnBJOb2fuau6S8AXacYFMmTwDCIh+tIIwL16m4uFPdmR9Me1dg7XjBNYg
 L/0L9Yx/dWM9oGnhgk+E3rHPsG2jk/OrERIrcOljoIM2dO1JHh2mRLRtP
 FG7B0wS7znujus3i2bSN7Axekpth+/19x7AfPUKfP2p79FiDwoNeWO5SM Q==;
X-CSE-ConnectionGUID: X0tFVYmAQMiDeRpFtrb09w==
X-CSE-MsgGUID: AkEi1iN6QDmu8nbMmlT0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97849154"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97849154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:50:35 -0700
X-CSE-ConnectionGUID: C/xYupQlQf2mS2V5kQS7lg==
X-CSE-MsgGUID: D+RSJNrCTiCmOLQCcr7x6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291272107"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 14:50:34 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 4/4] drm/i915/3dlut: disable 3D LUT if unsupported
Date: Mon,  3 Aug 2026 23:49:09 +0200
Message-ID: <20260803214909.3076716-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803214909.3076716-1-michal.grzelak@intel.com>
References: <20260803214909.3076716-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

XE2LPD_DE_CAP_3DLUT_MASK is defined but never used.

Check DE_CAP with the mask whether 3D LUT is disabled for LNL+. Reset
has_3dlut if that is the case.

Bspec: 71161
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: <stable@vger.kernel.org>
Fixes: 6d181a288e64 ("drm/i915/xe2lpd: update the dsc feature capability")
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 4 ++++
 drivers/gpu/drm/i915/display/intel_display_regs.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index a2bea5ac59cf..d4e52e627b34 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1940,6 +1940,10 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 	if (DISPLAY_VER(display) >= 20) {
 		u32 cap = intel_de_read(display, XE2LPD_DE_CAP);
 
+		if (REG_FIELD_GET(XE2LPD_DE_CAP_3DLUT_MASK, cap) ==
+		    XE2LPD_DE_CAP_3DLUT_REMOVED)
+			display_runtime->has_3dlut = 0;
+
 		if (REG_FIELD_GET(XE2LPD_DE_CAP_DSC_MASK, cap) ==
 		    XE2LPD_DE_CAP_DSC_REMOVED)
 			display_runtime->has_dsc = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 740331ead20a..78b9e6008828 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1773,6 +1773,7 @@
 
 #define XE2LPD_DE_CAP			_MMIO(0x41100)
 #define   XE2LPD_DE_CAP_3DLUT_MASK	REG_GENMASK(31, 30)
+#define   XE2LPD_DE_CAP_3DLUT_REMOVED	1
 #define   XE2LPD_DE_CAP_DSC_MASK	REG_GENMASK(29, 28)
 #define   XE2LPD_DE_CAP_DSC_REMOVED	1
 #define   XE2LPD_DE_CAP_SCALER_MASK	REG_GENMASK(27, 26)
-- 
2.45.2

