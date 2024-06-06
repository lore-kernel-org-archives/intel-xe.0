Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182D7C27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B925C10E545;
	Thu,  6 Jun 2024 05:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX1b96qX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04B410E448
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 05:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717652514; x=1749188514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HvWC0KA1cW1OyjsNk/VtXni8/cJ/Dg6hhxJl5Z5RVTc=;
 b=EX1b96qX6VzM1HuXLeUjFtF1ip/bBKm3HsaYZbH2DibfNgUpYf01mrmD
 O2/AWPAdLSIHcguYZEylFa9QkBEV2ioPg76jwav3LZWrOX4T7w9ivey3X
 1OYuQ3XeJuxK/N6DLQl1TEk0QEbUzNXh8jAHWY7oT2UlfNCaMhqtKqzje
 yXtxUXz30VLu1xv5TA7N9kWyVurMcKur0U/Yx3k6QiqSQElQxprt45dzR
 3AtSelE1mM1CzhHln5D6rZcckayW/w651R/PcWYSn9a4puEz2G8o1kZ2r
 xRpgq0IQ7/J0zj7zEIgE3M3pVuulJ89YSOUD0YfBI7QflGuJmXjokw3nc A==;
X-CSE-ConnectionGUID: tOJRRbPbQ9aDGcn+FIJPoQ==
X-CSE-MsgGUID: whoIxMdOR6+L4OgmOD0tFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25407037"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25407037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:41:54 -0700
X-CSE-ConnectionGUID: PS4ScGj2TXeQkKHYU8/Oqg==
X-CSE-MsgGUID: xSl3VJozSDGhxlFeO5OqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37855092"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:41:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v2 2/2] drm/xe: move disable_c6 call
Date: Thu,  6 Jun 2024 11:24:01 +0530
Message-Id: <20240606055401.934750-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240606055401.934750-1-riana.tauro@intel.com>
References: <20240606055401.934750-1-riana.tauro@intel.com>
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

disable c6 called in guc_pc_fini_hw is unreachable.

GuC PC init returns earlier if skip_guc_pc is true and never
registers the finish call thus making disable_c6 unreachable.

move this call to gt idle.

v2: rebase

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_pc.c  | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index a6ab8bb4571d..5d6181117ab2 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -197,6 +197,12 @@ static void gt_idle_fini(void *arg)
 
 	xe_gt_idle_disable_pg(gt);
 
+	if (gt_to_xe(gt)->info.skip_guc_pc) {
+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		xe_gt_idle_disable_c6(gt);
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	}
+
 	sysfs_remove_files(kobj, gt_idle_attrs);
 	kobject_put(kobj);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8187dfb2ad6c..508f0d39b4ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -897,11 +897,6 @@ static void xe_guc_pc_fini_hw(void *arg)
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
-	if (xe->info.skip_guc_pc) {
-		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		return;
-	}
-
 	if (xe_device_wedged(xe))
 		return;
 
-- 
2.40.0

