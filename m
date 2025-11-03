Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B666CCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 12:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79EE10E1CD;
	Mon,  3 Nov 2025 12:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCA852qC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA8410E1CD
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762173085; x=1793709085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFYJPBlECet3hNqmK7kMDrr67PULF0qAYg/sNMJCBLA=;
 b=TCA852qCb7R+48EphWiEC5BNVyr9OpLvkbbK0nvN5leDzjiXCeLiv0BJ
 OM/nI1wYg1oGZmnwqU20Po1k4TSRd3Oa9Ooy5A6v4Oky7lu7/Tv/34+6h
 DoJkbvE1s1+owYy3kv5V7mAKDqFd+pPN0+DfK1qeCA3r/H0q7Ww9vpF1u
 gGCiMzxblnEfwTt/+L9FY1Hm9/ua76iNlQMSFZtG2C0Qz7ptZhjVDS3s8
 KMlo3EQuVkzPFBNEBw+HRWNtwdezPR6tqeefSipUpGFVEp/NX5ga0SX8d
 ouQjt65TEUN0bCCnUbG7JqGf/13pEtsAu09aQeBqAVrKEHjVV5J8046JE g==;
X-CSE-ConnectionGUID: LCI5oH59RqKf+Wy47CDVVw==
X-CSE-MsgGUID: hAQOMdSoRiWNWesWxCIP9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64397359"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64397359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:31:24 -0800
X-CSE-ConnectionGUID: C1Yywe6pQxmFoRmXMseRkg==
X-CSE-MsgGUID: Fx21fAxSSvqixYMrmaKI2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187171973"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:31:23 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Date: Mon,  3 Nov 2025 18:01:46 +0530
Message-ID: <20251103123144.3231829-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
References: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
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

When unbinding wait for any GT reset in progress to complete. Unbinding
will release the mmio mapping but mmio operations are performed during
GT reset causing Kernel panic.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
v2:
 - Use the managed resource release function to wait for GT reset during
   unbind. (Lucas)
v3:
- Release the reference to the rpm if gt_reset_worker is stopped from
  execution. (Lucas)
---
 drivers/gpu/drm/xe/xe_gt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 60bac65c8b9d..e008e3c1bf68 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -607,6 +607,13 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	if (disable_work_sync(&gt->reset.worker))
+		/*
+		 * If gt_reset_worker was halted from executing, take care of
+		 * releasing the rpm reference here.
+		 */
+		xe_pm_runtime_put(gt_to_xe(gt));
+
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
-- 
2.43.0

