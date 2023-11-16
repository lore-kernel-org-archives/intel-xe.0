Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C87C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 06:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6E10E2A7;
	Thu, 16 Nov 2023 06:42:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C9110E29E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700116949; x=1731652949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AMZG782jfhJr9pYSS6kVw2gTIrub2mweH2MGgjXShbY=;
 b=Rnoc3keDE5P1zSRHGFlZjJtKvWZub3SC0VExThpimGz/1W+1fB0mhUJK
 MEN32kRl7x/ZKIw4SbpDKqe8KjKpAOXnLa7bxEssYNnaLH8YlmThHWnOf
 LA456JlhZQrDJEfqSzaMA4DvF1Fe3d/S+J+Bc4A12ss18lsctZnrwbh89
 AeOWfB+bsYwbavXFKquY7FB6ECQsAyHeeDicvVMwbuOVdn2YgxtBHcGz4
 OWUN0P9LxG938EtX1MGgZJkf2gyaJgg9CC7hB80/dD/LXZWEbYG00Pm7q
 fjCOMow1QYrQmYkHfRzQ1mbV7KmxAdjNriWI43/Qp/wiwuRRQIJjtX4qT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381422798"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="381422798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765216769"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765216769"
Received: from dcarcium-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.40.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:27 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 08:41:43 +0200
Message-Id: <20231116064145.3969338-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/8] drm/i915/display: Convert
 intel_fb_modifier_to_tiling as non-static
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

We are about to split i915 specific code from intel_fb.c. Convert
intel_fb_modifier_to_tiling as non-static to allow calling it from split
code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 40 ++++++++++++-------------
 drivers/gpu/drm/i915/display/intel_fb.h |  2 ++
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 906db4ffd262..3acadb064075 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -301,6 +301,26 @@ lookup_format_info(const struct drm_format_info formats[],
 	return NULL;
 }
 
+unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
+{
+	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
+			 INTEL_PLANE_CAP_TILING_MASK;
+
+	switch (tiling_caps) {
+	case INTEL_PLANE_CAP_TILING_Y:
+		return I915_TILING_Y;
+	case INTEL_PLANE_CAP_TILING_X:
+		return I915_TILING_X;
+	case INTEL_PLANE_CAP_TILING_4:
+	case INTEL_PLANE_CAP_TILING_Yf:
+	case INTEL_PLANE_CAP_TILING_NONE:
+		return I915_TILING_NONE;
+	default:
+		MISSING_CASE(tiling_caps);
+		return I915_TILING_NONE;
+	}
+}
+
 /**
  * intel_fb_get_format_info: Get a modifier specific format information
  * @cmd: FB add command structure
@@ -737,26 +757,6 @@ intel_fb_align_height(const struct drm_framebuffer *fb,
 	return ALIGN(height, tile_height);
 }
 
-static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
-{
-	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
-			 INTEL_PLANE_CAP_TILING_MASK;
-
-	switch (tiling_caps) {
-	case INTEL_PLANE_CAP_TILING_Y:
-		return I915_TILING_Y;
-	case INTEL_PLANE_CAP_TILING_X:
-		return I915_TILING_X;
-	case INTEL_PLANE_CAP_TILING_4:
-	case INTEL_PLANE_CAP_TILING_Yf:
-	case INTEL_PLANE_CAP_TILING_NONE:
-		return I915_TILING_NONE;
-	default:
-		MISSING_CASE(tiling_caps);
-		return I915_TILING_NONE;
-	}
-}
-
 bool intel_fb_modifier_uses_dpt(struct drm_i915_private *i915, u64 modifier)
 {
 	return HAS_DPT(i915) && modifier != DRM_FORMAT_MOD_LINEAR;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index e85167d6bc34..23db6628f53e 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -95,4 +95,6 @@ intel_user_framebuffer_create(struct drm_device *dev,
 bool intel_fb_modifier_uses_dpt(struct drm_i915_private *i915, u64 modifier);
 bool intel_fb_uses_dpt(const struct drm_framebuffer *fb);
 
+unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier);
+
 #endif /* __INTEL_FB_H__ */
-- 
2.34.1

