Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35882CF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 20:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068FE10E745;
	Tue, 24 Sep 2024 20:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/4gBdRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B0C10E741
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727209561; x=1758745561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11IYnFNHwa4qF2WVbgFuopUkpyJ5DmIS8vIv5eg9tBw=;
 b=i/4gBdRUS13anCiTr+LthvdTiXDe4bXPT1eCEdBfH0+68l+TFeeAMAFw
 9pfLVz9PZjFcjxFddVchKbRz2ewtSUMRKkE0rZ2sNuMCvq1ZAl2tPYtzG
 gOJ/FZCBU+CPDFZNW0vF6Yz8lX8CzQmq/3ZxRAJmAQDd81tWK0EJHQLvw
 vwvK81PW/kMfS8yRz89Rack6oLwQ1BJ69AVdnAnu+c2ElNd+xELhc7V5N
 ElvdibV+OlFLz59qOK2MVYsSS6dspjiryLSRZN+Zz1x9KZ91QJwiSE1tw
 X8YyIUOs3dbO5LmYWA3QGuB0UX4FyCBBYm7yquijdtU/4zpgRPucVdrXo A==;
X-CSE-ConnectionGUID: Xy0hka0wSoCxBmJIvL0q8g==
X-CSE-MsgGUID: 9aUbOioMRUul/9LO574dew==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51647414"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="51647414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 13:26:01 -0700
X-CSE-ConnectionGUID: BK/1QOqeSV6ovMQsfOFqpg==
X-CSE-MsgGUID: e8Ti86tTSOe6G8jpOn+swQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76335603"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa003.jf.intel.com with ESMTP; 24 Sep 2024 13:25:59 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/4] drm/xe/vf: Defer fixups if migrated twice fast
Date: Tue, 24 Sep 2024 22:25:53 +0200
Message-Id: <20240924202553.1541574-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924202553.1541574-1-tomasz.lis@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
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
index fe5eefa736c8..f326e507d73e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -52,6 +52,19 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * vf_post_migration_imminent - Check if post-restore recovery is coming.
+ * @xe: the &xe_device struct instance
+ *
+ * Return: True if migration recovery worker will soon be running. Any worker currently
+ * executing does not affect the result.
+ */
+static bool vf_post_migration_imminent(struct xe_device *xe)
+{
+	return xe->sriov.vf.migration.gt_flags != 0 ||
+	work_pending(&xe->sriov.vf.migration.worker);
+}
+
 /*
  * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
  * @xe: the &xe_device struct instance
@@ -63,11 +76,17 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 	int err, num_sent = 0;
 
 	for_each_gt(gt, xe, id) {
+		if (vf_post_migration_imminent(xe))
+			goto skip;
 		err = xe_gt_sriov_vf_notify_resfix_done(gt);
 		if (!err)
 			num_sent++;
 	}
 	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
+	return;
+
+skip:
+	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
 }
 
 static void vf_post_migration_recovery(struct xe_device *xe)
@@ -77,6 +96,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
 	err = vf_post_migration_requery_guc(xe);
+	if (vf_post_migration_imminent(xe))
+		goto defer;
 	if (unlikely(err))
 		goto fail;
 
@@ -85,6 +106,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
 	return;
+defer:
+	xe_pm_runtime_put(xe);
+	drm_dbg(&xe->drm, "migration recovery deferred\n");
+	return;
 fail:
 	xe_pm_runtime_put(xe);
 	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
-- 
2.25.1

