Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CFEC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 23:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4892310EB76;
	Tue, 25 Aug 2026 23:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzKoIiON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA16A10EB76
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 23:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787699778; x=1819235778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jk4YAX4ydaGZkSjuIZ5r/D9gjDj/tJSmkFXLqxk9oO0=;
 b=hzKoIiONLbju0nO2vNwWYg0aUAmK5Ju0+v2lTRUCLe0JEsULmBjNR9K0
 RFV/1/0wPgS9blZr/FWfucXkO/lmCK7SfSUivfXgslpbu1rT2TpsbPCMG
 vAkH00YreZG4nHOmvL2u3y9uANum66CVgLcjt8mJL0dbfovrdfY9i2CZR
 hyqyfLB3RrvxHYlWH2sq9pdglKtJMcPM+paWqMKufb3pw6O1Kv22dX/4f
 /DfOukbKDdaGBisXQY8sl3dD5SPR71ef4MwZ/klZlAkuEy8UZNWMmHIGl
 OYWoS7evWJIiD/TIXmzzV9053VNfafGkA+/n2O4pQVB4xe+k6zHHhC3z0 g==;
X-CSE-ConnectionGUID: SwFtPBN8QFq8XftLIzwtiw==
X-CSE-MsgGUID: YsuSmLCDTTm0MkkJRTx8Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91857233"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="91857233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:17 -0700
X-CSE-ConnectionGUID: hQVaIW1wT1C/XLYbaU2BRA==
X-CSE-MsgGUID: TSwM/eU6QYCsGt7zk0TVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270906885"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/6] drm/xe: Define WCL as a PTL subplatform
Date: Tue, 25 Aug 2026 23:15:59 +0000
Message-ID: <20260825231604.651906-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
References: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
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

WCL will support a different GSC binary than PTL, so we need to be able
to distinguish the two platforms.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 6 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2eeccff2de02..d11b0ca20ba3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -437,6 +437,8 @@ static const struct xe_device_desc bmg_desc = {
 	.vm_max_level = 4,
 };
 
+static const u16 wcl_ids[] = { INTEL_WCL_IDS(NOP), 0 };
+
 static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
 	.dma_mask_size = 46,
@@ -449,6 +451,10 @@ static const struct xe_device_desc ptl_desc = {
 	MULTI_LRC_MASK,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_WILDCATLAKE, "WCL", wcl_ids },
+		{ }
+	},
 	.va_bits = 48,
 	.vm_max_level = 4,
 };
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 3447848b74e3..9399198278a0 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -38,6 +38,7 @@ enum xe_subplatform {
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
 	XE_SUBPLATFORM_BATTLEMAGE_G21,
+	XE_SUBPLATFORM_WILDCATLAKE,
 };
 
 #endif
-- 
2.53.0

