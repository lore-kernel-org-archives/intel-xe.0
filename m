Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D78C531DF
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14EA10E514;
	Tue, 20 Aug 2024 17:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kq+m62qL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916A210E467
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174174; x=1755710174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MOz9+SwBr3bOLMFymWmx/E9F044gBQPA8g+c+eKCq4=;
 b=kq+m62qL006KFh6kGBKNbkzGwxtTEbXkm0YlLfRDeZKXWLZObfpo611Y
 tzXADifGMDd2q+OmKzjHndJpAWaq8m2Gjs8dFwWyu+Dm+YAknGGQ8agIy
 0m5E67vTDRx8Qm4sT7Di8jsot9XyIJAIRCX9gNrwP9OT0bJNZXU85tEKQ
 SYJvqaFmKWKjzt2R+vdpMwe9Tu8ST/5eSvT4O5GFik4uJPDZCTvhi3n0b
 eupNOQIZ64NFl0mq56uFajT9B86xQ10m9ZJOcBgboF5pk+hlZKozA17RC
 oycMQX3RKozLupFLL5j+oMUCBQ4d730loF43ccsDGANgpu40guF3YD+DA A==;
X-CSE-ConnectionGUID: APebxayTQHWX+zOXxoTdMQ==
X-CSE-MsgGUID: S6Prz39fRNeUrR+tUznp+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33114108"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33114108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:26 -0700
X-CSE-ConnectionGUID: C2CWFTtFR0CNseAe0dhgJQ==
X-CSE-MsgGUID: XrgsXjvkThey/404An49EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60755939"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.143])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:24 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrala@intel.com
Subject: [PATCH v3 1/3] drm/xe: Suspend/resume user access only during system
 s/r
Date: Tue, 20 Aug 2024 20:14:06 +0300
Message-Id: <20240820171408.192309-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820171408.192309-1-vinod.govindapillai@intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Imre Deak <imre.deak@intel.com>

Enable/Disable user access only during system suspend/resume.
This should not happen during runtime s/r

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 30dfdac9f6fa..ad7fc5137b42 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -323,7 +323,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
 	if (has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
-		intel_display_driver_disable_user_access(xe);
+		if (!runtime)
+			intel_display_driver_disable_user_access(xe);
 	}
 
 	if (!runtime)
@@ -335,7 +336,7 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	intel_hpd_cancel_work(xe);
 
-	if (has_display(xe))
+	if (!runtime && has_display(xe))
 		intel_display_driver_suspend_access(xe);
 
 	intel_encoder_suspend_all(&xe->display);
@@ -381,7 +382,7 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 	intel_display_driver_init_hw(xe);
 	intel_hpd_init(xe);
 
-	if (has_display(xe))
+	if (!runtime && has_display(xe))
 		intel_display_driver_resume_access(xe);
 
 	/* MST sideband requires HPD interrupts enabled */
@@ -391,7 +392,8 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	if (has_display(xe)) {
 		drm_kms_helper_poll_enable(&xe->drm);
-		intel_display_driver_enable_user_access(xe);
+		if (!runtime)
+			intel_display_driver_enable_user_access(xe);
 	}
 	intel_hpd_poll_disable(xe);
 
-- 
2.34.1

