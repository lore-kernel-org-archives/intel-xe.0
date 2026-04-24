Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811A6FED3FD
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B210E3F6;
	Fri, 24 Apr 2026 20:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlO019EL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4B410E1B4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xoxfd9UPgu83Br9GFUA72iPjqjJOhgP3mhr2awRfPoc=;
 b=JlO019ELG7t1ty7tDb8YibrcKQ3gKgeOIx74YIU1JMj9XO7+wResOvlh
 g/6Uq7RY3CiOhN4zSWLG2ZpjtdSQrxFtxnPsuDNNJK8f6zYL/kloYpYh3
 ae1twxzqxXA4vAu2lSidt9ABFGsS5gqxwuF2V75NEiJOJwDu0pfJusfyd
 PLOU4kVLwEJU2druXD1tIpFLnZCaozelUf/b+I2nQoGvrQKXhQgLD/ez/
 1+rfyf9hNQiyBkYFkkRDPiKifqaq+iFp+zsdcmXAdXAp3m9u0nNef+ttD
 wZOXfNr2XlEMKaDiPxtKRmkjBo1GSj5RSOY4sEb0ctBSovt0qFPizVP9R w==;
X-CSE-ConnectionGUID: ll2hAZErTKCMmAtyhgU02w==
X-CSE-MsgGUID: OMdiXZOESdCXhu6A9R1MBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80633999"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80633999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: fS6wpek4RVmgeTzU18om3A==
X-CSE-MsgGUID: USvPdD+mQBmis15MulJrjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560137"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:15 -0700
Subject: [PATCH v2 05/10] drm/xe: Fix name and definition of GFX_MODE register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-5-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4400;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=xoxfd9UPgu83Br9GFUA72iPjqjJOhgP3mhr2awRfPoc=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eU/8bkC8LjYPgeOovzHXakLb1KJ2s1IvEqi
 78X0l5jErSJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlAAKCRBNeSQFyHKQ
 BMXyD/4xzTYnfZoL1ZsiKN8oCwCoyoDxVMs8tWWKb1POXFeDmMF0ONKi39ptmZ4RV6m8fW8nqkq
 pqcnEERULT8AYUmp2SI/dIB8OPSU8wSh7du5LKtLsm7FCRfoG/iAChNcNLRriM5lYZhjXIAlJ5L
 B8yVR49zq8/BWImq+Rgs1DtDA3i6xRPrLJ9QxhOv6BQ6Nq1jgG4pcGDAp0+WiR3v3CMRJeGg5aV
 ciVc6V2TxuchPMNIfRuV5LLZ8TFXl7Xmjbq7ehWGeTyTB7nxo1PI1itCZHW2AIx7oi/atTCv6vr
 0INnMeAlMy55WdjfDVeHOG5fEznzb1rjlzJ6XTW/yKstmqHW6Odk7SEPUqDkPaKiN4rgrFq4iaT
 LoEXeZYBpP9oWnFDt5Ic5fmh5uURDUTBd30jl7tvcts2wxg1xSsq+PeuGhWFozwGKYfyFiKZV8i
 qmOcL7+WszxN9ttF953sQ2BX8owMWaCYj4RJerNEoVJj7tRcR/GRxUEXG2E5cMiRPFnOVR87F+H
 iWtC5fUo+bVXQdicgOlCoemGWYLOPAS2yWrc/DPoTDHPqvYa4UnvTkaj+PdNxFL9YV5mUx6mgyX
 wvSUVBVSNw31rGYSPc909VMganp7DEFrJ1cCcKX3nNZCbElmqvPP7mesKGICN2F4Adw6vJYVz2a
 8V+Coc9lTG6UbZw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The register located at $base+0x29c is referred to as GFX_MODE in the
bspec.  Although many other registers have RING_* prefixes for
historical reasons, this register does not, so using a name that does
not match the bspec just makes it harder to recognize/find.

Also, GFX_MODE is a masked register (updating bits [15:0] requires that
the corresponding bit(s) in [31:16] are also set), so add the
XE_REG_OPTION_MASKED flag to the register definition; this will become
important when we start programming this register via RTP tables in a
future patch.

Finally swap the order of the register's two bit definitions to match
our regular coding style of descending order for register bits/fields.

Bspec: 45928
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++--
 drivers/gpu/drm/xe/xe_execlist.c         | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c          | 2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c      | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 1b4a7e9a703d..4d5cd1b6f50d 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -165,9 +165,9 @@
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
-#define RING_MODE(base)				XE_REG((base) + 0x29c)
-#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
+#define GFX_MODE(base)				XE_REG((base) + 0x29c, XE_REG_OPTION_MASKED)
 #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
+#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 
 #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 026a1ec0c868..337b9b4e8b4a 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -80,7 +80,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 
 	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
 		ring_mode |= REG_MASKED_FIELD_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
-	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base), ring_mode);
+	xe_mmio_write32(mmio, GFX_MODE(hwe->mmio_base), ring_mode);
 
 	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
 			lower_32_bits(lrc_desc));
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d0497d9f43a2..b403ee0b5e74 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -745,7 +745,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		struct xe_reg reg;
 		bool skip;
 	} *e, extra_regs[] = {
-		{ .reg = RING_MODE(hwe->mmio_base),			},
+		{ .reg = GFX_MODE(hwe->mmio_base),			},
 		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
 		{ .reg = RING_IMR(hwe->mmio_base),			},
 		{ .reg = CCS_MODE,
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 2f5816c78fba..bc49e40165a3 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -111,7 +111,7 @@ struct __guc_capture_parsed_output {
 	{ RING_TAIL(0),			REG_32BIT,	0,	0,	0,	"RING_TAIL"}, \
 	{ RING_CTL(0),			REG_32BIT,	0,	0,	0,	"RING_CTL"}, \
 	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	0,	"RING_MI_MODE"}, \
-	{ RING_MODE(0),			REG_32BIT,	0,	0,	0,	"RING_MODE"}, \
+	{ GFX_MODE(0),			REG_32BIT,	0,	0,	0,	"GFX_MODE"}, \
 	{ RING_ESR(0),			REG_32BIT,	0,	0,	0,	"RING_ESR"}, \
 	{ RING_EMR(0),			REG_32BIT,	0,	0,	0,	"RING_EMR"}, \
 	{ RING_EIR(0),			REG_32BIT,	0,	0,	0,	"RING_EIR"}, \
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ec47e17b4119..60af395d031c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -332,7 +332,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 
 	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
 		ring_mode |= REG_MASKED_FIELD_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
-	xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
+	xe_hw_engine_mmio_write32(hwe, GFX_MODE(0), ring_mode);
 	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 				  REG_MASKED_FIELD_DISABLE(STOP_RING));
 	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));

-- 
2.53.0

