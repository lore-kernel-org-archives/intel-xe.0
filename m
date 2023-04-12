Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D66AC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403F10E9D8;
	Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1610E9D7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681339976; x=1712875976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1bpT3q0Cqo/RJqyU7mYwNcV2rN3Y2aYeVamRsYdXj9U=;
 b=KaD0S8xjJnPndqL33TPSSfORUdK/cvwMJWOj2DfxCOC0OUgYq2ytHwdQ
 duiBDk4XycvrXFxIoeKu1nVhuku4bblyeShzcLfJtXH08L9SRcb7tsDob
 FP8wNdGrmHFZGtEGl/VAf1P8EZtGaFF+tN83daqCZeQ8nleLt3b4a4Exv
 zVToKnagWJGSPGUq4ado8ZN6KzCvddOS2ebdDpxg6o8YFftGzuNNZsSQp
 6hLhcKz0VbGeJ4rFY1IAQZ5QBOIXNWAmFvmIXEYyg8S9AF0fHt64x9LYU
 aCrpfujcsl+FfxeOSMBqoNC1LNMhvc/KXCfxzdsGjHch9kSGNBc9Tcj2Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344038890"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344038890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721757073"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721757073"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 15:52:42 -0700
Message-Id: <20230412225248.3229571-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/8] drm/xe/irq: Improve warnings and
 assertions for GT handling
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Improve the assertions and warnings for GT-related interrupt handling to
help us catch any areas where we're trying to process interrupts in
relation to the wrong GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7e78eecba62a..ca86c99f8007 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -220,16 +220,22 @@ gt_engine_identity(struct xe_device *xe,
 static void
 gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 {
-	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
-		return xe_guc_irq_handler(&gt->uc.guc, iir);
-	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
-		return xe_guc_irq_handler(&gt->uc.guc, iir);
-
-	if (instance != OTHER_GUC_INSTANCE &&
-	    instance != OTHER_MEDIA_GUC_INSTANCE) {
-		WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
-			  instance, iir);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (instance == OTHER_GUC_INSTANCE) {
+		drm_WARN_ON_ONCE(&xe->drm, xe_gt_is_media_type(gt));
+		xe_guc_irq_handler(&gt->uc.guc, iir);
+		return;
+	}
+
+	if (instance == OTHER_MEDIA_GUC_INSTANCE) {
+		drm_WARN_ON_ONCE(&xe->drm, !xe_gt_is_media_type(gt));
+		xe_guc_irq_handler(&gt->uc.guc, iir);
+		return;
 	}
+
+	drm_warn_once(&xe->drm, "Unhandled 'other' interrupt on GT%d: instance=0x%x, iir=0x%x\n",
+		      gt->info.id, instance, iir);
 }
 
 static struct xe_gt *find_media_gt(struct xe_device *xe)
@@ -307,8 +313,11 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *full_gt,
 			}
 
 			hwe = xe_gt_hw_engine(gt, class, instance, false);
-			if (!hwe)
+			if (!hwe) {
+				drm_warn_once(&xe->drm, "Interrupt for unknown engine on GT%d: class=%d instance=%d\n",
+					      gt->info.id, class, instance);
 				continue;
+			}
 
 			xe_hw_engine_handle_irq(hwe, intr_vec);
 		}
-- 
2.39.2

