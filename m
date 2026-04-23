Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B454FDEE4D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB58B10E36C;
	Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAjSvnhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC8F10E121
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984548; x=1808520548;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xmt6UVluo5geHxi34Gg70+t69Iyc++IA+nQE9ViHEU8=;
 b=mAjSvnhJpa5ql7btB4iLYiD4YarDih04Ue4vARIKzWJNhG1mS597NtKM
 aF7rCT+Rdh+Td+7fxsWU9Gcig6mFroKT7s5CkzD9EQJCgPCFhnsO7xLUy
 5hcwyOMNJxzgVhcJUs0ZFmlfb4m+j862iN+nQ60LErA8QxTbTjgUiCr0d
 4RJnqV4U3wCLcjXtBHD1hWbyIuORNtFRRoCs2GAUZG8WxaniqI1yXvFXc
 69eZ7H1fKGNJ90hy5vuwRXzzT3fSkGctqHRy570QV5ummtcUNUaDjnzbx
 t3cIeQyJo9G8v9C+O7BQO8ZUSmyauotu+7ixAxG6ngrvufxg06pabh56D w==;
X-CSE-ConnectionGUID: F0+ukrzdSZ2PmHPn2Eixaw==
X-CSE-MsgGUID: +j7hwPgWSc+iEItXGWFXiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497064"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: txVCkcnNR3u4N3v7lYMBUw==
X-CSE-MsgGUID: njoTvx8/TaWZetXVDfxitg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696196"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:52 -0700
Subject: [PATCH 05/10] drm/xe: Fix name and definition of GFX_MODE register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-5-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4400;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=xmt6UVluo5geHxi34Gg70+t69Iyc++IA+nQE9ViHEU8=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHe1TWVEewfYWsVwbjxBry6P0LrEIyDYlhgl
 baF1/8DGNSJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BAj4D/9nrnRzMOexYNxihcnO42f8qjCc7U8W04/JKR4/ylD3Wx0wWQpNN5yD+ur5OleuDA3jIoJ
 9skJss3uWSrWfdiU+6D6RJ88XNxr2om1Svw7VXmpzUfqwYz8LnBXl4ysPCYOHNQkvvNI6pyYk3c
 Kc0xuUzxadPd4BWgKeBnA7odjYKAY6AOLHM773uTNU2oOsq9r0nJz4QiJSwQ4ldcXnR3VEpmB7w
 45Nxw451xOPfShJK/6FvseCIOxYgm8OtrZCNKW5Q7x/nICXHVVswDDmXKyQOuRKWwOjL+rSCfvP
 V8AunFNrcpW7nOiG/eHEbdcdYK75iy+5IWCwqYsGp8XT6mRRsydB9hlYaqBZxRHPUAW0+mzNgdK
 doy2b5Ef6dOZbcmxHCT4JEIsCpGgkf4RpAMOZq6gXh581xEm7EAj62TUctVwMxXh519KZoxoFF0
 vzv3ZIWjVGLMO29uV2wbDeUubFHwYHZwulxaCXrmicbrXhMM/I/7SIKkJuk/RUXrGhkNGRNtnwj
 bMcBiJn5jprDv83SKAMBrOFAgSWrZPy8I7SbH2t0+BKZpdCluPdsuEcSO/pLge7Dzk2THil0mod
 Bs83WMqsn+yrX1c1MSlvrbr9JoWr280I7sE0T6NDqaJK/78ZEU+4JyrPcsXsp+P78FsaOnWsu9L
 WRCnEyyzKc8m+hQ==
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
index 06eb655a4ae5..d28f50a64d88 100644
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

