Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82704C54F55
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2006D10E97B;
	Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJpNJ2pP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51F710E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255103; x=1816791103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yfn5KVmDrI7roSBwjCOcbteaqoz9KPZf53HP+hq4uFw=;
 b=CJpNJ2pPHIdANJh+C2bhjlDxhT3f9QSpGy1vDiGoVvnocWswvs17r6x+
 nMecVigfFiD6tXfY8AhtckXB0Y+6Ik9g+SSkdYUda8Z8CH07NV3HoFjf8
 MOY2NtEGeiThEwPmki/2OjMn1wcPEH9DiDD+dACW+s7Nl+9B8O0c8Ywtw
 JsIM+voN1ZboFIGqy8ktZ0LRflNR7PUzI9F79rB0vgfVxwQtRbCg6tEl8
 FTeNsAZqNeJ0Fh4foZMSZFS27Zz3ZUqfVdPZw7CbVsXUTpFytv9HgFtmC
 gTMKHwzd5R6tUV1QTwwYx9tSGUc+81VlPajmt5hAg+tQi16N+SQjMBS6u g==;
X-CSE-ConnectionGUID: +F3CbEdvTca6CPTgXcS5EA==
X-CSE-MsgGUID: QxC1+iaZSpqtuVLiOddIlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386310"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:43 -0700
X-CSE-ConnectionGUID: EfU9uHBcT2qlSyu2C8lr7w==
X-CSE-MsgGUID: t1jrcGsWT3i3F/qUqAvfhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819468"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 20/22] drm/xe/gt: Report 'reset failed' errors using SIGID
Date: Tue, 28 Jul 2026 18:10:35 +0200
Message-ID: <20260728161039.579-21-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

