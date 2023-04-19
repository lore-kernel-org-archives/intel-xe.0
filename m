Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302ADC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037DF10E96B;
	Wed, 19 Apr 2023 12:40:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262A610E96B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908004; x=1713444004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8yzU0GuKxlQLIEkCesfv9da8G8CKQgsEwz/kz0XCX0A=;
 b=IPSax80HLEvf6WERfuTng6v048/ttdB8MO1yaPZamR0zPJQcSvG5Oxsn
 zXal2b7ML103ZIle1fHw/Ci4t4S+BAdCz5Za/v3p19+z2TMFTw9GTFXXM
 U7AmbiULaYbFRUpDlqXp1zmX2vTMrPCpuq7bcE7IR1lpgkXDJAayOmQfI
 07w0uK/ijV0JMt+fyDDyfWmDKPwvaxBbjYdhU5M1ErhHM91XX6nlhvL7H
 ZHjlS2QIQJ6g/tNSnPiSyjXAOARrg4VsOCzfB2A51as7QHt2UOXFCV87J
 8737kSikFJFwgenGL45/8kQBXrSngGUv8KfGLG9I+elbKszbSCvRWQEeK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189317"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937660142"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="937660142"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:40 +0300
Message-Id: <20230419123947.543175-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/9] drm/i915/wm: remove stale and unused
 ilk_wm_max_level() declaration
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

The declaration was removed earlier, but got accidentally resurrected in
i915xx_wm.[ch] refactoring. Remove harder.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230419115449.422214-1-jani.nikula@intel.com
---
 drivers/gpu/drm/i915/display/i9xx_wm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
index a7875cbcd05a..b87ae369685a 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.h
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
@@ -12,7 +12,6 @@ struct drm_i915_private;
 struct intel_crtc_state;
 struct intel_plane_state;
 
-int ilk_wm_max_level(const struct drm_i915_private *i915);
 bool ilk_disable_lp_wm(struct drm_i915_private *i915);
 void ilk_wm_sanitize(struct drm_i915_private *i915);
 bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
-- 
2.39.2

