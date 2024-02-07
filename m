Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861E6C4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372F2113213;
	Wed,  7 Feb 2024 10:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuuvhmpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1B1113214
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFe6itFqTCpnK6EOz5FQZpDUAv1fN+mmbOoogNGu+ks=;
 b=KuuvhmpW9a2lNM9L4uvBoomutd72c0+FIwjfSIPL5zzpIU0/Y7SYnLHj
 lAM/ItKIpPz0weEM1KpvGFu48++V1fK+CsnAzx6LUNIiOIycBlv+9oWim
 Wy1RMpZ5kfvRgTu4a5TCtqNwWbN7OTncbAzf94nG68FwJqCqj5O8fsXH7
 fHpRZQGoArKQLNQwj7i3s6N+cUbpAOkithHF1g/dcNfRnGvKXm6T0BVEr
 lfHdXsZ2mdAh+vE8czOXp1y/ld/xgmlN/UJNKFCneKl6iIPaJ06N0ztey
 wXV5LdZ+IScA14newuCHIzdSQKJh3hSdgUUDYtqpO4nrz9pnwd2sTQUF2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317360"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328867"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:19 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 4/6] drm/i915/display: use wakelock in the last write function
Date: Wed,  7 Feb 2024 12:30:05 +0200
Message-Id: <20240207103007.665367-5-luciano.coelho@intel.com>
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

Finally, add the wakelock mechanism to the write functions.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index d8941995808c..b531b2ddd7a6 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -70,7 +70,11 @@ intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
 static inline void
 intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 {
+	intel_dmc_wl_get(i915, reg);
+
 	intel_uncore_write(&i915->uncore, reg, val);
+
+	intel_dmc_wl_put(i915, reg);
 }
 
 static inline u32
-- 
2.39.2

