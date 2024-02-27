Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4912C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 16:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B7F10E926;
	Tue, 27 Feb 2024 16:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvbnBTS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3582810E5A9
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709052567; x=1740588567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FVZkHTsdPadNOPmLhSpd66CPYvhL0exTpwmORC8xMXM=;
 b=SvbnBTS4cLk/IPscWfa1L1LWoQR/Gh4STEBU8PGal9SctRATtkLeIqbF
 HlMuojyEYhSLh210+uOj1cGtfnzoVjXwEFXtzzcU2VWIokh6y53TDA1BW
 CeJ30z7SPYjC2nquHWQTEBFiIKWCTUiZPfA6nQoENhtcjFvR0IlefyS96
 qUXKU4yucsmwrUywGwXijdoLPo8SWB8TfgVzBRdEknt51pUc/qQzOGV6O
 widcvOiifqJqNsnhojyxSnvsseFeT7wgcewYsCSs/06jQ83R+1fwjvfap
 +jA92X5ET/Er49W3FN6JnRqyITLH5zTuHmdcLciNyPC7VU+S8D4hvM9fD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7224238"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7224238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7043713"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2024 08:49:26 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 1/1] drm/xe/guc: Fix missing topology init
Date: Tue, 27 Feb 2024 08:49:22 -0800
Message-Id: <20240227164922.281346-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227164922.281346-1-zhanjun.dong@intel.com>
References: <20240227164922.281346-1-zhanjun.dong@intel.com>
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

init_steering_dss need topology dss mask to be init ahead.
Fixed by moving xe_gt_topology_init ahead of xe_gt_mcr_init

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 45646d3aea2d..85408e7a932b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -315,8 +315,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_gt_topology_init(gt);
-
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
@@ -503,6 +501,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out;
 
+	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
 	xe_pat_init(gt);
 
-- 
2.34.1

