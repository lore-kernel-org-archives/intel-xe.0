Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C84FC531DB
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F61410EA2D;
	Fri,  9 Aug 2024 23:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXC5VbEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551F210EA2D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 23:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723245170; x=1754781170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxOIk7Q5vhWfMEmdUAP1Wf52Zwe0g1+ai+kWqhl5Sns=;
 b=lXC5VbEnKStV8MnXjE7UZ3Rk3no9hQf2l5y7nXkVNaIIetqJjOZ2ug4w
 ziH7jauw1TbqLoppc7L+EVl/Q1pKy8qJbvLj+TjMOHLMHJFocz/VPpv9e
 e+Fr98u/Ovc8R2Op5L6FNWq0IXXDUNBViofUnoeboUdajFHelnJ54gbmL
 xTDAbNGGGj4IqCg1nvH6xAkBDOGT2yCFt6PSnK+zP9xxpHyX/0uQGRD5l
 AAp7Bl23I1JgP+3DMQwaQ2qw23AYnywfQss1HVAXjZJ37NuziqHgi8rFX
 QdSDpGbLuKGnWOxlgpuyqX8Dr4/rZI1xPuZqEIisFS9gnnOpSHblqaoVj w==;
X-CSE-ConnectionGUID: +PWsg55HRrmpDA3VakU67Q==
X-CSE-MsgGUID: 1CQ6mm0hSnKHrv9cChe1KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32845949"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32845949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:12:50 -0700
X-CSE-ConnectionGUID: sgz1L72nSqqahYSRtv+APQ==
X-CSE-MsgGUID: zjEdaX1AQ8+3lbRtJ0hgPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62107101"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:12:50 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 3/3] drm/xe/uc: Use devm to register cleanup that includes
 exec_queues
Date: Fri,  9 Aug 2024 16:12:37 -0700
Message-ID: <20240809231237.1503796-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
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

Exec_queue cleanup requires HW access, so we need to use devm instead of
drmm for it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c        | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index b84f2e020c8c..9614d9e6617e 100644
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
2.43.0

