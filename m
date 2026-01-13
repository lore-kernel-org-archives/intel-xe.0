Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1DDD30CF4
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180CE10E570;
	Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heT1GUzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCF910E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345419; x=1799881419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aiFXOltPE+dOHyQxlcjxBIi+tyL1a1+ODPSRi3UZ88=;
 b=heT1GUzKdPO6jDWSHnXVmiN89K76LeeDomX1dE5Sf47hP/qQW9HsjFYp
 muyM2e6rrZcybSZYAtWh8nTnT5HAnSZIAq2qt+SdkLmkwCge2/vyImKSk
 pQ0Kej6QMqbciD+9GTuX0Xsq2v67GUAn7BdrueMT5EsLlk+banr8hWgbp
 y62ckUG/gAo9JodkHIjfXndUtz+dLhxCCu6MX2qoUEO2oaIVLz3KJnWSE
 utboJYll2j/UG8kkToYFzDwTCCztVvKWAC24gbU3qE9/rrtvlJbKqGtJ9
 hHwssNlvWyyWTE8AuFF309/1+SJUHJraOlo0eV7uqzfbkF5fFgrZoHj/o A==;
X-CSE-ConnectionGUID: lmoDj17fRS2FZzDE1K9DMA==
X-CSE-MsgGUID: BVICT+50T5GQYBZwktLEvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311109"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: qXtE83dPStaqKdgV4gDcrQ==
X-CSE-MsgGUID: m6G5BeAvTdiPLDEtu3rvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147261"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 04/79] drm/xe: Drop unused header in xe_device.c
Date: Tue, 13 Jan 2026 15:03:09 -0800
Message-ID: <20260113230315.3081153-85-matthew.d.roper@intel.com>
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

xe_device.c doesn't use anything from xe_gsc_proxy.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7190b208e3da..495310a624b5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -35,7 +35,6 @@
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
-#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
-- 
2.52.0

