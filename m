Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56487C624D9
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A2110F268;
	Wed,  2 Sep 2026 14:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqDjAtWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A10910E021
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360914; x=1819896914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8PUu+qXBhD4XJ0OdAtFEwO7y/kXE5rpdEB6RWWuEQ4Y=;
 b=LqDjAtWyCc3KumYF+DaINmEURuZfdDVc2R0ryMloRaWOSjCN+q0PAP61
 750li3clxHclGxQIqqn1FFrNYl9sZOZ4bhusT87co+avcpzqxfInhPEyX
 6wubxCiFMgVNdlI3zJVoPEJ639drff+stb1eN8pxRHIIRoYrLLXF/8bvw
 jCwJPZ/fV2rLIRjb5D2s6JxTT1G/j9bZsw77RjOl2E3gxxkdDPR9aWLYH
 4XYuseFuJFd/wI45EeOMPcE6qCOlZ20a5cTMALMABCSJ5faGi0qRyqa6y
 wejh5O6TBUXBO9oZW7Y/tluxOuvrRhaN7p4/7h5kw0Puf69QSIzvpNceL Q==;
X-CSE-ConnectionGUID: eQEzP0RvSB2e9Yo1CqRUnw==
X-CSE-MsgGUID: AXW4negmQEWCS0E6OduW8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526039"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:11 -0700
X-CSE-ConnectionGUID: mPDf2vD0QX+RSw5xGpPIVw==
X-CSE-MsgGUID: 4VdTCPclRsWLmL4C41t93A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260144"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:08 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V20 12/15] drm/xe/vram: Check disable_vram_page_offline policy
 in fault handler
Date: Wed,  2 Sep 2026 20:23:55 +0530
Message-ID: <20260902145343.465686-29-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

Before reserving a page at a faulting address, check the cached
disable_vram_page_offline policy from xe->ras. If the policy is
enabled (logging only), log the corrupted address and return
-EOPNOTSUPP so that RAS can report to firmware to drop the
address from the SRAM queue without attempting to offline the
page.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 0ab92bc3c699..00569c5279a8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -21,6 +21,7 @@
 #include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
@@ -906,6 +907,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
+	if (xe->ras.disable_vram_page_offline) {
+		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
+		       addr);
+		return -EOPNOTSUPP;
+	}
+
 	/* Reserve page at address */
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
 }
-- 
2.52.0

