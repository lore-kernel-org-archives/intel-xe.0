Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AD0D68B33
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E27710E802;
	Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfdmfkWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB24E10E7FE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731597778; x=1763133778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsvitN59D2lG6Z/bu7TSPeCNC1uEHNGudun3LkVW7kc=;
 b=FfdmfkWNgFzzjPCNQ8ozPgRPw5UA4jofhHPxCo2JL/7FWSgUBAYW0Vc9
 HQhBsHueDA++jwGBFKm1/pwnNfm6la8dvPwtrFm/VtgdXZwm6/mx9kO8J
 gAfKn93zivzVnFrIhMs7fUB1FJON8ASfTHjhDGnalpGbJ3zq/j5/K2sbO
 bbGUZz8uzn/ceRi8TiPcFPVeHj65avOrSLQIVXYO/LYnj8YPxyXESlQct
 Qp7Mmm4ezTkUTi2ypdShMVbuy65b/8tlBbT2R6Im4GH/W5/MkGNftc8SV
 9b6zW13eFk1APjrpFiipBt1R9eCfcSl/7yaWNV5e9VaP4qY7iYzRRhzHv g==;
X-CSE-ConnectionGUID: YZuCZvgER16sgoE/oQlDcg==
X-CSE-MsgGUID: ZWAV2zNJQXmd6dRkcbMwnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="49004056"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="49004056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:58 -0800
X-CSE-ConnectionGUID: 46NHQGsgSt+4GGB98E0E4A==
X-CSE-MsgGUID: 6pyv126YSQ6vsCazQo2bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93189392"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/4] drm/xe: Drop HAS_HECI_*
Date: Thu, 14 Nov 2024 07:21:47 -0800
Message-ID: <20241114152148.572447-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114152148.572447-1-lucas.demarchi@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
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

Just do the same as for other has_* flags, without a macro.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 --
 drivers/gpu/drm/xe/xe_heci_gsc.c     | 8 ++++----
 drivers/gpu/drm/xe/xe_irq.c          | 8 ++++----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ff19bda9ddadc..27a3d82560498 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -42,8 +42,6 @@ struct xe_pat_ops;
 #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
 #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
-#define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
-#define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 65b2e147c4b92..d765bfd3636b4 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -92,7 +92,7 @@ void xe_heci_gsc_fini(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
 
-	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
+	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
 		return;
 
 	if (heci_gsc->adev) {
@@ -177,7 +177,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
 	const struct heci_gsc_def *def;
 	int ret;
 
-	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
+	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
 		return;
 
 	heci_gsc->irq = -1;
@@ -222,7 +222,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 	if ((iir & GSC_IRQ_INTF(1)) == 0)
 		return;
 
-	if (!HAS_HECI_GSCFI(xe)) {
+	if (!xe->info.has_heci_gscfi) {
 		drm_warn_once(&xe->drm, "GSC irq: not supported");
 		return;
 	}
@@ -242,7 +242,7 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
 	if ((iir & CSC_IRQ_INTF(1)) == 0)
 		return;
 
-	if (!HAS_HECI_CSCFI(xe)) {
+	if (!xe->info.has_heci_cscfi) {
 		drm_warn_once(&xe->drm, "CSC irq: not supported");
 		return;
 	}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b7995ebd54abd..7bf7201529ac8 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -192,7 +192,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
 			gsc_mask = irqs | GSC_ER_COMPLETE;
 			heci_mask = GSC_IRQ_INTF(1);
-		} else if (HAS_HECI_GSCFI(xe)) {
+		} else if (xe->info.has_heci_gscfi) {
 			gsc_mask = GSC_IRQ_INTF(1);
 		}
 
@@ -325,7 +325,7 @@ static void gt_irq_handler(struct xe_tile *tile,
 
 			if (class == XE_ENGINE_CLASS_OTHER) {
 				/* HECI GSCFI interrupts come from outside of GT */
-				if (HAS_HECI_GSCFI(xe) && instance == OTHER_GSC_INSTANCE)
+				if (xe->info.has_heci_gscfi && instance == OTHER_GSC_INSTANCE)
 					xe_heci_gsc_irq_handler(xe, intr_vec);
 				else
 					gt_other_irq_handler(engine_gt, instance, intr_vec);
@@ -459,7 +459,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		 * the primary tile.
 		 */
 		if (id == 0) {
-			if (HAS_HECI_CSCFI(xe))
+			if (xe->info.has_heci_cscfi)
 				xe_heci_csc_irq_handler(xe, master_ctl);
 			xe_display_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
@@ -508,7 +508,7 @@ static void gt_irq_reset(struct xe_tile *tile)
 
 	if ((tile->media_gt &&
 	     xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) ||
-	    HAS_HECI_GSCFI(tile_to_xe(tile))) {
+	    tile_to_xe(tile)->info.has_heci_gscfi) {
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
 		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
-- 
2.47.0

