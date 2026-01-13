Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64666D30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683210E56C;
	Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yk8bqL2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD3E10E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wbTNosAZ0A7I+8IdegAIwZUVhrg1hZevSsMPXpF21m4=;
 b=Yk8bqL2s7nSvUweM1S84/PSCrcLahzith6wDYeR4hCZmtLAK+9HHp6OX
 g/NCSxwEBJxUJrCaw1v9l/ahIDEiHb2yfMcP+ouI8/p7XxEl9mXn2wb7t
 6jbP13aRaaDdyA+1njGm1BfUZHk7bMBwSVh6aQ6QroBk11a74u+rNiGOV
 fxms5OOI8UlaD97DJEUcUBen2t1QzkpcJdbos7W5Lje70tVIqbivFLAeF
 zc5Ydd5xmZgdMhGa2dmdbZ71trQqhuX/T/rPZebHa7sMvaOj2hz5yCztD
 Pvh4OouYRLTcl6IDYjc3LhwdSafhvKIC/Oti6f3k28j5JfunSFycfJDRB w==;
X-CSE-ConnectionGUID: zM9hnE77QNGEZO0ly5W+KQ==
X-CSE-MsgGUID: Vx7Fj6qTQDO2yv5Ylb4clA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311121"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: N7/dsWUmTaaZIYH1Q9C4+A==
X-CSE-MsgGUID: +aiRhB3YRtisodfNwLJNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147295"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 15/79] drm/xe: Drop unused header in xe_gt_idle.c
Date: Tue, 13 Jan 2026 15:03:20 -0800
Message-ID: <20260113230315.3081153-96-matthew.d.roper@intel.com>
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

xe_gt_idle.c doesn't use anything from xe_macros.h.  Drop the
unnecessary header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c1c9bec3c487..7a569e1730a4 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -13,7 +13,6 @@
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
-- 
2.52.0

