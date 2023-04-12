Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A615C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7969B10E82A;
	Wed, 12 Apr 2023 14:27:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A1910E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309649; x=1712845649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FzV9kB7/T+3RGAfyTxnWl2g4iQeY+kvPEDG9/dC2N3E=;
 b=DjcrNBu+54niNXzpiWeNLboe6+AxgZUx200RVIXVhyOyoYXCDOT05m1n
 vADLlIiku0/owjQs/XzUA3+SJCpnuEcfgtRAu1WcC3TXStEoiBCWHZavx
 e2PJUWFroIzOI6xBDmhKnsKw6GumiOkJoZJFQpYI4/XEEUhr17Gg5iH8b
 9NQRoZKo1E6pS3CRCPQZ2AFbV0bcuvODFPENKAT7j93s0Kk5CfPbwnchT
 h9UIPRW4nEv1eHpdiqilknMmpf8Cjf5aiOaqnTnfzClUwnKYGZAV3SAY1
 BNuHEfFwlxPpDI6pX2QMbKFFeRNzJHujYHpickq2FBno3vR0Jx4LAr55i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341405345"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341405345"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639253088"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="639253088"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:01 +0300
Message-Id: <20230412142006.877109-37-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 36/41] fixup! drm/i915/display: Remaining changes
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 6431505b7a1e..e90f0dbda268 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1594,7 +1594,6 @@ void i9xx_enable_pll(const struct intel_crtc_state *crtc_state)
 	}
 }
 
-#ifdef I915
 static void vlv_pllb_recal_opamp(struct drm_i915_private *dev_priv,
 				 enum pipe pipe)
 {
@@ -2006,7 +2005,6 @@ void chv_disable_pll(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	vlv_dpio_put(dev_priv);
 }
-#endif
 
 void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
 {
@@ -2025,7 +2023,6 @@ void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
 	intel_de_posting_read(dev_priv, DPLL(pipe));
 }
 
-#ifdef I915
 /**
  * vlv_force_pll_off - forcibly disable just the PLL
  * @dev_priv: i915 private structure
@@ -2041,7 +2038,6 @@ void vlv_force_pll_off(struct drm_i915_private *dev_priv, enum pipe pipe)
 	else
 		vlv_disable_pll(dev_priv, pipe);
 }
-#endif
 
 /* Only for pre-ILK configs */
 static void assert_pll(struct drm_i915_private *dev_priv,
-- 
2.39.2

