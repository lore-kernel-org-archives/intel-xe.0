Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3601E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C3710E5D1;
	Wed, 18 Feb 2026 20:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNwnT/Ev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469E10E626
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448198; x=1802984198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nqwE/62oHQtFGnzqZPA53lSc5hTszx+qvzhi3aqNHFQ=;
 b=RNwnT/Evenw3tOMJcqwI6b0y6vSYwMdAKATVM3J8VrwMvoEMG7zDORx7
 DCEBVMtFpcH5OvkT5ZLuzMpDZqoIHHIA7TLf/sA4C2nJmfeuMv/U6s0Sg
 PmaK9/fpTz6KFMF5maEVFEDtmJ1GeqwrGUNQ4exrpuBE3qOVV8nXVO6ko
 RhLu3AF+JiTozDvxP0vMlgFluAYc77eJKeYETJ2g7aVC32OorqTJqoDgQ
 gj/jy5L2NtUNUfB1TMKLZ7sKO2mZa+yZ5+tBv/UqO5QZm/g7BuK0WCxqA
 znbLq8lxHXCQxrm0fJ00LT4orNcA0yZo844ybGqFbs6qJjLJ8Jxg88ml5 g==;
X-CSE-ConnectionGUID: UJdN80uRTNqNo89u9AM/eA==
X-CSE-MsgGUID: giUgBgDwSpCKhzoUuNjAkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710604"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710604"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:37 -0800
X-CSE-ConnectionGUID: o8nFgD/wQ12JKf4KjzBoIw==
X-CSE-MsgGUID: qeXaObAkT8C8edsnSd3zbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548276"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 09/10] drm/xe/pf: Skip VRAM auto-provisioning if already
 provisioned
Date: Wed, 18 Feb 2026 21:55:51 +0100
Message-ID: <20260218205553.3561-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In case VF's VRAM provisioning using sysfs is done by the admin
prior to VFs enabling, this provisioning will be lost as PF will
run VRAM auto-provisioning anyway. To avoid that skip this auto-
provisioning if any VF has been already provisioned with VRAM.

To help admin find any mistakes, add diagnostics messages about
which VFs were provisioned with VRAM and which were missed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: use VFID (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d2a2201440b8..cba20eb6b36b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1922,6 +1922,59 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 	return ALIGN_DOWN(fair, alignment);
 }
 
+static void __pf_show_provisioning_lmem(struct xe_gt *gt, unsigned int first_vf,
+					unsigned int num_vfs, bool provisioned)
+{
+	unsigned int allvfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt); /* PF plus VFs */
+	unsigned long *bitmap __free(bitmap) = bitmap_zalloc(allvfs, GFP_KERNEL);
+	unsigned int weight;
+	unsigned int n;
+
+	if (!bitmap)
+		return;
+
+	for (n = first_vf; n < first_vf + num_vfs; n++) {
+		if (!!pf_get_vf_config_lmem(gt, VFID(n)) == provisioned)
+			bitmap_set(bitmap, n, 1);
+	}
+
+	weight = bitmap_weight(bitmap, allvfs);
+	if (!weight)
+		return;
+
+	xe_gt_sriov_info(gt, "VF%s%*pbl %s provisioned with VRAM\n",
+			 weight > 1 ? "s " : "", allvfs, bitmap,
+			 provisioned ? "already" : "not");
+}
+
+static void pf_show_all_provisioned_lmem(struct xe_gt *gt)
+{
+	__pf_show_provisioning_lmem(gt, VFID(1), xe_gt_sriov_pf_get_totalvfs(gt), true);
+}
+
+static void pf_show_unprovisioned_lmem(struct xe_gt *gt, unsigned int first_vf,
+				       unsigned int num_vfs)
+{
+	__pf_show_provisioning_lmem(gt, first_vf, num_vfs, false);
+}
+
+static bool pf_needs_provision_lmem(struct xe_gt *gt, unsigned int first_vf,
+				    unsigned int num_vfs)
+{
+	unsigned int vfid;
+
+	for (vfid = first_vf; vfid < first_vf + num_vfs; vfid++) {
+		if (pf_get_vf_config_lmem(gt, vfid)) {
+			pf_show_all_provisioned_lmem(gt);
+			pf_show_unprovisioned_lmem(gt, first_vf, num_vfs);
+			return false;
+		}
+	}
+
+	pf_show_all_provisioned_lmem(gt);
+	return true;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
  * @gt: the &xe_gt (can't be media)
@@ -1947,6 +2000,9 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 
 	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!pf_needs_provision_lmem(gt, vfid, num_vfs))
+		return 0;
+
 	fair = pf_estimate_fair_lmem(gt, num_vfs);
 	if (!fair)
 		return -ENOSPC;
-- 
2.47.1

