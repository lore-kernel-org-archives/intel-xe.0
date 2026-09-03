Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC31C624D4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 05:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EB110E098;
	Thu,  3 Sep 2026 05:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKHl31Q+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC81810E098
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 05:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788414388; x=1819950388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4vIZnEKamt4SDC6V1nQzAjNDjVDJRlx/tNsVBO1x9nU=;
 b=BKHl31Q+va+b3tUDI+maMAk4SGuY+6SsuIqIx85OPIngr8In4NhfqW6H
 gHMSlW7PSGXaDlM6vavBQRLDWsOVaDs7NfOnr3WmtVSrjnx7Woee/RqvG
 ln9T1ivPvs5MGVG2hY34L/E73838GYvxUwLHphj71ezz4QesSwKr6OTGm
 ubJoQ63h4FDgCJ5ZfZKKkFzlFE76BehBZC9wkpMCiacKrfXN+dq7cJWIb
 r2pWYRcnmK/JCHMtl89+glkAvpS50LKV4AfjQ8NRhbneLqLH4MZs7YjAs
 r814gUK58uaI4eb2fOatOHobQydz5z1nQf7Cxh0L77Fct2x6FpaqtPk73 g==;
X-CSE-ConnectionGUID: TaiUCgxZQ7a9tDSV3d9+gw==
X-CSE-MsgGUID: zC5BSqEERYKbJKuV5esKaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100398808"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100398808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:28 -0700
X-CSE-ConnectionGUID: CdjOQNYURgaldcR/stf9Ng==
X-CSE-MsgGUID: ZyXjPlynReqe7jo+vuwenA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263447015"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:25 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v7 1/4] drm/xe/log: Add GUCSUBMIT component
Date: Thu,  3 Sep 2026 11:16:07 +0530
Message-ID: <20260903054610.3640788-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903054610.3640788-1-arvind.yadav@intel.com>
References: <20260903054610.3640788-1-arvind.yadav@intel.com>
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

The proper SIGID for GuC submission failures is GT_TDR, but using the
generic GT component may hide the real source of the report.

Add GUCSUBMIT as a DRIVER component and map it to XE_SIGID_GT_TDR.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v7:
 - Updated the commit message. (Michal)
 - Changed the GUCSUBMIT name to "GuC Submission". (Michal)
 
v6:
 - Moved GUCSUBMIT from DRIVER_FIRMWARE to DRIVER, since GuC submit
   is a driver submission component and not a firmware component.
   (Michal)

 drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index d6105520173e..526aadf85fe9 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -144,6 +144,7 @@ enum xe_log_location_bits {
 	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
 	define(DRIVER, 5, WA, SW, "Workarounds")				\
 	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
+	define(DRIVER, 7, GUCSUBMIT, GT_TDR, "GuC Submission")			\
 	/* */									\
 	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
 	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
-- 
2.43.0

