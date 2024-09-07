Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDF0E71081
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF2710EB3F;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZD60y/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEAD10EB2A
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGX4tF0pU7rc0feZzErJndmeAzy/naGTDg8DSWep+LA=;
 b=eZD60y/OlqOXgvtYl2etkPqm2Chhww8WrDgrclOGhEyXHyFOdSS2htCQ
 aem7QgCFhvP1g+BuRfJ6MRRUll0FrUUAZIzQkJ6JNq3N9gITB5VFOCFnV
 n/WxXArpWlmCDoUtOz53VDrni6CCUQzgl5qVWlG1fkE00TRYVX5+nW1Un
 WgbaRpcQuCpmaA/s9/9ZKlaIIc/UVpyqrS71qOwzqEr8WNFlei5WwNbmt
 gUiUGGbnrFnfS6rfUQQkOQJaZYpOfX/HZQxvvijILjGorhUc85OdQ2Xoo
 DqFbSWl6utCCrokHkTkMII/T0o7j7hvtIXvUZzVOCYvy5UOGtW8ltCU9N w==;
X-CSE-ConnectionGUID: PjMWdX5BRPGUBwwX6XiWTw==
X-CSE-MsgGUID: oWRlLZsHTFW51yh6Fu97eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855312"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: FyY5jEtGSI6GnJn9dSRrjA==
X-CSE-MsgGUID: 41/FxDbnTRWdUGqPInmA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792684"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 22/43] drm/xe/huc: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:11 -0700
Message-ID: <20240907000748.2614020-67-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index f5459f97af23..77c5830309cf 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -229,7 +229,7 @@ bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
 
-	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
+	return xe_mmio_read32(&gt->mmio, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
 }
 
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
@@ -268,7 +268,7 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 		goto fail;
 	}
 
-	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
+	ret = xe_mmio_wait32(&gt->mmio, huc_auth_modes[type].reg, huc_auth_modes[type].val,
 			     huc_auth_modes[type].val, 100000, NULL, false);
 	if (ret) {
 		xe_gt_err(gt, "HuC: firmware not verified: %pe\n", ERR_PTR(ret));
@@ -308,7 +308,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
-		   xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO));
+		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
-- 
2.45.2

