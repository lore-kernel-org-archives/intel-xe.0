Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17078D31884
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EDD10E58B;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dESEvyXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BCC10E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOsiEtjV0BDLiXMxcMhkP0q0hsvMq5/n2eSp2Ta+Ehw=;
 b=dESEvyXHdrASgEnQ/fJszvoP/xNqbqTJW0QpB/qGT3Mv40/c578uTRP7
 VD6NEdQ/wYC6GfdqVy/ev6tAuEfBoEO9dmkC9jJK+yDoBf9hXAzTUF2rs
 InkQIWVPvc5hUKLjnCimvhqhAasoHBC1cDwCJtuI1bSQMnaUGaPI4oUVC
 MzYrYpB/4LwH1yyLviycd4SmX58a9ELZNzC8g2mixMafKQJhOelY08DAk
 awj4813cx7O3tIeHvzdoojbE4lS4AbcKRDxi0MTlWhhYcMrimC0SP5Mqp
 iIHt6sDX2UNia44iH+ntI7bnpJ3evG/IuBePApg5B7mIN8AhrP6xY0Lx8 g==;
X-CSE-ConnectionGUID: PcfVUKPzTGqp6r6TIRgY1g==
X-CSE-MsgGUID: A+0Vgg22TruiWcJq5BgglA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311149"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: mot91fYmQKiEx7Q2ievFEQ==
X-CSE-MsgGUID: t3P5nkkmT+KumWHSY7rN8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147400"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 44/79] drm/xe: Drop unused headers in xe_mmio.c
Date: Tue, 13 Jan 2026 15:03:49 -0800
Message-ID: <20260113230315.3081153-125-matthew.d.roper@intel.com>
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

xe_mmio.c doesn't use anything from xe_regs.h, xe_gt.h, xe_gt_printk.h,
or xe_macros.h.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 350dca1f0925..bcb6674b7dac 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -14,12 +14,8 @@
 #include <drm/drm_print.h>
 
 #include "regs/xe_bars.h"
-#include "regs/xe_regs.h"
 #include "xe_device.h"
-#include "xe_gt.h"
-#include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
-#include "xe_macros.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
-- 
2.52.0

