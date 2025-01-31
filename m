Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC6C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 07:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24D510EA27;
	Fri, 31 Jan 2025 07:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRj1cjXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E9B10EA27
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738309503; x=1769845503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XElk3QsRRWEbdJVqCf4qB8MMrFcQVUt1UTOAOcPVCbs=;
 b=kRj1cjXZhYmU0a1s018vw11ED3o8GXj1fdOhC3xhz7bsfbqSNLewHEUW
 xvXWqOCMShQpMUmOED8JmjuqF5drP8/ejxGMkOm7ymZ8ks0Z04X0tVQy3
 6bZWeqmyYmRzX3voJFPJMpfcrvjtuEA5P2g7GdIe40DHWx3TOUMNbow4D
 6I+KFczq1xsPR/fuGt/v1VlINp27flZjIdKUZ8OW8ODdXUC+X05wvGlr0
 EjatkmhkuKRS+2c7akJPFYCm4OZEV/0Bne+gq2bReKmMQEKP0uOuFX833
 bO02oFNZrgT/45wd7a9YY0XWXyaXzdPxEH/Fa2Xrw3WbylUVB/MTK6pS8 w==;
X-CSE-ConnectionGUID: 5ESavQ4XT0ulCo1L1D58TA==
X-CSE-MsgGUID: FfbxSRLzSF6OpVLjIOi3ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61344459"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="61344459"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 23:45:02 -0800
X-CSE-ConnectionGUID: M8R8CdIsQHCgMXkRAT3Czw==
X-CSE-MsgGUID: ASm+LvIZRemnYvSoZS4XMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="109710202"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 23:44:55 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 satyanarayana.k.v.p@intel.com
Subject: [PATCH] drm/xe: Skip survivability mode for VF
Date: Fri, 31 Jan 2025 13:35:27 +0530
Message-ID: <20250131080527.2256475-1-riana.tauro@intel.com>
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

Follow the probe flow in case of VF and do not enter survivability mode
in case of pcode init failure.

Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot survivability")
Suggested-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index c619560af74f..02b4eadf8407 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -177,7 +177,7 @@ bool xe_survivability_mode_required(struct xe_device *xe)
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	u32 data;
 
-	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
+	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
 		return false;
 
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
-- 
2.47.1

