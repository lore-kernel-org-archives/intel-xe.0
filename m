Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E6D3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292A010E060;
	Tue, 29 Oct 2024 19:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsXRBouJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4310E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230806; x=1761766806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4UHbgE1saJHALjdyIHwDytadTiImItDIw7/AN64r2M=;
 b=FsXRBouJhiEOQotd3NDMoEwzlnUQgECAoCP9deJCoCPkvSRjmduYzLgj
 YNwufm2bSondwFysHOl+wkCChO9NJFAfYLP0VmoXTilpE0a+jDuAvUDhP
 ccUMUqo4GTrO80/cEE0LIuMXIZ6tRy8yTdz3ju8t8MJxzDa+sg5moQ2WQ
 w4q5wKFG5aLEX8Jlm2Emi8XrIMGNgInq+oBQ/IVJiA2W6+Nfn4eeGLm3W
 PYqZZkvLirjQ/BIe3Ly+DgMYRZ5FF/IgMsiLlRR9KycOWgmV/MMjOE2j5
 DwVMluYz7d6YILSYWuOEsOWYq5WfayFjFEC2wkG1Au9WP8yhShZnpAN7y Q==;
X-CSE-ConnectionGUID: cMbufcyKQTiO5NP5NMPa0w==
X-CSE-MsgGUID: tUnLX2bJTK62Hp/ux28NVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17537366"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17537366"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:40:06 -0700
X-CSE-ConnectionGUID: eJ1vZpFXSu+d/0FyYl94oA==
X-CSE-MsgGUID: aMcgH+Z6Sbmj8L/7yu7mZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81996581"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 12:40:05 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v5 5/5] drm/xe/vf: Defer fixups if migrated twice fast
Date: Tue, 29 Oct 2024 20:39:56 +0100
Message-Id: <20241029193956.1043614-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029193956.1043614-1-tomasz.lis@intel.com>
References: <20241029193956.1043614-1-tomasz.lis@intel.com>
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
index 6aac4e7d5945..1352584669c8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -50,6 +50,19 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
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
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -59,8 +72,14 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 	unsigned int id;
 
 	for_each_gt(gt, xe, id) {
+		if (vf_post_migration_imminent(xe))
+			goto skip;
 		xe_gt_sriov_vf_notify_resfix_done(gt);
 	}
+	return;
+
+skip:
+	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
 }
 
 static void vf_post_migration_recovery(struct xe_device *xe)
@@ -70,6 +89,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
 	err = vf_post_migration_requery_guc(xe);
+	if (vf_post_migration_imminent(xe))
+		goto defer;
 	if (unlikely(err))
 		goto fail;
 
@@ -78,6 +99,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
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

