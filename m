Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669CFC76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 08:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4594910F13C;
	Fri, 31 Mar 2023 08:47:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B16F10F136
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680252417; x=1711788417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+63jwOjZmHVqFQlWmCwU8gLaHKgzO1Eb88tjHirHjSc=;
 b=i1+LtAwQZEQa5HuEEfgwJwYKvV04bRjTKdDzlxFFKuUfKoITvMGUHlVz
 xKZ1EWT5MI9zhFzLDYM2fWSm6REKVpPWjTWIPx9hRLU3MdpdmH7MoPOZj
 Ka81bX7Jq5Kg9xpmNvyHZH4FoItHiy9x2gbIioYT3n1zc62sKSMaXn95s
 0+ifkdGygPy8CSlTfyrCvjyE4aQkWVhkiZZDQ8SHnPkTINLHb8+QQrW6K
 f3gZIMF+D1dPIMrGwrj79fM9A/qhliKbR2wrds9UE+ohgoh/iCi62WzeO
 HrIy6ZeRPDEzU5is38x2+ehAovYXoWB9AqsafgbltOkUyDaMbwVcoXAIv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325364374"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325364374"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678544923"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="678544923"
Received: from kuhnbrex-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.81])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 09:46:28 +0100
Message-Id: <20230331084628.421814-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331084628.421814-1-matthew.auld@intel.com>
References: <20230331084628.421814-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/5] drm/xe: fully turn on small-bar support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This allows vram_size > io_size, instead of just clamping the vram size
to the BAR size, now that the driver supports it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5cacaa05759a..f6becf32ca49 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -216,7 +216,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
 	xe->mem.vram.io_size = min(usable_size,
 				   pci_resource_len(pdev, GEN12_LMEM_BAR));
-	xe->mem.vram.size = xe->mem.vram.io_size;
+	xe->mem.vram.size = vram_size;
 
 	if (!xe->mem.vram.size)
 		return -EIO;
-- 
2.39.2

