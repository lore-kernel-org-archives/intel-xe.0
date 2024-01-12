Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223EC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E486E10EB44;
	Fri, 12 Jan 2024 15:27:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A16410EB47
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073230; x=1736609230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7IFu9IYolZ8eOzj9IKILZkXwJcuDLYeMXbm2HQXeXg=;
 b=DDq6L6CEAPSbKQEO7CjI2b5uJMSUTsozPxD0/TUdf6jfD2K1Y2w9NrDZ
 nUiteoI0juDJTJx5z7dibfnMCqDA8km3YVNaDG0IaYU33htEgf0XQ2cOE
 mBMPmGyZTLwX7pLgC+ljIOqyKJaywmIfyq7UYTO1QgKKhe5mUU0MYRJsL
 tUTAszIip5JjezHEHUmCjJIEBfsEe/4KETXshMSAuhFx//E6nt7j/+9oJ
 ttv6wn6fC/5sCpoE5yOokZa3DxmX7HHuoiMUjBqmj8ExULK0cYGTKpVsZ
 uh5sT8NWc0HfAWo7Nrc+aClysYV4hXmn+PIPFBt6+N84KgdCbY4Q97plZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566388"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566388"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003195"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003195"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:07 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/8] drm/xe/vf: Don't program PAT if VF
Date: Fri, 12 Jan 2024 16:26:48 +0100
Message-Id: <20240112152649.849-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PAT programming can only be done by the PF driver.
Besides VF drivers don't have access to control registers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1ff6bc79e7d4..e148934d554b 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -13,6 +13,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 #define _PAT_ATS				0x47fc
 #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
@@ -433,6 +434,10 @@ void xe_pat_init_early(struct xe_device *xe)
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
+
+	/* VFs can't program nor dump PAT settings */
+	if (IS_SRIOV_VF(xe))
+		xe->pat.ops = NULL;
 }
 
 void xe_pat_init(struct xe_gt *gt)
-- 
2.25.1

