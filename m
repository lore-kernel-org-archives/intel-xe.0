Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEE8C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89F610EB39;
	Fri, 12 Jan 2024 15:27:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E34810EB39
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073221; x=1736609221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tPewwudekbtN/uxmEbN3GBWGKdt+pLueIVDK+Iei7ZA=;
 b=PwCvICWJdarzUvRrK+O1dyD3aoj+TklRFwiJnjbGUs4yjQ2Pvab/x72h
 r0G3epeVdhF/3WxpQHe60VuPJdf/zY7tZXXKzm39L/s/Tes8eUIArwG/G
 dBCjxvgY1lRcFsJm78rnSDeFqPz0tSLElGAAGxp/w6GDFLZpBkbKsf8lO
 R8/ju8aivNYcToWwXZwdq0SvIKq/3OCeZeNq5CIbsqsJqFzc+BsQ49982
 c8OyXKmdeP1n6uJvNHwdk0F5R/71kY+diN4FLirQQhUL/uxiHvaAdckc/
 CPfYkyHZzmbj2KKwVWRt6E6L6rCNJrc7PHVHsbEuDRhrXpiDv3Ri54GO9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566360"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566360"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003138"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003138"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:26:58 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/8] drm/xe/vf: Assume fixed GSM size if VF
Date: Fri, 12 Jan 2024 16:26:42 +0100
Message-Id: <20240112152649.849-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

VFs can't use size mirrored from PCI config, but it should be
safe to assume it covers full 4GiB GGTT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 6fdf830678b3..ab96edb058d6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 #include "xe_wopcm.h"
 
 #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
@@ -144,7 +145,11 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 
-	gsm_size = probe_gsm_size(pdev);
+	if (IS_SRIOV_VF(xe))
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
 	if (gsm_size == 0) {
 		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
 		return -ENOMEM;
-- 
2.25.1

