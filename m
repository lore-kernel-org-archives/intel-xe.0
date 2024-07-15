Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926BFC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 11:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F89910E35B;
	Mon, 15 Jul 2024 11:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo2NSerH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07C10E35D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721043663; x=1752579663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=26eOK92KxFu4eZMkRQ5IO0/zqcotxxRcjFh7enrFhc8=;
 b=jo2NSerH/74kWzbI7DvKvm23qIuJx7mRUkpKLhzqwKE3dvCmWCQ/s0Gm
 rxjzvIWlo89R9tRRcHwBd30Fzu7wMpWIGkGKkPvGx0ehjFIZVAltR8iUz
 TKApuGoySjsfvl/lZd+Y7IICIjMrHcX7ysM7neCAdrf6dTQhDe4VbeCS2
 yAYVkBVgDwqPj6IqDgGCHq9uRsglkR0caEj4JHQz4L11PKlfbr6UU55ql
 VIIvc2YnXqpOOfTAq1DCC4uNqafDq/wzPMEBVU+Gw5nd01Et99pc7XENI
 ZutJ0HWUD+Err25p1Kn7TpQe8jHuiGayk6LaZKBnGgm21qzbsQcKrzKzP A==;
X-CSE-ConnectionGUID: JWnQWwSBSS+pzme+66b6mg==
X-CSE-MsgGUID: yCBHcmgKScCnT9LBvCHyIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29095803"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29095803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 04:41:02 -0700
X-CSE-ConnectionGUID: +2FqAqImSf6OahrCs9IGsA==
X-CSE-MsgGUID: qgrrv0p8SayU33vSWqkd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="80683320"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.120])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 04:41:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Restore TotalVFs
Date: Mon, 15 Jul 2024 13:40:52 +0200
Message-Id: <20240715114052.1330-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

If we update TotalVFs to a new value and fail the .probe() then
the PCI subsystem will not restore original value, which might
impact next .probe() attempt. As a backup plan, use managed action
to restore it ourselves.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
Attempt to fix that at PCI layer is here [1], but until it will be
available for us, we can still fix that on our side.

[1] https://lore.kernel.org/linux-pci/20240715102835.1286-1-michal.wajdeczko@intel.com/
---
 drivers/gpu/drm/xe/xe_sriov_pf.c | 48 +++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 0f721ae17b26..d61933770f1c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -17,12 +17,40 @@ static unsigned int wanted_max_vfs(struct xe_device *xe)
 	return xe_modparam.max_vfs;
 }
 
-static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
+static void restore_totalvfs(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int totalvfs = xe->sriov.pf.device_total_vfs;
+
+	xe_sriov_dbg_verbose(xe, "restoring totalvfs to %d\n", totalvfs);
+	pci_sriov_set_totalvfs(pdev, totalvfs);
+}
+
+static int pf_reduce_totalvfs(struct xe_device *xe, u16 limit)
 {
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	int err;
 
+	xe->sriov.pf.device_total_vfs = pci_sriov_get_totalvfs(pdev);
+	xe->sriov.pf.driver_max_vfs = limit;
+
+	xe_sriov_dbg_verbose(xe, "reducing totalvfs from %u to %u\n",
+			     xe->sriov.pf.device_total_vfs,
+			     xe->sriov.pf.driver_max_vfs);
+
+	/*
+	 * XXX: If we update TotalVFs to a new value and fail the .probe()
+	 * then the PCI subsystem might not restore original TotalVFs value,
+	 * which might impact next .probe() attempt. As a backup plan, use
+	 * managed action to restore it ourselves.
+	 *
+	 * Note that it's not critical if registering that action fails.
+	 */
+	devm_add_action(xe->drm.dev, restore_totalvfs, xe);
+
 	err = pci_sriov_set_totalvfs(pdev, limit);
 	if (err)
 		xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
@@ -37,6 +65,14 @@ static bool pf_continue_as_native(struct xe_device *xe, const char *why)
 	return false;
 }
 
+static bool pf_continue_ready(struct xe_device *xe, u16 max_vfs)
+{
+	xe_assert(xe, max_vfs > 0);
+	xe_sriov_dbg(xe, "preparing for %u VF%s\n", max_vfs, str_plural(max_vfs));
+	pf_reduce_totalvfs(xe, max_vfs);
+	return true;
+}
+
 /**
  * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
  * @xe: the &xe_device to check
@@ -58,18 +94,16 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
 	if (!dev_is_pf(dev))
 		return false;
 
+	if (!totalvfs)
+		return pf_continue_as_native(xe, "no VFs reported");
+
 	if (!xe_device_uc_enabled(xe))
 		return pf_continue_as_native(xe, "Guc submission disabled");
 
 	if (!newlimit)
 		return pf_continue_as_native(xe, "all VFs disabled");
 
-	pf_reduce_totalvfs(xe, newlimit);
-
-	xe->sriov.pf.device_total_vfs = totalvfs;
-	xe->sriov.pf.driver_max_vfs = newlimit;
-
-	return true;
+	return pf_continue_ready(xe, newlimit);
 }
 
 /**
-- 
2.43.0

