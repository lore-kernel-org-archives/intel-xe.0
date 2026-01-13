Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBFAD3189E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B1A10E5AC;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpvI7EGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67A10E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wq18bYiTo8L1/M5WfnbFrtVc/G9pcGS87n0ltr4xzwA=;
 b=lpvI7EGHITxazQtswr3K7w1fTQpNSGRzFFmlizlFVd3P/LvwC962car2
 GcXDEbzzFYwQNE7wrTGHUOnyTVS2R24F1HN5uBM3ZZ22w1QZI7qs5Nc6T
 73qS697bFxuHrgeFm39BHWIQF7PO3XBYI87bYtVRltzQaVuN4Q8C3Ga6p
 EkF4wmEjgA72/C/myUgnfig75uRFo7b5BYJG7lXWbjP3SimnQgivBPPco
 DLP3Za4sF5GhqpiYcnA/aBV13mVyyCj5usN5+FI09zZO/8ppTPtCAbj6a
 4XVzDYsdKWg/hDHE7krSDk/TrD64I1VWO836O1/GnTfIhEGK1OI+sO/3q A==;
X-CSE-ConnectionGUID: FfWLq6UZQYmVp8Gk08G0dw==
X-CSE-MsgGUID: YUndAmsFS5e0UagwrQoJhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311126"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: gafzY095SpCBXTlE23FyJA==
X-CSE-MsgGUID: fCjwSH9YT6mLJChuWx4tsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147349"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 21/79] drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
Date: Tue, 13 Jan 2026 15:03:26 -0800
Message-ID: <20260113230315.3081153-102-matthew.d.roper@intel.com>
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

xe_gt_sriov_pf_service.c doesn't use anything from
guc_actions_sriov_abi.h, regs/xe_regs.h, or xe_gt_sriov_pf_helpers.h.
Drop the unnecessary includes.  It does however need xe_assert.h and
xe_sriov.h which were being indirectly included, so add explicit
includes of those.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 2eb21610e5a0..b5e0a5b7723e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -5,20 +5,19 @@
 
 #include <drm/drm_managed.h>
 
-#include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
-#include "regs/xe_regs.h"
 
+#include "xe_assert.h"
 #include "xe_mmio.h"
 #include "xe_gt_sriov_printk.h"
-#include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_gt_sriov_pf_service_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hxg_helpers.h"
+#include "xe_sriov.h"
 #include "xe_sriov_pf_service.h"
 
 static const struct xe_reg tgl_runtime_regs[] = {
-- 
2.52.0

