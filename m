Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505C4E63F12
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D88A10E37D;
	Sun, 15 Feb 2026 20:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYrkxavy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47110E23D
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187629; x=1802723629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=obFjG5uEmPNwdZBRHXLpkbGvQ0P1a4nctM0d9s0J75U=;
 b=FYrkxavy1PLLY45if+6N4G1y1npQiG3fOoay+mbBC/5wB92Jie8GXFbA
 /TyST8UyYlt5rBOKwRPEAzX+nQrJHQK9f+UdtbWAXwoE6WPmY7WeRx9ZU
 BQnUGIouEULK8uVc/Njx++RdGEkHcMkE0ixxCCyIMRwgYbbGpf5bb9KRt
 R5Tc7WVU4huBYYKz4S1qSw2DWq6LPYIv0XD53ROIbNcJXVZTvVakzs7hj
 4VaOflCtDQU/mhWXEtWIbefhWYvsCZTutWVguqSm33OI9gRqVf93Py96m
 BnRQ6FFxydtI/qOQvaNPeQ4sDbHnnd1bvcttM/DuWtt7u6VrzhjiBsCaa w==;
X-CSE-ConnectionGUID: SHcNUaqDSs6+CLFltQTfXg==
X-CSE-MsgGUID: oOFbKTdFSLGKdnr2lgPLkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996394"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:49 -0800
X-CSE-ConnectionGUID: SIrexXESSI21ujfnrdhFxg==
X-CSE-MsgGUID: rdyXuYbKTMmD4ZiKf9o9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096615"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:49 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 8/9] drm/xe/pf: Skip VRAM auto-provisioning if already
 provisioned
Date: Sun, 15 Feb 2026 21:33:22 +0100
Message-ID: <20260215203323.595-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

In case VF's VRAM provisioning using sysfs is done by the admin
prior to VFs enabling, this provisioning will be lost as PF will
run VRAM auto-provisioning anyway. To avoid that skip this auto-
provisioning if any VF has been already provisioned with VRAM.

To help admin find any mistakes, add diagnostics messages about
which VFs were provisioned with VRAM and which were missed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 1a9f3b85526c..b1eccd6712f4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1939,6 +1939,59 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
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
+	__pf_show_provisioning_lmem(gt, 1, xe_gt_sriov_pf_get_totalvfs(gt), true);
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
@@ -1964,6 +2017,9 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 
 	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!pf_needs_provision_lmem(gt, vfid, num_vfs))
+		return 0;
+
 	fair = pf_estimate_fair_lmem(gt, num_vfs);
 	if (!fair)
 		return -ENOSPC;
-- 
2.47.1

