Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC00C79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31F910EB0E;
	Tue,  8 Sep 2026 10:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvDBBFdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508F610EB08
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862742; x=1820398742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MZB8Os/+TVa91En7/qKRRI2xBuwUqqgNctAyfAas6+4=;
 b=CvDBBFdZ8TpMJOvTf+JqCrnsv82iZif1VoDg+B54M45eIcyZFQwPjpHg
 cfa5ySm2Dxc2mBM+Fn7p+pICcF8V5cTjvikNOC4T9bbPV/fBJMDK61buA
 hZI70GtWhEItVx76VW0f/FUcLGSHwlST7XqOOCxzxWGH3jQg3P/9E1Tcp
 1MO9DAl+JjL/UcqY89RSSFt9PQZYOOrBC+Ul6OJtS0JJbMu+0TCgLteb6
 hLkxAyxFeW/MRt+KoBBsXqiPK2foi0Bjkb79p0cwJak2X2BZ9WrMVZMZW
 ZeeRExWMlEKTexT94NNpqb9kUuTylCii3KGxnXmtL9qlD9Z9lchzhCuMi A==;
X-CSE-ConnectionGUID: 40OdOoDzR0WB/l1dpssMwA==
X-CSE-MsgGUID: 1booHSEgT8aBth9QU+05Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278276"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:02 -0700
X-CSE-ConnectionGUID: nVMITqTfSxaZzIy1Zq3/Vg==
X-CSE-MsgGUID: GBw9X4eTSOqYj/CazFnIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628450"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:01 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 07/13] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Date: Tue,  8 Sep 2026 15:48:43 +0530
Message-ID: <20260908101849.1219614-8-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
xe_log_err() using the REGS component tag for register save-restore
operations:

  - MCR register mismatch corrections
  - Failed to add register to save-restore list
  - Force-wake timeout during SR apply
v2:
- Drop error type from logging explicitly(Mallesh).
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e328f5072557..ee17e8c10a46 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
+#include "xe_log.h"
 #include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_rtp_types.h"
@@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
 
 	if (is_mcr && !reg.mcr) {
 		reg.mcr = 1;
-		xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
-			     reg.addr);
+		xe_log_info(gt, REGS, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
+			    reg.addr);
 		reg_sr_inc_error(sr);
 	}
 
 	if (!is_mcr && reg.mcr) {
 		reg.mcr = 0;
-		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
-			     reg.addr);
+		xe_log_info(gt, REGS, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
+			    reg.addr);
 		reg_sr_inc_error(sr);
 	}
 
@@ -143,12 +144,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 fail_free:
 	kfree(pentry);
 fail:
-	xe_gt_err(gt,
-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
-		  idx, e->clr_bits, e->set_bits,
-		  str_yes_no(e->reg.masked),
-		  str_yes_no(e->reg.mcr),
-		  ret);
+	xe_log_err(gt, REGS, ret,
+		   "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s)\n",
+		   idx, e->clr_bits, e->set_bits,
+		   str_yes_no(e->reg.masked),
+		   str_yes_no(e->reg.mcr));
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -219,7 +219,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
+		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply\n");
 		return;
 	}
 
-- 
2.54.0

