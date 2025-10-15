Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE409CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 15:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AA410E822;
	Wed, 15 Oct 2025 15:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mU2XJxYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854A10E822
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760541054; x=1792077054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AKHmBz7BKQmCb7ml68ZXIU3Axyq92IclcP1fPZQW0JU=;
 b=mU2XJxYBmhAgQQMFDjyGFNOPeJErG76Z19S0RAiHNY0GO/EooxJ0k8+h
 8x4EWsabBiEAbF703hNub74Zh55RYFOXFhecE6X6lzWw/NRWG5yTnxTAe
 BrDlhYFwl0S7kbI/fMMFHJbkUd00tq/ejdgYeoT+1Tb9WtAjKinNNR4eZ
 Bah5hx+NvcoT7UzhjZ1prflJOU7xTrDdREVV/yq39PMiNd2iXn0a90k1o
 yFbMdteoSvpNskIoCnwlvPjnZHe6iO0cshd7GHrPJ8HetOLqHnQCgQIJT
 DVMTXLPIPCXyZ0PmBhS6RmVjxjm+KJYLwU/8tCBFmbNXL4I/glEXGCiBg g==;
X-CSE-ConnectionGUID: 7MTJQyfrTOu73Y7pLus3OQ==
X-CSE-MsgGUID: sS0x0SZaTH2FrmmZ9YzOTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66551124"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66551124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:10:54 -0700
X-CSE-ConnectionGUID: gRtVfeQ8TXiThPGXbh9LIw==
X-CSE-MsgGUID: MRAoZTIjSPOw4K2XilAFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182159200"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:10:54 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe_guc: Expand guc_g2g_alloc error hanlding for future
 change
Date: Wed, 15 Oct 2025 15:10:54 +0000
Message-ID: <20251015151053.66931-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
Hardware-wise there's always at least one tile, and every tilie has a
primary GT.  If something went wrong during init of tile or GT and we
couldn't create/initialize the structures, then we already aborted the
device probe immediately and we'll never get further on to places in the
code that would be chasing a NULL pointer.

However, there's currently ongoing work to allow the primary GT to be
disabled via configfs for debugging purposes.  Once that lands, it will
be possible for this query to return a NULL pointer.  Expand the error
handling code for guc_g2g_alloc to manage this in the future.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc..fbe66722e852 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -467,9 +467,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 
 	if (gt->info.id != 0) {
 		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
-		struct xe_guc *root_guc = &root_gt->uc.guc;
+		struct xe_guc *root_guc;
 		struct xe_bo *bo;
 
+		if (!root_gt)
+			return -ENODEV;
+
+		root_guc = &root_gt->uc.guc;
 		bo = xe_bo_get(root_guc->g2g.bo);
 		if (!bo)
 			return -ENODEV;
-- 
2.43.0

