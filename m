Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C01ECF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 22:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198C410E87C;
	Fri, 20 Sep 2024 22:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFp54/bL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E72C10E877
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726871372; x=1758407372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=biFW93w6zU7RR61c4T7ugYCRYfMfkL62OpmH3GVAdxg=;
 b=JFp54/bLsaeMmaReC861MgVQnMs7J5Zk7pbllPPegdgaXPm0EJFquxz6
 4tf+5PEV787nL/IjTSLaNcCZV6Uwxm4xHDT0AoFbWbwglMsUt2WS0q/ND
 ixqsYa8vqf/NkWfL1N4lro/EWCdHCxOACdAQtGAJE8Ne+KENwyYTX4VkN
 mds15hRZnE52VX5NyroNuWahuDkty0dbkpb2ULGf9vlfVQJSvsYT4lQJd
 i9e8OBdLnhkZqQ2aMuBaSyLU8N3RFv7JAe/lyu9W8Z7Ai4UfAsHzDJDYy
 2sB3ItWTJ1wCh8khYAU3e3lneFpNFkihdTGBmsNYxwEC1/P4mlIlNhA52 g==;
X-CSE-ConnectionGUID: AD5BrgYDRVSjf+wB0HXZnQ==
X-CSE-MsgGUID: s0yy56jnTBG2whyM41AV3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13616071"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="13616071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 15:29:32 -0700
X-CSE-ConnectionGUID: 8Y/QusrgRjKgquXJSaWing==
X-CSE-MsgGUID: 1dHDrSLiQfazPPY0i/Ibng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70328108"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 15:29:31 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 3/4] drm/xe/vf: Start post-migration fixups with GuC MMIO
 handshake
Date: Sat, 21 Sep 2024 00:29:25 +0200
Message-Id: <20240920222926.846985-4-tomasz.lis@intel.com>
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

During post-migration recovery, only MMIO communication to GuC is
allowed. But that communication requires initialization.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 459fa936aaba..3cea2d21525f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -22,6 +22,36 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&xe->sriov.vf.migration_worker, migration_worker_func);
 }
 
+/**
+ * vf_post_migration_reinit_guc - Re-initialize GuC communication.
+ * @xe: the &xe_device struct instance
+ *
+ * After migration, we need to reestablish communication with GuC and
+ * re-query all VF configuration to make sure they match previous
+ * provisioning. Note that most of VF provisioning shall be the same,
+ * except GGTT range, since GGTT is not virtualized per-VF.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
+ */
+static int vf_post_migration_reinit_guc(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err, ret;
+
+	err = 0;
+	xe_pm_runtime_get(xe);
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_vf_bootstrap(gt);
+		if (!err)
+			err = ret;
+	}
+	xe_pm_runtime_put(xe);
+
+	return err;
+}
+
 /*
  * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
  * @xe: the &xe_device struct instance
@@ -44,10 +74,20 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
+	int err;
+
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
+	err = vf_post_migration_reinit_guc(xe);
+	if (unlikely(err))
+		goto fail;
+
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	drm_notice(&xe->drm, "migration recovery completed\n");
+	return;
+fail:
+	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
+	xe_device_declare_wedged(xe);
 }
 
 static void migration_worker_func(struct work_struct *w)
-- 
2.25.1

