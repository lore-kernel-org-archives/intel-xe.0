Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA23FD1BDF7
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 21:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E04310E4E1;
	Mon,  4 Nov 2024 21:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwWXEDoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA0E10E4E0
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730756097; x=1762292097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EdOaVvEzuspU+Ub16o3oB1B/OTxvbnm8C6grlwE0wjQ=;
 b=PwWXEDoqo+TN8+lF2+NDKYVdb4wqr5GHCGKrg72SHPZrMCEMdbfS/sTj
 oOMogCT5KjY0ixI7RTqyarI5JqQtoW7kSVtfbKJbZ1GkseOxJ/JkFFGuT
 CmLx9reEGBeFX8Nw/SbhMN0S6JvKKREAP/HTdqWMAfJy3YGbunzKsGaNW
 d0FOd7RAsDRIWeA2/Jn8i8pju5uD3XAf43eHCDMcQUULxysPBe90I5ldw
 feRCpwpwrNWGJJm4SBw2Gz2enknLcJUkYLeVKg/XQGEVYD+lP4RV7UcZQ
 iUJ8F4NZO7m7rIsTTfm9MgmZzmjEFhagKCAhgUW1ToYQFkCX/T3o8Q5JS A==;
X-CSE-ConnectionGUID: 568gEp0kT66lcSsM+w1TWQ==
X-CSE-MsgGUID: 74xKdu9MSRO5bSCW/LdRNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30638530"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30638530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:34:57 -0800
X-CSE-ConnectionGUID: OWv5hddBSPGUiOVyaMTg8g==
X-CSE-MsgGUID: 8IJ8A8AqQ8Ku4edwQESAFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84208455"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 13:34:56 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v6 4/5] drm/xe/vf: Start post-migration fixups with
 provisinoning query
Date: Mon,  4 Nov 2024 22:34:48 +0100
Message-Id: <20241104213449.1455694-5-tomasz.lis@intel.com>
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

During post-migration recovery, only MMIO communication to GuC is
allowed. The VF KMD needs to use that channel to ask for the new
provisioning, which includes a new GGTT range assigned to the VF.

v2: query config only instead of handshake; no need to get pm ref as
 it's now kept through whole recovery (Michal)
v3: switched names of 'err' and 'ret'  (Michal)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index db9441f303f5..954177e5333f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -25,6 +25,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 }
 
+/**
+ * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
+ * @xe: the &xe_device struct instance
+ *
+ * After migration, we need to re-query all VF configuration to make sure
+ * they match previous provisioning. Note that most of VF provisioning
+ * shall be the same, except GGTT range, since GGTT is not virtualized per-VF.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
+ */
+static int vf_post_migration_requery_guc(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err, ret = 0;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_vf_query_config(gt);
+		ret = ret ?: err;
+	}
+
+	return ret;
+}
+
 /*
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -40,12 +65,23 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 
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

