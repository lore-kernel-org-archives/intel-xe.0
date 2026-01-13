Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB5FD31888
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A4210E591;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBvsnuI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2FC10E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8shEvyNvb7amp7rBNEa+tO3JOGlf54CFINemjBcWtE=;
 b=BBvsnuI3AmvY/R+MJAZAS6ONE80LAy021AHSs875tOtg1fwxw0oknRW4
 UO+cJo1BBPRZoEHLPriG1CT4S9FlhqaSNACElYfbdYcfmoZS3FpzZ1B8z
 cI+oiDfboaLioB4PsFTW16n3H9lDe26Bjo3YnXEnFuyvSVrsviNkafVnL
 eWzew7Vph/uleZHmmBVViaGET6ixi6L4vv2yCek77n4zmfOmne9WW4RqE
 zEAYpZRc4vzI6onFKrPWvZ7dgZVR/bGdqfp7EjT1J62sRh75TlWLgPr/t
 GU0gFDQlvkHJbWpTabHuz3aBbWilO1WVNE+fYfvRS4cXmEhEgn2xvPx4K g==;
X-CSE-ConnectionGUID: jFz45vT0SFinzOKJ7GLvig==
X-CSE-MsgGUID: 9l2hKcg5TlS8gkiVGH3LwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311111"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: NhgWGmGjQgOZcnb8ufNy4A==
X-CSE-MsgGUID: 7CZwrAVxQK2woRbmBWfZlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147270"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 07/79] drm/xe: Drop unused headers in xe_exec_queue.c
Date: Tue, 13 Jan 2026 15:03:12 -0800
Message-ID: <20260113230315.3081153-88-matthew.d.roper@intel.com>
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

xe_exec_queue.h does not use anything from xe_ring_ops_types.h or
xe_hw_fence.h.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b5737563ee14..a940849bb6c7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -21,13 +21,11 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
-#include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
-#include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
-- 
2.52.0

