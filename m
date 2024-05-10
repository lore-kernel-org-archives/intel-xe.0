Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DEDC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E791B10EEE9;
	Fri, 10 May 2024 18:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="be3n3Qql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8587910EF01
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364768; x=1746900768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCpbsh7ZXVlyyaNdclzMlDkK5dqXtSMnFM5lq32Q5/8=;
 b=be3n3QqlEthiUxHiQrw+3gNd/SmZZAFluCFme9SJdvMsj4C3Dw4VtvZO
 20ioCcfMIFxud1lhdfaSNaMOQNjm6WQh9iJEIouMvWWhhgTkH1cSzVCSM
 P+NOzzaDg8WCFQCaH5caPhNPxHV1/eDvndNYwoMTCzUe9d4CUn/WFZAec
 aE6VYOnD3TxMDziBfGFrMX4phr4KYrM6k5JYZA7OeGyAt7BAMQeBrL49o
 kOrPCRlZJRAsVuiNz3oUTaH1qGcOIpkmSHqG/7C+nRZu6yTLP3905kshZ
 ACXMNlxSG/K3/KdBZCimslsCoGh/IllWHeUhhrSvRpJEMm6HrLYFXCY6n A==;
X-CSE-ConnectionGUID: 60SuJNbVT6mHrSPUgt47pw==
X-CSE-MsgGUID: fGcPQfrsS0KKTqonYIU2rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844616"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:48 -0700
X-CSE-ConnectionGUID: 1KIQudzMThmDNoGcxjHKmg==
X-CSE-MsgGUID: 5apE6yQvTtSfdJTYqniszA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544134"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 16/20] drm/xe/mmio: move mmio_fini over to devm
Date: Fri, 10 May 2024 19:12:29 +0100
Message-ID: <20240510181212.264622-38-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Not valid to touch mmio once the device is removed, so make sure we
unmap on removal and not just when driver instance goes away. Also set
the mmio pointers to NULL to hopefully catch such issues more easily.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 05edab0e085d..a3094e741db8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -387,13 +387,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	}
 }
 
-static void mmio_fini(struct drm_device *drm, void *arg)
+static void mmio_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
 		iounmap(xe->mem.vram.mapping);
+
+	xe->mem.vram.mapping = NULL;
+	xe->mmio.regs = NULL;
 }
 
 int xe_mmio_init(struct xe_device *xe)
@@ -418,7 +421,7 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
-- 
2.45.0

