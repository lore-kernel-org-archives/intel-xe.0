Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8698CC61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCCB10E255;
	Mon, 31 Aug 2026 06:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0sLUCwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BDE10E61A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159068; x=1819695068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYfiHlOBHp0pab292QxlLg+vbow/CIb9Yo/p5li2kBc=;
 b=H0sLUCwuanR8bpJouTZ2EFKJ96xncZqtJfeDJK6fwOTq/snAMvyGEVV9
 p6ZBgOLF2M1hFjRxQukbcj3NB/xJFduQu+PCIM92RHzIRCEkgI4YfHEnh
 stLimgquRNmGVjzWki7bf3slhwmjQAe4qU7qxFV1B67nt1JReny5zkEiP
 BnSGZWzpwVnQNt2SAw1gq7FkVEGVPChryvPxikD4bvonDrjg12OvoQ9aO
 bZ3MBqHDfsw1tUmi5aztiyfrWyv5sbREImmZ4nLRVphs5oQNR1+0kvdkI
 qzz3sMvnSwmbSQGCWwAYvaqLP5UbJ753Ig093ti95WyMfeGiehX8pyIZd A==;
X-CSE-ConnectionGUID: FDfG566TQRmRCfU+PAU+og==
X-CSE-MsgGUID: Fuyq+HFkTWG4XByTjF/AXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081718"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:28 -0700
X-CSE-ConnectionGUID: m3cXVoP7RA+UIex5UGisVA==
X-CSE-MsgGUID: 4b8hZz38QFKSbYi8Iicqzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302892"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V19 12/15] drm/xe/vram: Check disable_vram_page_offline policy
 in fault handler
Date: Mon, 31 Aug 2026 12:19:54 +0530
Message-ID: <20260831064942.315720-29-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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
index e5994c14487d..286c866f1d58 100644
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
@@ -834,6 +835,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
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

