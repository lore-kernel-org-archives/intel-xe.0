Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8170CC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1B10E2C7;
	Wed,  3 May 2023 13:11:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED1710E2C2
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119463; x=1714655463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRlLubcfgNPEAqwnO7nqwDaXR2EU3Q5HXFHREPo0T+o=;
 b=lEIh6+9f8JParfQQDxwM+YTzOcIhNSQPAiTutOqvC/Up7S8ycaa5K7aY
 I2O+6kGa1zlh84L6K/d60gS55xcXL9JWHQokKGdPKggvE1R8/cJefgZN+
 /zGpiTg1SIE4l9Yi6WucKiGK0ZKTYZsLu+3PXeeOStMfRiPyyO9Yz5jVs
 1NEwymWlTP2DIEAK5ZJBVpAN+8xD8L/VNufWggXpIz6uaiUGzAf9os3z3
 iHkLexH7aWgWigXV4GjDXUjyVSe5FT5T4e/X3gNkz5aJtQ82k2cbOSl8s
 xyfmlkELUmaymrvwcIK3w0r3LcLIgdlCFgittOd0kM6bh1l+YEtnJySHS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350726773"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="350726773"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026493464"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="1026493464"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:57 +0300
Message-Id: <20230503131005.1602412-11-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/18] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is unused.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index ab711b2cba12..e858011efa02 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -22,12 +22,6 @@ intel_de_read8(struct drm_i915_private *i915, i915_reg_t reg)
 	return intel_uncore_read8(&i915->uncore, reg);
 }
 
-static inline u8
-intel_de_read64(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	return intel_uncore_read64(&i915->uncore, reg);
-}
-
 static inline u64
 intel_de_read64_2x32(struct drm_i915_private *i915,
 		     i915_reg_t lower_reg, i915_reg_t upper_reg)
-- 
2.39.2

