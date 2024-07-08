Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660BC3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 08:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B3610E2E6;
	Mon,  8 Jul 2024 08:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4pZCTax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E7810E2E6
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720429068; x=1751965068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0G6QL5KZLFW5El377HvhFv+V39g+W8W12eNmnTUYC8s=;
 b=b4pZCTaxp4IzroI5HeC9l2Kp8Jhw77tj33liswhQpLJGG9ofWcd77MKG
 uMZjllGPbDWqLDgGL/dsiyCniTChtKkF5pOUD7VcTdgK2tN7yMPDApJ0e
 +ycSaVCDN6nJyfbygk7wHxu+u0M48Pcnjijq4emdMpnJrORJrPOcdyXMi
 S8u+T4tUbyS99ElhnI8eaUFgk9pVB8th/T3vHYzrbzumcb0VSOjCyXiIC
 P9Pgfl0g3KnVr5gsDj66my8l7l3SlL0ujEKjzMj64rq+1mXMx3zYn5jnf
 xfFrxU8OPyho3ywLXRSJLh8FYus5NX9Ng+JYWK6f1SHKsuU91JiMcR5N2 g==;
X-CSE-ConnectionGUID: edjg7lKqQSWdKPSdaOH+Fw==
X-CSE-MsgGUID: DiCvlVK5RQiCTlumC8GeCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28773525"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28773525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 01:57:48 -0700
X-CSE-ConnectionGUID: tpg4505MT2GOTUP+MHKPgg==
X-CSE-MsgGUID: ZSF1fCx2Ts6/T8NmgqKxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="48172777"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 01:57:46 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/gsc: add Battlemage support
Date: Mon,  8 Jul 2024 11:49:06 +0300
Message-Id: <20240708084906.2827024-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add heci_cscfi support bit for new CSC engine type.
It has same mmio offsets as DG2 GSC but separate interrupt flow.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_heci_gsc.c     | 28 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_heci_gsc.h     | 10 ++++++++--
 drivers/gpu/drm/xe/xe_irq.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  7 +++++--
 5 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f0cf9020e463..8e81ade7279b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -44,6 +44,7 @@ struct xe_pat_ops;
 #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
 #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
+#define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
@@ -289,6 +290,8 @@ struct xe_device {
 		u8 skip_pcode:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @info.has_heci_cscfi: device has heci cscfi */
+		u8 has_heci_cscfi:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 1c9d38b6f5f1..65b2e147c4b9 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -92,7 +92,7 @@ void xe_heci_gsc_fini(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
 
-	if (!HAS_HECI_GSCFI(xe))
+	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
 		return;
 
 	if (heci_gsc->adev) {
@@ -177,12 +177,14 @@ void xe_heci_gsc_init(struct xe_device *xe)
 	const struct heci_gsc_def *def;
 	int ret;
 
-	if (!HAS_HECI_GSCFI(xe))
+	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
 		return;
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_PVC) {
+	if (xe->info.platform == XE_BATTLEMAGE) {
+		def = &heci_gsc_def_dg2;
+	} else if (xe->info.platform == XE_PVC) {
 		def = &heci_gsc_def_pvc;
 	} else if (xe->info.platform == XE_DG2) {
 		def = &heci_gsc_def_dg2;
@@ -232,3 +234,23 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 	if (ret)
 		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
 }
+
+void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
+{
+	int ret;
+
+	if ((iir & CSC_IRQ_INTF(1)) == 0)
+		return;
+
+	if (!HAS_HECI_CSCFI(xe)) {
+		drm_warn_once(&xe->drm, "CSC irq: not supported");
+		return;
+	}
+
+	if (xe->heci_gsc.irq < 0)
+		return;
+
+	ret = generic_handle_irq(xe->heci_gsc.irq);
+	if (ret)
+		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
index 9db454478fae..48b3b1838045 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.h
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
@@ -11,10 +11,15 @@ struct xe_device;
 struct mei_aux_device;
 
 /*
- * The HECI1 bit corresponds to bit15 and HECI2 to bit14.
+ * GSC HECI1 bit corresponds to bit15 and HECI2 to bit14.
  * The reason for this is to allow growth for more interfaces in the future.
  */
-#define GSC_IRQ_INTF(_x)  BIT(15 - (_x))
+#define GSC_IRQ_INTF(_x) BIT(15 - (_x))
+
+/*
+ * CSC HECI1 bit corresponds to bit9 and HECI2 to bit10.
+ */
+#define CSC_IRQ_INTF(_x) BIT(9 + (_x))
 
 /**
  * struct xe_heci_gsc - graphics security controller for xe, HECI interface
@@ -31,5 +36,6 @@ struct xe_heci_gsc {
 void xe_heci_gsc_init(struct xe_device *xe);
 void xe_heci_gsc_fini(struct xe_device *xe);
 void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir);
+void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir);
 
 #endif /* __XE_HECI_GSC_DEV_H__ */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 85733f993d09..5f2c368c35ad 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -459,6 +459,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		 * the primary tile.
 		 */
 		if (id == 0) {
+			if (HAS_HECI_CSCFI(xe))
+				xe_heci_csc_irq_handler(xe, master_ctl);
 			xe_display_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 732ee0d02124..3c4a3c91377a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -59,6 +59,7 @@ struct xe_device_desc {
 
 	u8 has_display:1;
 	u8 has_heci_gscfi:1;
+	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
 	u8 has_mmio_ext:1;
 	u8 has_sriov:1;
@@ -345,6 +346,7 @@ static const struct xe_device_desc bmg_desc = {
 	PLATFORM(BATTLEMAGE),
 	.has_display = true,
 	.require_force_probe = true,
+	.has_heci_cscfi = 1,
 };
 
 #undef PLATFORM
@@ -606,6 +608,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mmio_ext = desc->has_mmio_ext;
 	xe->info.has_sriov = desc->has_sriov;
@@ -815,7 +818,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d",
+	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d cscfi:%d",
 		desc->platform_name,
 		subplatform_desc ? subplatform_desc->name : "",
 		xe->info.devid, xe->info.revid,
@@ -828,7 +831,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe->info.media_verx100 % 100,
 		str_yes_no(xe->info.enable_display),
 		xe->info.dma_mask_size, xe->info.tile_count,
-		xe->info.has_heci_gscfi);
+		xe->info.has_heci_gscfi, xe->info.has_heci_cscfi);
 
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
 		xe_step_name(xe->info.step.graphics),
-- 
2.34.1

