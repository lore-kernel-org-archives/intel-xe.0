Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB30C7EE22
	for <intel-xe@archiver.kernel.org>; Sat, 29 Apr 2023 06:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3A410E100;
	Sat, 29 Apr 2023 06:24:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D113D10E141
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682749458; x=1714285458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=707h+LcD3N8HSBW7yEApp2K4DLBCZrNQr06ktruqqZI=;
 b=WR26dQhOLYAvIEaHlVbLkyYKUoRorWlkpqbErsfKF2GFe92ILLy2kfox
 +pa4pu1CrNBbhIIFUaMXN0tH9IcPStq8n6Tkv06wK0s6dZbuZuh9Iq7fz
 pyUy7QsJk1/1TRcRGpgSGgosizts9An8v36ELrgM6nn00TpEPjPIBxrCJ
 QiDael9HHPGvtAfx3vO3pCAUlDsJK3GAB8ysi9kShDu5dIGBeG1oljn6I
 Rokdkqc0s7ZLx5U0hX+mkZTda68glhhDKDywyPfPQ6fJsExtInSYzEkBV
 GeeY0Zxc93BQob5QrzbfACLh0XR8RVhguCYvqrXER+h6FgZ33bnx/74rj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375928431"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="375928431"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="697829101"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="697829101"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 23:23:32 -0700
Message-Id: <20230429062332.354139-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429062332.354139-1-lucas.demarchi@intel.com>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe: Fix indent in
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix the indent to align with open parenthesis, following the coding
style.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 66 +++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e62662bc3a86..ca98160dc5ee 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -516,70 +516,70 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
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

