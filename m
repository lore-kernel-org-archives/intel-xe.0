Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFCDC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C8510E8E6;
	Thu,  9 Nov 2023 16:18:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38E10E8E9
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699546708; x=1731082708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUn7wbvTrFHyyavthZSCISt7sRWf8J9eynWwqpOPdSY=;
 b=LfyEPzS0GHKGYQMQ8xLgsikeOjPcBRe/MPoHmYDoNspL/nSSp3/MLqol
 7WlhwqcKqjaEAv7Gwdm0YircFa1OOME9M3TsipQ7/q9kV9WiFJjxpdTNX
 93GSxISEudGiWXdl5Q6G1wRZFDLaGiq7sFen/i0cjEnSgjzdBRoGTiDaB
 f/nbKsPvMLEwU87RuWzYsFrfVep6d2yqpgMd9ADS1oUcGt/46PloYg/Rg
 1kbftJr7XoYaX4xHmzBdfOW48uSmpnI413FNnlAhGLB/2wF47IUCW4fZ1
 vBVyvzEfGnhk+NQIGlKxVKoQ5pwvOhNkYn1/Jtihbn6mm8XbvsNJTi/hy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11563277"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11563277"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4764598"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 18:17:55 +0200
Message-Id: <f58f35184e93bd9b863924c1a7553e4c0b65b723.1699546565.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699546565.git.jani.nikula@intel.com>
References: <cover.1699546565.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] Revert "FIXME: drm/i915/pxp: some hack to
 bypass pxp"
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 7c700778c3b455c853c9ada8b85e83a550171c03.

To be replaced with a slightly cleaner abstraction.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 68eabe089aaf..a4d0e2ede2f7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -21,11 +21,7 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
-#ifdef I915
 #include "pxp/intel_pxp.h"
-#else
-// TODO: pxp?
-#endif
 
 static const u32 skl_plane_formats[] = {
 	DRM_FORMAT_C8,
@@ -1864,14 +1860,9 @@ static bool skl_fb_scalable(const struct drm_framebuffer *fb)
 
 static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
 	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
-#else
-#define i915_gem_object_is_protected(x) ((x) && 0)
-	return false;
-#endif
 }
 
 static bool pxp_is_borked(struct drm_i915_gem_object *obj)
-- 
2.39.2

