Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894B1F8DFC7
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 21:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345DA10E277;
	Thu, 16 Apr 2026 21:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDIU2rax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F9910E929
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776374260; x=1807910260;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=eDkpCQA206hSGHZpbr3IW1gLwdaPpTDarjLYq/nOGew=;
 b=eDIU2raxY+6SSh0uY/WKwuXbJbdgT21XPcgbRkIJcMJ9YHYZJDhqreSd
 rbyHQg0I1RmwhYeeRMykzaXhvF9C4OEz3AaTpwB3IBbKAed+B/ZTgsqOU
 YC8UgKvGsEvJaNnA6b2mbAHEDh0VQz6iJGlhRMd3ZAu6KMfZLXzdyY30m
 vI73bG5dWhv0YPlZ+GDCEwHfSgUaFjR8QL5TJ5cz/2H15hi0p2BS8m9pL
 shP/C8bYIdJheRk+kNVNffksrsIgqZXelpuJyTpxt0i74SMRBFJyN89Xt
 HlroB0FF0HqkeG56nnbz/jZax7OYLv1iND8m9ezzIQCAiG39cff/Z71to A==;
X-CSE-ConnectionGUID: jQtRO8ZST5awn3wffqrTaA==
X-CSE-MsgGUID: +gSdiJe7RHONwXZbGag39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81259901"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81259901"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 14:17:39 -0700
X-CSE-ConnectionGUID: JGSs0QtsT2S2XIU+O24w8Q==
X-CSE-MsgGUID: 52GddtfnR7apAwp9s0Zcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="231101574"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 14:17:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 16 Apr 2026 14:17:09 -0700
Subject: [PATCH] drm/xe: Drop skip_mtcfg descriptor flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-no-skip-mtcfg-v1-1-c8ea26d81530@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3bx83eLszALd3JLktHTdFLM0M1PDFIMUc8s0JaCegqLUtMwKsHn
 RsbW1AOLZH01fAAAA
X-Change-ID: 20260416-no-skip-mtcfg-d6f651d0d79f
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=eDkpCQA206hSGHZpbr3IW1gLwdaPpTDarjLYq/nOGew=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp4VHzsHVgRdgByNszSwVvnloHCdc0tLSMiu6aB
 NvkY3UgDPqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeFR8wAKCRBNeSQFyHKQ
 BCCkD/9+WRC4xvESuTCm7j97leut846WMDiK5+ssVOBJbIHZAIda9zbUQ4uVGZZ2VbqalLCVWO5
 7M44maBNhAE8HGqJn/xmXS6Pupj8lH/m6TSdEAQKAg4N5RZtVZb7OF1TqM16KHsoOgqKXIEuMrJ
 XdBULjLIQVfmxcxCV8CnIh8Is2g+ke/j8mG8FubxmVmquMtgnOayGvo3F9DECPhQ3wat0oAG70U
 RFHe/dcJtrSW0QqG64c4QTI51XebqVZSSj8hg4YI9lNqHf9iBuUDQMITTHFpepBBKjo9fwFjaL4
 Fl+54TuVccOCUKq3cKDl7eorIcdVp2Mn0Vnv/9iULMM6L3sPD/aeAYEc6ZrD7RUymA0T6oC3+i1
 x1kclMGmGyoEtEmPPHdsMVMz0dIqGk2o112ZNS/zfWZZdNq7HnWhJuMoB4wD0XChU6Z9FZCDnvT
 d4KxcnH5JEj2cRltPP3m5HxJY0FYndFypZVR3BFiyqIQTBtR8/cz1x+Qd/d7HFLJ1x/5pjIe6o8
 t/kXwfIpj48+jf12TxCx1qTuSP8zWeSgZCED+h5zlif88a2K2+dWU6Uf2l5wlNq9TKxQ50bF9SP
 Cu6Dgtw0LBM0peC0fzJcTKYMxClRvNn1z3h9cqqfXQWIA48AO8GyMmDsltTWz14F1J9D/di+jHY
 NGCo23uo0iHJv/w==
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

The skip_mtcfg descriptor flag is unused and expected to remain that
way.  Drop it.

Single-tile platforms are already identified by a zero/unset value for
max_remote_tiles and don't need/use this flag to avoid trying to read
out multi-tile configuration.  PVC is currently the only multi-tile
platform, and PVC uses MTCFG so this flag is not set.  The current
expectation is that if/when future multi-tile platforms show up, they
will also use the MTCFG register in the same manner as PVC, meaning that
they won't have any need to set 'skip_mtcfg' either.

Even if a future platform does change how multi-tile configuration gets
probed (e.g., using some different register), simply doing an early return
from xe_info_probe_tile_count() would probably not be the correct logic
to handle that anyway.

Bspec: 53146
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 --
 drivers/gpu/drm/xe/xe_pci.c          | 4 ----
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 -
 3 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2ebe33a0dc07..e9e11bb1c65f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -218,8 +218,6 @@ struct xe_device {
 		u8 probe_display:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
-		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
-		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
 		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e560ef84a97..d55e5af4f4b7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -768,7 +768,6 @@ static int xe_info_init_early(struct xe_device *xe,
 		desc->has_sriov;
 	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
-	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
@@ -810,9 +809,6 @@ static void xe_info_probe_tile_count(struct xe_device *xe)
 	if (xe->info.tile_count == 1)
 		return;
 
-	if (xe->info.skip_mtcfg)
-		return;
-
 	mmio = xe_root_tile_mmio(xe);
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 08386c5eca27..5b85e2c24b7b 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -60,7 +60,6 @@ struct xe_device_desc {
 	u8 has_sysctrl:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
-	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
 	u8 needs_shared_vf_gt_wq:1;
 };

---
base-commit: 2a1c604bebed8cbbe6aea00f761777eed424dc55
change-id: 20260416-no-skip-mtcfg-d6f651d0d79f

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

