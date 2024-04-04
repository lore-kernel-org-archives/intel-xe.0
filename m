Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40776CD129A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 19:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99BA11346E;
	Thu,  4 Apr 2024 19:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX6JzXvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924011346E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 19:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712259427; x=1743795427;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=giAFxvM60J2NXAbyUnEZ3TKYTkylbxedV7MtG0b9jOU=;
 b=ZX6JzXvkzOZc1m/voigqhs2UmHTZuhTnCTP1IKAnGHyNzQWqPCx8ITiH
 bN53rqJOXp4E2Z1OHvm0K/DTnkHdJev5xUVjPMmbPZ9OfIXImgW5yGZOT
 0mVLjb+PHJh7RoeotJbbC5YW/4XC4EkoDmrk77QD0vCYFe+TU9XNeoiw+
 qs3beNGXL7ybMpGtCmtjhazS3hWIYwDqMVWvU2C/0Hg8MX4Df/t2Htbsg
 fQoWEwY7Z1T6+iTSIuU3WWaiUE2M5TlBRwcny+kONRLW7/C1+CL6YzGgZ
 zkyaabJrt4DK6HII7w5O+TbNtcwFPwWboH+xHylY5wnRTUiVidi8hilWD Q==;
X-CSE-ConnectionGUID: 6mG8/pnJRgaZeqplWY3u8g==
X-CSE-MsgGUID: 0fgvJ2aKTgG7eQSZ+sf5MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="19002457"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19002457"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:36:59 -0700
X-CSE-ConnectionGUID: f/LLi9DAReuusg9bZFvKNw==
X-CSE-MsgGUID: GGR+F7HLTEmpesHvlC4cVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19497263"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:36:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/guc: Don't overuse ct_to_xe()
Date: Thu,  4 Apr 2024 21:36:47 +0200
Message-Id: <20240404193647.759-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404193647.759-1-michal.wajdeczko@intel.com>
References: <20240404193647.759-1-michal.wajdeczko@intel.com>
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

Pointer to xe_device might be already available or could be added.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 06952b0480f7..ae255dab6516 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1210,8 +1210,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
-	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
+	ongoing = xe_device_mem_access_get_if_ongoing(xe);
+	if (!ongoing && xe_pm_read_callback_task(xe) == NULL)
 		return;
 
 	spin_lock(&ct->fast_lock);
@@ -1254,6 +1254,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 static void g2h_worker_func(struct work_struct *w)
 {
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
+	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	bool ongoing;
 	int ret;
@@ -1281,8 +1282,8 @@ static void g2h_worker_func(struct work_struct *w)
 	 * responses, if the worker here is blocked on those callbacks
 	 * completing, creating a deadlock.
 	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
-	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
+	ongoing = xe_device_mem_access_get_if_ongoing(xe);
+	if (!ongoing && xe_pm_read_callback_task(xe) == NULL)
 		return;
 
 	do {
@@ -1299,7 +1300,7 @@ static void g2h_worker_func(struct work_struct *w)
 	} while (ret == 1);
 
 	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
+		xe_device_mem_access_put(xe);
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.43.0

