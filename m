Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF5CA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7020410F7DE;
	Wed,  7 Oct 2026 21:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3p1WtzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BFF10F7D5
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407668; x=1822943668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8PZH8lqmAK5sAMdmZba5qA0TlilAByTkLEBj+XCGEuA=;
 b=J3p1WtzT1VVHf+VUVL4s/9i1ZZNiuvjSRpQxTRZceTyNH4+y07Jpvo3g
 FoqDxAFigWiTMSMEGmuY58NP7SFBfTvLzExOsOpqHv74GEMBvt0ZGJl3k
 LRl2Mn4KhxqtD47AgRdTXetvFcIvJvcx1cPpXdOJyIscA7bdjeRyxpIva
 ug5H0zSmDxoDNQ8cy3r40S6kF810jkxc79qRpyfOULuTZfexMeju+4z8J
 R2eNAoCb+PP8DVp1p9NOEAaoXiGr9F9HHeley0xrFGQ9nqNtS4lK+uMwP
 8rz9NS9RqHGK13S39ejC6d8CbyhOtNYzTtMsPfK0inFs6+ptfT6b97oEa w==;
X-CSE-ConnectionGUID: Mp7l9u+FSFqfWvwUWFGJhQ==
X-CSE-MsgGUID: PFE3Up+uQ3er+9CS+qS+Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77163"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:28 -0700
X-CSE-ConnectionGUID: 1MITradwR8C2k1FQ7psihw==
X-CSE-MsgGUID: eSy/y1S4SpyE7zO3/LMBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526825"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:27 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 06/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Date: Thu,  8 Oct 2026 02:44:11 +0530
Message-ID: <20261007211417.2093611-7-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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
xe_log_err() using the RTP and REGS component tags for register
save-restore operations.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

---
v2:
 - Drop error type from logging explicitly (Mallesh)

v3:
 - Replace RTP instead of REG_SR (Michal)

v4:
 - Update commit description (sashiko)

---
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e328f5072557..eab84a528d12 100644
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
+		xe_log_info(gt, RTP, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
+			    reg.addr);
 		reg_sr_inc_error(sr);
 	}
 
 	if (!is_mcr && reg.mcr) {
 		reg.mcr = 0;
-		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
-			     reg.addr);
+		xe_log_info(gt, RTP, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
+			    reg.addr);
 		reg_sr_inc_error(sr);
 	}
 
@@ -219,7 +220,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
+		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply\n");
 		return;
 	}
 
-- 
2.54.0

