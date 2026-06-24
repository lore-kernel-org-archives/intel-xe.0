Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F82CDE005
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6577610EF6A;
	Wed, 24 Jun 2026 14:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8Ow9EjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A4910EF6B;
 Wed, 24 Jun 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311851; x=1813847851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJoXYt/YkjiRDkKwmndgjM5w+GV/Aij3L6Cgid1od7s=;
 b=C8Ow9EjLpDJRWkoBWuyk+peoGan0DRBy6BazyBkThYcuesXCIck/wmkX
 KUtwvp6NV/dCpcBQ+VT9YsPqw9YYnpWXDNH47YD5TJpNxcnkqmjMJiWz6
 w0G+vazeTXW23c/TFBvftWetRHdVjoEfIAPSf5l2GoiMIewV+Pzbm5wao
 F4yVGWRkldEFVrQyy3I+g5ERMxdsT4Qu/os0S0aE0wungBBJMHuNSXVkT
 rHmuYOC75gekXyGKyCh/BznY27+Gw7M45MqUvRa76tdi1d/BI0zO584pc
 +bX7s1/3Q+wkwjSqydKpS/lhaXc0a/rwXrmpDFij0jvMD77UJM84s48t5 g==;
X-CSE-ConnectionGUID: GmPl+eFrT1OQpZGL9bAHkA==
X-CSE-MsgGUID: qP63o8uoTeSmTT1WtzB+mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86920329"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86920329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:31 -0700
X-CSE-ConnectionGUID: 7JmDqfqySvGy8BhYyMBM1A==
X-CSE-MsgGUID: 3CvGSTEbTEGZ22CWthXBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253799162"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 6/8] drm/xe/display: separate d3cold handling from
 xe_display_pm_runtime_suspend_late()
Date: Wed, 24 Jun 2026 17:36:53 +0300
Message-ID: <447270c818c716a64dc88caa9650ee6455107fa0.1782311749.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782311749.git.jani.nikula@intel.com>
References: <cover.1782311749.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Make the special d3cold paths completely separate from the rest of the
runtime pm calls.

The intel_dmc_wl_flush_release_work() call right after
xe_display_pm_suspend_late() might be completely redundant, but this
avoids any functional changes.

Wiggle the comment while at it. It gets duplicated for now, but this
will be addressed in the follow-up.

v2: Update comments

Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 493e9e09b6c9..bdafc010fae1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -389,14 +389,14 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	if (xe->d3cold.allowed)
+	if (xe->d3cold.allowed) {
 		xe_display_pm_suspend_late(xe);
+		/* Ensure the wakelock release work gets flushed */
+		intel_dmc_wl_flush_release_work(display);
+		return;
+	}
 
-	/*
-	 * If xe_display_pm_suspend_late() is not called, it is likely
-	 * that we will be on dynamic DC states with DMC wakelock enabled. We
-	 * need to flush the release work in that case.
-	 */
+	/* Ensure the wakelock release work gets flushed */
 	intel_dmc_wl_flush_release_work(display);
 }
 
-- 
2.47.3

