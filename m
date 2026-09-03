Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE6CC624D4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302CC10F6E7;
	Thu,  3 Sep 2026 16:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlB6ySK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1763110F6E7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452201; x=1819988201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AMelpljDHNACKmiSvhEpluyEXxRT/mDPKyL9Bti9GfQ=;
 b=hlB6ySK2BwGy1mH9wBkGoQgQzu4HPq+XdGSwd9SiGQA49btEhfcsyMqZ
 MlM3u4r37Br/hJL9ewSwusN9GWte3/XtHfuoeotfmQ9CxCTxm92JfaGzJ
 i6QZoVOeRh0j/ctaRY4s9TwApgbUh3IL89IeK5NTBOB4HyjzAXbXL1oOH
 //HSQjEcE7AXKLS9uC23YlJlyPrQWZh8rGYHPJukFNc9JjeEzm5cUPABS
 EREBfDkCppD4hXRNwX9Be6FT0LzDOxgngR3QXWw8sHvBAHb7r0RbI1Yx0
 kXs0xOacBVYknex7l/mFarXiJVpLxTgXy7tye5AIa/XU1r12J3aHpYkUZ g==;
X-CSE-ConnectionGUID: ruJz2MqXRCWK5XVikrPWxg==
X-CSE-MsgGUID: h6I3Q9etTfuU9rjjT6utnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114487072"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114487072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:40 -0700
X-CSE-ConnectionGUID: cLpewEb3RgyOMLzRFtFaYg==
X-CSE-MsgGUID: c2ODL/sDS9KJkQ6EQ6GqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461638"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V21 12/15] drm/xe/vram: Check disable_vram_page_offline policy
 in fault handler
Date: Thu,  3 Sep 2026 21:46:05 +0530
Message-ID: <20260903161553.528932-29-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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
index aea4cb0b66fd..f4810cb961df 100644
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
@@ -904,6 +905,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
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

