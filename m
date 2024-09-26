Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF2DCDE03F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 22:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F74A10E323;
	Thu, 26 Sep 2024 22:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFjR/WZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38310E322
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727389210; x=1758925210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZss4l7lvpso5no5nktyWPVzMTtW15Tlzc+Kzh0/iN8=;
 b=WFjR/WZrCb4cS1DIyC7fTyAWeBiEeOhajRnVamJcvamkq6Vu+OxnmBQX
 MVV9dEGF2agKJnLyiNZV7wNaayIzBFz68RU8PivTtrGaUx58yws3mrhY1
 IOL0BnkT9PljLZl6btuq1+4GhFuyxlEVQmENxDNLt+2EhSTLHj1W5SDF7
 +mnKNUVYZb7Fvv8j5f6HBjBLyQbOnKRQySJ8SSlyeWsc0YlzrhetPeqkN
 8qA+DjwBjU2/GDjuuyBLUOn0BJrMf8HUMJaSbHrIYjWzRIAG33mnQFp9x
 00AyWLyY6LoB+o+SO4r/OxYOOl+Xv7yNJ/FF/FVkLqKP4DhX7/AcAz8OP Q==;
X-CSE-ConnectionGUID: oPLLhu3gRL+Iv9MYUyO/wg==
X-CSE-MsgGUID: DPYoE5p0RD29WbBtcGFt+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26617040"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26617040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 15:20:10 -0700
X-CSE-ConnectionGUID: beV2I2XATM6w2jr1ObynVQ==
X-CSE-MsgGUID: wO/VB1YZRTGg11X2Nl9gJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72636217"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2024 15:20:09 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v3 4/4] drm/xe/vf: Defer fixups if migrated twice fast
Date: Fri, 27 Sep 2024 00:20:04 +0200
Message-Id: <20240926222004.2462345-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926222004.2462345-1-tomasz.lis@intel.com>
References: <20240926222004.2462345-1-tomasz.lis@intel.com>
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
index 457380ca9636..06fdc1201a0c 100644
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
  * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
  * @xe: the &xe_device struct instance
@@ -61,11 +74,17 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
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
@@ -75,6 +94,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
 	err = vf_post_migration_requery_guc(xe);
+	if (vf_post_migration_imminent(xe))
+		goto defer;
 	if (unlikely(err))
 		goto fail;
 
@@ -83,6 +104,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
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

