Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F08EE0213
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A2910E997;
	Wed, 11 Sep 2024 15:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtAh9Tvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A09510E778
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726068600; x=1757604600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/954zSR0qVihKmOp++6dXZJDfgg4diCGIHxx2TCiWrI=;
 b=LtAh9TvfnfYufav4iM/HBKgZWfVgDGOkgimo2rWGvVHkj6HmWcir0221
 UHRrc+vurhufk/CGYyib3/eJh2aTa8poh0XQPQPZV7gOkt6gMsmYm3UDx
 Bf2uHIJBLppF/9WP0duDaKnCcgSkPmycSjihzEkEITWenTbqXaPHo03fX
 6S7jBMbBv4iJB+emiolV+sZ7TJXksRf3vFxxUGG7D4PlEg0OhLtc17lK/
 P6uMdi0ivsgdc+o5TMhrGELwN/T5cOgA2LIdnmNutv44+wuyb5U7TdUQq
 71lESuxQ67xzY5WfCjUoKe0xVAMKaUToqQUdgRMDQM5Fzi1pRqizyi1xd w==;
X-CSE-ConnectionGUID: VoTN5q8MRlybHKBbx/6AzQ==
X-CSE-MsgGUID: /qe2UUPDQVinBLQ4/z9egQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36014226"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="36014226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:30:00 -0700
X-CSE-ConnectionGUID: mmzapk7uRmWhiWLC5IfAUw==
X-CSE-MsgGUID: 8aiLBiesSs20q1kxOZnKuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="72182620"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 08:29:59 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, rodrigo.vivi@intel.com, imre.deak@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/2] drm/xe/display: Do not do intel_fbdev_set_suspend during
 runtime
Date: Wed, 11 Sep 2024 20:57:24 +0530
Message-ID: <20240911152724.693560-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240911152724.693560-1-suraj.kandpal@intel.com>
References: <20240911152724.693560-1-suraj.kandpal@intel.com>
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

Do not do intel_fbdev_set_suspend during runtime_suspend/resume
functions. This cause a big circular lock_dep splat.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index a09062b7687d..bf18fd69e1c2 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -333,7 +333,9 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	if (!runtime)
+		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+
 	if (!runtime && has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
 		intel_display_driver_disable_user_access(xe);
@@ -420,7 +422,8 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	intel_opregion_resume(display);
 
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
+	if (!runtime)
+		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 
 	intel_power_domains_enable(xe);
 }
-- 
2.43.2

