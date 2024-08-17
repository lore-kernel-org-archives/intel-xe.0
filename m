Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3910BC531DE
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 02:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C5810E041;
	Sat, 17 Aug 2024 02:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF0U8LM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0CC10E021
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 02:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723862864; x=1755398864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ze/lVVuJGF9YVI3Y/QUHzhNBNKIJThDI//J8NG3Q9lA=;
 b=GF0U8LM2oBcJyIT+7ZbHV268YkGLbjm4X9OSLlcBzS5i6H3+AbsMdan4
 wKWhDPpdFUetKr5cTrP45YyWxE+TUA8x/qIEVIvrH8ByGFg5avML1iFDb
 9wmL39CIyGjggpwoopyDVvDGXKH79Y+JvEbQMf+BrdAfMRaLTzVJ0wVZF
 n7MsQQmkRNctP1TdTWUPvDUaJK6j6CPJM2wDKE7Qcft1mBg45vgu/vVkT
 pT4i4hnboBcLDqwXPQfHMkiBShuuioYFDgKoYw3CFYpbxOj1+TCLJrXZ6
 Ry6KqM2H+rVnhm3bwz3Cp2kaLoGcVkxJ93DO9PtAjiVbVWnQLgwBD5GLX Q==;
X-CSE-ConnectionGUID: dfG8TNWZTLui42JtpQhxSw==
X-CSE-MsgGUID: cAqGufpZQE+BrRvkyInByw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33316197"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="33316197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 19:47:43 -0700
X-CSE-ConnectionGUID: Os+jyiLyRz2QCMDW/mfSCA==
X-CSE-MsgGUID: 4Lxp480rTSOOOyTZwdr4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="59852821"
Received: from dut4310arlh.fm.intel.com ([10.105.10.103])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 19:47:42 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [CI 1/3] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
Date: Sat, 17 Aug 2024 02:47:30 +0000
Message-Id: <c9a951505271dc3a7aee76de7656679f69c11518.1723862633.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723862633.git.stuart.summers@intel.com>
References: <cover.1723862633.git.stuart.summers@intel.com>
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

On driver reload we never free up the memory for the pagefault and
access counter workqueues. Add those destroy calls here.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9292d5468868..b2a7fa55bd18 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -382,6 +382,18 @@ static void pf_queue_work_func(struct work_struct *w)
 
 static void acc_queue_work_func(struct work_struct *w);
 
+static void pagefault_fini(void *arg)
+{
+	struct xe_gt *gt = arg;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->info.has_usm)
+		return;
+
+	destroy_workqueue(gt->usm.acc_wq);
+	destroy_workqueue(gt->usm.pf_wq);
+}
+
 int xe_gt_pagefault_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -409,10 +421,12 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	gt->usm.acc_wq = alloc_workqueue("xe_gt_access_counter_work_queue",
 					 WQ_UNBOUND | WQ_HIGHPRI,
 					 NUM_ACC_QUEUE);
-	if (!gt->usm.acc_wq)
+	if (!gt->usm.acc_wq) {
+		destroy_workqueue(gt->usm.pf_wq);
 		return -ENOMEM;
+	}
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, pagefault_fini, gt);
 }
 
 void xe_gt_pagefault_reset(struct xe_gt *gt)
-- 
2.34.1

