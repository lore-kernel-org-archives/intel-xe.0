Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23AFCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 00:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F8510E677;
	Wed, 22 Oct 2025 00:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSTMpPga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92B10E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761094543; x=1792630543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v3b6TVIo2okc2P7tpm87txenr2ZR/n2tssAddFV3pjo=;
 b=kSTMpPgaqnKkW5re3rsnBQVG28tdv9x2VEWDRCrjw+pomQOJsXgv5R7D
 D4B44CMXxJaEMBSAUEGCMDtT9aJzQj44q8YPlhylnjV8UkdQ4yGQRYJZF
 Cg6+9KevYDR0vb1Wd0LVtK/yOl8WtGdfGdronL3cXMCsggkLWRSEQYOG8
 6Az1AtOAlo1ucb7Ro3s9PUtTW9vszjFKXsm+avpvFqvnl42wpWnyPyLsm
 HW1ASAbn9Hn1PUaarV13d8go6EzMqZ/3eRXBlYGoeENbe4YYpaNAhe7uE
 jH7tRjR5XlpyKA5hAodRcnarP5/7ob+ryXOW9B4OPqOw8kXrMLhYjTZBo Q==;
X-CSE-ConnectionGUID: 1ftJpAklRJK0DC6c5THCdA==
X-CSE-MsgGUID: 5YIgrGk/Q9CWUBCm6qiSxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50807413"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50807413"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:42 -0700
X-CSE-ConnectionGUID: Rdmvdw79S6yEzYj2DLQG+g==
X-CSE-MsgGUID: 6fWauR7cRPi7dCpTpGuEbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="182938777"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Do not wake device during a GT reset
Date: Tue, 21 Oct 2025 17:55:37 -0700
Message-Id: <20251022005538.828980-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022005538.828980-1-matthew.brost@intel.com>
References: <20251022005538.828980-1-matthew.brost@intel.com>
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

Waking the device during a GT reset can lead to unintended memory
allocation, which is not allowed since GT resets occur in the reclaim
path. Prevent this by holding a PM reference while a reset is in flight.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d8e94fb8b9bd..89808b33d0a8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -818,17 +818,19 @@ static int gt_reset(struct xe_gt *gt)
 	unsigned int fw_ref;
 	int err;
 
-	if (xe_device_wedged(gt_to_xe(gt)))
-		return -ECANCELED;
+	if (xe_device_wedged(gt_to_xe(gt))) {
+		err = -ECANCELED;
+		goto err_pm_put;
+	}
 
 	/* We only support GT resets with GuC submission */
-	if (!xe_device_uc_enabled(gt_to_xe(gt)))
-		return -ENODEV;
+	if (!xe_device_uc_enabled(gt_to_xe(gt))) {
+		err = -ENODEV;
+		goto err_pm_put;
+	}
 
 	xe_gt_info(gt, "reset started\n");
 
-	xe_pm_runtime_get(gt_to_xe(gt));
-
 	if (xe_fault_inject_gt_reset()) {
 		err = -ECANCELED;
 		goto err_fail;
@@ -875,6 +877,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	xe_device_declare_wedged(gt_to_xe(gt));
+err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return err;
@@ -896,7 +899,9 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		return;
 
 	xe_gt_info(gt, "reset queued\n");
-	queue_work(gt->ordered_wq, &gt->reset.worker);
+	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
+		xe_pm_runtime_put(gt_to_xe(gt));
 }
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
-- 
2.34.1

