Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE75C05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F335610E88E;
	Tue, 14 Feb 2023 11:24:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1CC10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373844; x=1707909844;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UtKMMMKb/djLCjTI9X9ozdgdyHTyBaAHwW2Xaa4UPj4=;
 b=L01by5V2C5C06VwL31lO5tAwicL/BXuf5w9A2wFCFDSHfw247z4SjYPb
 tA8+yP1BfMH1ZasVZxfDKA4r6e8TMXRSTu1w2gygNHj7TPPeVuSCrZLML
 ossOGcrP+OUVJaxGa60zr+96aW8NDHtZ3mXAujwAM6kNKp+JvifsnvDxF
 yi6ZnWZaoIj2NP0yl1T1LBcUgRoXxb0a5XbVLEFsFjEx1g7Ew2vDEJv9j
 MG+eS4sH+nZS9LpgHgV7tF3OtW1wbW6IJcKIMcj3DvR1uflo+Jnl4aDHt
 R9IREzff0VsVA1wgdbbCKWFUPUguPFoWpwwENMksro3MUfgw+EFiLFrWK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450087"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:24:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863247"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863247"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:24:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:36 +0000
Message-Id: <20230214112136.162380-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/15] drm/xe: fully turn on small-bar support
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

This allows vram_size > io_size, instead of just clamping the vram size
to the BAR size, now that the driver supports it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 4c8b77caeb43..0a0958393a4b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -217,7 +217,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
 	xe->mem.vram.io_size = min(usable_size,
 				   pci_resource_len(pdev, GEN12_LMEM_BAR));
-	xe->mem.vram.size = xe->mem.vram.io_size;
+	xe->mem.vram.size = vram_size;
 
 	if (!xe->mem.vram.size)
 		return -EIO;
-- 
2.39.1

