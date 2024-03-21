Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6694BC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF3410E725;
	Thu, 21 Mar 2024 11:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGUzx5+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0041210E717
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711019934; x=1742555934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WwjfSAIVFyKDd7jl7opuz8uE/qzYeece372LqCgfGdM=;
 b=aGUzx5+FYAwGNt2/ZiaGQSzN1Nce1a8OYTHO6L+sNd4ZBv/etN5uEjcu
 mx/y9mzqrg1gLOtggJxsq9MJqhQiyojc5wJwC4GmE2bM29ahqfMnGtdwB
 6O1NBBiqdL8+8xr2soXXYeuaK+xiPE1N3ZIUsqtC0wMXjabkJuT30hgb8
 K161k/kht8XPAzq4MuluxoOY5sw2qcmH5ykVneHD4Y1OmLITOH08/poxD
 skhVN7uxB0Thf9IfNTRVIRyDF6KzJnyPkF4xdWftvvhOx8mj8b6q1dTTo
 zbPyQVKRUSKFPHYApVVjjW+WdGRkW0LL5JTUM8ODfTaMEWP4ozgYDBAvs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6125781"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6125781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14452393"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2024 04:18:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe : Fix mixed enum type warning
Date: Thu, 21 Mar 2024 17:02:10 +0530
Message-Id: <20240321113210.3311749-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

The issue arises from comparing an unsigned integer with a macro-defined
value. To address this, cast the macro-defined value to the same data
type as the other operand.

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
Coverity Reports "Parse warning (PW.MIXED_ENUM_TYPE)
1. mixed_enum_type enumerated type mixed with another type"

 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 866bbd26ba3f..027cb60c60c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -311,7 +311,7 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
 {
 	int dss_per_grp = dss_per_group(gt);
 
-	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
+	xe_gt_assert(gt, dss < (unsigned int)XE_MAX_DSS_FUSE_BITS);
 
 	*group = dss / dss_per_grp;
 	*instance = dss % dss_per_grp;
-- 
2.25.1

