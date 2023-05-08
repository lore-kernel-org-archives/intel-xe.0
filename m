Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E88C7EE2C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 22:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1FC10E31A;
	Mon,  8 May 2023 22:54:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B4010E314
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683586447; x=1715122447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMSg51BN2RaEyDm1KojUN/rIk5H2Yvk3pCGDa/YL1Mk=;
 b=XmrCjMpH/itZGyY1uzlS3wPSL5PCUWhnAA8TRdBaA3x6kvcSCAfJbRdm
 PaPsT/zFTd6rvI/a/+oqBrIiyam+INbefUq1a5xH79CLhG0vBoz6X12hr
 IOsyE9OdxPLtuZ1PRSOgH8YYCl5MsbNabGKXf8tixq8vWm6KrCQhcExzE
 9DhvoIh5yRicPn6PrbLn9wMsC/zpPC+BZjSXXIgElDjnhSCZKJDQem6Cm
 XflcTXeLi/tGPBaCq9gfNlRcM6sd/ucqBuOIUFpe7OWArfiSHGNU11oi6
 FXoL1D8xpa1gR3zi5rbukOyBiGUzPcrA/C6QLXU5Qw7lo4w69vqdU3aye w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330130318"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330130318"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768232388"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768232388"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:54:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 15:53:22 -0700
Message-Id: <20230508225322.2692066-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508225322.2692066-1-lucas.demarchi@intel.com>
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] drm/xe: Fix indent in
 xe_hw_engine_print_state()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix the indent to align with open parenthesis, following the coding
style.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 66 +++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 696b9d949163..751f6c3bba17 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -580,70 +580,70 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
 		return;
 
 	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
-		hwe->logical_instance);
+		   hwe->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		hwe->domain,
-		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
+		   hwe->domain,
+		   xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
 	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
 
 	drm_printf(p, "\tHWSTAM: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
+		   hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
 	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
+		   hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
 
 	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
+		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
 	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
+		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
+		   hw_engine_mmio_read32(hwe,
 					 RING_EXECLIST_SQ_CONTENTS_LO(0)));
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
+		   hw_engine_mmio_read32(hwe,
 					 RING_EXECLIST_SQ_CONTENTS_HI(0)));
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
+		   hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
 
 	drm_printf(p, "\tRING_START: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_START(0)));
+		   hw_engine_mmio_read32(hwe, RING_START(0)));
 	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
+		   hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
 	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
+		   hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
 	drm_printf(p, "\tRING_CTL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_CTL(0)));
+		   hw_engine_mmio_read32(hwe, RING_CTL(0)));
 	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
+		   hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
 	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MODE(0)));
+		   hw_engine_mmio_read32(hwe, RING_MODE(0)));
 
 	drm_printf(p, "\tRING_IMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_IMR(0)));
+		   hw_engine_mmio_read32(hwe, RING_IMR(0)));
 	drm_printf(p, "\tRING_ESR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ESR(0)));
+		   hw_engine_mmio_read32(hwe, RING_ESR(0)));
 	drm_printf(p, "\tRING_EMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EMR(0)));
+		   hw_engine_mmio_read32(hwe, RING_EMR(0)));
 	drm_printf(p, "\tRING_EIR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EIR(0)));
-
-        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
-		hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
-        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
-		hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
-        drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
+		   hw_engine_mmio_read32(hwe, RING_EIR(0)));
+
+	drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
+		   hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
+		   hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
+	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
+		   hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
+		   hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
+	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
+		   hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
+		   hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
 
 	drm_printf(p, "\tIPEIR: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, IPEIR(0)));
+		   hw_engine_mmio_read32(hwe, IPEIR(0)));
 	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
-		hw_engine_mmio_read32(hwe, IPEHR(0)));
+		   hw_engine_mmio_read32(hwe, IPEHR(0)));
 
 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
-			xe_mmio_read32(hwe->gt, RCU_MODE));
+			   xe_mmio_read32(hwe->gt, RCU_MODE));
 
 }
 
-- 
2.40.1

