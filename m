Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E8C77B6F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0949A10E82A;
	Wed, 12 Apr 2023 14:26:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A696C10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309564; x=1712845564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l1+EWPce44f4rlySMXbfBWu+NySKSH5yqYUqxuE6Pjc=;
 b=Thc7L7pqcvmAWJ1ZX0zGe8iT+U1uhHFOl0a7SMn/6oI47QrSJRb0V4fQ
 dKac+UiJRLo1/Ca159bAGvuPvx42Pi6dvIeMhdCxxuUCORHBt8zKQjikZ
 KgBwjDFAqzHXmoCZcQIptgRvgevx8wMi637fTvRGo5IHB8fWe7ZvbtfiK
 2SFAeda6iysZo5+eRHXUniV/tKHGCcZ+8N9FthgXrwcUluwW0v8TPG6wH
 ECZaNGLb6KlJQEfndIt7QosgsBBZyZ1CnmH7zKVKWm/QaFX7sQzTl1jMf
 cufo/gfhzgZTxz8gzdWEzsd5/V+AsfH2ZkDdiRmHSt5JmMGPWp72F4+Ie w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667752"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800358278"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800358278"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:52 +0300
Message-Id: <20230412142006.877109-28-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 27/41] fixup! drm/i915/display: Remaining changes
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

Remove some ifdefs

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 2cae35aa0cdc..22fc908b7e5d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -607,7 +607,6 @@ static void hsw_ddi_spll_enable(struct drm_i915_private *dev_priv,
 static void hsw_ddi_wrpll_disable(struct drm_i915_private *dev_priv,
 				  struct intel_shared_dpll *pll)
 {
-#ifdef I915
 	const enum intel_dpll_id id = pll->info->id;
 
 	intel_de_rmw(dev_priv, WRPLL_CTL(id), WRPLL_PLL_ENABLE, 0);
@@ -619,13 +618,11 @@ static void hsw_ddi_wrpll_disable(struct drm_i915_private *dev_priv,
 	 */
 	if (dev_priv->display.dpll.pch_ssc_use & BIT(id))
 		intel_init_pch_refclk(dev_priv);
-#endif
 }
 
 static void hsw_ddi_spll_disable(struct drm_i915_private *dev_priv,
 				 struct intel_shared_dpll *pll)
 {
-#ifdef I915
 	enum intel_dpll_id id = pll->info->id;
 
 	intel_de_rmw(dev_priv, SPLL_CTL, SPLL_PLL_ENABLE, 0);
@@ -637,7 +634,6 @@ static void hsw_ddi_spll_disable(struct drm_i915_private *dev_priv,
 	 */
 	if (dev_priv->display.dpll.pch_ssc_use & BIT(id))
 		intel_init_pch_refclk(dev_priv);
-#endif
 }
 
 static bool hsw_ddi_wrpll_get_hw_state(struct drm_i915_private *dev_priv,
-- 
2.39.2

