Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38145C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE22410E874;
	Thu, 11 Jan 2024 09:16:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F5D10E8A2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704964603; x=1736500603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGntp/V71O9COwDgmGHMLhmKsxcNkI9ufQ9LV/WdLbc=;
 b=P8GJ6UPaPz7MJlvPfNblyALqnKJBPhnewFW39nEFoZeq7Les6j3GGx6H
 NCn55vIZYG6Id50XX9Nbg7rAXOfkR3EKAelNIqVRTFV58nH5qkLANRFuo
 /bVFrCOMi/wWsY+qHxYTR6Dat27yfkIDM2VW+dY4T2/PcL/JrL4kb6YCm
 z+b4dkMelWEqLTq8kx4dVeWXgrIvsDgLhwGMT9rm+XCx2mJHtqXUtYCD4
 0x9waTzOdy8/ni/iT1hEC/pL4ZAyMdnODpEHmSHfYt0IVynnv2Fa4fxhF
 FNjbfID4/Goa/lEpgN8LOat7uBYCclJyga7/dzOTALdpBgpuUVNFfSaFm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397663336"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="397663336"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="24568528"
Received: from kgdowskx-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.37.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:42 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 3/4] drm/i915/display: use wakelock in register waiting
 functions
Date: Thu, 11 Jan 2024 11:16:21 +0200
Message-Id: <20240111091622.1110799-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111091622.1110799-1-luciano.coelho@intel.com>
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the wakelock functonality to the functions that help wait for
register bits to be set.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 52 ++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index c7c00bebb3eb..220907442bad 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -97,14 +97,30 @@ static inline int
 intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			   u32 mask, u32 value, unsigned int timeout)
 {
-	return intel_wait_for_register(&i915->uncore, reg, mask, value, timeout);
+	int ret;
+
+	intel_display_wl_get(i915, reg);
+
+	ret = intel_wait_for_register(&i915->uncore, reg, mask, value, timeout);
+
+	intel_display_wl_put(i915, reg);
+
+	return ret;
 }
 
 static inline int
 intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
 			      u32 mask, u32 value, unsigned int timeout)
 {
-	return intel_wait_for_register_fw(&i915->uncore, reg, mask, value, timeout);
+	int ret;
+
+	intel_display_wl_get(i915, reg);
+
+	ret = intel_wait_for_register_fw(&i915->uncore, reg, mask, value, timeout);
+
+	intel_display_wl_put(i915, reg);
+
+	return ret;
 }
 
 static inline int
@@ -113,22 +129,46 @@ __intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			     unsigned int fast_timeout_us,
 			     unsigned int slow_timeout_ms, u32 *out_value)
 {
-	return __intel_wait_for_register(&i915->uncore, reg, mask, value,
-					 fast_timeout_us, slow_timeout_ms, out_value);
+	int ret;
+
+	intel_display_wl_get(i915, reg);
+
+	ret = __intel_wait_for_register(&i915->uncore, reg, mask, value,
+					fast_timeout_us, slow_timeout_ms, out_value);
+
+	intel_display_wl_put(i915, reg);
+
+	return ret;
 }
 
 static inline int
 intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
 		      u32 mask, unsigned int timeout)
 {
-	return intel_de_wait_for_register(i915, reg, mask, mask, timeout);
+	int ret;
+
+	intel_display_wl_get(i915, reg);
+
+	ret = intel_de_wait_for_register(i915, reg, mask, mask, timeout);
+
+	intel_display_wl_put(i915, reg);
+
+	return ret;
 }
 
 static inline int
 intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
 			u32 mask, unsigned int timeout)
 {
-	return intel_de_wait_for_register(i915, reg, mask, 0, timeout);
+	int ret;
+
+	intel_display_wl_get(i915, reg);
+
+	ret = intel_de_wait_for_register(i915, reg, mask, 0, timeout);
+
+	intel_display_wl_put(i915, reg);
+
+	return ret;
 }
 
 /*
-- 
2.39.2

