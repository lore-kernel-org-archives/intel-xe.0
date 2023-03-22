Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E190AC6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 14:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D4F10E38A;
	Wed, 22 Mar 2023 14:20:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C927910E95D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679494840; x=1711030840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=onIvKcFWQ2G92ghDN1WZBMYP69fJtiBWQKCCBLDE5ac=;
 b=ko3VXvjRNocDEzLjDeK7stp/qS+0lo6K3Ili5C7JGg17wDKlJGHlywLL
 SL287zLopddeROar7uzXgDHcUHCRnZSHXwsszRWYE+TJYb9sl9m9fpDJu
 D1aszzSAx7DUD85r4lXzb47bMkw9AG/SlHy4F0Zlsz0DfxVhUCADU1pjY
 3wJj6p9z5h65JEd1dTXrf8XnwpBVqvhNaDxs8cJ+8rFU84+/4JPdYNjxM
 VXqzH2c3hjM3Oxn8kn5yb5BAM7T7Cb5QASogBi1YJSfPULMQJ3W0uUGwE
 P2uxavB0KwXHrP0fQ9zQkAsxranLn8gNxBIPWyh+AGXzFMJJA3ePpoqs3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336727403"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="336727403"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659201157"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="659201157"
Received: from ftbyrne-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:20:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 14:19:36 +0000
Message-Id: <20230322141936.297612-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322141936.297612-1-matthew.auld@intel.com>
References: <20230322141936.297612-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: fully turn on small-bar support
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

