Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77692C3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 09:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2211B10E375;
	Thu,  8 May 2025 09:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZhBaj6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B711410E36A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746695311; x=1778231311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uN6N/DVgZzn7UeSsGji6USPadkX9Imh9wqXAoaUBZwE=;
 b=EZhBaj6pAoZ+WvRfOVkLhIF0pmtZk+X7riiRNEe/5W86OGB7AmeS2jmJ
 2pOkpwKmJkIFQvvtaUNNrrgqBUQjKPpLzoBiumMNHNWWs2P2jrGV2FfDG
 XDRMf/t2SJuPhuooEAEDR2TC7pmB1clMb6wlZA0cVBt153+nanCnjRzXG
 7AM7kw+6RE6gSbFGVgSIr1Z6LDruGN2bI7tBxnLr6tmncDfxPCxse5iVl
 d+rG55bitNSVkJlH6ea7tq4xRiSnacjjxnoTjzTS2ZW3wOLcM5e9gj4P0
 N89a1NwMs/NpKRWVobDhTdIXCTgAvfi/OdJ3xiURIQ3Ez6dvq1ec9kwI5 w==;
X-CSE-ConnectionGUID: zGNy0YPYQ8uhy99Q3dSL1w==
X-CSE-MsgGUID: 40t8ZtavQCCHsa8OEoXfCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52276408"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="52276408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:08:31 -0700
X-CSE-ConnectionGUID: 8I/obGDHRCyNAHo6XkR4zw==
X-CSE-MsgGUID: 9mJKCupnSOKMl3muHXrYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136730467"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:08:29 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Rename wait_for_lmem_ready and make it
 non-static
Date: Thu,  8 May 2025 14:38:15 +0530
Message-Id: <20250508090816.216176-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250508090816.216176-1-karthik.poosa@intel.com>
References: <20250508090816.216176-1-karthik.poosa@intel.com>
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

Rename wait_for_lmem_ready to wait_for_vram_ready.
Convert it to non-static to enable calls from other functions.

v2:
 - Add xe_device_ prefix to wait_for_vram_ready. (Anshuman, Riana)
 - Rename verify_lmem_ready to verify_vram_ready.
 - Replace mentions of lmem to vram in xe_device.c.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_device.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c02c4c4e9412..6d130a6dcba2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -624,14 +624,14 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static bool verify_lmem_ready(struct xe_device *xe)
+static bool verify_vram_ready(struct xe_device *xe)
 {
 	u32 val = xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT;
 
 	return !!val;
 }
 
-static int wait_for_lmem_ready(struct xe_device *xe)
+int xe_device_wait_for_vram_ready(struct xe_device *xe)
 {
 	unsigned long timeout, start;
 
@@ -641,10 +641,10 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-	if (verify_lmem_ready(xe))
+	if (verify_vram_ready(xe))
 		return 0;
 
-	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
+	drm_dbg(&xe->drm, "Waiting for vram initialization\n");
 
 	start = jiffies;
 	timeout = start + secs_to_jiffies(60); /* 60 sec! */
@@ -664,20 +664,20 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 		 * use a timeout and defer the probe to prevent this.
 		 */
 		if (time_after(jiffies, timeout)) {
-			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
+			drm_dbg(&xe->drm, "vram not initialized by firmware\n");
 			return -EPROBE_DEFER;
 		}
 
 		msleep(20);
 
-	} while (!verify_lmem_ready(xe));
+	} while (!verify_vram_ready(xe));
 
-	drm_dbg(&xe->drm, "lmem ready after %ums",
+	drm_dbg(&xe->drm, "vram ready after %ums",
 		jiffies_to_msecs(jiffies - start));
 
 	return 0;
 }
-ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
+ALLOW_ERROR_INJECTION(xe_device_wait_for_vram_ready, ERRNO); /* See xe_pci_probe() */
 
 static void sriov_update_device_info(struct xe_device *xe)
 {
@@ -728,7 +728,7 @@ int xe_device_probe_early(struct xe_device *xe)
 		return save_err;
 	}
 
-	err = wait_for_lmem_ready(xe);
+	err = xe_device_wait_for_vram_ready(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..0e807748287d 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
+int xe_device_wait_for_vram_ready(struct xe_device *xe);
 
 void xe_device_wmb(struct xe_device *xe);
 
-- 
2.25.1

