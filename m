Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF7CCA474
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9B710E9C8;
	Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKPVphYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21E610E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9u3UYx2uxzHk+xECi5pa25DjSnzIZmCYfOj+qYAb3bg=;
 b=FKPVphYxMIkfZrGFEu0tHve1aLfFEliHLlM+Gt2CqkH+0HBoxszRXOM/
 P9payKbKGVB43jZQAxx1yQJObPid200oHixTOyWU5r44cplvmLcia/5B4
 DRTI0Aucq2qa31CSHU/+ZJRnbHEFEDOCFTNT7K5aB1Y0wYUYf/va43Sr5
 nn5xRfIKSG124kiz6QtATdSCvGcdAqm4+hJGja202q95P38O9/eurZNPY
 LdIC9fAGNPiOMHHkvRrIELM8X1rF30kpvxxV2rKSH0tnsmV2keUgJ3umK
 cKDMH12rs76X2iKtnkCEWtvbDZpOkJkwVGAZQS9ss9EVduUKLRq+6lmkP g==;
X-CSE-ConnectionGUID: 7NoDnSk0SeiTmy2r7FEk8Q==
X-CSE-MsgGUID: dWQ9ZV/3SkGpuJ7uRtk0tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817671"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: wAl1ICUIRDCEVtvEgvAHZA==
X-CSE-MsgGUID: gAJ6vHgcR2WzChTVQTNyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852971"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 09/22] drm/xe/query: Report hwconfig size as 0 if primary
 GT is disabled
Date: Thu, 25 Sep 2025 16:46:37 -0700
Message-ID: <20250925234628.2112163-33-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

The hwconfig table is part of the primary GT's GuC firmware.  If the
primary GT is disabled, the hwconfig is unavailable and should be
reported to userspace as having size 0.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2e9ff33ed2fe..1c0915e2cc16 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -436,7 +436,7 @@ static int query_hwconfig(struct xe_device *xe,
 			  struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
+	size_t size = gt ? xe_guc_hwconfig_size(&gt->uc.guc) : 0;
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
 
-- 
2.51.0

