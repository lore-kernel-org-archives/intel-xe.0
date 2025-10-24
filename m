Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AA2CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51610E20A;
	Fri, 24 Oct 2025 15:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXEPMt8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D87310E20A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761320917; x=1792856917;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WrAhdD6Vbja5fsSZ3uClqWB7PBNwD3KfdFdk2jQD6JU=;
 b=aXEPMt8R8rIzHwAxUR4xBRaovGPi8wW8IL2JFfgnjc12WBFWzb3N+FFZ
 mlrQtsDZU8Kd4z8qxj40TOYgrFczav52epVgMQZTyNIgxgu0+JQ+qyowX
 q9nObVUmrTLAPqkfpdwkpT0RMf9quV6z6Nr0+rJpXSNVINP6O1QPt+1DF
 LMkHMW9v1oW6Los2xvF1YS7IB93/5j6hhAiW7/M6meF6yblIU5z+tnXVe
 VAf6PkdJeT3r/6DAPUf5QLxP9Zt/SGGTFbTdfkAHy0LdJbCVhU1nVyaxr
 1wmYFh7zv78p3K9n7ETtvUsqcR38stO30EhJ2Y+ZsRAB0b4RcOgu7xhg8 A==;
X-CSE-ConnectionGUID: zAU0vs7hSEOtPOQgyqM/FQ==
X-CSE-MsgGUID: ZB7xrlnFQ0mCNdKfsxm0Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63396112"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="63396112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:48:36 -0700
X-CSE-ConnectionGUID: hfB0+OC2Tfufuf1v+/ekJQ==
X-CSE-MsgGUID: g2M8Wd7wSYmkLqBSBB004A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="188752836"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.97])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:48:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2] verbose p2p
Date: Fri, 24 Oct 2025 16:48:27 +0100
Message-ID: <20251024154826.75043-2-matthew.auld@intel.com>
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
 drivers/pci/p2pdma.c            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
index 78e108e47254..e4d81d4ab393 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -451,6 +451,7 @@ static const struct pci_p2pdma_whitelist_entry {
 	{PCI_VENDOR_ID_INTEL,	0x2033, 0},
 	{PCI_VENDOR_ID_INTEL,	0x2020, 0},
 	{PCI_VENDOR_ID_INTEL,	0x09a2, 0},
+	{PCI_VENDOR_ID_INTEL,	0x7a30, 0},
 	{}
 };
 
-- 
2.51.0

