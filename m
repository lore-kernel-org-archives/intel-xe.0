Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA7DD1BDF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 21:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BB010E4DD;
	Mon,  4 Nov 2024 21:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxLaEIlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D916210E4E1
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730756098; x=1762292098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QOnhyR6AS/fCOdm1ofp/76GIuLbCtZKBBbNvGUDbasY=;
 b=cxLaEIlgCyn3dcDzpHH5bsmzzfaK9IroQpEhYzGSU5+hClEFycoghnq4
 /SCHGI6bGl99N/VzVYy6cEulL8UebYOePMvR6l+ok2bWnSQxMwz8izr1S
 j5ccc88Q3TosenKV7ZXx5rli3sk0kwrwMLCX/O3fy3B/COJQev5slObv1
 oejQh6LqEVF8e/y9CcgLYyTXKAZNUQkDdKIoY9vRCZn9/rrHDCGxjiREG
 0LXPSHDfwVGnDZWtD1F8RJjJ8c3AjFUGPujpIqGVIJVy7vBwssBGqEnbw
 SXAgc1m19qXUn9/U8TQ1X5LgvSk3W0gLeuai6z9T1+HiFLpGB4y0bHQRp Q==;
X-CSE-ConnectionGUID: IYeZatDFRMK2KfTPmtIbTA==
X-CSE-MsgGUID: AuAEt7i1SDibywxf10POpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30638531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30638531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:34:58 -0800
X-CSE-ConnectionGUID: XQ4Twu7oTP6XTIVN4Z/HFA==
X-CSE-MsgGUID: YEr9mCq6Q9qITUzPvaPhtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84208458"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 13:34:57 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v6 5/5] drm/xe/vf: Defer fixups if migrated twice fast
Date: Mon,  4 Nov 2024 22:34:49 +0100
Message-Id: <20241104213449.1455694-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104213449.1455694-1-tomasz.lis@intel.com>
References: <20241104213449.1455694-1-tomasz.lis@intel.com>
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
index 954177e5333f..8ab40df86c7e 100644
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

