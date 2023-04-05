Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128ADC76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C3B10E9FD;
	Wed,  5 Apr 2023 15:40:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CA810E9FF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709228; x=1712245228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KwmFu46+Haus4O1bc/PB2Xhg3FXanWybW6x3axkRCQE=;
 b=Xvi56S3VLcnNdUWCAMc+Oaw0dWP8a1EcSpNII1qxH4FH15ebuTUYdIOa
 nVzKGdnweA0BTARB7WgWuQ8rVd/vCTjkY3IYwZzHVwmCpx9eM2vkURw5Z
 ce5wUhhcLDOYTXDIWcnNB3hKkT7yLJTWCfi/Ozjtccd9USJO25itEny2i
 VJcdOisnuUKrT+N/5O+uPZPvb2ymgnBjQrSOUOgAtGkriCD1WAv851RyS
 +vPq6T0T5geouOgj9LaVLob5pd3hfL4bdtYeRFE0J36HM7QBlC08Y72aX
 WB8CDFXhvps1zevL6aqeKTPR4WwLQh3NPWM9Et7t3mc68/peOYb4Qymw+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865182"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865182"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689327641"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="689327641"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:11 +0300
Message-Id: <20230405153920.926583-13-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/21] fixup! drm/i915/display: Remaining changes
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_pch_refclk.h ifdef cleanup

To be replaced with better conditional build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch_refclk.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.h b/drivers/gpu/drm/i915/display/intel_pch_refclk.h
index aa4f6e0b1127..9bcf56629f24 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.h
@@ -11,7 +11,6 @@
 struct drm_i915_private;
 struct intel_crtc_state;
 
-#ifdef I915
 void lpt_program_iclkip(const struct intel_crtc_state *crtc_state);
 void lpt_disable_iclkip(struct drm_i915_private *dev_priv);
 int lpt_get_iclkip(struct drm_i915_private *dev_priv);
@@ -19,12 +18,5 @@ int lpt_iclkip(const struct intel_crtc_state *crtc_state);
 
 void intel_init_pch_refclk(struct drm_i915_private *dev_priv);
 void lpt_disable_clkout_dp(struct drm_i915_private *dev_priv);
-#else
-#define lpt_program_iclkip(cstate) do { } while (0)
-#define lpt_disable_iclkip(xe) do { } while (0)
-#define lpt_get_iclkip(xe) (WARN_ON(-ENODEV))
-#define intel_init_pch_refclk(xe) do { } while (0)
-#define lpt_disable_clkout_dp(xe) do { } while (0)
-#endif
 
 #endif
-- 
2.39.2

