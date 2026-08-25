Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87444C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 05:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F61310E125;
	Tue, 25 Aug 2026 05:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MA7k8QUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A3310E125
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787636630; x=1819172630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f/16kBJ47bSVdkU7GRfgVdz91xbpoWU30jxgMcY/usA=;
 b=MA7k8QUR5CHBeGeVMjKUJtl2XZ+IKj44xUK4M+Yrz4mYD5CbnrWmDjdF
 4O8h4zQ7JU5/C0sjAaCHNkujm3E1kiq5B///F+0kkCQO5IrICs9y0uqkR
 VP46NHwdqAMX19LBJrtjxmECd0HiOG5ZkJg1g8EZxGBKDiBj0yH2n0s4K
 2wl7txt5eL+Os3NDk7rnSD7GKVCScgjhJTEqnV7WZUdz0jHAI9Z6pAN2v
 RLojhd6y4EFSMvZ4262Q2019IXa59Y+1Okrqo6ZjS9qSj7sj2FTgBWJiJ
 6WuwXPC0zBo8oG3jk/V5HiqG3yD1weP/RFT3D76K6xBLDOExozHIiw1UW w==;
X-CSE-ConnectionGUID: YW1XyjbERwOA4t6zgTjD0g==
X-CSE-MsgGUID: SgM/Xa3LS26T80IXJ3GoGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112047"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 22:43:50 -0700
X-CSE-ConnectionGUID: qFNzBAs7R8GtfBuV4GtguQ==
X-CSE-MsgGUID: vCV7bPe+SQOcWsPhZwoCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="272418216"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2026 22:43:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: dave@stgolabs.net, jic23@kernel.org, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, djbw@kernel.org,
 iweiny@kernel.org, ming.li@zohomail.com, bhelgaas@google.com,
 rodrigo.vivi@intel.com
Cc: linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 lukas@wunner.de, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/2] PCI/AER: Export pcie_aer_is_native() to AER namespace
Date: Tue, 25 Aug 2026 11:12:50 +0530
Message-ID: <20260825054312.1319951-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825054312.1319951-1-raag.jadav@intel.com>
References: <20260825054312.1319951-1-raag.jadav@intel.com>
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

pcie_aer_is_native() was originally exported to CXL namespace in commit
49f776724e64 ("PCI/AER: Export pcie_aer_is_native()"). This is a bit
misleading as the symbol or its underlying implementation does not reflect
any distinguishable CXL functionality.

Change this and export pcie_aer_is_native() to AER namespace, which is
cleaner and more suitable for its implementation.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/cxl/port.c     | 1 +
 drivers/pci/pcie/aer.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
index 99cf77b6b699..00f675163b3d 100644
--- a/drivers/cxl/port.c
+++ b/drivers/cxl/port.c
@@ -340,5 +340,6 @@ module_exit(cxl_port_exit);
 
 MODULE_DESCRIPTION("CXL: Port enumeration and services");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("AER");
 MODULE_IMPORT_NS("CXL");
 MODULE_ALIAS_CXL(CXL_DEVICE_PORT);
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c4fd9c0b2a54..8660b18bac8b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -248,7 +248,7 @@ int pcie_aer_is_native(struct pci_dev *dev)
 
 	return pcie_ports_native || host->native_aer;
 }
-EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "CXL");
+EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "AER");
 
 static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
-- 
2.43.0

