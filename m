Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F5EC531DC
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D64810EA61;
	Sat, 10 Aug 2024 01:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yef+tmyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3410EA54
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xc8eKmG+mV8iku4V0RApQIPPuIVsBItjqfS440+WeXQ=;
 b=Yef+tmyjX9ExM5fhib0DG6rUsGkkWvCBZkcqQINpvAT4Kvd5mGdlQj/5
 xjlHZGlUZfd4Mnm/YF4nU1cxHaygygKusYxwLQ4TsRkdCDAEAdSoAn4r4
 f/UpFx+WDWilZTIvixTiHXvx/BSvGCYHsPFgElaxf/Rv8ONg4q4Cn7x5m
 KhA8TrSlYeXAPNj/lRrRr3gELEoBqDcnlmsnjJ9LQwATqJI4+K+95e4v9
 3kqwY3DeetkKVODu5SymK2DschaKdPiR4nP8h/TPCkqo/xkaePpC8/ExI
 4lkTtVcQ4ri9deTlyc+Jy+Pa+G56eeuatF9YV2jhTl1FrZ1yE6pBX5XBV Q==;
X-CSE-ConnectionGUID: QOq09hroQKuRdPdFojMQcw==
X-CSE-MsgGUID: PakZxQptRu6+QndOk9OmfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420025"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: b6xCsqr6QmO2kDewnoC/9w==
X-CSE-MsgGUID: UUTdc/RcSoW1QW7aYqUrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813383"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/11] drm/xe/uc: Use devm to register cleanup that includes
 exec_queues
Date: Fri,  9 Aug 2024 18:55:36 -0700
Message-Id: <20240810015544.3443258-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Exec_queue cleanup requires HW access, so we need to use devm instead of
drmm for it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c        | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 8a9b3c50a588..8a137cb83318 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -437,7 +437,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
 	return ret;
 }
 
-static void free_resources(struct drm_device *drm, void *arg)
+static void free_resources(void *arg)
 {
 	struct xe_gsc *gsc = arg;
 
@@ -495,7 +495,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 	gsc->q = q;
 	gsc->wq = wq;
 
-	err = drmm_add_action_or_reset(&xe->drm, free_resources, gsc);
+	err = devm_add_action_or_reset(xe->drm.dev, free_resources, gsc);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..2adf551500cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -284,7 +284,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	free_submit_wq(guc);
 }
 
-static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
+static void guc_submit_wedged_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_exec_queue *q;
@@ -877,7 +877,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 
 	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
-	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
+	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
 		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
-- 
2.34.1

