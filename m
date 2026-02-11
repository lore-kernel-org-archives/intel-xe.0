Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679CECD6EE
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893DE10E66A;
	Wed, 11 Feb 2026 23:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ou9LcRcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90C310E669
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852791; x=1802388791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EB52bHQKTh/qbhadOSv5nxh8MHndv7cccXAQdp/LZYA=;
 b=Ou9LcRcr6bo9+3JByGbluH6jCy6fDywjRgPf/CCZBjHc17ZdY7yCHHOt
 oRZEgxeVzLFUqNXCLrbCqPMxCBNBu9Z2JfDSVHUEGtnRs+fgLCRRrpkGX
 knxxKQjLBQ2IFlfv0UmK0KArI8CFDzA7hEooUkYoAA1qNKOIlg/UzXNki
 9QOBNsUMryFRwTfhp5TbZCORdMV3LDc7q7au++N8lT/Q4m2YJ4p1+px+I
 Uvj1nztMlclOInEqYwWXpjbFOCX/38OF/rKI5vWCu4Y+TTCQlYoCIZBHr
 TC9tE60vDoCjQkLBj91ff8ZcKYrOJGHzrJic8Qbhg4I6lFrOoCW2Z88zL g==;
X-CSE-ConnectionGUID: meyLrM4nQ7mS3cysS/a+Pg==
X-CSE-MsgGUID: grDG9M4BR8S0uXBYqElIgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71916309"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71916309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:33:10 -0800
X-CSE-ConnectionGUID: +900ikp9Tj+YRmRDg8LmfQ==
X-CSE-MsgGUID: 1cyDbpyRTl2gnMLnT5y2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212495382"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:33:11 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Do not process GT WAs and tunings for SRIOV VF
Date: Wed, 11 Feb 2026 15:33:03 -0800
Message-ID: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
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

GT workarounds and tunings are not applied for SRIOV VF, so do not
process them.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 68c4771de040..2c646448f7b0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -540,8 +540,10 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		return -ETIMEDOUT;
 
 	xe_gt_mcr_set_implicit_defaults(gt);
-	xe_wa_process_gt(gt);
-	xe_tuning_process_gt(gt);
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		xe_wa_process_gt(gt);
+		xe_tuning_process_gt(gt);
+	}
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
 	err = xe_gt_clock_init(gt);
-- 
2.43.0

