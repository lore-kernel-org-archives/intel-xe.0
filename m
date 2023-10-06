Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898C2E92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC6B10E0BB;
	Fri,  6 Oct 2023 10:38:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4B10E0BB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588701; x=1728124701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6BExU/nvlAAB7lZcoYVbx1XjdrvX0L0vf1w1z2QLv14=;
 b=kjklxR7qhOMRJdluHykjgPsjacq1gn772VGYp7smwTQRaM3kI3W+Jw37
 tF9wecYuGpxhp4DFwaU1ya+wNyYuKpX+qnHEVjk0aZIMQsH4bHANzGxk6
 rqRtT2sSVv14Ei2Nt+JAWWQP4G/K2m82NbTg8YUpfQURq+CDXNDuBQL45
 39Xy08gjS5Yd/KYFr8pt731k1GmqazdSnxS9PqM6ryBWwOJyF9Rhymyy8
 pn/MY2Q8fAdEj6dUMOhxIFM0Dn6tIO1CN0b+KAZCM6Sp79c2KYUXZ9sA5
 DE0qygBtwmige+VBs7vyCi2kqrNxDMtZ1A5SxQL9p/uHfgX8AzxNk1yly A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374070209"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="374070209"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787348357"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787348357"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:37:58 +0300
Message-Id: <e539e7ebbb410dc1b6ef065ac9a09b44be9449cc.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
References: <cover.1696588392.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/6] fixup! drm/xe/display: Implement display
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

We have an abstraction for "display runtime info", and it's
DISPLAY_RUNTIME_INFO(). Use it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 7c825f129166..f739858d17e2 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -90,9 +90,9 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
 
 #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
-#define DISPLAY_VER(xe) ((xe)->info.display_runtime.ip.ver)
-#define DISPLAY_VER_FULL(xe) IP_VER((xe)->info.display_runtime.ip.ver, \
-				    (xe)->info.display_runtime.ip.rel)
+#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
+#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
+				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
 
 #define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
 #define IS_GRAPHICS_VER(xe, first, last) \
-- 
2.39.2

