Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25B2D2D100
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE1A10E580;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMbtJMq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F7710E57C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yhhn8Puq1J0WIOq8fijW2RGXjL/U1MAeMY6rGrpKqrw=;
 b=AMbtJMq/kW8mEiubYIVJt1c3RunzOTJu/joXRoNPP2dPvqnUPapxQH3C
 BdNcOFXRQWXOzOUt6fKKJAXgXwrfEHlIo5TWT+94OmFjQ6FDPOlCyIwQ3
 H1qkxTLSavUfvkKErOu88+ESKTWBdH5wZQauHj/U9TOFycf4wXx8dSTNQ
 TyowMS7OSy7cXProw7z7NGhgY2RZjfK97tRiQHyUiZZP5p/YbTBu7qPUB
 KSZbVfdO69n4BNqjgm+Vo8vZOcoKsQeHto9KMzpZLUH542tUimGErYHLh
 GV07fdgdMDXKuqY7sng489ompCITSqXtfz/WO5GAFQ92xcBiZoh510/mn w==;
X-CSE-ConnectionGUID: RLYCNFwXTf+DzZNaVbRn4A==
X-CSE-MsgGUID: TOFOSdEyT/+rQo15rkD3vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311170"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: RglwOVG+TQW/fmC9budnJw==
X-CSE-MsgGUID: JUwI+YYzQ/2/ib9XxtOQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147447"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 64/79] drm/xe: Cleanup headers in xe_tile.c
Date: Tue, 13 Jan 2026 15:04:09 -0800
Message-ID: <20260113230315.3081153-145-matthew.d.roper@intel.com>
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

xe_tile.c only needs the device 'types' header rather than the full
device header.  It also doesn't use anything from xe_gt.h.  Drop/replace
the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index eb262aad11da..c465aae7883c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -9,9 +9,8 @@
 #include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
 #include "xe_memirq.h"
 #include "xe_migrate.h"
 #include "xe_pcode.h"
-- 
2.52.0

