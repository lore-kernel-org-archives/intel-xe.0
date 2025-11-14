Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E182CEACE0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ED410EB35;
	Fri, 14 Nov 2025 21:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdBSzMHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497F010EB31
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NFEHXZiNxCkiJdM4eVLu8FEJC8Lui2FxBJLQlkY1UPE=;
 b=AdBSzMHBq1CveKY7fhxtDmaNFjFCU2+2qZ8hlfrcEJf7lcA0evjrWAtY
 M6I4ddazqD9Pkl7XhyB1oCp1XkX5ctKY/1s9kMR9bMzl+7NdUAqFFnRwC
 UX31k5Q7tuK9atcZjnInzREn2RPonSADwL+1z6lEheKjPTdh7iy3h4TwR
 guU5gSTQuk0uH8gxVSsjJCfXVntEXefp3Lyu0E8d6J9+AtrSTKlz66ypC
 FxrnC/XueUHijcBO6QlxFpQeRSeBilLzbme2Rsv7haaoXvUMD9QOiy5UM
 efJ91bctYXwUrz3w/0hG4542Q7ntSWhX7OkD93YhClFyfRAuja6F6WHB+ Q==;
X-CSE-ConnectionGUID: FP2geSFjS3if+MuHXKD8Hg==
X-CSE-MsgGUID: pnVMhTSVQjCkbu8jwFvPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648319"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: LaQVnUd5SxekDj408IjpcA==
X-CSE-MsgGUID: /Y43E7AVS0i/nDV/7XWnUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308324"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 17/27] drm/xe/huc: Use scope-based forcewake
Date: Fri, 14 Nov 2025 13:43:53 -0800
Message-ID: <20251114214335.2388972-46-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Use scope-based forcewake in the HuC code for a small simplification and
consistency with other parts of the driver.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 0a70c8924582..4212162913af 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -300,19 +300,16 @@ void xe_huc_sanitize(struct xe_huc *huc)
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
-	unsigned int fw_ref;
 
 	xe_uc_fw_print(&huc->fw, p);
 
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
 		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
-- 
2.51.1

