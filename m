Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F09C52D7D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 06:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FDA10E646;
	Thu,  8 Aug 2024 06:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8B+WO1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAA610E646
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 06:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723096851; x=1754632851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJKNtAlp9VSdjQPl6MDRzxQp4GcjrurHz+97xYdZLPg=;
 b=P8B+WO1fAFA7mwL17M5q14U4rnWxLqj5QJQT9BDunWdOz0P56WWO77N2
 SzgcdQ6gIg5gsIC6FyDCtSFzY4p6vE7hJ6qrS/YsqWCzG5OuQxa+o/fIG
 /Ck/qCDFmb3fUTacIU9lRqcE0RbdzsidE3E/FZu1SHFYXJy/hnEh5hgX6
 PxG5yKc46ChbN02tqXzouSZbT15jwxJMDYQwPNCWlGcur/mwIrhHB1aLJ
 FlgUrAdsMGdmWR84/TuoGxGUD9JAIGtTuo7w7QDtfks8omAbZT9FPYhYx
 ZkumIiHOSFmwv86oc6IUn4GZ441+6MkCQJXYaNwYrmEEydOz4jQ0ZT5t9 g==;
X-CSE-ConnectionGUID: 1xmrhmbHRiGMGKoaKPEgcQ==
X-CSE-MsgGUID: gVxBZlqZTE63CKbWYePccQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25075183"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25075183"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:00:51 -0700
X-CSE-ConnectionGUID: R7RTvGZoTZWdixdUqrzMuA==
X-CSE-MsgGUID: iObh7v/RRYmGT4MJvHbXEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="88014205"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2024 23:00:49 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/2] drm/xe: Init MCR before any mcr register read
Date: Thu,  8 Aug 2024 11:32:51 +0530
Message-Id: <20240808060251.510586-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808060251.510586-1-tejas.upadhyay@intel.com>
References: <20240808060251.510586-1-tejas.upadhyay@intel.com>
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

enable host l2 RAM is example where MCR register is
getting read before fully MCR init is done. Lets move
MCR init early and merge early mcr init into main MCR
init.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  3 +--
 drivers/gpu/drm/xe/xe_gt_mcr.c | 21 +++++----------------
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 -
 3 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c6296dc8897f..e2e3a1eabde8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -555,7 +555,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out;
 
-	xe_gt_mcr_init_early(gt);
+	xe_gt_mcr_init(gt);
 	xe_pat_init(gt);
 	xe_gt_enable_host_l2_vram(gt);
 
@@ -568,7 +568,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 		goto out_fw;
 
 	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
 
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 6d948a469126..9c4c4a627bc4 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -375,22 +375,6 @@ static const struct {
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
 };
 
-/**
- * xe_gt_mcr_init_early - Early initialization of the MCR support
- * @gt: GT structure
- *
- * Perform early software only initialization of the MCR lock to allow
- * the synchronization on accessing the STEER_SEMAPHORE register and
- * use the xe_gt_mcr_multicast_write() function.
- */
-void xe_gt_mcr_init_early(struct xe_gt *gt)
-{
-	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
-	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
-
-	spin_lock_init(&gt->mcr_lock);
-}
-
 /**
  * xe_gt_mcr_init - Normal initialization of the MCR support
  * @gt: GT structure
@@ -401,9 +385,14 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
+	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
+	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
+
 	if (IS_SRIOV_VF(xe))
 		return;
 
+	spin_lock_init(&gt->mcr_lock);
+
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 8d119a0d5493..e7d03e001a49 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -12,7 +12,6 @@
 struct drm_printer;
 struct xe_gt;
 
-void xe_gt_mcr_init_early(struct xe_gt *gt);
 void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
-- 
2.25.1

