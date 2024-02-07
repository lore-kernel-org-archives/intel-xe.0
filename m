Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD3CC4829A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E73A113211;
	Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTBig81R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE24113212
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbQfk46uavxD8NUrwC9QPAaEUdFJztJQVyWeFp6xE+k=;
 b=eTBig81ROaFj/Xtxrm+czkai8yyh/0oEOUfNla/KBHjCEq5aDxwg16hg
 bmovzrs0pxplulvpA3Miq0XhBQOS8ib3UOu1im8f6OodZkxXAAWS6NAm8
 7qbdCN7kCgQdCrTVOj6RjxTg+ZShebMoRrIw9uqzUOTrLZbGaZbAxyuJK
 MD8LKSwNoLBI6zZw2Q4tBj3DGRhx08QI/RMyr8xqgrYG5dQZUzAbXGZMg
 mVFFxojLc57LvQNA0lU5unTeGtskL84owp3JIDgRur6rhrVMz1GuhbPkn
 rx6gmLJ2uK3Yd0GXKG0NP+b8/lBVz78LdV6fAQaZizmw6fHM2UtyMyfKL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317357"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317357"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328863"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:17 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 3/6] drm/i915/display: use wakelock in register waiting
 functions
Date: Wed,  7 Feb 2024 12:30:04 +0200
Message-Id: <20240207103007.665367-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207103007.665367-1-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
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

Add the wakelock functonality to the functions that help wait for
register bits to be set.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 42 ++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 0bf73b1e1cfe..d8941995808c 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -121,7 +121,15 @@ static inline int
 intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
 			      u32 mask, u32 value, unsigned int timeout)
 {
-	return intel_wait_for_register_fw(&i915->uncore, reg, mask, value, timeout);
+	int ret;
+
+	intel_dmc_wl_get(i915, reg);
+
+	ret = intel_wait_for_register_fw(&i915->uncore, reg, mask, value, timeout);
+
+	intel_dmc_wl_put(i915, reg);
+
+	return ret;
 }
 
 static inline int
@@ -130,22 +138,46 @@ __intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			     unsigned int fast_timeout_us,
 			     unsigned int slow_timeout_ms, u32 *out_value)
 {
-	return __intel_wait_for_register(&i915->uncore, reg, mask, value,
-					 fast_timeout_us, slow_timeout_ms, out_value);
+	int ret;
+
+	intel_dmc_wl_get(i915, reg);
+
+	ret = __intel_wait_for_register(&i915->uncore, reg, mask, value,
+					fast_timeout_us, slow_timeout_ms, out_value);
+
+	intel_dmc_wl_put(i915, reg);
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
+	intel_dmc_wl_get(i915, reg);
+
+	ret = intel_de_wait_for_register(i915, reg, mask, mask, timeout);
+
+	intel_dmc_wl_put(i915, reg);
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
+	intel_dmc_wl_get(i915, reg);
+
+	ret = intel_de_wait_for_register(i915, reg, mask, 0, timeout);
+
+	intel_dmc_wl_put(i915, reg);
+
+	return ret;
 }
 
 /*
-- 
2.39.2

