Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA80103FFAC
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 21:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3DB10EC49;
	Fri, 27 Feb 2026 21:41:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBAA10EC49
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 21:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772228468; x=1803764468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xfDzpTEpyYOFGZPQ5K4qgPfHcGDrsPzKdFvYEs/5AV8=;
 b=OgiyJHr+QKWEb2GVVFWtPoeDjIqyu7IpPBs73M22Tolw0mO9QVUb3RnB
 Z5E4cr8ZxOlBRHCbvWGRnU4Y1wueu7OqchCrGRLsUoAV8JLnMekAaN3kU
 27rU8SNvEeh5I9c0pvzRY4MK7/Rq2w31hSReharrPwtcmsSXzWoq8UDCj
 v11QXaU10vMWM8IsoqcVKM4C+nY/bIaRMMFkTNSbM/VQQEXTDgoD/oY5Y
 oxn/CKE3Ng4NX/qn1bx2hAevmRCsx4tp5zAiJNdbEOR3YNM/Y+ju/uOo/
 mZ18d8aw4IRoq7G/rek45QbMSQOUyOfoXD8ixugGWVYgMN+0A//CUJ4gG w==;
X-CSE-ConnectionGUID: AEnqeEXqQmSXWHVs8EWVBQ==
X-CSE-MsgGUID: sZCCTdvXT/yIQdxoQ837LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75923592"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75923592"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 13:40:58 -0800
X-CSE-ConnectionGUID: dUBI2+LrT++htur5/Klhqw==
X-CSE-MsgGUID: kHVmZgoKQVSbwobUoXPGSQ==
X-ExtLoop1: 1
Received: from pdaniel-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.19.11])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 13:40:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Take pci_rescan_remove_lock mutex when disabling
 VFs
Date: Fri, 27 Feb 2026 22:40:47 +0100
Message-ID: <20260227214048.12649-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_pci.c       |  2 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

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
-- 
2.47.1

