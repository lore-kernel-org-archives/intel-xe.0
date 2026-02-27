Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE991048920
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 22:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737EB10EC4B;
	Fri, 27 Feb 2026 22:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlrNKfV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847B610EC4B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 22:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772230805; x=1803766805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QtTpcIt+u4QLd1RqnyNN1WJOy9vlzKVWIWP8rv1CD7k=;
 b=dlrNKfV0PDzagzKkWJlz5hiMoaHXqpg4eeMhZl7fgLqYHzPF+Sr9HE1b
 PBAKi0m9fplCkdj8PW3bnhtITQtqZyR7/jAPuNsx+zk8dN/vEPhRxqfOr
 pa61b6JmVfjYXrhRY2Dg/aB+KgX4n2zWUL/5ZynP60kxZ7Ln7acgC/4Lv
 FU+tQ1T/Vj9poMP1bi0XHR5gO6wmkAuBCAEZE4ydGnIEZrIgvdZQMo+O4
 8oAp1s6bGWpDdq5taEg/CQhvnZxz8bKjJdiRF5mKLuRTvG18j5tJkdhQL
 Yu5njsOPRVHTRYMG56tY/Q9wRI/fw7tJ5q0J/JBXiKPwf8/2Ovg7Dqqir g==;
X-CSE-ConnectionGUID: x2jy88sVSg+zeXXeptNqDw==
X-CSE-MsgGUID: DLXx42X0S+GupweXXmEl6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73234129"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73234129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:20:05 -0800
X-CSE-ConnectionGUID: /f2iOafuT+m+jvIlXQU8Nw==
X-CSE-MsgGUID: rV3rpqjRRzaoYPaHYc1bZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221166681"
Received: from pdaniel-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.19.11])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:20:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe/pf: Take pci_rescan_remove_lock mutex when
 disabling VFs
Date: Fri, 27 Feb 2026 23:19:53 +0100
Message-ID: <20260227221953.12678-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Since recent commit a5338e365c45 ("PCI/IOV: Fix race between SR-IOV
enable/disable and hotplug") the driver pci_driver.sriov_configure
hook is called with the mutex pci_rescan_remove_lock already taken.

As we are using this hook as-is during driver removal, we get:

 [ ] xe 0000:4d:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 1 VF
 [ ] ------------[ cut here ]------------
 [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)
 [ ] WARNING: drivers/pci/remove.c:130 at pci_stop_and_remove_bus_device+0x4c/0x50, CPU#32: rmmod/6476
 [ ] RIP: 0010:pci_stop_and_remove_bus_device+0x4c/0x50
 [ ] Call Trace:
 [ ]  <TASK>
 [ ]  pci_iov_remove_virtfn+0xd1/0x140
 [ ]  sriov_disable+0x42/0x100
 [ ]  pci_disable_sriov+0x34/0x50
 [ ]  xe_pci_sriov_configure+0x2d0/0x1150 [xe]
 [ ]  xe_pci_remove+0x7c/0x190 [xe]
 [ ]  pci_device_remove+0x41/0xb0
 [ ]  device_remove+0x43/0x80
 [ ]  device_release_driver_internal+0x215/0x280
 [ ]  driver_detach+0x50/0xb0
 [ ]  bus_remove_driver+0x86/0x120
 [ ]  driver_unregister+0x2f/0x60
 [ ]  pci_unregister_driver+0x22/0xc0
 [ ]  xe_unregister_pci_driver+0x15/0x20 [xe]
 [ ]  xe_exit+0x1f/0x34 [xe]

Fix that by taking a pci_rescan_remove_lock as it is now expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: add missing .h (CI)
---
 drivers/gpu/drm/xe/xe_pci.c       |  2 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.h |  5 +++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3ac99472d6dd..fb0abd768e67 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1010,7 +1010,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	if (IS_SRIOV_PF(xe))
-		xe_pci_sriov_configure(pdev, 0);
+		xe_pci_sriov_disable_vfs(pdev);
 
 	if (xe_survivability_mode_is_boot_enabled(xe))
 		return;
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 3fd22034f03e..2a3fd3578ef2 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -239,6 +239,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 		return pf_disable_vfs(xe);
 }
 
+/**
+ * xe_pci_sriov_disable_vfs() - Disable all VFs.
+ * @pdev: the PF's &pci_dev
+ *
+ * This is a simple wrapper around our function that implements the
+ * pci_driver.sriov_configure hook but also takes a required mutex.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_pci_sriov_disable_vfs(struct pci_dev *pdev)
+{
+	int ret;
+
+	pci_lock_rescan_remove();
+	ret = xe_pci_sriov_configure(pdev, 0);
+	pci_unlock_rescan_remove();
+
+	return ret;
+}
+
 /**
  * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
  * @pdev: the PF's &pci_dev
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
index b9105d71dbb1..758a0371f148 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.h
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
@@ -10,12 +10,17 @@ struct pci_dev;
 
 #ifdef CONFIG_PCI_IOV
 int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
+int xe_pci_sriov_disable_vfs(struct pci_dev *pdev);
 struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid);
 #else
 static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 {
 	return 0;
 }
+static inline int xe_pci_sriov_disable_vfs(struct pci_dev *pdev)
+{
+	return 0;
+}
 #endif
 
 #endif
-- 
2.47.1

