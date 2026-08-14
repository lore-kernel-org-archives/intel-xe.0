Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF484C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8002710F6DB;
	Fri, 14 Aug 2026 17:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnAVG3ZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426F10F6D5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727953; x=1818263953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UZRELeTKaag89o6X+s+iChzDhRdRkp0e+0oAJI6cNXQ=;
 b=UnAVG3ZVe2dEdzYacEZP8Xo9/P5RJ6RPDV3jx5EvUpneiB205PLi1D0B
 0ehaOqZB28TvUKWYNSx6gd0P6ssZU6YhcJAT3KF7XNFQLjQrpcii/hOBn
 B4hstcszqe4QqaIXhwz1+4nLMEpFIWRuMuz7hBJJN+x/6ako8PaRP2tcz
 ndvc4wRhjQyFR8OvJEQSDen/MYswqPIgX/SURVXC/oH1Y3wfU+sfc3eUP
 aEVK5iQ8gPdwZIe58ooOQAQG+f2ZdNLTgJEjdmz8r4dQ3O1B1DvugFacx
 9oFPpgHOHFdxQZFuoMor1RwIaiW3IJj0+Ce+BdZy3LSS88H/DPzgX75el A==;
X-CSE-ConnectionGUID: imhDahqDSS2F8pXYat3D6Q==
X-CSE-MsgGUID: PUQ9ToiFREWtRcrnTXp/CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464120"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:13 -0700
X-CSE-ConnectionGUID: IixcYXMkRRinM91tpHqHWw==
X-CSE-MsgGUID: Gw5nwfP2QZmmG1ZCOiW8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946371"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 30/33] drm/xe/gt: Report 'reset failed' errors using SIGID
Date: Fri, 14 Aug 2026 19:17:56 +0200
Message-ID: <20260814171801.13347-31-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'reset' related err/info messages using xe_log() helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dfdacc0f6de9..6805e0d3bf21 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -48,6 +48,7 @@
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_irq.h"
 #include "xe_lmtt.h"
+#include "xe_log.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
@@ -925,7 +926,7 @@ static void gt_reset_worker(struct work_struct *w)
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		goto err_pm_put;
 
-	xe_gt_info(gt, "reset started\n");
+	xe_log_info(gt, GT, "reset started\n");
 
 	if (xe_fault_gt_reset()) {
 		err = -ECANCELED;
@@ -964,7 +965,7 @@ static void gt_reset_worker(struct work_struct *w)
 	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
 	xe_pm_runtime_put(gt_to_xe(gt));
 
-	xe_gt_info(gt, "reset done\n");
+	xe_log_info(gt, GT, "reset done\n");
 
 	return;
 
@@ -973,7 +974,7 @@ static void gt_reset_worker(struct work_struct *w)
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 
 err_fail:
-	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
+	xe_log_err_fatal(gt, GT, err, "reset failed\n");
 	xe_device_declare_wedged(gt_to_xe(gt));
 err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
-- 
2.47.1

