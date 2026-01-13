Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E879D31886
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4D110E562;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQNb/xUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9204010E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WuZFggn8jpJMBJnLlaY2b7H+303tPxhgZhnue/6V/FY=;
 b=FQNb/xUdbVnByI7aOdYp1Zf/XIxg9N0rXEXOAYFVu+dqs8KdXq/539ir
 3dKnHrPc4c/sN7nxSb+T8RWszk1fog9K/xPSwHPJSNMV6P2VfMHka+0CC
 CSufMNvKKL+Wu4pjihm0oR0QyfB+wvLIGWJPi7fKsRkWjcXbtxowBssIY
 zdsQlDAZECmd74b4MCP5gtpbP86HI2lbuMEBLOj3qDs0mGRhp/jJO+wEe
 CTeusTU2nkadoCu/Wy3fgXkyJ2iVhNx/QrMrBM2h58jzGY/kYZz4o+HaY
 gLyQWVSdnQdCXj9fz5Hdsd77j44/1kQDAO1upTmPmEoHKXBCKJMqHKJs/ A==;
X-CSE-ConnectionGUID: n307iS8DREm7l5ZMqrRzuA==
X-CSE-MsgGUID: p9BQZmqZQRWfj8Rj/lA8Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311161"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311161"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: rV0NiEf3RqG9GBMVAhK1SA==
X-CSE-MsgGUID: xpDCJ01ST4yy8TuFEMtGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147427"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 55/79] drm/xe: Cleanup headers in xe_ring_ops.c
Date: Tue, 13 Jan 2026 15:04:00 -0800
Message-ID: <20260113230315.3081153-136-matthew.d.roper@intel.com>
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

xe_ring_ops.c doesn't use anything from xe_lrc_layout.h or xe_macros.h.
It also only needs the GT types header rather than the full GT header.
Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a1fd99f2d539..248620b0901d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -11,11 +11,9 @@
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_lrc_layout.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_lrc.h"
-#include "xe_macros.h"
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
 #include "xe_vm_types.h"
-- 
2.52.0

