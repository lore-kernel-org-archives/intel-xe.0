Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA15D29DF0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 09:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17A910E48D;
	Tue, 13 Jan 2026 09:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P41pJ9EW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971DE10E48D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768295971; x=1799831971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JYmxXAJS6/aob00UfFicvts8bEoA1u/aVq/3SY4aTpM=;
 b=P41pJ9EWw9RGVpp0Bpy49lpi+hvFRk2eDu8YzoSmJmroslj2Eaxn3Hc0
 m+JXeHa0HwKzzIThZmEiP+wKNAyN0eIBdx4QbBCcJbq4ddTB+nEOACq/A
 lVGg9xlBiRpTotnKE0S2spnyy0JnDeqbJlDQAMl92X4A2/XWZg6RGLUar
 RSd990FSjVr+XCyfo2T4GmzC1KvWAbixj370RmDs1+lJVfDUEY0/rZl3O
 FDSdwJp+pAm8YRygV4JZi5QFA/2v2LJa98DqSpvAPqaRRQmJzBYIOceIY
 Fos97GK2flf8ypN20rZXm87rlE9Qe/3n9nOADSfJ1qvcEUsNcs05klREG g==;
X-CSE-ConnectionGUID: 8F5qe4aeTSS0r4BKnNGYjA==
X-CSE-MsgGUID: dfhV9LejR+GZqOqi2dpanQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="95051405"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="95051405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:19:30 -0800
X-CSE-ConnectionGUID: 8oI2cchjTQWaCtrcBv0JpA==
X-CSE-MsgGUID: EC816oGMSbuzuGrVLnx6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204949234"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 01:19:29 -0800
From: nakshtra.goyal@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe_query: Removing check for gt
Date: Tue, 13 Jan 2026 14:49:28 +0530
Message-Id: <20260113091928.67446-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

There's no need to check a userspace-provided GT ID (which may come from
any tile) against the number of GTs that can be present on a single
tile. The xe_device_get_gt() lookup already checks that the GT ID passed
is valid for the current device.(Matt Roper)

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 75490683bad2..b7b4261968e0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -142,9 +142,6 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &resp.eci;
-	if (eci->gt_id >= xe->info.max_gt_per_tile)
-		return -EINVAL;
-
 	gt = xe_device_get_gt(xe, eci->gt_id);
 	if (!gt)
 		return -EINVAL;
-- 
2.34.1

