Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A35D318AB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D5E10E56C;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP0M/jWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9980310E579
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ex8ukQsnDAwERgNW9J41oVCM2Pk0UH9I19nQ55iINOw=;
 b=MP0M/jWBPt8qg6AyQNdxgnWiqKHfz+/FZ9+JdxuM7IdXCNhlMcki6G63
 eVCSLxdXDwsdbCcDsr7AKdOmKUK2TD/MibD3av5O7xHno4ePaWiTRwDWa
 HB+jwgQVHatH2OjvUo/2eE69DI4aGP71yuViUXKpuTFhCOBRn8VbJd+Ce
 w+lcbbeBkIwdYr182tNVSLGqILK0Me3XAjjiIYRwn8t9w/7bbmj3LB3TU
 y3LkM1dMnSgvP0ZzfsWsmJbytsFYoNIc7P0CJvxNw/7cbMBj7aTqi1Cg9
 prwdDmQE8bPnj1tqSbSfr+gUsYyHY22ML2wY5gCiNJJdsOwy1Tw2gUN6v A==;
X-CSE-ConnectionGUID: W8bpyasnT9uhFMKA+jELrA==
X-CSE-MsgGUID: BM+s9sboQMyuLSUFk4Jj7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311165"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: MbpHYeTlQNK1lo5Cobxd/A==
X-CSE-MsgGUID: f17niHdkS1SBqzG1wf9xoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147432"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 58/79] drm/xe: Simplify header in xe_sched_job.c
Date: Tue, 13 Jan 2026 15:04:03 -0800
Message-ID: <20260113230315.3081153-139-matthew.d.roper@intel.com>
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

xe_sched_job.c only needs the GT types header rather than the full GT
header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 39aec7f6d86d..3927666fe556 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -11,7 +11,7 @@
 
 #include "xe_device.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
-- 
2.52.0

