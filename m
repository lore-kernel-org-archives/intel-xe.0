Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F424C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 17:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37410E740;
	Tue, 22 Sep 2026 17:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STGikWeb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7471210E63F
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790097565; x=1821633565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1vDrj/xiELL7hN/nx/JdinckAG7w3j1e8D2j03dgOm8=;
 b=STGikWebHMGfpnf73CFVfu7OwGM+PRMvWpUQEhiZPxMbHjT2WYt8Yo0n
 MIC8jJyhuskmUZajtoebB0KWbbTz1K1MhI/wY1qOTDqK3eWZc1iTvNadQ
 Hilr4EMmxFdlARBziz0kbN5FR+OixN8Rt202utqZ/ya+vPzH/JdUXkJpt
 A4U+tKu/HCKjrs5xjQUzEU5FltiY4WP4FSh1TcIJ0I7BFhdgUtbGZRTNi
 JCaC1vQzPs9K64D0QjTLJlAldTuNcDQMoqjCceI+F0HAQYWpsdbswgSC3
 SUA15T+iJCsD7M8AkAkA0Z0OfP7OhQT18gdgmbrpkPLBufoalvDqLRYu9 Q==;
X-CSE-ConnectionGUID: Xmg1BYa2ST+QAUcByHe/3w==
X-CSE-MsgGUID: eGTX9VtBRg682NQMULbXkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1226503"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1226503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 10:19:25 -0700
X-CSE-ConnectionGUID: Q6fnbTMqQQWmUbWWsbKr2w==
X-CSE-MsgGUID: I6LQuFy2TwyrxgSeSMWl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="277985277"
Received: from yshashi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.113.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 10:19:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Tales=20A=20=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [PATCH] drm/xe: Add and use TLBINVAL component
Date: Tue, 22 Sep 2026 19:19:11 +0200
Message-ID: <20260922171911.500-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Replace the existing TLB invalidation error message with a new one
based on the xe_log_err() macro and use the dedicated TLBINVAL log
component.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tales A. Mendonça <talesam@gmail.com>
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
 drivers/gpu/drm/xe/xe_tlb_inval.c   | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index 526aadf85fe9..adb3c2128251 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -145,6 +145,7 @@ enum xe_log_location_bits {
 	define(DRIVER, 5, WA, SW, "Workarounds")				\
 	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
 	define(DRIVER, 7, GUCSUBMIT, GT_TDR, "GuC Submission")			\
+	define(DRIVER, 8, TLBINVAL, GT_TDR, "TLB Invalidation")			\
 	/* */									\
 	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
 	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index dd1030de9ab6..da629d410829 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -11,6 +11,7 @@
 #include "xe_gt_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_tlb_inval.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_tlb_inval.h"
@@ -86,9 +87,8 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_tlb_inval_fence_timeout(xe, fence);
-		drm_err(&xe->drm,
-			"TLB invalidation fence timeout, seqno=%d recv=%d",
-			fence->seqno, tlb_inval->seqno_recv);
+		xe_log_err(xe, TLBINVAL, -ETIME, "fence timeout, seqno=%d recv=%d",
+			   fence->seqno, tlb_inval->seqno_recv);
 
 		fence->base.error = -ETIME;
 		xe_tlb_inval_fence_signal(fence);
-- 
2.47.1

