Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DF3C25B47
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 21:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9CE10E27B;
	Mon, 23 Oct 2023 21:53:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6B010E27B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 21:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698098022; x=1729634022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O8BzrxrMt/Zpxw6Uj3OiVT7YaUTRjB/14qTI1z8tivI=;
 b=ZP1Ba/kRTzADm0angr/ymb1HUzAhGNYvxkDxYXa++2vwQjaEpv4XcBCy
 8DlOVTGCCC1d087yGhR4KBrEMefEgSAHjtNXYYf245dDu2J3JP+CL4vwE
 Oj1FDzVNshtEkGZTLyNgQjhMMSYfvzVbzmIZAYwg4UzKS51RS825XrqY5
 X/bX2alpZAoGq3Jh9SKus33Da4USj6RhXJTs4Aamufygc+XTf4i0rTzm+
 1B8b8t4mKwv0X/M8mTFKX4LV5C4ktoHK4DGDzl+BB9Wyit2BJf3T4xPQ2
 AHFIt/DxyA9fxeBRF43iyUMbUIDBfPMjcVlNVGvq8u6XTHckiE5K2mIKq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390815179"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="390815179"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 14:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751768470"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="751768470"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 14:53:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 14:53:29 -0700
Message-ID: <20231023215329.1796912-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023215329.1796912-1-daniele.ceraolospurio@intel.com>
References: <20231023215329.1796912-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe/gsc: add gsc device support
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
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

2 fixes:

1) The gsc_mask variable is not set in all branches, but it is always
   evaluated in an if condition, so we need to initialize it to a valid
   value

2) On MTL+ the GSC interrupts come from the engine, so we can't
   unconditionally call the handler for the GSCFI interface and we
   instead need to check if we're on a platform that does have a GSCFI.

While at it, move the GSCFI irq function call to where the other
non-engine OTHER_CLASS interrupts are handled.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 61350ed32c61..21d5273d7e61 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -142,7 +142,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
-	u32 gsc_mask;
+	u32 gsc_mask = 0;
 
 	if (xe_device_uc_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
@@ -303,11 +303,6 @@ static void gt_irq_handler(struct xe_tile *tile,
 			instance = INTR_ENGINE_INSTANCE(identity[bit]);
 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
 
-			if (class == XE_ENGINE_CLASS_OTHER && instance == OTHER_GSC_INSTANCE) {
-				xe_heci_gsc_irq_handler(xe, intr_vec);
-				continue;
-			}
-
 			engine_gt = pick_engine_gt(tile, class, instance);
 
 			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
@@ -317,7 +312,11 @@ static void gt_irq_handler(struct xe_tile *tile,
 			}
 
 			if (class == XE_ENGINE_CLASS_OTHER) {
-				gt_other_irq_handler(engine_gt, instance, intr_vec);
+				/* HECI GSCFI interrupts come from outside of GT */
+				if (HAS_HECI_GSCFI(xe) && instance == OTHER_GSC_INSTANCE)
+					xe_heci_gsc_irq_handler(xe, intr_vec);
+				else
+					gt_other_irq_handler(engine_gt, instance, intr_vec);
 				continue;
 			}
 		}
-- 
2.41.0

