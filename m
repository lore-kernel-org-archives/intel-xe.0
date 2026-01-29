Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA2D73E80
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 17:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333C610E8D4;
	Thu, 29 Jan 2026 17:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0+IBNSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B260E10E8E4
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769707814; x=1801243814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H91/UoyTB8RJWQcrl/bdG6GSQPh4hZDz+4/49Drqxpg=;
 b=b0+IBNSQGEW5oDzimiaVdQCXUjo2fCwBXMWYh4wL6BndgxqL7NyRw0/4
 UnVaQk3IphrqBYgJygRDqkYi5Jaf1lxMJa/Bm0/vUYAVcCwRW4yHqh94E
 ejttbDg1wGIz8Nfj9PukTKaHr1LHttxdvX61GuYU6ugCqyTN7fav9iJWL
 +7/NI+GAnYXYGTwevVDDTxkM060WSEFTGHjgE4tNbUG7FrrWCJVbJZWy6
 8da/VTkwUAJY8gucnSr8ZpIIaBZZ/k220yMEekgSDi+7iP6o4tJsq+aab
 gcjEFkn3OMQla8KUqeKiXtAyiA4WA3cFfBMaQScua/c8/Q7w9ec34+kLg w==;
X-CSE-ConnectionGUID: c39dLBsLTgyWjz8fLtYTVQ==
X-CSE-MsgGUID: GOf0hwyIS3ulvpI1wcnIPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70850076"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70850076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:30:14 -0800
X-CSE-ConnectionGUID: /qZZjGLoQr2B7ui0m/Gldg==
X-CSE-MsgGUID: QFewlKAVSkOs967sgz2Vxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208990489"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jan 2026 09:30:13 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
Date: Thu, 29 Jan 2026 22:52:48 +0530
Message-ID: <20260129172246.1106097-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129172246.1106097-4-naresh.kumar.g@intel.com>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
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

Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
CCS mode changes

Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..e146e00b0ca2 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
-- 
2.43.0

