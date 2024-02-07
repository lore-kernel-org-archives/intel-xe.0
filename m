Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58E7C4829B
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2A1113201;
	Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1XzjGSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEE9113207
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFZdF4Xb6AWdozsUptyY2uTmKE9D+NWiRwPQvCz8BgQ=;
 b=U1XzjGSObrgUUIqGcAhJYzG+ynDddx9Hl5jzxrQMDe0Cx+RChuq5WjN9
 nssbJrIKGKtkzV7txWCYqEn7ltlg38AJs1gEMU9Hik8CFTuNj+g53GKda
 fitbll5F4llOWcC+/FM0aBDWSYQz5AP3hIInJoe66qnG/MM4RyNWY4QWt
 Fk9ws77DGpfMee+IV3q1U9Hitan50KXfUJaF3ilbS88bfWx5vcf6VcJKT
 U0vdl2mf1b9rT+RCvCHnTeEDkrRTP6ClI6OOZHpR0cNUxGv8U2zXOGZrZ
 guANheZXbGShcDeheSVoPfTpSz9FNQOHiPUu2wMAypsTCbmGeG+Bzm3wi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317347"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328858"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:15 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 2/6] drm/i915/display: use wakelock in the remaining read
 operations
Date: Wed,  7 Feb 2024 12:30:03 +0200
Message-Id: <20240207103007.665367-3-luciano.coelho@intel.com>
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

In the patch where the framework is implemented, we only add the
wakelock usage in the read-modify-write operations.  This patch brings
in the wakelock implementation to the remaining read operations.  The
idea is to keep these in separate blocks to ease bisections in case
there are any issues.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 38 +++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index ef24748d522d..0bf73b1e1cfe 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -13,26 +13,58 @@
 static inline u32
 intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
 {
-	return intel_uncore_read(&i915->uncore, reg);
+	u32 val;
+
+	intel_dmc_wl_get(i915, reg);
+
+	val = intel_uncore_read(&i915->uncore, reg);
+
+	intel_dmc_wl_put(i915, reg);
+
+	return val;
 }
 
 static inline u8
 intel_de_read8(struct drm_i915_private *i915, i915_reg_t reg)
 {
-	return intel_uncore_read8(&i915->uncore, reg);
+	u8 val;
+
+	intel_dmc_wl_get(i915, reg);
+
+	val = intel_uncore_read8(&i915->uncore, reg);
+
+	intel_dmc_wl_put(i915, reg);
+
+	return val;
 }
 
 static inline u64
 intel_de_read64_2x32(struct drm_i915_private *i915,
 		     i915_reg_t lower_reg, i915_reg_t upper_reg)
 {
-	return intel_uncore_read64_2x32(&i915->uncore, lower_reg, upper_reg);
+	u64 val;
+
+	/* Both lower and upper registers will almost certainly be in
+	 * the same range (and very likely one immediately after the
+	 * other), so we can check only the lower one.
+	 */
+	intel_dmc_wl_get(i915, lower_reg);
+
+	val = intel_uncore_read64_2x32(&i915->uncore, lower_reg, upper_reg);
+
+	intel_dmc_wl_put(i915, lower_reg);
+
+	return val;
 }
 
 static inline void
 intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
 {
+	intel_dmc_wl_get(i915, reg);
+
 	intel_uncore_posting_read(&i915->uncore, reg);
+
+	intel_dmc_wl_put(i915, reg);
 }
 
 static inline void
-- 
2.39.2

