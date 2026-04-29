Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCD1FF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 09:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DF710EEFD;
	Wed, 29 Apr 2026 09:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oClaNtJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA7310EF1A;
 Wed, 29 Apr 2026 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454814; x=1808990814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdmv4G85gx10k2xJDy6ZZCCBPeMGi7zpBNW5/vF5JNA=;
 b=oClaNtJ1yJm5SdKrJJWovRJqkusGVp8xR5xk2JCG4zEGmTxaxNwNhAL3
 Nqtaojztpy1X462922iYG2gkCK+vrej0MtXGAkab/rs1DRmaYcE2mXCb3
 VkqHHQxTKo1lXigbZ0jn07l4Il/2O4X5BZOXwup5XzIpYNjlsO+2FI82F
 L3aCyzL+vCZlPBuUfJsnuU/x2b8qZB/QKqVN60/4hjvI1zQhWAIaRIqfK
 Ha0ztbPsMVN0Drt4P/vqNjmqcCT8AjXSY3cw900NIrZS/YSLlTLxj7rqO
 2CGj14XNoklbHr5YFS5FoDnZxoHhgqowQhRFTusoi611qUpoNOuEEv9lP Q==;
X-CSE-ConnectionGUID: uoMJbj5dQguR+2BOmY7RDw==
X-CSE-MsgGUID: XSqArWSMTM6VUAHkPDjdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95946301"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95946301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:26:54 -0700
X-CSE-ConnectionGUID: MRg/DwvVRlOAdI6AhRKfAQ==
X-CSE-MsgGUID: Ptcf5itnQ461KuaagX8P9Q==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:26:52 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v3 04/13] drm/i915/display: Add DC3CO DC_STATE enable/disable
 support
Date: Wed, 29 Apr 2026 14:56:58 +0530
Message-ID: <20260429092707.485696-5-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add DC3CO handling to the dc_off power well sequencing and disable the
DMC wakelock when exiting DC3CO.

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_power_well.c  | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index b5e6437c3d8d..5e002d459e95 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -866,6 +866,13 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 	power_domains->dc_state = val & mask;
 }
 
+static void xe3lpd_enable_dc3co(struct intel_display *display)
+{
+	drm_dbg_kms(display->drm, "Enabling DC3CO\n");
+	intel_dmc_wl_enable(display, DC_STATE_EN_UPTO_DC3CO);
+	gen9_set_dc_state(display, DC_STATE_EN_UPTO_DC3CO);
+}
+
 static void assert_can_enable_dc5(struct intel_display *display)
 {
 	enum i915_power_well_id high_pg;
@@ -1054,9 +1061,13 @@ void gen9_disable_dc_states(struct intel_display *display)
 	}
 
 	if (old_state == DC_STATE_EN_UPTO_DC5 ||
-	    old_state == DC_STATE_EN_UPTO_DC6)
+	    old_state == DC_STATE_EN_UPTO_DC6 ||
+	    old_state == DC_STATE_EN_UPTO_DC3CO)
 		intel_dmc_wl_disable(display);
 
+	if (old_state == DC_STATE_EN_UPTO_DC3CO)
+		return;
+
 	intel_cdclk_get_cdclk(display, &cdclk_config);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
 	drm_WARN_ON(display->drm,
@@ -1092,6 +1103,9 @@ static void gen9_dc_off_power_well_disable(struct intel_display *display,
 		return;
 
 	switch (power_domains->target_dc_state) {
+	case DC_STATE_EN_UPTO_DC3CO:
+		xe3lpd_enable_dc3co(display);
+		break;
 	case DC_STATE_EN_UPTO_DC6:
 		skl_enable_dc6(display);
 		break;
-- 
2.43.0

