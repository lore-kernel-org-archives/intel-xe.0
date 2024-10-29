Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0AAD3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FA10E6F4;
	Tue, 29 Oct 2024 19:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKo5ZEZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA06B10E6F0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230805; x=1761766805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4vv55Vt8s4ZiFJI64FgJtLL7488F9vv4nnKPugUnEQ=;
 b=QKo5ZEZCUOd7zRBfNOgtFTRLjd7H4eeXWoxyxeC7kuPOBT5+pfVXgzmb
 d5qkMsffpWOqq9zdDKjQx09Yj+Wm0mvsXb6o7zLRV/NDoiNTzyvPHZysX
 KkrD61AgbIDcbbiRFB14C/mOb12wqxBNc0eHyM5QBPzWRQeiVf4wnNCW/
 yuoAnyoPzoJFOg0zSLPsNWYBoRyOYW/zY0VOxtHimSFAatjnGErZwdWbr
 lT5i9tV1F709/0/IT+w4Jz/B0YVLuUMUWFFUc9L9u5pi5qUAbOqt8Ssem
 QVqsSIgvM/moG09s5wGJUVupeugsOm/0dGq5VMSnps2z13NlgVAiK5JEh A==;
X-CSE-ConnectionGUID: p+w6ATu3TZ+71Kwn99XNFQ==
X-CSE-MsgGUID: iOd2ZsqlRMGZS6jSOZe80w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17537353"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17537353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:40:04 -0700
X-CSE-ConnectionGUID: 78kZEiIrSjCkUrHbMiJQ4g==
X-CSE-MsgGUID: YaFG07LtTvytR12o/BPpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81996561"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 12:40:04 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v5 4/5] drm/xe/vf: Start post-migration fixups with
 provisinoning query
Date: Tue, 29 Oct 2024 20:39:55 +0100
Message-Id: <20241029193956.1043614-5-tomasz.lis@intel.com>
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
index 6343688822d5..6aac4e7d5945 100644
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

