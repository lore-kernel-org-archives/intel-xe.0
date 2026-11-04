Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8156073539
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 21:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F4FzhVnu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869DB10E2CC;
	Wed,  4 Nov 2026 21:54:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6810E071
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793829241; x=1825365241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ElLQJKLkUkSYoi3OKTU9OXmmkUrDcw7sbzs5D90XmYI=;
 b=F4FzhVnuceap2Pl2QVodOUexclLbOg3FBS3mBSTGoWHyWE+SIrtUZJG0
 w1LevIrz71lL/T1zUFYHV99exsKzCQCjpbV2RQiiLoMoIFgPLUcDB445i
 tahYboFJV1AUcWKmgZ4oS7pBmmQmrK2lbyVWWX/q9Uua2gl+6WSm7AkFh
 eK25GXlt/yqCDTU2jsj0jdiYRFQ6VrOLMxO6zLE1LwpbbVScVWvKu8TQx
 c0ZgPTxn/KcvQpktstqPtJfmnt5HrmIMxhAMbQeMVie3+K/KtP6hR/vCI
 mVw3QIAm8vtRSysEPRyvaR25jUeFVYNa29iPbXbugEx/1BrH6IEefh03l A==;
X-CSE-ConnectionGUID: WpUcm/blSJyG+40QB1aUVw==
X-CSE-MsgGUID: +VlFmvsbS8OKcycfI6855A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2502150"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2502150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:56 -0800
X-CSE-ConnectionGUID: tv7b7qVhRzS+v+HncQ1Tew==
X-CSE-MsgGUID: k7X4KDEgRJeR+jxtEXFtAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6831386"
Received: from dut4425arlh.fm.intel.com ([10.1.80.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:55 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, anoop.c.vijay@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/3] drm/xe: Process device OOB workarounds during early info
 init
Date: Wed,  4 Nov 2026 21:53:55 +0000
Message-ID: <20261104215353.234314-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104215353.234314-5-stuart.summers@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
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
index 273e2c45fea9..ae28584e1e95 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -712,9 +712,6 @@ int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
 
-	xe_wa_device_init(xe);
-	xe_wa_process_device_oob(xe);
-
 	err = xe_mmio_probe_early(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ba23ec60477b..ee3766e2b938 100644
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
@@ -39,6 +41,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_tile.h"
 #include "xe_tile_printk.h"
+#include "xe_wa.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -794,6 +797,17 @@ static int xe_info_init_early(struct xe_device *xe,
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

