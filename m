Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1014CC27C55
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 09:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA57810E8B7;
	Thu,  6 Jun 2024 09:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxZLIXXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A46510E8B7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717667790; x=1749203790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7lK4OOShqeXhb6GbfHvTzi9GbBolVwy1RGh0Axi8qco=;
 b=bxZLIXXvayP5+Ffsp0SkIPeNeMaS/4a0a53ZIwyLYoZaFucqQTIqiNGh
 m++5YJxq7e8ljJELvDQAZGSM09A8hOrHGsTrFbhRY6TfPxtC1zW4pNZsN
 AKJ6AH2Cl/Lo/4ur4lTA1MAhLPwcg9YLGW25VE+IrhT0p+nhrrRgKzBb1
 dL0CwTEQfw0dvbbl+um6uNLblO45seZAM5EvA1Ugn++MrP5P94GNFjShH
 MPspTN81aANy5rfjbvWEV53t4YVsDGn8C7TmRD5pYtQoGqQHG8PKVlFra
 fEeNAgVssiqxllkQli6whC75GnBQ29RG+Eyb9lZUMTHvHwAvfxmaHB/iE g==;
X-CSE-ConnectionGUID: TRmQkQsmSfCYisG+l0vnCA==
X-CSE-MsgGUID: eEfbxm11Q1a5Zs+Ww8GdpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31823909"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31823909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:56:30 -0700
X-CSE-ConnectionGUID: 5CaR9vaSRn2apO6iTm9Q6g==
X-CSE-MsgGUID: g/t1GUt5R6eHkfDtQtJ/Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="42326704"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:56:28 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v3 1/2] drm/xe/xe_gt_idle: use GT forcewake domain assertion
Date: Thu,  6 Jun 2024 15:38:41 +0530
Message-Id: <20240606100842.956072-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240606100842.956072-1-riana.tauro@intel.com>
References: <20240606100842.956072-1-riana.tauro@intel.com>
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

The rc6 registers used in disable_c6 function belong
to the GT forcewake domain. Hence change the forcewake
assertion to check GT forcewake domain.

v2: add fixes tag (Himal)

Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 0109d1d2e9c4..a6ab8bb4571d 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -250,7 +250,7 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 void xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
-- 
2.40.0

