Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC86CD30CF6
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562F710E574;
	Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYgUCYnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC97C10E568
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnXcDf1o17v/AruG7ZWOS6KlQSXO8W53hXt1RxYX7Do=;
 b=FYgUCYnlCmdEnFQpCOX3gjfHN8zNG0g8CaiwkHoNk4zQlBY4CbNeBM37
 JyBAA/CWA3S/MwyOVRCrBSkilokLnwaYd7Z3L4QKYaXnKOOts/A+Wivzi
 bFndes8XfJ1Spk/6MflTnaC1NruRARKUXVtIBxcTOYK8Wgdz+/BWgpTVA
 kOJ0YIImUjOBz+k18wPCngMDMcJVWQBjqnmuR963cVQS500COrZPU+Bpd
 rhRwUscPkTf+jtOX1htKPwg+uQxDoxrowAxO5ATj6g3dGlifLpC9FrBbN
 Tt+jemD7dAyRHBZixrT0OICPM1viRfpXCx9KscRhT/2StRVHkjORxdAnl w==;
X-CSE-ConnectionGUID: AnMpIkW/Rlu8Sh3F8Pcipw==
X-CSE-MsgGUID: Q1YZ920JTHi4Noz2gq+3JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311110"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: RLMxpbSPRs+TZ2iAnnfTRw==
X-CSE-MsgGUID: GVNdDPEVSvSt+0iDl/ce1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147252"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 01/79] drm/xe: Cleanup headers in xe_bb.c
Date: Tue, 13 Jan 2026 15:03:06 -0800
Message-ID: <20260113230315.3081153-82-matthew.d.roper@intel.com>
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

xe_bb.c only requires xe_device_types.h, not xe_device.h and doesn't use
anything from xe_hw_fence.h at all.  Drop/replace the unnecessary
includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 6d20229c11de..8b678297aaa2 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -7,10 +7,9 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_assert.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
-#include "xe_hw_fence.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
-- 
2.52.0

