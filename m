Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9010D30CF3
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE74110E56D;
	Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0/LV/tE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AD810E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oOQh5aTMqIqtTt4GWemEOfEoZ3H27irZ5PCigKjLRfo=;
 b=D0/LV/tEtwMOTa9wllQPCq/VD+ihdYpLsxajuo71KRbVKr/6eG4+6MNR
 kQkVZw+seWZIbPInC5KpHnj6QkMv+L5cA7+M14ecTHXdF4WFOOixevbpr
 F6t/jXLUAw8R3ruRQsJB2JoUoVaDco65DPvzNPdmTWm70G+PJ81+92mAA
 4soLWfzeJiywjtsxxAlKqgIT0bbtw8sK88urRmWWlr+gfd1aN3X7r/LWO
 PjDukCxBKwG74WbAekLeHy4LvoqAZzOQzsQwf0sLIv0oGtjStci+V6BLF
 8MbusjGelDu5vYyHaOPDUYuhtF4N7m6afqQ2mFmMiZraYkv1xQNVXgsRr A==;
X-CSE-ConnectionGUID: Fz5v+7vcQAOF0QPUP5txmw==
X-CSE-MsgGUID: xragxi0CSNupfhtKms5dZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311129"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: KF6USs8kTwukiD4ERQSgCw==
X-CSE-MsgGUID: n5T97F0SR8+/1bvJs4kqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147361"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 26/79] drm/xe: Drop unused headers in xe_guc_ads.c
Date: Tue, 13 Jan 2026 15:03:31 -0800
Message-ID: <20260113230315.3081153-107-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
MIME-Version: 1.0
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

xe_guc_ads.c doesn't use anything from xe_platform_types.h or
xe_uc_fw.h.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 7e1cb6093de7..f4cbc030f4c8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -28,8 +28,6 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-#include "xe_platform_types.h"
-#include "xe_uc_fw.h"
 #include "xe_wa.h"
 
 /* Slack of a few additional entries per engine */
-- 
2.52.0

