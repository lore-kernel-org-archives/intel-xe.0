Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D164C369D5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0983A10E81A;
	Thu, 24 Apr 2025 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVk0BaQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E5F10E81A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505052; x=1777041052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFm/wqUyiJTcvlWGrEw6uBa4va/uoJdbtNi92XcWHGo=;
 b=JVk0BaQyTZjM+8rhVLkRK9l1mAX6ymN8RoNF1xDdwcRxbWX2VSmu/vWu
 lSzFwBFWyAIjtfl9I8vwUMbFhBK51CXE36TgO8KlYRMHTVrOUhcAlGSQV
 KzgZoWW79B/rWtXFugb0E5PFaNgHg3CJtxaZOB11Sq1jX1bldr0sDtasf
 F2MgJ9AlBmInP/u+rNlFcoKi3evSsvNfRszW8M34bBO6lU9OAF14LBZZn
 1DwqxO7wTr1InQWSDRLxvWAVom4dFvRkGMxNCVIsNyWGEZS6Bo8hB+oPq
 LsPO3GdOXiTE0xMfLDkopD4fXnIYO7dLKEp1hcTz5BGlSliDmadVRuj+e Q==;
X-CSE-ConnectionGUID: iwaYP8+JSCeymDEU2XbNzQ==
X-CSE-MsgGUID: x2SEg9+sTFWiujn7t+tZag==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50805578"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50805578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:52 -0700
X-CSE-ConnectionGUID: XBz538wLQPe7M7uGzbJ2PA==
X-CSE-MsgGUID: Bb5CsbolTrW78CfzFQiWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137632714"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:51 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH 1/4] drm/xe: Don't update wedged mode in case of an error
Date: Thu, 24 Apr 2025 16:30:40 +0200
Message-Id: <20250424143043.937-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250424143043.937-1-lukasz.laguna@intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
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

Update driver's internal wedged.mode state only in case of a success to
avoid inconsistent state.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..2e6d8744003b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -169,8 +169,6 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
-	xe->wedged.mode = wedged_mode;
-
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
@@ -182,6 +180,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	}
 	xe_pm_runtime_put(xe);
 
+	xe->wedged.mode = wedged_mode;
+
 	return size;
 }
 
-- 
2.40.0

