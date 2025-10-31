Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A0BCCF9FA
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 12:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F8F10EB1D;
	Fri, 31 Oct 2025 12:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVlcoAVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5583010EB1D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761913426; x=1793449426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=av0N0LTYe/Anpl1Tlp97Noaya9zebRUwFXvFfC8PgbE=;
 b=eVlcoAVrmDOQUI+o5b0zNnFY29eK1RSmqizLuSExYcnDvjT4dJwZV+Sh
 CODZmw7vp3qhImJHgvYMhZ8nY13PjIlwIKzGsucEsATQg+R2m2d5G5dog
 qXT6Ymx2tS1/7/JgUhNXNPy6t6KVvNfNn1VLDNPYoBZm/3Eyo/u9OqIaY
 ENEw2sG3DKWor5CJ8Yt8Gz5gXfzLDHCC3Di6+jI0CANmG2Kq4wYmLQKlT
 I+8agN4155MRzE/CQMGiytRJ9EBQotLN/KgRYzuxGAgK/ldBML9PTjYiI
 0nFxnjv4r3anjz2foV1eK1rQANpIaBFQoV3nNquElFka3JEXIDFARhtOb w==;
X-CSE-ConnectionGUID: RcySrSlsSVGBCNI8AIhNSg==
X-CSE-MsgGUID: XuqXCy6AQFiLAz3lddLYVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75422706"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="75422706"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:23:46 -0700
X-CSE-ConnectionGUID: p+CPtzwvQQ2jm7USNAEJSw==
X-CSE-MsgGUID: mx3bY5Q2RyG/cu/Vzkq8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="190571714"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO jhogande-mobl3..)
 ([10.245.244.46])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:23:45 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/xe: Do clean shutdown also when using flr
Date: Fri, 31 Oct 2025 14:23:11 +0200
Message-ID: <20251031122312.1836534-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently Xe driver is triggering flr without any clean-up on
shutdown. This is causing random warnings from pending related works as the
underlying hardware is reset in the middle of their execution.

Fix this by performing clean shutdown also when using flr.

Fixes: 501d799a47e2 ("drm/xe: Wire up device shutdown handler")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86d5960476af6..6156be15affba 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -988,21 +988,21 @@ void xe_device_remove(struct xe_device *xe)
 
 void xe_device_shutdown(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u8 id;
+
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
-	if (xe_driver_flr_disabled(xe)) {
-		struct xe_gt *gt;
-		u8 id;
+	xe_display_pm_shutdown(xe);
 
-		xe_display_pm_shutdown(xe);
+	xe_irq_suspend(xe);
 
-		xe_irq_suspend(xe);
+	for_each_gt(gt, xe, id)
+		xe_gt_shutdown(gt);
 
-		for_each_gt(gt, xe, id)
-			xe_gt_shutdown(gt);
+	xe_display_pm_shutdown_late(xe);
 
-		xe_display_pm_shutdown_late(xe);
-	} else {
+	if (!xe_driver_flr_disabled(xe)) {
 		/* BOOM! */
 		__xe_driver_flr(xe);
 	}
-- 
2.43.0

