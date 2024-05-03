Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E206C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 08:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C9D10FA0C;
	Fri,  3 May 2024 08:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WczLNNYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735AE10F915
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714724714; x=1746260714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6wTysAcMoH0phyIQ5DuoA/xrelyCNdazx1Ea/Y/3n6Y=;
 b=WczLNNYiwkAgUZc+s+QYTJHDCIX8gN2eTVCiz+aIPOnj2uVqZNRsCVUZ
 dWbjqeojYIp1gIjJJackmNSrogqkYMRnUSORBjDUESq+T0RrmP1croHlC
 IKSD8RuhgiPDhqO2HL7qngpt4XTTvgLXJRBztbJTHc5Vu1viX+3ILiF36
 23VypeUsmOAP29cUAH7RCijjydUqFWGbQzniQ2LAsiqLY24JmbEaq6mUb
 hhGC7SWXk3Xh6jYzhiO0eVSlL1ajjik1oqYaFv6As50rR4FfvIv9F7f7r
 Ep2Y6vl2PyYP8ws0DTb2Kj7N5XegaH01awTOHtbhMezmZbUOy6bGQNGmz A==;
X-CSE-ConnectionGUID: DGPdA6saRUaKPBS8VOok4w==
X-CSE-MsgGUID: 0EqN8ug1SpGPkPFHZqeWnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21079773"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21079773"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 01:25:14 -0700
X-CSE-ConnectionGUID: 09wePQO+QQ679oEiAlW/yg==
X-CSE-MsgGUID: VSqjUiavQOqbOyrL+xLL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="32203406"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.209.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 01:25:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/debugfs: Get a runtime_pm reference when setting
 wedged mode
Date: Fri,  3 May 2024 10:24:50 +0200
Message-ID: <20240503082450.268335-1-francois.dugast@intel.com>
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

This function is another entry point where it must be ensured that
the device resumes before operating on the GuC, so grab a runtime_pm
reference. This fixes inner xe_pm_runtime_get_noresume calls which
were previously failing.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0e61fa462c7b..96920f7b2371 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -152,6 +152,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 
 	xe->wedged.mode = wedged_mode;
 
+	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
 		if (ret) {
@@ -159,6 +160,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 			return -EIO;
 		}
 	}
+	xe_pm_runtime_put(xe);
 
 	return size;
 }
-- 
2.43.0

