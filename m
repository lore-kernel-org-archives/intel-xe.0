Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725A3C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39310E8A1;
	Thu,  7 Dec 2023 13:01:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B310E8A5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954073; x=1733490073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m8bTsuqYpoul6LYhkq+5Fg5QSTBusStQIp/2wqSOzRk=;
 b=GvkeTz6hSBlaQqINM72WdYh1hkdTkyPZKRUTJpcEKeYl/o9etzDn5Ho8
 X+1Q8DJJluPTh49IUS9pGLa2GUu8shfI6nUlBDjdCCQgtPja1YCRgPpBi
 wPwU74hD+hFcC4HfxnIk0RmjJDWiNFDllFmMEoiiUHtmuKLrk+ew1ohFM
 vgqLoluX3lru+xfDwe28l3mJ8SXIyIDlTwlS7l2MdjNDkukX7TdlJ7Z5/
 f0UJIM4pFsYAOSQ9RGu2UUV6idl7U1HHZjsR0dgrzr6SoNpGuF5fyZVih
 eCrNBRCMO5uKujnfYL68KiAraqWtiHR9NsUMxWiEH6E5Qv9EgwdUsG8HF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1308991"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1308991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721454230"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721454230"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:11 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 7/9] fixup! FIXME: drm/i915/display: Remaining changes to
 make xe compile
Date: Thu,  7 Dec 2023 15:00:44 +0200
Message-Id: <20231207130046.2350822-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207130046.2350822-1-jouni.hogander@intel.com>
References: <20231207130046.2350822-1-jouni.hogander@intel.com>
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

