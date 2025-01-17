Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF83C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 03:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701A010EA35;
	Fri, 17 Jan 2025 03:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGEsroPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44110EA35
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 03:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737084122; x=1768620122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qoOVBw0CSg41kvX8GxEkXR2mpjXbJOvMAIhH4g2ijGM=;
 b=JGEsroPgfRXCYBYz7ygofmfVOM1F36vH8iGO11ppTJfV2HER0yUD7tef
 yXZ0KbsnqYiLdJe5jSMssePuvMhecLhUnlM4gUS/pUfeOdoILGTURiNop
 HqrMn4WZU9d2xnNI8Q9gfrEBqJhaty6qT+o+L3wgaxqk+EtHDi2uegi6P
 Ey6NvTlmmAg+84P3SmeNQopNhS5hVX1zJPcBsPacEYXx/IIMCXMFOOh91
 TSnkN+NRr3VWEkzr/8qQa92chTlNlZDILvpTtb6scnK/CeuA4B3nf9HHG
 WVLWxuT+fKvhJpkBFWQ3ocNvHOzm76mT0OODxRGV83zLTxIIys4Z9YXrI Q==;
X-CSE-ConnectionGUID: OvBwQRTGSrKCETnrL+jkEw==
X-CSE-MsgGUID: 62YdRrz1S/2GPPV6G5bnoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48896840"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="48896840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 19:22:02 -0800
X-CSE-ConnectionGUID: XFIOkE+hSI+d+kcamCNjaA==
X-CSE-MsgGUID: IouexxmdT5em40AnBYcFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="136524772"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 19:22:02 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 felix.j.degrood@intel.com
Subject: [PATCH] drm/xe/oa: Preserve oa_ctrl unused bits
Date: Thu, 16 Jan 2025 19:21:55 -0800
Message-ID: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

UMD's have interest in setting unused bits of the oa_ctrl register "out of
band" for certain experiments. To facilitate this, don't clobber previous
oa_ctrl unused bits, i.e. rmw the values rather than simply write them.

Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_oa.c           | 12 ++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index a49561e9f3c31..a79ad2da070c2 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -51,6 +51,10 @@
 /* Common to all OA units */
 #define  OA_OACONTROL_REPORT_BC_MASK		REG_GENMASK(9, 9)
 #define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
+#define  OAG_OACONTROL_USED_BITS \
+	(OAG_OACONTROL_OA_PES_DISAG_EN | OAG_OACONTROL_OA_CCS_SELECT_MASK | \
+	 OAG_OACONTROL_OA_COUNTER_SEL_MASK | OAG_OACONTROL_OA_COUNTER_ENABLE | \
+	 OA_OACONTROL_REPORT_BC_MASK | OA_OACONTROL_COUNTER_SIZE_MASK)
 
 #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
 #define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
@@ -78,6 +82,8 @@
 #define OAM_CONTEXT_CONTROL_OFFSET		(0x1bc)
 #define OAM_CONTROL_OFFSET			(0x194)
 #define  OAM_CONTROL_COUNTER_SEL_MASK		REG_GENMASK(3, 1)
+#define  OAM_OACONTROL_USED_BITS \
+	(OAM_CONTROL_COUNTER_SEL_MASK | OAG_OACONTROL_OA_COUNTER_ENABLE)
 #define OAM_DEBUG_OFFSET			(0x198)
 #define OAM_STATUS_OFFSET			(0x19c)
 #define OAM_MMIO_TRG_OFFSET			(0x1d0)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eeb96b5f49e2a..6a08e6c92835f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -452,6 +452,12 @@ static u32 __oa_ccs_select(struct xe_oa_stream *stream)
 	return val;
 }
 
+static u32 __oactrl_used_bits(struct xe_oa_stream *stream)
+{
+	return stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG ?
+		OAG_OACONTROL_USED_BITS : OAM_OACONTROL_USED_BITS;
+}
+
 static void xe_oa_enable(struct xe_oa_stream *stream)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
@@ -472,14 +478,14 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
 		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
 
-	xe_mmio_write32(&stream->gt->mmio, regs->oa_ctrl, val);
+	xe_mmio_rmw32(&stream->gt->mmio, regs->oa_ctrl, __oactrl_used_bits(stream), val);
 }
 
 static void xe_oa_disable(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
 
-	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctrl, 0);
+	xe_mmio_rmw32(mmio, __oa_regs(stream)->oa_ctrl, __oactrl_used_bits(stream), 0);
 	if (xe_mmio_wait32(mmio, __oa_regs(stream)->oa_ctrl,
 			   OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
 		drm_err(&stream->oa->xe->drm,
@@ -2534,6 +2540,8 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
+		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
+
 		/* Ensure MMIO trigger remains disabled till there is a stream */
 		xe_mmio_write32(&gt->mmio, u->regs.oa_debug,
 				oag_configure_mmio_trigger(NULL, false));
-- 
2.47.1

