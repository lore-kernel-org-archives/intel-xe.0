Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E06FC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26ED10EB42;
	Fri, 12 Jan 2024 15:27:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160B110EB3E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073224; x=1736609224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vSXiXPbhBOWH6Ae2AnYfM//fL/YoGuUXqLhZg48Z8BU=;
 b=MBU1YqiIQUlD+pMizZK5J/5qWGeKBDtDgsLD6XRtT4UjBoMfUhGg7pwI
 GeBwBtrXCz+JsMk7wLGL3RQbZhBCychwT6GwIRq1mqyTt5LYAacE6CVxU
 jFguNJf8WQUgnq6U6WBGDh6ik8D0WyzbUC30QA6BglYs8Q7ujjTByC/ej
 16jHYor0WkLxSR0LnWLznBep/nrzqgAj34y3gLBxtdq/s+WR2yUTu6rW4
 efKImZCMsf2LxGtr5SqADLC4wEc1lpbENhh7ZK3MfyyvZ/SXpr5iU8BS+
 OQkwiVCNBoyLFEqpcjHRvjPYypnJ+Ylc1Qq302qU1A/86v0HZAdvgA4Hc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566364"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566364"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003170"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003170"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/8] drm/xe/vf: Don't program MOCS if VF
Date: Fri, 12 Jan 2024 16:26:44 +0100
Message-Id: <20240112152649.849-4-michal.wajdeczko@intel.com>
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

MOCS programming may only be done by the PF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index d205d684d809..609d997b3e9b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -13,6 +13,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -539,6 +540,9 @@ void xe_mocs_init(struct xe_gt *gt)
 	struct xe_mocs_info table;
 	unsigned int flags;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	/*
 	 * MOCS settings are split between "GLOB_MOCS" and/or "LNCFCMOCS"
 	 * registers depending on platform.
-- 
2.25.1

