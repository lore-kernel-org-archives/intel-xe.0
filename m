Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E4C25B70
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D6210E95B;
	Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9B110E951
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393620; x=1729929620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qH3AIh+9DYcDRULRsA4o035Y1NXjEMBZ5CPmZBg5Pvk=;
 b=lMn1EDcZ2YsxIn/Lr7RYfIuGW6hI7W835/p3NhE6evDUmHisYDe6YJt0
 jTC9hZ2dDOGQY+DY7mXV4rtpBITh/YqrTB4C5CPiLIzNw/wMYbUdeawo/
 H3ey9nSJI2wdKWK0crX6nSd16/RYhioxjcuVHgg2psQzMXWFbyUel5iwX
 /SOMuCN7vnkmhT07cqPB1WNvXZAAITZoCSqus1Rq5XpdQFFesFqybhOeq
 V2yGQ3x/23LybRj1vMTWpTKnpNmnwcnhgaerYg8ejGuggCb0kytMOvupH
 Sj2jlkv27rBNi48pk2R+dZKmM86ysNu8cSScYWiLMo7XZ6PZk6EhuKcHP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603856"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603856"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510381"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510381"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:17 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:11 +0300
Message-Id: <20231027075918.2206862-25-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 24/31] drm/i915/display: Use device parameters
 instead of module in I915_STATE_WARN
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Also make module parameter as non writable.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-21-jouni.hogander@intel.com
(cherry picked from commit 514bec3387426f42e88a49bf62f9b0f5eb528b9e)
---
 drivers/gpu/drm/i915/display/intel_display.h | 2 +-
 drivers/gpu/drm/i915/i915_params.c           | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 0e5dffe8f018..ba3548f9768d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -552,7 +552,7 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port);
 	struct drm_device *drm = &(__i915)->drm;			\
 	int __ret_warn_on = !!(condition);				\
 	if (unlikely(__ret_warn_on))					\
-		if (!drm_WARN(drm, i915_modparams.verbose_state_checks, format)) \
+		if (!drm_WARN(drm, __i915->params.verbose_state_checks, format)) \
 			drm_err(drm, format);				\
 	unlikely(__ret_warn_on);					\
 })
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 3205c6b62670..4e8c088c69fd 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -93,8 +93,7 @@ i915_param_named(mmio_debug, int, 0400,
 	"Enable the MMIO debug code for the first N failures (default: off). "
 	"This may negatively affect performance.");
 
-/* Special case writable file */
-i915_param_named(verbose_state_checks, bool, 0600,
+i915_param_named(verbose_state_checks, bool, 0400,
 	"Enable verbose logs (ie. WARN_ON()) in case of unexpected hw state conditions.");
 
 i915_param_named_unsafe(nuclear_pageflip, bool, 0400,
-- 
2.34.1

