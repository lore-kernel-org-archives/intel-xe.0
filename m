Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FD3C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C213610E035;
	Wed, 30 Jul 2025 05:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYciT5l6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2E10E378
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854587; x=1785390587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i696hIEYbcOg86GsXvbF7YdmfxdgSGvONohj/0NXd+4=;
 b=gYciT5l6UuJsl/Pwg1c2FlK3jMD/XqAJPw1XaxuizN2Gn5VbYmZNG+qC
 2YaszlB32tpKjO+KRN7ucbj1fdoIINln6N0PXbRaARJXvq6X42VxZ94Cs
 2M/QbjyXR3MgqZfBgc9SYyJv35JUQ1KDQp4Ha2YizZbOODT8OSXwPEl3u
 eHCe505/NLIhULH0LAxEYXzeIYkvOcFErFN6UKMI/C8gOd2wzMyQfPBmo
 dv+xQgiUQ/JOGmqLsBxiQ2A0oXGowiMfm3KbLEMUr9NLZ0fjJ3OCcr/uF
 KCSE9QglpfRX1dCb5wEv+eHZds6f7XWb9FXlWAPErelhHL3YM29KOKMrj Q==;
X-CSE-ConnectionGUID: QdULiEITRaqjfYfhPiG3+g==
X-CSE-MsgGUID: Gt2zNxYPTZCqVikMO3T6kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215620"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:46 -0700
X-CSE-ConnectionGUID: cKrO4NYATZaEYLTTbthCTQ==
X-CSE-MsgGUID: 0aZyTdq2QuudWnOcUfr9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240268"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:44 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 09/10] drm/xe: Clear SOC CORRECTABLE error registers.
Date: Wed, 30 Jul 2025 11:18:13 +0530
Message-Id: <20250730054814.1376770-10-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

PVC doesn't support correctable SOC error reporting, classify them as
Undefined and clear the registers.

v2
- Fix commit message.
- Although the errors are correctable but they are spurious interrupt.
Hence use drm_err instead of drm_warn.(Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 690b7df7ccba..a77779eb6ce8 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -624,13 +624,31 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	if (tile_to_xe(tile)->info.platform != XE_PVC)
 		return;
 
-	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
-		return;
-
 	base = SOC_PVC_BASE;
 	slave_base = SOC_PVC_SLAVE_BASE;
 	err_regs = &tile_to_xe(tile)->hw_err_regs;
 
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+		for (i = 0; i < XE_SOC_NUM_IEH; i++)
+			xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+					~REG_BIT(hw_err));
+
+		xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				REG_GENMASK(31, 0));
+
+		drm_err(&tile_to_xe(tile)->drm, HW_ERR
+			"Tile%d reported Undefine SOC CORRECTABLE error.",
+			tile->id);
+
+		goto unmask_gsysevtctl;
+	}
+
 	/*
 	 * Mask error type in GSYSEVTCTL so that no new errors of the type
 	 * will be reported. Read the master global IEH error register if
@@ -707,6 +725,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
 			mst_glb_errstat);
 
+unmask_gsysevtctl:
 	for (i = 0; i < XE_SOC_NUM_IEH; i++)
 		xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
 				(HARDWARE_ERROR_MAX << 1) + 1);
-- 
2.25.1

