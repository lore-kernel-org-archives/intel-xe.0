Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE333C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8890910E87E;
	Thu,  7 Dec 2023 11:17:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AFC10E885
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947855; x=1733483855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m8bTsuqYpoul6LYhkq+5Fg5QSTBusStQIp/2wqSOzRk=;
 b=OS6UjFQgKlvh3csFMrUmdeWPnCelpfFAXYfwsiGoaPxBB+1i/tQx1eLc
 tht9rk6sKJZxVMxm/LQzvd6EyZcSiILVu5U+wl2dI/gqb70sgoLu/Q6Ag
 z5zZ0ZVLKQmWEoIrDpIWiAv7bOiyHjc80jXJq9FHobbxuThHWsU9ExSZS
 XNjJidYKl4JNdlpGTkR86r0esFyFH7ODUKUKZLMz12AbpV0+xZnwZgO3f
 wv7YVx2KIpI7C30Jfh3cVj97fJlpRVV7WJjCsFS+N7AYDQIWDXZBbspo+
 FZBNFPLy+38fQsQ0EaL06aE2Uy/y+dUyftP9IZxWvzDziSY2zRA3NmF0W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704548"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704548"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837686074"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837686074"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:33 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] fixup! FIXME: drm/i915/display: Remaining changes to make
 xe compile
Date: Thu,  7 Dec 2023 13:17:04 +0200
Message-Id: <20231207111706.2293105-8-jouni.hogander@intel.com>
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

We have already i915_ggtt_offset in our compatibility headers. Remove
useless ifdefs.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index db20dd7e5c0d..a685c527c7d1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2105,11 +2105,7 @@ intel_crtc_needs_color_update(const struct intel_crtc_state *crtc_state)
 
 static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	return i915_ggtt_offset(plane_state->ggtt_vma);
-#else
-	return plane_state->ggtt_vma->node.start;
-#endif
 }
 
 static inline struct intel_frontbuffer *
-- 
2.34.1

