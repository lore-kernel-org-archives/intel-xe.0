Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA1DE6C619
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 08:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA0410E981;
	Tue,  3 Dec 2024 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4iIzNsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8920F10E981;
 Tue,  3 Dec 2024 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733215641; x=1764751641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqJH0FHtoZiziTifOtnur0gVyQUptOv1ElWSS5iMq7o=;
 b=c4iIzNsLD0idVpp/l6UdhPR9ccjweeCEYZXOh7JGyzud8WRCZnu4fsaT
 RzkDrj+tFTDlybRYW96JemahZAX6cBSFPPXiAd2oT1DcDSrLOyj7jovdY
 +qQTrPRsO/LPwRUS9HyA3IWvlJUFo4LGrIXtYqRl/GcWM0EAY2wmxw0Ug
 KHXolKCGx9L8T7RUjAVtu/GhXY18hMyCOB9BED/Lwmpie+sxH5/M1K1yE
 11+V4pW5n4qVQlgmprt9WfzxVAoNtynaFov6mkqrF0FP2Ykzm/Zw9tFhY
 eokK2pxLC0hrxohBdsB0MG8Uf/WrXFsjWZ/VhAkjQrBFJp9RdrdBWeW3F Q==;
X-CSE-ConnectionGUID: 5/nvq1/hQSitwfeO7BXe6g==
X-CSE-MsgGUID: 4AJCv/MEQPG7Bb9qwVP7JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44805443"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="44805443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 00:47:20 -0800
X-CSE-ConnectionGUID: gmaQunPgSuafNKLb2Sav1A==
X-CSE-MsgGUID: W+kR75d4ST+dNqVrVkS9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="94198907"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 03 Dec 2024 00:47:18 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/6] drm/i915/wm: Use intel_display structure in DPKGC code
Date: Tue,  3 Dec 2024 14:17:03 +0530
Message-Id: <20241203084706.2126189-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203084706.2126189-1-suraj.kandpal@intel.com>
References: <20241203084706.2126189-1-suraj.kandpal@intel.com>
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

Use intel_display for DPKGC code wherever we can. While we are
at it also use intel_de_rmw instead of intel_uncore_rmw as we
really don't need the internal uncore_rmw_function.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index df961cb8d51f..4e46567f1359 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2857,11 +2857,12 @@ static int skl_wm_add_affected_planes(struct intel_atomic_state *state,
 static void
 skl_program_dpkgc_latency(struct drm_i915_private *i915, bool enable_dpkgc)
 {
+	struct intel_display *display = to_intel_display(&i915->drm);
 	u32 max_latency = LNL_PKG_C_LATENCY_MASK;
 	u32 clear, val;
 	u32 added_wake_time = 0;
 
-	if (DISPLAY_VER(i915) < 20)
+	if (DISPLAY_VER(display) < 20)
 		return;
 
 	if (enable_dpkgc) {
@@ -2869,14 +2870,14 @@ skl_program_dpkgc_latency(struct drm_i915_private *i915, bool enable_dpkgc)
 		if (max_latency == 0)
 			max_latency = LNL_PKG_C_LATENCY_MASK;
 		added_wake_time = DSB_EXE_TIME +
-			i915->display.sagv.block_time_us;
+			display->sagv.block_time_us;
 	}
 
 	clear = LNL_ADDED_WAKE_TIME_MASK | LNL_PKG_C_LATENCY_MASK;
 	val = REG_FIELD_PREP(LNL_PKG_C_LATENCY_MASK, max_latency) |
 		REG_FIELD_PREP(LNL_ADDED_WAKE_TIME_MASK, added_wake_time);
 
-	intel_uncore_rmw(&i915->uncore, LNL_PKG_C_LATENCY, clear, val);
+	intel_de_rmw(display, LNL_PKG_C_LATENCY, clear, val);
 }
 
 static int
-- 
2.34.1

