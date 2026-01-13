Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1527FD3189A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ED010E5B3;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfZ0Ci63";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA2D10E57E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ftldXzBKb1kfw6QEYxYGgfNhEbgxYArKEx7476FcE/o=;
 b=bfZ0Ci63zFI084qk3pxk+QilpeM08RUAxmJ5Q9DlLZvlkV2GDrBSHN+G
 I65XMLxovHVV6kW92N9/0z1ZYbb2MBffdAE6bFuttiCaNjZHQ2D2vhST9
 DX2dvWVym7buaQNH36zxonEsOipzCNdsS1g1b2VThjoIXCZUh8peUzLwB
 wU8MWQci4RRG4EgXgG3U+gWA7a25wbnAPUjpNcSFQVW8WgS5BfDiQnA+D
 bUuSnkxGSErJvEfbIiUiNPdWuXjJuyIXIVnPb6HpfhqaEMlLSnJLhK01Z
 HrbZLoTulqF3xHROIRmp3oMxHNWo9FI0bBvdb90vHIxMgjeYTP5lZqqaL A==;
X-CSE-ConnectionGUID: s5Fqa5BNREG7T2cXFHV5bw==
X-CSE-MsgGUID: jy5PV0OZRiW4ZoUSLXaacg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311176"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: 25/HshANStWVOotcKC1Olg==
X-CSE-MsgGUID: QKFRkJNbS8yiXa0hC6Jgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147467"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 71/79] drm/xe: Simplify header in xe_uc_fw.c
Date: Tue, 13 Jan 2026 15:04:16 -0800
Message-ID: <20260113230315.3081153-152-matthew.d.roper@intel.com>
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

xe_uc_fw.c only needs the GT 'types' header rather than the full GT
header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7455ac3300c6..6a8e692fd7a1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -14,9 +14,9 @@
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-- 
2.52.0

