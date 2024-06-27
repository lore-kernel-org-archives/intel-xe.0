Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB86C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 10:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870FC10E1A4;
	Thu, 27 Jun 2024 10:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GE60CZJQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FA810E240
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719485027; x=1751021027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b9X+f5zEJo+PugVEi6yNevUJ3yL1Dp6PzDTCwQbunyU=;
 b=GE60CZJQZa3ssP4fpH2pVygerfRmdGyIYntRJ5jK+gxFukeFg5Pjc/x5
 4IXAtOpwddxuW8G/Nu4AB5BSM3jX672iKG+c9KvNGWGF01blozC+O1RIk
 iIO+Pe1ShQLu5dG/opbO63cZsbNk3xSc6dS0MESoakSzmzISmn0nY7Ghp
 Etipmbr6Z/4T8Fh0Ymn/iSgygi9iqziBuKWctd1fk0zGIVoW09YtrYPKc
 igTVYLPaRQWDUlbOgXCXCNp2n4+woaYM96pKQ1GGp61cgAdEefYuaCAVn
 f9UToclFwIu2qFxYejNrE8XLQX9sBlv6LYXDIT876Urt0aeBRdiU0ehim Q==;
X-CSE-ConnectionGUID: sQjobgOzTbaD7w9jTNjIqg==
X-CSE-MsgGUID: UxXtNtUvQXiJD3kJCq2h5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16278039"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16278039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 03:43:46 -0700
X-CSE-ConnectionGUID: Go0ObpN3TV2/VHNp+MV4XA==
X-CSE-MsgGUID: 1Dnw09DuRtWn4Hg8++xY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44400371"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.27.12])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 03:43:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
Date: Thu, 27 Jun 2024 12:43:05 +0200
Message-Id: <20240627104305.1477-1-michal.wajdeczko@intel.com>
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

We can remove #ifdef CONFIG_PCI_IOV in .c files if we provide
dummy replacement of the xe_pci_sriov_configure() function.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 4 ----
 drivers/gpu/drm/xe/xe_pci_sriov.h | 7 +++++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4b91a9878f41..53b67f39c7d5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -749,10 +749,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (!xe) /* driver load aborted, nothing to cleanup */
 		return;
 
-#ifdef CONFIG_PCI_IOV
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
-#endif
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
@@ -1010,9 +1008,7 @@ static struct pci_driver xe_pci_driver = {
 	.probe = xe_pci_probe,
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
-#ifdef CONFIG_PCI_IOV
 	.sriov_configure = xe_pci_sriov_configure,
-#endif
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
index 3b8bfbf7e1d9..c76dd0d90495 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.h
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
@@ -8,6 +8,13 @@
 
 struct pci_dev;
 
+#ifdef CONFIG_PCI_IOV
 int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
+#else
+static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
+{
+	return 0;
+}
+#endif
 
 #endif
-- 
2.43.0

