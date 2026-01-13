Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF643D3189C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB48710E5AA;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bz5M4uOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D11E10E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2x9L7v+LtCnPaZPFVnfx44Qoy5zSe63yG7sJFXpUXW4=;
 b=bz5M4uODX5S0PXneSw/U9GiE8N0SJkAyi6m+rWVml6aLS36avo/MqrIG
 uuElszKFYWGzvykPaQjsP8Ty9F6UZRKioZIokJBVwHZmJpqLGBVBq5LN/
 dnwCBkSq3jbXBMvINN6fiw1cT8U7ebDoeO1cMukJtql0r/hVeVCD5hu6L
 nzMKeUSeHKdb1+Fx8u/Shn4yrm35AAP2zl/7wn0Ky5HYiwvdwxfdZuEvl
 vmLVt8IaynEXJVeQwI0G5rHoWrZeHBt/VMrW5BffIa0uJr/j5uur4CAkP
 Tr7GsF8gN0BiWZk1M5d6Gg8oCdjY/fT6mXmIzMR5ocabKtm+TAL9yTvv7 w==;
X-CSE-ConnectionGUID: IxUZsH37Tj+zeXX3MfKwqw==
X-CSE-MsgGUID: N9SqWTYAQ5m0lFmYrML8iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311130"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: JFhEmQxeR6mU+6FbCA6sjA==
X-CSE-MsgGUID: Cj2sc+J2SaKFrZzRNVH1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147359"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 25/79] drm/xe: Simplify header in xe_gt_throttle.c
Date: Tue, 13 Jan 2026 15:03:30 -0800
Message-ID: <20260113230315.3081153-106-matthew.d.roper@intel.com>
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

xe_gt_throttle.c doesn't use anything from xe_device.h; it only needs
the corresponding 'types' header.  Replace the include accordingly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 570358310e97..1e7e3a31aa69 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -6,7 +6,7 @@
 #include <drm/drm_managed.h>
 
 #include <regs/xe_gt_regs.h>
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_gt.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
-- 
2.52.0

