Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3BDC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED3310EA0D;
	Fri,  8 Dec 2023 07:56:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903E10EA0D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702022206; x=1733558206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=10gpOfaVCVK68uSmHeENRz2kSjNgAM4yGD34DZW1/so=;
 b=jqZzu9z97cJfv4dQ41V1ORBhzOUmPEnSlqhU6406E9ygziwzVgV19rAT
 z7ODMqafHYFTxck1sRXq1bS/WdNqDNgYKpPW3l6xqZHeScVRIl31Ws3l8
 crwZQOE1mEo037BMwtwLtHhR1Gmn5TMMRIuIptp27mKIayJ065bkyhasC
 jpq9ftg33p3/h98JXcYILAVMzsKm2vMUzFGvDAgIQCVZJvIha9fFUatkP
 UO5tNsseiqnYJRm08LEayv+8SZ8VLmk2VZli/W0MHD2V3zDjoVHhPe5lJ
 PxrEauw2uupwAMl8oNE89vK4CN27X5PhM7Y+Kz4ugz9r2MEGnTTyhmJU3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391542414"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391542414"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838044740"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838044740"
Received: from cannonro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.63.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:44 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 7/9] fixup! FIXME: drm/i915/display: Remaining changes to
 make xe compile
Date: Fri,  8 Dec 2023 09:56:08 +0200
Message-Id: <20231208075610.3005795-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
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
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

