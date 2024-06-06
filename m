Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289AFC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 12:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2210E927;
	Thu,  6 Jun 2024 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjteVXz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C161D10E927
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717676736; x=1749212736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpGQpZpAKaRYohbSCo0kaY5O9Jhjtja9Is0omyQgi4Q=;
 b=KjteVXz0mekgbL4kEDG43UYyD1a/aCuBj95mBi0jMTz/PCtBGJlpy5jA
 eya9X3JG3xZ7W+NCYfi3Jtj5Gl3AyFUuS7HPYsCcqUDrIWTXVFvDcv45S
 OTnRqBRNyaRRtIaV2ikFpz8E0Swqw82ijowF16ta6IdL6r+di3G1SEata
 w9L05m2ox0wnwVecHPoQtKgT7iZPvkqtHHleQi34w159htqSNhNEDtS+o
 p3zgtMb16JnA47RJu1rUuFINS5G0szvkS7YO/Zxo4p0jkFcjrcAsgysiV
 9gmWQdxIP+GN3tSsiCbMDntr+rDrxtOJ/qdh6J3k2yMMiPIIIR1RVgAfq w==;
X-CSE-ConnectionGUID: L2kRN9nlSNyZIgaV1LJU9g==
X-CSE-MsgGUID: Rt8tz/TVTGimrvA1K+B0Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17273905"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17273905"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:25:36 -0700
X-CSE-ConnectionGUID: 184x7y5AR1ycPswgTOz4bQ==
X-CSE-MsgGUID: WTyb/WScS8eD/Smz5pT4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38033826"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2024 05:25:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [CI] drm/xe/xe_gt_idle: use GT forcewake domain assertion
Date: Thu,  6 Jun 2024 18:11:33 +0530
Message-Id: <20240606124133.1353738-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
References: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
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

From: Riana Tauro <riana.tauro@intel.com>

The rc6 registers used in disable_c6 function belong
to the GT forcewake domain. Hence change the forcewake
assertion to check GT forcewake domain.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
Patch is part of series[Link], added to ensure CI passes for [PATCH 1/3] 
Link: https://lore.kernel.org/intel-xe/171765277681.3535.15897925217208820202@a6498e030952/T/#u

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
2.25.1

