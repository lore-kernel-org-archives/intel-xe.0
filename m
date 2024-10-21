Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFED1712E
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 20:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2A10E3CD;
	Mon, 21 Oct 2024 20:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyvKNRVQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A8910E3CD
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541741; x=1761077741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tvzqtbwriAKZvdyo6aQ5KuPLECp8DsaYCbNignRbkUY=;
 b=MyvKNRVQgXPq78ccXFiD/pkH7oO6Db37Sbns1/0dL+XXCxJoMSaVYqsc
 3LFRQUVq6lE8kxuhKjeOPbKlkkKwXxlyYYp3CmoGvgPvMyQ9+NOdLXf4q
 WUnZWy6Lyb8azfvJA/NTVJJfPybuu0FbWwZxg7WQ7frME+Xxq8PR1DJ7e
 tjllBs4UXiWyzAI0c8EFM6T0xpwC1zTGb4/WS2Sm21w/CDA5AwabX2eq2
 Npj3KRXyfx6Rsb1nc4vJYCrmq3iAF9f03PTmyRBeh8B8WWIg92q/zs5Tr
 zn5A4YaczXQIoE7cWy89vKCKJHIp8gs7gkOrKwPqkVLs0cXwBXe4lHf84 g==;
X-CSE-ConnectionGUID: unBzsK6OR3CTYIimSOzWKg==
X-CSE-MsgGUID: wPjKwl69Qwunhz8RyBWOIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29144512"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29144512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:15:41 -0700
X-CSE-ConnectionGUID: GKPISAvZT96O2SWkVQesPw==
X-CSE-MsgGUID: d0dj18xpQCC4mWx2/7Og8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110395920"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:15:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Show VFs LMEM provisioning summary over debugfs
Date: Mon, 21 Oct 2024 22:15:06 +0200
Message-Id: <20241021201506.1771-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

While we can already view individual VF LMEM provisioning using
lmem_quota debugfs attribute, we want to have unified way to show
summary across all VFs, like we do for GGTT or GuC doorbells/IDs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 35 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  5 +++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a863e50b756e..062a0c2fd2cd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2376,6 +2376,41 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_pf_config_print_lmem - Print LMEM configurations.
+ * @gt: the &xe_gt
+ * @p: the &drm_printer
+ *
+ * Print LMEM allocations across all VFs.
+ * VFs without LMEM allocation are skipped.
+ *
+ * This function can only be called on PF.
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_print_lmem(struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
+	const struct xe_gt_sriov_config *config;
+	char buf[10];
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+
+	for (n = 1; n <= total_vfs; n++) {
+		config = &gt->sriov.pf.vfs[n].config;
+		if (!config->lmem_obj)
+			continue;
+
+		string_get_size(config->lmem_obj->size, 1, STRING_UNITS_2,
+				buf, sizeof(buf));
+		drm_printf(p, "VF%u:\t%zu\t(%s)\n",
+			   n, config->lmem_obj->size, buf);
+	}
+
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_config_print_available_ggtt - Print available GGTT ranges.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index b74ec38baa18..0c55aa40a1a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -65,6 +65,7 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
 int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
 int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
 int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_sriov_pf_config_print_lmem(struct xe_gt *gt, struct drm_printer *p);
 
 int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 91fc42e386d8..05df4ab3514b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -81,6 +81,11 @@ static const struct drm_info_list pf_info[] = {
 		.show = xe_gt_debugfs_simple_show,
 		.data = xe_gt_sriov_pf_config_print_dbs,
 	},
+	{
+		"lmem_provisioned",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_lmem,
+	},
 	{
 		"runtime_registers",
 		.show = xe_gt_debugfs_simple_show,
-- 
2.43.0

