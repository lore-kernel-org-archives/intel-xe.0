Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C80EE0213
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D30E10E778;
	Wed, 11 Sep 2024 15:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hovs02vD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C63210E778
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726068599; x=1757604599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySsUZ3dHdLyMqd1aPPY8pOGjklBgtgc0q96OHBPnR+g=;
 b=Hovs02vD23UN8Za8HO36ERIAE4a1TCCX+Lq8nLVdisHYUer1MYBn8xmy
 9b4VjOrhByZ7UKzGf1KXne5LIla6DkKEc0hpfHZw/aYzKrjiKSFn681ka
 ovGI2lR0ba/LrD27db6MINRIAh8ZXifDdt5mKD5t+83rB9BZ98EVuOcdZ
 64SM3BKXBDP0E3HL0egwDKFfB+Z1tHtFQ5EWsOqPXgaH22k+UtLrVYwVc
 YbvBfqW1xaj6vZFNpvEGCtErsFwp2kn29hwzczM+xpZLeJfqNBVbV8uIu
 U3PlQZfepCZEdo+y8cACu3NEsJsfUvOXzF79zr9putuF7Q/YoIdlLEYyR A==;
X-CSE-ConnectionGUID: y4kVUz5tTpa2lCza2MhZIQ==
X-CSE-MsgGUID: wd9EtpGxRBetrQti13S/3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36014222"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="36014222"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:29:58 -0700
X-CSE-ConnectionGUID: amMiF05zQ+OMNbgglJjasw==
X-CSE-MsgGUID: pAGepPkJRXeYuwD9JWWwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="72182612"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 08:29:57 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, rodrigo.vivi@intel.com, imre.deak@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/xe/display: Do not suspend resume dp mst during
 runtime
Date: Wed, 11 Sep 2024 20:57:23 +0530
Message-ID: <20240911152724.693560-2-suraj.kandpal@intel.com>
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

Remove intel_dp_mst_suspend/resume from runtime suspend resume
sequences. It is incorrect as it depends on AUX transfers which
itself depend on the device being runtime resumed. This is
also why we see a lock_dep splat here.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index c0e9aa7a274f..a09062b7687d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -342,7 +342,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	xe_display_flush_cleanup_work(xe);
 
-	intel_dp_mst_suspend(xe);
+	if (!runtime)
+		intel_dp_mst_suspend(xe);
 
 	intel_hpd_cancel_work(xe);
 
@@ -407,7 +408,9 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 		intel_display_driver_resume_access(xe);
 
 	/* MST sideband requires HPD interrupts enabled */
-	intel_dp_mst_resume(xe);
+	if (!runtime)
+		intel_dp_mst_resume(xe);
+
 	if (!runtime && has_display(xe)) {
 		intel_display_driver_resume(xe);
 		drm_kms_helper_poll_enable(&xe->drm);
-- 
2.43.2

