Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCC3CF9C69
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 20:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2FB10E742;
	Tue, 24 Sep 2024 20:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFBUbSnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540AE10E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727209560; x=1758745560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kvRw5BgeBBe/pUj8PgEgZIFg0dSrzfAbD70JMksQhmU=;
 b=LFBUbSnJoYXwdQ2Rl18g5ejQMqKy1TO/VGfQAfXs+IkRHU6F9oYZYu55
 7w/1YaBwg/CNvl1BUkM5uEXm0FgY1WH3UdSY3c+s7S94zvl8qeE5eoKnL
 422aDuOd8mcEiEE5tcu6si+CRQGqtg7g44IzlLu6vbvSc5BgxM30gzJMo
 yDq8gu9wMvcExpXbH0HlI2xHxcm1Qcvm3Cs8K+8Lx8QKaw/y1v5iyZaEZ
 jMQB4HEBhjIJRcfH5xVTHQWBobxPQyzlpWI0M3saP8kTn96MNShydvos0
 1hEEqGqLlQHfKH6xlzxuajCNH30/zgK/qaLVA6yB6MYrklw3//eQ5hINm w==;
X-CSE-ConnectionGUID: 2lqQaQ2TRdy1RFAkta0Z8w==
X-CSE-MsgGUID: MufRdZ7lSwSFZzGEoeRorA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51647413"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="51647413"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 13:25:59 -0700
X-CSE-ConnectionGUID: uigM3Wu+SzyzvJNK8n+zUg==
X-CSE-MsgGUID: Chms6dURTjiY883+BITOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76335596"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa003.jf.intel.com with ESMTP; 24 Sep 2024 13:25:58 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/4] drm/xe/vf: Start post-migration fixups with
 provisinoning query
Date: Tue, 24 Sep 2024 22:25:52 +0200
Message-Id: <20240924202553.1541574-4-tomasz.lis@intel.com>
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

During post-migration recovery, only MMIO communication to GuC is
allowed. The VF KMD needs to use that channel to ask for the new
provisioning, which includes a new GGTT range assigned to the VF.

v2: query config only instead of handshake; no need to get pm ref as
 it's now kept through whole recovery (mwajdeczko)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index d0c5a0b7e170..fe5eefa736c8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -24,6 +24,34 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 }
 
+/**
+ * vf_post_migration_requery_guc - Re-initialize GuC communication.
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
+static int vf_post_migration_requery_guc(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err, ret;
+
+	err = 0;
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_vf_query_config(gt);
+		if (!err)
+			err = ret;
+	}
+
+	return err;
+}
+
 /*
  * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
  * @xe: the &xe_device struct instance
@@ -44,12 +72,23 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
+	int err;
+
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
+	err = vf_post_migration_requery_guc(xe);
+	if (unlikely(err))
+		goto fail;
+
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
+	return;
+fail:
+	xe_pm_runtime_put(xe);
+	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
+	xe_device_declare_wedged(xe);
 }
 
 static void migration_worker_func(struct work_struct *w)
-- 
2.25.1

