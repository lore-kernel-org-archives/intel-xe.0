Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BE7C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6E110E882;
	Thu,  7 Dec 2023 11:17:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708E910E880
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947847; x=1733483847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HSK1y2ONfxsx6OtjzZSn+BiLPEjqGYTgQPjO1ONK0I=;
 b=FGMh15GMXg9APb96gshN4+dTz+jnGtPuoA88rVCD3BAnUPaomSUi+58f
 Y9dLtE0GNkmaXhfyHDdr9Dy2yNGycBgp1I4iSFLunGxSWaPxhqRsl1M+N
 lLG7dcbLODLMwlamap/68Q90pS2C0HmSEPgj9Y1W2n1w+n6cmgUF5ncRM
 ZEN0DdoYeLph++YQmWFUnqcXyabfy38XKwdQX/iOk7MfxrX/8K/mplwur
 Zfqb9TeBwvH1y5w+hSf+b+D/REwDIcocI4FGj/9X4LePqI5XkYMRNxmOR
 g48+e3FV2jtcZLcRk9V8UgQvYBAT774HUlL6lvYkkoCG902pL6ordLszv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704532"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704532"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837685951"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837685951"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:25 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915/display: Use i915_gem_object_get_dma_address to
 get dma address
Date: Thu,  7 Dec 2023 13:16:59 +0200
Message-Id: <20231207111706.2293105-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Works better for xe like that. obj is no longer const.

This is will be a backport when this gets merged:

https://patchwork.freedesktop.org/series/127300/

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b342fad180ca..0d21c34f7499 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -23,6 +23,8 @@
 #include "intel_psr.h"
 #include "skl_watermark.h"
 
+#include "gem/i915_gem_object.h"
+
 /* Cursor formats */
 static const u32 intel_cursor_formats[] = {
 	DRM_FORMAT_ARGB8888,
@@ -33,11 +35,11 @@ static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
 
 	if (DISPLAY_INFO(dev_priv)->cursor_needs_physical)
-		base = sg_dma_address(obj->mm.pages->sgl);
+		base = i915_gem_object_get_dma_address(obj, 0);
 	else
 		base = intel_plane_ggtt_offset(plane_state);
 
-- 
2.34.1

