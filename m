Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CE9C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710010E835;
	Wed, 12 Apr 2023 14:21:39 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3AC10E83E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309297; x=1712845297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qt9OsU8wQEue3Vf0gFnMuIp/g0zlywxdmsRW042XgG0=;
 b=jTFIIsujgHfE+wcc5aai+goVF1Y7rPHGyyXxrw0juZgiQiNruQL63tp4
 zvFZX7cacyWrIXwkbpAhnhArWUvVaWi7KzAEmOQjLg6HrO9lESFCDyJVM
 YBf3cyczQiD74dO0Z+mvIgs/d0UTnqe0QoL6OK/WlGUXZwHQODX9bqewA
 +TQSKuPzvRHSUZBH14KyMueCGT6ID9FfJ6+baCZYhyYWSKkITH0WzJ2HZ
 Byga6fK6sqvqqyoFFOhByCnG4Uusw1B+Ydfmfh8IpRNO2EyEHnY0uFjQ6
 l/vmQce47NYxo2Zw4IYfCL6MxLDgk0fUjeBFBT8xC6G2zs1IgM0DvMUgL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406738319"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="406738319"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018760959"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1018760959"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:39 +0300
Message-Id: <20230412142006.877109-15-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/41] fixup! drm/xe/display: Implement display
 support
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

No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index e4974f2e1d67..5f6f21f3dba9 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -171,9 +171,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define HAS_TRANSCODER(dev_priv, trans)  ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
 #define HAS_128_BYTE_Y_TILING(xe) (xe || 1)
 
-/* Should not be called (vlv specific) */
-#define assert_dsi_pll_enabled(xe) BUG_ON(1)
-
 #define intel_has_gpu_reset(a) (a && 0)
 
 #include "intel_wakeref.h"
-- 
2.39.2

