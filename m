Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20083CF9C69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 22:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF22C10E877;
	Fri, 20 Sep 2024 22:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjwVhUxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7606510E877
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726871373; x=1758407373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cr7/ciSb6VUbC5qQw5OONxltLWimKBvyp9SxdHEevu4=;
 b=ZjwVhUxKIcd4j2f8EgdZhO0NY56pd6Ekh1CEuUB+qNJvfZNYC/o4cBM1
 ornkC4iXyOUMpswtkDvtdCXc8v29QeF8L8DvWlpMFBpKoM4HvTyslnnmu
 jp+gJYV/JGmdVLxMJO6VW3/WXCvWuM9jyMrRhPq2JhBlT96vLXpU4w90R
 kAr7BjDlWWoeHI8eHrf5bSxV3OjEowXeuQ7ggcoz+L/QEaR7StLThrple
 F0YyhZiJJd7SKW2P6V2S0AhPXbMG0Qy6SbsuvOieS8mDs10eWZx10l5XM
 tiCocmS0+b9cyvz/INhSog0jDyQDbyCnTvAhCr/4P8JGruad5X7zqvy2r A==;
X-CSE-ConnectionGUID: bNejkkx6TBenw0Y4241MgQ==
X-CSE-MsgGUID: 6eCjyrN2T3+93g2uSWZJzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13616072"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="13616072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 15:29:33 -0700
X-CSE-ConnectionGUID: FuYrRN1dTlubG+JVXmfdAA==
X-CSE-MsgGUID: uh+sPii8S6mUHJa7HxG/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70328113"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 15:29:32 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 4/4] drm/xe/vf: Defer fixups if migrated twice fast
Date: Sat, 21 Sep 2024 00:29:26 +0200
Message-Id: <20240920222926.846985-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920222926.846985-1-tomasz.lis@intel.com>
References: <20240920222926.846985-1-tomasz.lis@intel.com>
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

If another VF migration happened during post-migration recovery,
then the current worker should be finished to allow the next
one start swiftly and cleanly.

Check for defer in two places: before fixups, and before
sending RESFIX_DONE.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 3cea2d21525f..93817cf21701 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -52,6 +52,19 @@ static int vf_post_migration_reinit_guc(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * vf_post_migration_imminent - Check if post-restore recovery is coming.
+ * @xe: the &xe_device struct instance
+ *
+ * Returns if migration recovery worker will soon be running. Any worker currently executing
+ * does not affect the result.
+ */
+static bool vf_post_migration_imminent(struct xe_device *xe)
+{
+	return xe->sriov.vf.migration_gt_flags != 0 ||
+	work_pending(&xe->sriov.vf.migration_worker);
+}
+
 /*
  * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
  * @xe: the &xe_device struct instance
@@ -64,12 +77,19 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
+		if (vf_post_migration_imminent(xe))
+			goto skip;
 		err = xe_gt_sriov_vf_notify_resfix_done(gt);
 		if (!err)
 			num_sent++;
 	}
 	xe_pm_runtime_put(xe);
 	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
+	return;
+
+skip:
+	xe_pm_runtime_put(xe);
+	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
 }
 
 static void vf_post_migration_recovery(struct xe_device *xe)
@@ -78,6 +98,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	err = vf_post_migration_reinit_guc(xe);
+	if (vf_post_migration_imminent(xe))
+		goto defer;
 	if (unlikely(err))
 		goto fail;
 
@@ -85,6 +107,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	vf_post_migration_notify_resfix_done(xe);
 	drm_notice(&xe->drm, "migration recovery completed\n");
 	return;
+defer:
+	drm_dbg(&xe->drm, "migration recovery deferred\n");
+	return;
 fail:
 	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
-- 
2.25.1

