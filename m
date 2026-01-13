Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82103D31899
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FFD10E567;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8pLsilH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8578F10E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k5nPaK9E/z4KZsDYRhc9L8MoQa6yO4nbXV8jJKYy5ds=;
 b=Z8pLsilHTakr+CYRuCNhdvo3Nv6fMXpaRPsTVDbhcl6gbskcMYvXsyUJ
 SP+8ZOWUaQurYV6bd/GTWXSNMp90awkj8lRDMplYKA1yqVK/5/HijmpRX
 oKylEGq/vgGPX3x6LFkGNwJMYD4r5bMWs8O4miJQpWc2W/ukNdFkioZOb
 +EKfA78cSqf1CunsxnalxhWGQ0R6Woxvo+ifxnuCqIgy39DsuIKFbjsNr
 LV8QN3HjJ65D6n9dWYInGm9cYJ4OUYjNasasE3Ctag2oZ1hf9ypdfnmnq
 mxOzHCn6QaXcOlzvoPKjntgG+dok8K0+VhM5BF1OQPTmhu7m9Z8UZMerm g==;
X-CSE-ConnectionGUID: HzZU+JAjSzKDhydXojTroA==
X-CSE-MsgGUID: 6pdTMWcJS3OF9LOn94xebQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311118"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: zS+Kq3xdTrO0Uvh88OjFuw==
X-CSE-MsgGUID: DEZBmrMmTKS+lZ2aUja98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147342"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 19/79] drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
Date: Tue, 13 Jan 2026 15:03:24 -0800
Message-ID: <20260113230315.3081153-100-matthew.d.roper@intel.com>
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

xe_gt_sriov_pf_migration.c doesn't directly use anything from
xe_gt_sriov_pf_helpers.h.  Instead it just needs xe_sriov_pf_helpers.h,
which was being included indirectly.  Switch the includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 7410e7b93256..87a164efcc33 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -14,7 +14,6 @@
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
-#include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
@@ -25,6 +24,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
 
 #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
-- 
2.52.0

