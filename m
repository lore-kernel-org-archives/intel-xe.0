Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5261BC5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 20:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07B910E876;
	Wed,  4 Jun 2025 20:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dbqo68xo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A310E864
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749068964; x=1780604964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/6Tn0oIKDkTJkJFFptnSibq/KzN3pYrs3iwOjR3cH+U=;
 b=Dbqo68xoiFsDLNuKzhWHoRtRHmzD9FAE53V8OexiYr0WuQzKHGOH264j
 I4ZutMe4BqVvm93jXcXcwDbkr8P+BIfu53d4O9kKNw2elS0gsep8sLCcW
 OqRFtONPPUYz/49tVLByroyI2jmtRZbK/qPgSwsyu8mQWCKId7D1MBHeV
 IzFguERgSJsfmDjcKGXRE68eXgemmnm8aaYEdjsrwG8wzrmLefQWS5ndC
 6ZLTOCEAzM1zDHMAzCbKOZpqoe1TbropQjNL7f3t+n6LyDiaCtcEP7FKA
 tU05QchZROW16w0ObsVTggy5KFQBvwuC8+AmEJI5K3PJH5oWH9nVMfNlA g==;
X-CSE-ConnectionGUID: tP2GrMgATeyNES9lpsfYlA==
X-CSE-MsgGUID: A+GwajoXQf29hE2skWjedQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51039074"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51039074"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:24 -0700
X-CSE-ConnectionGUID: Rjbc0cr4R/6GMla7arRZdQ==
X-CSE-MsgGUID: dlHWH50qRCCpszXViYOFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145257220"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/3] drm/xe/topology: Stop trying to fix programming mistakes
Date: Wed,  4 Jun 2025 22:29:08 +0200
Message-Id: <20250604202908.769-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250604202908.769-1-michal.wajdeczko@intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
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

We shouldn't ever pass more DSS registers than our hardcoded limit,
it should be sufficient to just assert that instead of trying to
fix it, as this will never happen in the production driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 048743913b36..305939c69747 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -22,8 +22,7 @@ static void load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs,
 	u32 fuse_val[XE_MAX_DSS_FUSE_REGS] = {};
 	int i;
 
-	if (drm_WARN_ON(&gt_to_xe(gt)->drm, numregs > XE_MAX_DSS_FUSE_REGS))
-		numregs = XE_MAX_DSS_FUSE_REGS;
+	xe_gt_assert(gt, numregs <= ARRAY_SIZE(fuse_val));
 
 	for (i = 0; i < numregs; i++)
 		fuse_val[i] = xe_mmio_read32(&gt->mmio, regs[i]);
-- 
2.47.1

