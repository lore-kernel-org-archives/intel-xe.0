Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AA6C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 16:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340E10EEEF;
	Thu, 21 Mar 2024 16:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFjNARYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFDC10EF48
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711037756; x=1742573756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2YautsSOBWHaLBIv0oDP/aflBtUen5EaCbZJaT6qb0g=;
 b=DFjNARYP41XdK+c4Ei0v7iNyWQ/Yy+aIfw/53wW3c0bsoywtRsz21KgX
 EZkJlJrjlPWRLUKHLWI6cFC8nEWD+EwgeXGy6KOKPvRvbRs2J3Ac7E5Pg
 zgTW4cM3rLPL23sHjr1OF2PQs7vUo/ZLz8YT27tvNayWOp70wU70yRjDP
 FkoEhtR0iylE/JhYZASpSixiG0Gt5Ww+t5OsyJ0xpP1BXigZ46ej9XljG
 MWP8X6wpTi+DLRIPSukcOKwkAZOJwTtm2UIRQfa0cvb/OQIA15ab5x0w/
 XfX+9yWsYNOiaxGo0W9uCkFGNIu0uFzb9ZBG7hPmIZZ2uYvM+0tS3s818 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23488234"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="23488234"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14458222"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:15:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe: remove unused struct xe_device members
Date: Thu, 21 Mar 2024 18:15:48 +0200
Message-Id: <20240321161548.3509672-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

modeset_restore_state has been unused since commit 6af0ffc0db93
("drm/i915/display: move restore state and ctx under display
sub-struct").

member global_obj_list has been unused since commit e2925e19c006
("drm/i915/display: move global_obj_list under display sub-struct").

hti_state has been unused since commit 62749912540b ("drm/i915/display:
move hti under display sub-struct").

snps_phy_failed_calibration has been unused since commit 3a7e2d58f800
("drm/i915: move snps_phy_failed_calibration to display sub-struct under
snps").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..1df3dcc17d75 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -498,10 +498,7 @@ struct xe_device {
 	struct mutex sb_lock;
 
 	/* Should be in struct intel_display */
-	u32 skl_preferred_vco_freq, max_dotclk_freq, hti_state;
-	u8 snps_phy_failed_calibration;
-	struct drm_atomic_state *modeset_restore_state;
-	struct list_head global_obj_list;
+	u32 skl_preferred_vco_freq, max_dotclk_freq;
 
 	union {
 		/* only to allow build, not used functionally */
-- 
2.39.2

