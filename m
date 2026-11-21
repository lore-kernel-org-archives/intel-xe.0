Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CF606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DctTb1y9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C8C10E447;
	Sat, 21 Nov 2026 18:23:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C47110E447
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285406; x=1826821406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P33Jz5/lyJKbRmi/W+ZQnoh0q8l48zM394qzTR6SD+E=;
 b=DctTb1y9UQIxa9vy9i7hQzZah2LjX4CqwM9v6GdBx6NB+8YDygaBNkzV
 SNOayk+3XyPz6j+E6yuc2B2ilUeuPokTd04xahnaTWtgQ8y8CQS6mAFXx
 CvE6AFsIx9uJCsAhpuBcnObKSzDgSWXHxZiyKEyv1pfQJVroH06Gt1Otk
 CAJ/fD/cdHjISPWOcXiOiOjDKxt+wtbZJMuPIWeIYo92bk9/utnHss2sW
 dbdIIyPsxdj6vIkfRwaZJggihKg5ryfGY8IAQvBgZdAlmYF1KSb5N5eSJ
 oSxyaNrVeFqnNBWlXCa2o7+bblbBeZYpA1M8itP/omXLu1AXwae1cwN7x A==;
X-CSE-ConnectionGUID: n7ADeUNSQuG3EN5t7DZ3xQ==
X-CSE-MsgGUID: QINZlm7sQb6NUQWewkQlGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034057"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
X-CSE-ConnectionGUID: Y8YuhyR5S1OIEfuUuWjkWA==
X-CSE-MsgGUID: j8KONVkbSViHjg5kG3+lIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934407"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/17] drm/xe: Process device OOB workarounds during early
 info init
Date: Sat, 21 Nov 2026 18:23:18 +0000
Message-ID: <20261121182317.48981-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device OOB workarounds only match on platform, subplatform and platform
step, all of which are known once xe_info_init_early() has copied them
out of the device descriptor. Processing them there instead of in
xe_device_probe_early() makes XE_DEVICE_WA() usable for the rest of
early probe, which runs before xe_device_probe_early().

While moving the call, check the return value of xe_wa_device_init(),
which the old call site silently dropped.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ---
 drivers/gpu/drm/xe/xe_pci.c    | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f5a581d39c96..b053a788d59c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -715,9 +715,6 @@ int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
 
-	xe_wa_device_init(xe);
-	xe_wa_process_device_oob(xe);
-
 	err = xe_mmio_probe_early(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 619653c68f2c..fb2a5f3311c8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -15,6 +15,8 @@
 #include <drm/drm_drv.h>
 #include <drm/intel/pciids.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
@@ -40,6 +42,7 @@
 #include "xe_tile.h"
 #include "xe_tile_printk.h"
 #include "xe_wedge.h"
+#include "xe_wa.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -795,6 +798,17 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
+	/*
+	 * Device OOB workarounds only match on platform, subplatform and
+	 * platform step, which are all known by now, so process them here and
+	 * make XE_DEVICE_WA() usable for the remainder of early probe.
+	 */
+	err = xe_wa_device_init(xe);
+	if (err)
+		return err;
+
+	xe_wa_process_device_oob(xe);
+
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
-- 
2.43.0

