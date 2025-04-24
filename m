Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F358BC369C2
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BE310E827;
	Thu, 24 Apr 2025 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbfkICCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0579910E81A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505056; x=1777041056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wxPqYI9i5fOqP+FWvZoH7TXSMAmYrosTRddwIrORkpM=;
 b=dbfkICCQjxRVPI9FSRg4e3BdqK+v7YySVG1xMJ/9htZEtSL+ZWSQnsgk
 849Ue0vX3Yiff2Qa8XZuoOtbKZLCsmiFHVYG0tCirGqoXm8TzNM3yVoJB
 AZjV8nmX0VSYkmvzMhVXeDIcsHYuYFI3vrW6riH5WfdLQqsmzgAA5AhuZ
 0J8Ojn46TZrxPIjURTgbenKM0+Uq3ZCffayFXmz8NVvsGc5MdRwbk6Epa
 4CrEv6mdLYdPRgKA2O6bdtkyD5MMdPQPejSVeKHQyIcxmZoPEpxJs0MuH
 NVvJZ8oVoQgQ1ACwvQtxDoLy7uifRROn/J+tji3eZbZIO9T+tGJroR7KZ w==;
X-CSE-ConnectionGUID: yFCmGRpZQQm93TJfMnlbEw==
X-CSE-MsgGUID: JQkf8MMIQbKRceKcoskM9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50805604"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50805604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:56 -0700
X-CSE-ConnectionGUID: L2gh72JGRsi/LsvKnPMU3w==
X-CSE-MsgGUID: /4gdIKB1TjWJRiG1WqvS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137632731"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:55 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH 2/4] drm/xe: Validate wedged_mode modparam input
Date: Thu, 24 Apr 2025 16:30:41 +0200
Message-Id: <20250424143043.937-3-lukasz.laguna@intel.com>
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

Check correctness of the wedged_mode module parameter input. If the
value is out of the expected range (>2), set the default (1) and log a
debug message.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c      | 7 ++++++-
 drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
 drivers/gpu/drm/xe/xe_module.c      | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..d2de6936cc20 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -731,7 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->wedged.mode = xe_modparam.wedged_mode;
+	if (xe_modparam.wedged_mode > 2) {
+		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
+		xe->wedged.mode = 1; /* default */
+	} else {
+		xe->wedged.mode = xe_modparam.wedged_mode;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 859a3ba91be5..a471cf55ad8d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1856,7 +1856,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 		return NULL;
 
 	xe = gt_to_xe(q->gt);
-	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
+	if (xe->wedged.mode == 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
 		return NULL;
 
 	ss = &xe->devcoredump.snapshot;
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 05c7d0ae6d83..b1b9bb2056ae 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -71,7 +71,7 @@ MODULE_PARM_DESC(max_vfs,
 		 "(0 = no VFs [default]; N = allow up to N VFs)");
 #endif
 
-module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
 MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
 
-- 
2.40.0

