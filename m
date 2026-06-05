Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF21CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 08:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EE611A5D4;
	Fri,  5 Jun 2026 08:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiHk48Rl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E4211A5D0;
 Fri,  5 Jun 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780649117; x=1812185117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6TTSf1ubMo+fSxB+YMUeS54oFfvbq9g6v5DmdTiTl8U=;
 b=MiHk48RlvDx2sfBxFQb8m+qgAemQ08xSX6PE8+QxOzLqy1vB4QiMJiOt
 WUv8npI/BX+E0B2z5TYz5ktA6v3IHtbj5CSYhreZiuUyNLzQwDyBXVXGl
 hWLUjMxMbYotTwXHsHSaBygd7i6XrpxoH39H0RHB/3ZA6oK9V0RJaAy52
 6D7wUwS10sSicaH6M5zqAOrJ2/2y51nkWciRbu9DnE4a8e3z0KAHp6IUE
 9ge/ctmo5V2ULlWvzpGGlg2s4hAiCF7Ln+Mnth4tIl0QYVGqFb9aakzpl
 iGAQJKVwGjyvL2Ir9vmxxufaegw1y139L9GVF2faAhFRDDd4mdrfwbiP+ g==;
X-CSE-ConnectionGUID: 6xUJHzRBQJ+pniUJ+Kgl8A==
X-CSE-MsgGUID: X5oEthjDR627DWjxeqOBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81666416"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81666416"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 01:45:17 -0700
X-CSE-ConnectionGUID: WPUVmbKXRVC91jJ4vpNysw==
X-CSE-MsgGUID: LScunbTJT4e6FZlB1oXLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="246624164"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 01:45:15 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v5 06/14] drm/i915/display: Add DC3CO support check
Date: Fri,  5 Jun 2026 14:14:13 +0530
Message-ID: <20260605084421.3912865-7-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605084421.3912865-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260605084421.3912865-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add intel_display_power_dc3co_supported() helper to query DC3CO
support from allowed_dc_mask.

Changes in v5:
- Add HAS_DC3CO() check to intel_display_power_dc3co_supported().

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_display_power.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 271d50d5da3f..eadae8eb5709 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -358,6 +358,16 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
 	return current_dc_state;
 }
 
+bool intel_display_power_dc3co_supported(struct intel_display *display)
+{
+	struct i915_power_domains *power_domains = &display->power.domains;
+
+	if (!HAS_DC3CO(display))
+		return false;
+
+	return (power_domains->allowed_dc_mask & DC_STATE_EN_UPTO_DC3CO) == DC_STATE_EN_UPTO_DC3CO;
+}
+
 static void __async_put_domains_mask(struct i915_power_domains *power_domains,
 				     struct intel_power_domain_mask *mask)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 56dc89eed3f8..06b3e49e5f8b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -182,6 +182,7 @@ void intel_display_power_resume_early(struct intel_display *display);
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
+bool intel_display_power_dc3co_supported(struct intel_display *display);
 
 void intel_display_power_runtime_suspend(struct intel_display *display);
 void intel_display_power_runtime_resume(struct intel_display *display);
-- 
2.43.0

