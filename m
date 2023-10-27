Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C926CC25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6C010E950;
	Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A1B10E950
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393624; x=1729929624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rztw+Ffh8f5HG9fiT6vBYt4lwqIIhToRJxxXk2H4kAA=;
 b=b3AxCJnHOLyJ0oq1zKkMYxDYhvYpUk1/yR7CHFFubIaQ5i2Wxqyh4ZSO
 vnPbiLMzNyw8tRdWI3VQSLA/Hz4/cZjyakrumBa+PlQ4Q4pzCsH4XNCmN
 BUH7aU9WYYtoKWqQ0XZMA/BGbfDICW9qGZBxQ+zHwII5nDfP170iwdK52
 7inX/XPaBe7FdJR2xme5Bk7GTPg/OCa/Mdst2MFbvpCCVU8dk6dRRaG9i
 kn+nBqo5oA8ZrfEKhsF6F6AH8kjFFgFCB5iTYdX/bVT75ka/mJb6F+sPu
 83xonbqocvD5jbY+9cqLSU/jnKlXhKVVewEUhsMDo7nvwXLTNUXshBNUF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603882"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603882"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510402"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510402"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:21 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:13 +0300
Message-Id: <20231027075918.2206862-27-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 26/31] drm/i915/display: Move nuclear_pageflip
 under display
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

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-23-jouni.hogander@intel.com
(cherry picked from commit 192a4444abc88d0e95966a4bb5085d58bed03162)
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
 drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
 drivers/gpu/drm/i915/i915_params.c                  | 3 ---
 drivers/gpu/drm/i915/i915_params.h                  | 1 -
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 43cc66923509..a97d3e1f8909 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1098,7 +1098,7 @@ void intel_display_device_info_runtime_init(struct drm_i915_private *i915)
 	}
 
 	/* Disable nuclear pageflip by default on pre-g4x */
-	if (!i915->params.nuclear_pageflip &&
+	if (!i915->display.params.nuclear_pageflip &&
 	    DISPLAY_VER(i915) < 5 && !IS_G4X(i915))
 		i915->drm.driver_features &= ~DRIVER_ATOMIC;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index cae1449e9b06..f82f5bed69bc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -90,6 +90,9 @@ intel_display_param_named(disable_display, bool, 0400,
 intel_display_param_named(verbose_state_checks, bool, 0400,
 	"Enable verbose logs (ie. WARN_ON()) in case of unexpected hw state conditions.");
 
+intel_display_param_named_unsafe(nuclear_pageflip, bool, 0400,
+	"Force enable atomic functionality on platforms that don't have full support yet.");
+
 intel_display_param_named_unsafe(enable_fbc, int, 0400,
 	"Enable frame buffer compression for power savings "
 	"(default: -1 (use per-chip default))");
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 46ec097d43be..40aed14d18be 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -40,6 +40,7 @@ struct drm_i915_private;
 	param(bool, force_reset_modeset_test, false, 0600) \
 	param(bool, disable_display, false, 0400) \
 	param(bool, verbose_state_checks, true, 0400) \
+	param(bool, nuclear_pageflip, false, 0400) \
 	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 72614c139222..18424873442d 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -93,9 +93,6 @@ i915_param_named(mmio_debug, int, 0400,
 	"Enable the MMIO debug code for the first N failures (default: off). "
 	"This may negatively affect performance.");
 
-i915_param_named_unsafe(nuclear_pageflip, bool, 0400,
-	"Force enable atomic functionality on platforms that don't have full support yet.");
-
 i915_param_named_unsafe(enable_guc, int, 0400,
 	"Enable GuC load for GuC submission and/or HuC load. "
 	"Required functionality can be selected using bitmask values. "
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 4b543beb17ca..c7fff571db2c 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -64,7 +64,6 @@ struct drm_printer;
 	/* leave bools at the end to not create holes */ \
 	param(bool, enable_hangcheck, true, 0600) \
 	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
-	param(bool, nuclear_pageflip, false, 0400) \
 	param(bool, enable_dp_mst, true, 0600) \
 	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
 
-- 
2.34.1

