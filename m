Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B070CD3189B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AFD10E5A8;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNWCgMCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2C10E56E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KxzxdmDAOQW8p90DXsiHxajjrPMeThwoEbF/diMHgE0=;
 b=WNWCgMCGwv+3k0qrvFb+dKtuYB6xld4vEDQPYt2pjAU9+s0xhCLmlY3b
 mg1f/Bfpnq/C9s2Cbk41q6uijJGMr2asAi62cLOVBob/t0y7aTEk5fq0u
 RVeH5deWRlgrE4ifEHOutVdiwnljy1ZLBWS1ViDLd0e9tU6ff1ThFtaas
 EzGJgo9/HmJ3yDHUwqhxKsJ1FDDYuBtwxvRI4yhjo3f1is3UnFKaDYhOR
 jRxgemmym9e/5qrlOCeYrng1eV79VvyrZxtxHbnN6FAA49TFOQqARLgxj
 uudxP1/Rmfba9dyMXFYAUiOtKlI3K26JKKklB7AVT8ax8V9jdXhrV1xyg g==;
X-CSE-ConnectionGUID: MQbhm07yQV+/RXz3VDW9iw==
X-CSE-MsgGUID: GfoBEyvzQAadzicB5tXOfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311144"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: Z8+XdW1hTSCiGP2XQ9BlpA==
X-CSE-MsgGUID: zpA+TfB8ROmvsg30lTjUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147389"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 39/79] drm/xe: Simplify include in xe_hw_engine_group.c
Date: Tue, 13 Jan 2026 15:03:44 -0800
Message-ID: <20260113230315.3081153-120-matthew.d.roper@intel.com>
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

xe_hw_engine_group.c only needs the device type header, not xe_device.h.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index f69a32c27458..2ef33dfbe3a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -6,7 +6,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_stats.h"
-- 
2.52.0

