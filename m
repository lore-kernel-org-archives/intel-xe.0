Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85822D3188D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56B110E598;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPRTJOgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0888B10E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVPrpW3ywgPIbggl7jBY7LPCu8M2u1bxaL54kEzTVJM=;
 b=jPRTJOgt5av7nXZpEnqhUMYhNASRolCpAT82IFuEcD8FkMxZ4Og0ibRa
 kZ8qen9WHyxE/F02K0/0AgsUVaPLRk6xMR7OXU+XoTkOiDoLU1cugehDw
 stXwhP2+Ic7N+3No60ASKqk4p54XYvcCaXnuQ64BmuLV8+rlPy2CBPmRf
 yyeykGfXEFuQIGfDpGj0qZDpDTzmvQ9BNoAffBCZWAuN16dR2cZsUI7b/
 LzXkQqHIOCgXbBP2nBUkCZ9E3KqFO/GbwXvoL9kURnUAtbhEviZufFC13
 frlwfnLJ7Ueo+5aAhBhAp0IfQWxmWYm5LdK5UfLU+RMkju8Yk59EkQdkH w==;
X-CSE-ConnectionGUID: a0XEr1nBQKiaPL7cgCftPg==
X-CSE-MsgGUID: qv8RuiHvRuu0MgEiPXNUZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311146"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: sLHracUEQxqAaOgnuufcAg==
X-CSE-MsgGUID: HAzuWbSuT22Q5btVJBJgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147397"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 41/79] drm/xe: Cleanup headers in xe_i2c.c
Date: Tue, 13 Jan 2026 15:03:46 -0800
Message-ID: <20260113230315.3081153-122-matthew.d.roper@intel.com>
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

xe_i2c.c doesn't use anything from xe_device.h or xe_platform_types.h.
Drop the unnecessary includes.  However it does require xe_sriov.h which
was being indirectly included; add an explicit include for that.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index befc77e46eae..1e1fb72e49bf 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Intel Corporation.
  */
 
+#include <drm/drm_print.h>
 #include <linux/array_size.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -26,11 +27,10 @@
 #include "regs/xe_i2c_regs.h"
 #include "regs/xe_irq_regs.h"
 
-#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
-#include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_survivability_mode.h"
 
 /**
-- 
2.52.0

