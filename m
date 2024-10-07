Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CEECFB45F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 20:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8710E417;
	Mon,  7 Oct 2024 20:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZ78yEfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDED10E41E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 20:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728332199; x=1759868199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rOQ5UTgOql2/QHb9qBTakQ3pAMQnRmJeycyC9ExN6gU=;
 b=QZ78yEfOsqD0gN6dembuTbrQl7NVQ6Eeku4Ao6YuJ+TFuqCNmNjtrod6
 5Q82TqDpXy8BEQopt38Duky2/U4rmn1IQAuDVnVM6X9OZwmQzHYaqPoRx
 1bIXhhU9HyWCv7OCY9xxldbAWLGyk8Td38vey3JVQVJMjvYrBcn6V8Kth
 fshH6gs1LesiikT0zKzrK9X9wzzqqp8TLsbK60zsu2pBbW5TtYKJV2v2S
 Gu/iNrkA086dnQkvgls3M8sEWY3cCP2xZ82z9/Wekj6qhLJXLCarIoJeP
 E9na8gwAavgAqk0J0EoMOMuxyY7C0NdvTAXgATL7iipveqFe128lRn3UQ A==;
X-CSE-ConnectionGUID: qBWKa8O+TkewhAUke3DUbQ==
X-CSE-MsgGUID: GvtwvJghRDyKHYxjRj5SCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="44968872"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="44968872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 13:16:38 -0700
X-CSE-ConnectionGUID: L7aeyOsnT+m1e7opssGioQ==
X-CSE-MsgGUID: njrIU+ZfR3+9dS/vsHca4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75964181"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2024 13:16:37 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v4 4/4] drm/xe/vf: Defer fixups if migrated twice fast
Date: Mon,  7 Oct 2024 22:16:31 +0200
Message-Id: <20241007201631.3369513-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007201631.3369513-1-tomasz.lis@intel.com>
References: <20241007201631.3369513-1-tomasz.lis@intel.com>
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
index 97ab66edd711..1d4f278cb7a6 100644
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

