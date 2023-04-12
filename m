Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E29C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45D010E82A;
	Wed, 12 Apr 2023 14:26:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2710E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309599; x=1712845599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AL4JGC1uP2gMK78w1/UZZ3vuCkH3jL168Hf4Jk3B/PM=;
 b=Y8QrUUom2aEr4FzpCpxhTv6JgwujJwAEdYo9ftW50Skgk16+/qjOVvSl
 sqfb7mT+Ui9BOKSL5Nu+OdJ85XOoAi/6BSkQMByubMFjpGbDeleGCvqXE
 Ge5RS7mhWV4GhM3rM3gnoOXxvx11pJAHS+eJornFHSC6uZMmDn4UcpKTo
 DvWTE7zkyGvvWIR9bY6BQ5Pn2yQCCXzO3UCX8DFOT6S1p+HDSWxNV/b1Y
 RgiPzAoeRRN18PMmYJ+SvENuFDzRsFAYeIOo6o19GvFZ6gkd+EhKYUwTG
 l00EPifgVLLyqMmLETw0BU37bknqrUtSqYMwCZBvfwdzx321UDb7qP0u6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328021643"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328021643"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666376054"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666376054"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:58 +0300
Message-Id: <20230412142006.877109-34-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 33/41] fixup! drm/i915/display: Remaining changes
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
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 96108d121995..d02378d2ab4e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1815,7 +1815,6 @@ static void vlv_cmnlane_wa(struct drm_i915_private *dev_priv)
 
 static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0)
 {
-#ifdef I915
 	bool ret;
 
 	vlv_punit_get(dev_priv);
@@ -1823,9 +1822,6 @@ static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0
 	vlv_punit_put(dev_priv);
 
 	return ret;
-#else
-	return false;
-#endif
 }
 
 static void assert_ved_power_gated(struct drm_i915_private *dev_priv)
-- 
2.39.2

