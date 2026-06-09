Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F852CD8CBF
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F88A10E319;
	Tue,  9 Jun 2026 12:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qm/4G4fd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101A10E30E;
 Tue,  9 Jun 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006654; x=1812542654;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TqM9ufzHNgLezebibH2wXKvapG74frng1GEWPYpp0ic=;
 b=Qm/4G4fdaxWrwfVCPfLuT+/SoweXvRWTtWxj9KErlqFfhNnznrOMQm/9
 5G5zzlXX0hA5LPk5IF5Ktz1yi74hj6UjRpxnG9Vnfepj91681yUk58vT2
 YhaA4H25luVW3E0Bxd9Asa3HlKYcmdrPimvrCsxfbeDi3FKNVPk14P8cl
 X0d+EquVn6JPhFALa0vKMzpSEce0UZ1OwKM0ms+Lsu9+1qQoSXg3HsQQx
 QOdcCBEXMkYiwqXqXG22y7cxKtWEdR3hHM8dLTCHUKRwtAT5BkgjEgJYY
 7/B+Tu2kya6rfV7Bej5baMutuEsu/TiM9eJqsaJ8ypP52wTxB+fYRS3ur A==;
X-CSE-ConnectionGUID: O05dIovsTQODOOMabW3XdA==
X-CSE-MsgGUID: Dbb5YsmmQlKHKTuwglloMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340421"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:13 -0700
X-CSE-ConnectionGUID: 0ZtRuMX6QQ+wfvjakvhX6w==
X-CSE-MsgGUID: uE3Q7FCvQ/KtT4T1iru0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988453"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:13 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 25/36] drm/i915/display: Add DC3CO support check
Date: Tue,  9 Jun 2026 17:32:39 +0530
Message-ID: <20260609120250.867750-26-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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
index 37a8bd7d3961..e213e02aadaa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -375,6 +375,16 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
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

