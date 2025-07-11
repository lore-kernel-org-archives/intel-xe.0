Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9C1C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CAC10E2E8;
	Fri, 11 Jul 2025 19:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9mnFc5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F6910E2E8
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752260895; x=1783796895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=odtL2hz4uTIDpHbXzAUwM1lYW8Rac0hcxg87ySVcQD8=;
 b=C9mnFc5cuRYwkYyBu5sGw66wpPs7RY5ubkp07oOMw0iywl4KCR/yWU+f
 6eeN4knS2X0os59P5Wppw6Pcw/EMBUnA1Ig9ndnp8Np588ZzZMxBS3Y1F
 gltlkLZJ/q1C/BM1lvMlSujqx9LW9lf0U0zm59LsLzdFKSQOL1MJxX3hc
 83K5FJdVSVLdtYR+fgqzqDDJGnQnzbuZHWfSQgoeZ8687l7kQMRtMYwOw
 XS+zmFdGVNNqSVNqsbKqcd1pIe3DvILd56ugI0GPtXbthaqEzmlmBwxqG
 moHvsQuJKDHB3SRnXPLgdsNrp9xtpQAjv8uOerUf4oZQuHKQGpTDlft/O Q==;
X-CSE-ConnectionGUID: fnPHZCjJQL2KGRNG0Aqezg==
X-CSE-MsgGUID: DmYm2j2oSiePQ9WGWNdrKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54535061"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54535061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:08:14 -0700
X-CSE-ConnectionGUID: R09DBXX5Tp6qHTmThDJzHg==
X-CSE-MsgGUID: q7S0deA5Te6E5QRurQJPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160457796"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2025 12:08:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Don't expose device attributes for VFs
Date: Sat, 12 Jul 2025 00:38:08 +0530
Message-Id: <20250711190808.2743402-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Commit a7f87deac229 ("drm/xe: Default auto_link_downgrade status to false")
tried to fix the side effect of xe_pcode_read() returning successfully
without valid data-out value when xe->info.skip_pcode is set. Since this
is true for IS_SRIOV_VF() cases, a much robust fix would be to not expose
device attributes for VFs, which covers wider pcode mailbox users.

Fixes: a7f87deac229 ("drm/xe: Default auto_link_downgrade status to false")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index e5fd0cd537bc..8250aa4620ee 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -259,8 +259,7 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	/* default the auto_link_downgrade status to 0 */
-	u32 val = 0;
+	u32 val;
 	int ret;
 
 	xe_pm_runtime_get(xe);
@@ -297,6 +296,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	int ret;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	if (xe->d3cold.capable) {
 		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 		if (ret)
-- 
2.34.1

