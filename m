Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14800CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99A410E146;
	Wed, 14 Oct 2026 13:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7719610E146
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791983942; x=1823519942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zxe5MTtnwFsGViRD4DP5kK2cenvHB/ZdaWLOUl6Zcek=;
 b=j4DzETxemIym+gA4Qka9ugRlHQDcdhslSiMakIl6LT5SmC88v7VZIIxV
 8bLbD9YzWHExkuyH226AjzKBJ7Vgexxm9TUsh4vKasyAWiWJokllkAYBO
 CfB+OiFAvPQS9/79P3HMJPbyRLoFHAkNmnzOQefY9wECArjByqLuf0LPx
 v7zx8QBPxEG25PmLneoD/qBsnDTmd+vkK32HQ+GVQcfGHq3w4pXlLW2zt
 VbGvnUK4jf7PRC69dPrlGy89feU0gl7YB91ekCchJNIG+Vud9Ltk8F4Vo
 tFAX0l33JICN5y89mO4n8tkyPQVMLC983/HFeM0pl5vsghJVvg0k72A11 Q==;
X-CSE-ConnectionGUID: I7xS79C8RcGa/KiNJjAVOA==
X-CSE-MsgGUID: 4be7dPNTQvG416eirrqGEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="733420"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="733420"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:19:01 -0700
X-CSE-ConnectionGUID: uK0P0PX6R4+iMbbMvl8UUw==
X-CSE-MsgGUID: G8L1jrsRTQelF5LeOY8YWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3272378"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa011.fm.intel.com with ESMTP; 14 Oct 2026 06:18:58 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: kvm@vger.kernel.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] vfio/xe: Add CRI and NVL device IDs
Date: Wed, 14 Oct 2026 18:48:50 +0530
Message-ID: <20261014131849.157593-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
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

Crescent Island (CRI), Nova Lake-S (NVL-S) and Nova Lake-P (NVL-P)
support SR-IOV in the Xe driver. Add their PCI IDs to the xe-vfio-pci
device table, so that the generated vfio_pci module aliases allow
userspace to select this variant driver for their VFs.

Also reordered the table entries.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yishai Hadas <yishaih@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>
Cc: kvm@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/vfio/pci/xe/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
index cbff5af385ef..8f1237751d51 100644
--- a/drivers/vfio/pci/xe/main.c
+++ b/drivers/vfio/pci/xe/main.c
@@ -574,9 +574,12 @@ static void xe_vfio_pci_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id xe_vfio_pci_table[] = {
+	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_CRI_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_NVLS_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_NVLP_IDS(INTEL_PCI_VFIO_DEVICE),
 	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
 	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
-	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
 	{}
 };
 MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
-- 
2.53.0

