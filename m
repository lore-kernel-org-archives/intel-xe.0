Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CCBC27C55
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1410E448;
	Thu,  6 Jun 2024 05:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYqdLpFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29E10E448
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 05:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717652512; x=1749188512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3XulCH6S7oXxAtrTgFrG56dl6rPWT8pf3SE74eZ0mqs=;
 b=SYqdLpFqBVBz8Pk/VPMxduQhpGwnIwwCWzNfipuk/DKamWiy2sh8BEp9
 NCv8Qr5xwKehmiFDjdSLVBUDrUCADQ01nN7JZMLYoGqE2v/cU39JBHv8e
 A3A9WDLXrd9STupidZfIgg8viYFEft69gfNqNKq5/dO70m40tiyS3zAtB
 nqYfZoQ9p7jf1Xk+C+QvJiCfbEM2iy0vMETdEK24l27xKPwn6f2ACPYzW
 3GfhgeLW0cb2i/eJXfZQ+FgQnVhe4ki3m4pvxfIZXPX51EMXhR8rZLU/I
 OMrjlM82U+42SgHXZMTstrPOBAysCotbVZBANVVzIUKiO46cHZLLDO5tf g==;
X-CSE-ConnectionGUID: /g3+LVBlTEqONE7HbcY0Wg==
X-CSE-MsgGUID: djoLPCOCRXyrKnu5JedmSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25407036"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25407036"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:41:52 -0700
X-CSE-ConnectionGUID: Dg7uTcEETk2pkIoRSO0tSA==
X-CSE-MsgGUID: GpItIeiUStyU0E30FSH8pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37855087"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:41:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v2 1/2] drm/xe/xe_gt_idle: use GT forcewake domain assertion
Date: Thu,  6 Jun 2024 11:24:00 +0530
Message-Id: <20240606055401.934750-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240606055401.934750-1-riana.tauro@intel.com>
References: <20240606055401.934750-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

