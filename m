Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F422CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413ED10E118;
	Mon, 12 Oct 2026 05:19:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09CC10EC8C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782372; x=1823318372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g3JC3+TQpE233P4zQrij0i9w3C5GTX4n3KidPJ4dqiY=;
 b=kW56gJ96/j0TqOgdjXqzFsWsdQBYO/GDo5fGIqb2f13jT1yn4YmsNdRM
 w4ACbcYsABKEbkSFG3R65Pp7aTMbZBGZJ/hAVIlTOMQlUr+2m3JalkfRp
 tJVemF87CT6LeflrkybrGbeSVY02lSc12FfjbeuHnHa6aSHEHYzD8H0z4
 a5lmfL/oIO9JXaJ5jySIgm3JUFNwGUbOwLhRNRdaVVuqu1SEyzSS2RwVR
 4GxQwcR4BwI/P3OuaPDSyu8t9h4stHqufeX4UdPRwN9Yv7UfopDSpeyt2
 BDp5+85tGgdTVLys46982T1PMO/q2KCoaEZmc/Beutuxr04v54YYbRDWB Q==;
X-CSE-ConnectionGUID: 3VxOXUk+SnuFePS43CYeZg==
X-CSE-MsgGUID: Ce4z3K0YSy2JweWItOqPRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390507"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:37 -0700
X-CSE-ConnectionGUID: +LFkdiVbTiKMXy0WIEFgLQ==
X-CSE-MsgGUID: HXbYMp69R0WBhC7dS7SOlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735896"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:36 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 06/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Date: Mon, 12 Oct 2026 10:48:17 +0530
Message-ID: <20261012051823.2201360-7-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

---
v2:
 - Drop error type from logging explicitly (Mallesh)

v3:
 - Replace RTP instead of REG_SR (Michal)

v4:
 - Update commit description (sashiko)
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

