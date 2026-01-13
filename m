Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA99FD3188F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013FA10E59C;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8Zpxivl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226C10E573
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fnu8CDNo9YCGAKXiDfjEu5mPehGPaqeQS1q2yrI2Cck=;
 b=f8Zpxivl1w82wD2+5/vcZnTLr8sqZKfWFnB8Ypl4Q0FO9m5TjqLZpfH/
 sOjc/O51vtgZcmxpUS9Kq/JrzA4lNHDnsmb8WLPvq2QzV3zs9TxFWUEAr
 YKoo/L7GWdnHvt/0heuZTqsYsofA3WnHepWd+t/27VsYGtGNmy0063s1S
 rG/YjpLqllvvZYI1Pz/b+EtUnXmqhRe+wu48skNBL5XCIniLSgBXKT6jJ
 3U84G6iSQt3bkhCANZxgOoBC9MFMocVtau22QvKBivO8Ug6cL4gBiCE18
 4sm8SWDTzLviYHyjaIaAKL6xkRFQmOKBtyYfI/MdPYoP43M+XxfzjQLyK A==;
X-CSE-ConnectionGUID: 7hatA4BPSnePpjuYGCu0zg==
X-CSE-MsgGUID: Xj7QM8DKTvucl+jwdymr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311175"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: 7jbjLESKQwS3hq9JYleMdA==
X-CSE-MsgGUID: bPJh8EXSQSG12gFbeCj0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147461"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 69/79] drm/xe: Drop unused headers in xe_uc.c
Date: Tue, 13 Jan 2026 15:04:14 -0800
Message-ID: <20260113230315.3081153-150-matthew.d.roper@intel.com>
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

xe_uc.c doesn't use anything from xe_gsc_proxy.h or xe_uc_fw.h.  Drop
the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 157520ea1783..3f63c2a7e86d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -8,7 +8,6 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gsc.h"
-#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -17,7 +16,6 @@
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
-#include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
-- 
2.52.0

