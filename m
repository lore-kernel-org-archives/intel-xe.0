Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124EEC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 17:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781A10E29C;
	Mon, 21 Jul 2025 17:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="ImjF/7Ab";
	dkim-atps=neutral
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C8710E29C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 17:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753119072; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z7bEa0Xa2mWFL+y2qcbx3Q7RGTnx6CN3/q2d/9D/IrJzDyBmdt7+TVCo20jlKhzmFM8zqrzsrnlwtWBuoLHsv2sJohr57X21TX5ukNAlRamRfn4sRVHl6s65R8x9znSCEiCNYtvOaTqwBVA2B/7NThxPdoK9TOMeU8++IYsvnAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753119072;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ImS4Azflmxc74vwR1MKlrS9ROU2xqa3Al5LEIyLX5PU=; 
 b=A8lefDwaylSZQ/vmMrpUzJaI58pjieHdjh0gFNe2EN7/UbN7MHhsG84TVpeBlPEhADh5RXz5b72up+P9SDxS+ND+s95BQlTODLhxwKL9XcieU3B4o6ABdt6yuK6pk8FKQ595oRr2334WVrmPX1R+CmcyqDdbP1bNRyAJQSBS4Zs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753119072; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ImS4Azflmxc74vwR1MKlrS9ROU2xqa3Al5LEIyLX5PU=;
 b=ImjF/7AbXUCQT5rXNE35r40gFZ71HTdson0NJfGB0TgWUYnppka+YPySyXHBZkQx
 EDJUMtovWet7sIXiTH5hjFRkjgW3SR1zaIlNnR+Vjbu7rl8fGPJndXK6zgEzaXPdFd/
 jksQg4NmmeQbaNmyvMSAXQmXABGFLgIZ7773Te8sQ37/cVZSq716YSSU+PD4EA7Wr1F
 Rjz1c/h6aPlZCEmeR+z20He+uY3TLnTEU7u22ULN/rliohC6Oxjs35Tl0MywmzCtqfA
 sHwuJ6iZxzXy4OEjzBCRBDxu+EAEFVslK4lP6wH0RgCGwSC8k+ThNL+u0so8LgrXQJe
 yQQ911GIoQ==
Received: by mx.zohomail.com with SMTPS id 1753119070005505.4824892322754;
 Mon, 21 Jul 2025 10:31:10 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] PCI: hide mysterious 8MB 64-bit pref BAR on Intel Arc PCIe
 Switch
Date: Tue, 22 Jul 2025 01:30:57 +0800
Message-ID: <20250721173057.867829-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The upstream port device of Intel Arc series dGPUs' internal PCIe switch
contains a mysterious 8MB 64-bit prefetchable BAR. All reads to memory
mapped to that BAR returns 0xFFFFFFFF and writes have no effect.

When the PCI bus isn't configured by any firmware (e.g. a PCIe
controller solely initialized by Linux kernel), the PCI space allocation
algorithm of Linux will allocate the main VRAM BAR of Arc dGPU device at
base+0, and then the 8MB BAR at base+256M, which prevents the main VRAM
BAR gets resized. As the functionality and performance of Arc dGPU will
get severely restricted with small BAR, this makes a problem.

Hide the mysterious 8MB BAR to Linux PCI subsystem, to allow resizing
the VRAM BAR to VRAM size with the Linux PCI space allocation algorithm.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/pci/quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d7f4ee634263..df304bfec6e9 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3650,6 +3650,22 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d0, quirk_broken_intx_masking);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d1, quirk_broken_intx_masking);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d2, quirk_broken_intx_masking);
 
+/*
+ * Intel Arc dGPUs' internal switch upstream port contains a mysterious 8MB
+ * 64-bit prefetchable BAR that blocks resize of main dGPU VRAM BAR with
+ * Linux's PCI space allocation algorithm.
+ */
+static void quirk_intel_xe_upstream(struct pci_dev *pdev)
+{
+	memset(&pdev->resource[0], 0, sizeof(pdev->resource[0]));
+}
+/* Intel Arc A380 PCI Express Switch Upstream Port */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa1, quirk_intel_xe_upstream);
+/* Intel Arc A770 PCI Express Switch Upstream Port */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa0, quirk_intel_xe_upstream);
+/* Intel Arc B580 PCI Express Switch Upstream Port */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xe2ff, quirk_intel_xe_upstream);
+
 static u16 mellanox_broken_intx_devs[] = {
 	PCI_DEVICE_ID_MELLANOX_HERMON_SDR,
 	PCI_DEVICE_ID_MELLANOX_HERMON_DDR,
-- 
2.50.1

