Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07911C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B1310F6D0;
	Fri, 14 Aug 2026 17:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1aCmNqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB6610F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727931; x=1818263931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LaaRXQUT/Lfb1gSX7H0kdA/XYDYR4N/CqDVWAmIwIJI=;
 b=c1aCmNqdh6rr7XKFh6UpiT1zOW6mBZMfv2dd+AW5aJIX99bdlKjtALWg
 WB/mfG7RzDPDVdw+k/hHvpxaVcMc1TsEDNKU2p9EgdRcDvNoSsZ9gA+SU
 WGXrdKVhEQATK/Fw8Ts4TKb/ZUpXmnMCIl+lZM21p+Y5+Qv12C8ZCSXeX
 v5nn03L8CzhEAytLVrmi5vjuixjvG1YDKAc+27GKbLGbtiyxHE9KSmTFF
 1x8HQ2PgcOxeYc0WjGlUzfi3LIL/crX+deJVAhDTZnTROX+vg3mv6RUTu
 3WuKFMnFjyKEpD8I+sevgX54zmPYILY1VtcFWZVXkPtY5y0BlE2Y+YhNc A==;
X-CSE-ConnectionGUID: juZrupJ9R6iQ5wpFVbDJyg==
X-CSE-MsgGUID: 9tYjlw19Sym5Uy7qZRh0TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464063"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:51 -0700
X-CSE-ConnectionGUID: wxP/pkgbRhuGp20k2XIfLw==
X-CSE-MsgGUID: PAMMqxLnR06BWm+Bsk5yxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946231"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 18/33] drm/xe: Report 'probe blocked' status using SIGID
Date: Fri, 14 Aug 2026 19:17:44 +0200
Message-ID: <20260814171801.13347-19-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'driver loading blocked' status using xe_log_info() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: use info severity (Aravind)
v3: drop "Probe " prefix (Mallesh)
    drop redundant vendor code, update message (Michal)
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 36d62927b969..b19efef1c5cd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,6 +25,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_error.h"
@@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	if (id_blocked(pdev->device)) {
-		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
-			 pdev->vendor, pdev->device);
+		xe_log_info(pdev, PROBE, "driver loading blocked for device '%04x'\n",
+			    pdev->device);
 		return -ENODEV;
 	}
 
-- 
2.47.1

