Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D41CD98EE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BA210ECB4;
	Tue, 16 Jun 2026 16:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ha4oK9Eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13FF10ECAC;
 Tue, 16 Jun 2026 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781626997; x=1813162997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5Ytt8VuR5xUZZ1ZiMuTLN9GoyoURWZbnOiO6+ZgV3Y=;
 b=Ha4oK9Eonmu1HUEq0rAjGTRdg+XiRfBIVYHA8swoHVbypiH2EAaxnxSI
 2F74mM4TzH1LT8w+WGW4EJ4JGSTPWIs9CoektJY9pIJJ5DrjZsmJemYNw
 bZAUNv0JojTrYNT3OKEavQZ8jPNdA9p+uBcgCGwm4d9OIMQQC9mDtNC6B
 KDM+zshmAeWQAuHbyOqMfzbHn3bkVopUTiMw8W3kS2x4oE2VnZUdKKi53
 PXkDf7hgJ81Ip6+5cGI/6gxvrM9U+7V23cqTgx8Thw7YitJHbeAuN5WIx
 SBc//TEjRnXnbrcn0ATzSdNDcMUpdvgreOqdqeMtX/U6uVl8u9hENLj3w g==;
X-CSE-ConnectionGUID: tNYMkFcjQP2bl0Wse+Lanw==
X-CSE-MsgGUID: c2aqJ0TZRsiGECnmag+AuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781305"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93781305"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:16 -0700
X-CSE-ConnectionGUID: VSDrM2wmRB6FMV5wDXqKlQ==
X-CSE-MsgGUID: BLfvY3bMTUWDYoAD69SFiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247693507"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:15 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, animesh.manna@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v6 06/16] drm/i915/display: Add DC3CO support check
Date: Tue, 16 Jun 2026 21:51:44 +0530
Message-ID: <20260616162154.2630995-7-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_display_power.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index e313d719fea1..9e66f9a4fcdc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -381,6 +381,16 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
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
index b9c9b68072af..41b4be9018b4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -184,6 +184,7 @@ bool intel_display_power_get_and_reset_dc3co_to_dc6(struct intel_display *displa
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
+bool intel_display_power_dc3co_supported(struct intel_display *display);
 
 void intel_display_power_runtime_suspend(struct intel_display *display);
 void intel_display_power_runtime_resume(struct intel_display *display);
-- 
2.43.0

