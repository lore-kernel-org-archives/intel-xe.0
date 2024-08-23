Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EBC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 11:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B10610E4AB;
	Fri, 23 Aug 2024 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLJB/YhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B3E10E4AB
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724412134; x=1755948134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C1f0Zw50nJ9so+146jQdm8iruFDh4HlywJBUbdAXGRw=;
 b=eLJB/YhI8eUK6ih0JUVdTFsy8nZ3/zqwmNA5Th1lo3+Q4ggR5QBHc5Uq
 OCrQx936HRNK7esaQAajnnDlSwClSyPY6urv1ohNeFjS7EYwfxxz2UGxP
 CrVPH7nJb3EnMBPCK19ejL3D8AJSK5tXtKO4WoUgrq4/oiWNiByhFZEue
 9BssDN4K5CmOk0e+XyUcKmp3ulFqWmi0E5isl0BT4c7SHTqZgNdlcxzLz
 aiiSWvqtrPaANjPVHFwJck/gTZir4N+LU8oohCGdWzphLL2JosdHMTf9N
 YYCWGQxtQ6Qhw/6XgSlUolp20hLz64DzCJt9Sialt8KDYtvyo2guzZ3MI A==;
X-CSE-ConnectionGUID: 55of1pDPTqaHlfWetA+a/A==
X-CSE-MsgGUID: +5fZ/QC/Qzq42U2b2euXpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23000475"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23000475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:22:14 -0700
X-CSE-ConnectionGUID: yZXEvqJbSRyL/sHyVgNbzQ==
X-CSE-MsgGUID: 0mU6JfNkTbunYrvOVsHiRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61473822"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.4])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:22:11 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrjala@intel.com
Subject: [PATCH v4 1/3] drm/xe: Suspend/resume user access only during system
 s/r
Date: Fri, 23 Aug 2024 14:21:46 +0300
Message-Id: <20240823112148.327015-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823112148.327015-1-vinod.govindapillai@intel.com>
References: <20240823112148.327015-1-vinod.govindapillai@intel.com>
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

v2: rebased

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
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

