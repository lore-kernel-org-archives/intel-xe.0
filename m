Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF60C78820
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 10:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E9710E805;
	Fri, 20 Sep 2024 10:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ2yDARN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45A010E008
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726829754; x=1758365754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DroiyTYy+iRbFKQcso5/ZFSpH8Klex6vSePgcO2qSgQ=;
 b=LJ2yDARN5wwuDNBHdP/V7HIKfypU8qh1LXdQNvPAL0oyOWY9xKAIafzn
 nXzvK1KfxVVR9HZ8bMJje0lxRkFn9q2kveFNjYZQyPXSxtfIgVvX8AhZi
 8UqilVjnWRfUnlkT4BTc/Cqa7pLjdUbw9tkWYaL56oFVhq1XYjUGxvFpK
 3Z+7NNyvGmMKGWQqJkyJfWVAbQEBz6wzHb6EG+MvvVxn1wtN1C2xvjNR8
 OR8FASAB/b+YdCtXsYCLLTU7U9sj3J3hPqIMhNTOqLtnKbWTR7hbDQHaV
 uHcpNszL4pEk8YRNyNrww+gNEXWB42aq/+IIo/OiIkUtRM05jkUj3xmJh g==;
X-CSE-ConnectionGUID: 7O0w+0oZTuSwLFYx1JPSXQ==
X-CSE-MsgGUID: iFwi8YTbS524usBgcwnM8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29725406"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29725406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 03:55:54 -0700
X-CSE-ConnectionGUID: SH25oiTeQsqdSdOKzsj3cg==
X-CSE-MsgGUID: QhVT2GFESGOsRSuwRUwQzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75218373"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by orviesa004.jf.intel.com with ESMTP; 20 Sep 2024 03:55:47 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Check return values of functions in xe_gt_shutdown()
Date: Fri, 20 Sep 2024 16:23:42 +0530
Message-Id: <20240920105342.1798882-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Put check on the return value of functions xe_force_wake_get()
and xe_force_wake_put() to avoid mistakenly considering error
values as normal values.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 274737417b0f..eaeaae1df198 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -890,9 +890,9 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
 /**
-- 
2.34.1

