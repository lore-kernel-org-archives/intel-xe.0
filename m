Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408F2C64ED6
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2270910E689;
	Tue, 28 Feb 2023 10:42:17 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95DC10E689
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580933; x=1709116933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hnda6HvKYRSxfS63fkaxERt1dz3F+QBrQvNUH4Du/9A=;
 b=ZofZKZ8uKs79I3PT+EbvZU6CXDRUgzehAq+mfTk7eOifYcjU8QPSt3NP
 699RSxY+whawZofDx3PnXizF2HKfvLNlSntwZ2q0vMAfrJuJdHQ+h5R+C
 Q4hhK6gg5DG1vcuBlRwDH7RCcUe+8LJbk8ZAG7UIrsNDKw7KW2VKJXk2O
 tbjaOkSLYP4sgR3ja8FFjzDfRI8VG57cYoYWxGO2xbl8bc7Entg8sfjL8
 xOomw22dWIymknYXeCk6Qj1ToUeb1sN3B7dslKhFoyuDnnuIzDIiqm4Qv
 efH4RD0EwdDJJT1g5TYm0EFVzB4lkMO44VjhczAWZL1zbAAUmNrE0jErc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884741"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884741"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108988"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108988"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:37 +0000
Message-Id: <20230228104137.80965-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/14] drm/xe: fully turn on small-bar support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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

