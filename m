Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2C3C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 03:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDEE10E0A5;
	Thu, 22 Jan 2026 03:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoH5K0Cd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598FE10E8B6;
 Thu, 22 Jan 2026 03:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769051903; x=1800587903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDityTucUhOV26BDvOuERheJb1iNQ8/2EwUyX9wvNjg=;
 b=XoH5K0Cd6g+ay4tI6Hy2D8Q5WoTwLQQXqKFzHMezNk2ODpFg7HMPuVVB
 POuvsCqLQntZiKSQEBH16El2Mm/meaJCZqg435DvBtagL1L+HaQldl6L2
 Iyux6rOChQAdyQrRc0Xt/yMnLWqNLNOj5qUA8tLVCis/eUtmaQqtadQwf
 qTReIG956OR+mgNdfQQjAxrvls4l/FO+DXLGXd+vQoiC219UTTQ4S2LSE
 jlriJ+xV2M7vJAj+nODsTL+dmzRAgXdAWGsCmlcwMhhn1N4x6fu8zAAXC
 Dr/ZWQcRlCyhUlTIbypBcMFr/jLq9DIygRXW2IvsIAuwEwj+IgWVgbU+X A==;
X-CSE-ConnectionGUID: NP1IggjzTNOntyMR+bgbzA==
X-CSE-MsgGUID: DywfsncfQKiPsWgRwyvESA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87865866"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="87865866"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 19:18:22 -0800
X-CSE-ConnectionGUID: A0FuZhzLR2KNvLQ7RvZoig==
X-CSE-MsgGUID: G4gsXixKStmG4lq4T7oN3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206526589"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 19:18:20 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v3] drm/i915/display: Disable DMG Clock Gating
Date: Thu, 22 Jan 2026 08:48:18 +0530
Message-Id: <20260122031818.703590-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120050033.635681-1-suraj.kandpal@intel.com>
References: <20260120050033.635681-1-suraj.kandpal@intel.com>
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

Incorrect clock is connected to DMG registers.
Disable DMG Clock gating during display initialization.

WA: 22021451799
Bspec: 69095
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
---

v1 -> v2:
-Remove details from comment (Nemesa)
-Add details in commit message (Ville)

v2 -> v3:
-Move the WA to intel_display_wa.c (Ankit)
-Remove stray change (Jani)

 drivers/gpu/drm/i915/display/intel_display_wa.c | 10 +++++++++-
 drivers/gpu/drm/i915/i915_reg.h                 |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 581d943b9bdc..86a6cc45b6ab 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -32,9 +32,17 @@ static void adlp_display_wa_apply(struct intel_display *display)
 	intel_de_rmw(display, GEN8_CHICKEN_DCPR_1, DDI_CLOCK_REG_ACCESS, 0);
 }
 
+static void xe3plpd_display_wa_apply(struct intel_display *display)
+{
+	/* Wa_22021451799 */
+	intel_de_rmw(display, GEN9_CLKGATE_DIS_0, 0, DMG_GATING_DIS);
+}
+
 void intel_display_wa_apply(struct intel_display *display)
 {
-	if (display->platform.alderlake_p)
+	if (DISPLAY_VER(display) == 35)
+		xe3plpd_display_wa_apply(display);
+	else if (display->platform.alderlake_p)
 		adlp_display_wa_apply(display);
 	else if (DISPLAY_VER(display) == 12)
 		xe_d_display_wa_apply(display);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5bf3b4ab2baa..f928db78a3fa 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -763,6 +763,7 @@
  */
 #define GEN9_CLKGATE_DIS_0		_MMIO(0x46530)
 #define   DARBF_GATING_DIS		REG_BIT(27)
+#define   DMG_GATING_DIS		REG_BIT(21)
 #define   MTL_PIPEDMC_GATING_DIS(pipe)	REG_BIT(15 - (pipe))
 #define   PWM2_GATING_DIS		REG_BIT(14)
 #define   PWM1_GATING_DIS		REG_BIT(13)
-- 
2.34.1

