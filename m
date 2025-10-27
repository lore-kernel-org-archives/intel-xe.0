Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7487FCCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A68910E46B;
	Mon, 27 Oct 2025 12:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNb7mizQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC4E10E46B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761569416; x=1793105416;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gOvwK7wZ6mcBIQpuhhZyVW9iasiOeon4/1hL4ocJ0P8=;
 b=NNb7mizQIKIJuqTDsSEXua3au9mmEHDCWUWZ4Ur5wEPJ18gDdwGe7XNS
 9Yac2qoyaWJK/3XuYZtoDViWTKLjbFGMy5uRKj4/fqjN/MCKdxjKADR/R
 TkrfttWtlsZJsnOD4Yg2nO1s5u3zuNzinvZKmd0SFTorzFoPX06LqZXvy
 GrIgavJR3/VaCeuLrGP9Gqf86P2WyEYHD0nOnf8pHjxkmHupq9JLhFHYw
 h9rPChfk7yXU7aCAJCqJBwbND74xu5My9rFdNI0HXxbxL37foEBFZVKBy
 WGxp6qcbEABUiCAX079MDWoDrWyDUuIE0VSrCFxcNjmfE73MOHjsJcOWj Q==;
X-CSE-ConnectionGUID: U4BIUU/NSsijaj75Pi/M0g==
X-CSE-MsgGUID: bi+YpTUzSUytcjLUPwg/dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73933345"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73933345"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:50:16 -0700
X-CSE-ConnectionGUID: 2YEo5zH1S2W3lwzsarEy9g==
X-CSE-MsgGUID: B25fnVBmR4ClBIk1yIbGfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189073953"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.20])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:50:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3] verbose p2p
Date: Mon, 27 Oct 2025 12:50:06 +0000
Message-ID: <20251027125005.100121-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

Do not review.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 drivers/pci/p2pdma.c            | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 54e42960daad..b047251674ea 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -28,7 +28,7 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
 	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, true) < 0)
 		attach->peer2peer = false;
 
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 78e108e47254..0fb01face8f3 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -451,6 +451,7 @@ static const struct pci_p2pdma_whitelist_entry {
 	{PCI_VENDOR_ID_INTEL,	0x2033, 0},
 	{PCI_VENDOR_ID_INTEL,	0x2020, 0},
 	{PCI_VENDOR_ID_INTEL,	0x09a2, 0},
+	{PCI_VENDOR_ID_INTEL,	0x7a30, 0},
 	{}
 };
 
@@ -503,7 +504,10 @@ static bool __host_bridge_whitelist(struct pci_host_bridge *host,
 	vendor = root->vendor;
 	device = root->device;
 
+	pr_info("root v:%x d:%x\n", vendor, device);
+
 	for (entry = pci_p2pdma_whitelist; entry->vendor; entry++) {
+		pr_info("entry v:%x d:%x\n", entry->vendor, entry->device);
 		if (vendor != entry->vendor || device != entry->device)
 			continue;
 		if (entry->flags & REQ_SAME_HOST_BRIDGE && !same_host_bridge)
-- 
2.51.0

