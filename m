Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C79C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F2B11A765;
	Thu, 25 Apr 2024 18:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eegHFMtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AC211A770
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714069429; x=1745605429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRjVpx8mQKo6/tqlkVzCPeaRjBVW6uKl5Eqre1prbbc=;
 b=eegHFMtTAukaWusw5aV8+9EKpmj05ibzQaEQgZabTuKc3suIJaTfwzh5
 Vc1Jc5/5/ftrQzPxiwf7Sq+6yJUS7oUG5H4diHsnb9XGstFY2ydjcDlIR
 bCf4lZIrrf8ULr/GBggmEcorrDRcSiGqvHRWxbKgKBm29Mpe3PYXYwWV0
 AzBClnaooLfPDN3q8MMAbVFIfQP1ljS25pj3KfvM82Y06Igvdfsd/8aDn
 qM2+fWPGAjdBGygo8vk/JTtDyWQQHZZdNFF1RIDpDixPLIeYn/YQwlj1q
 pETsMnaPA6JG64uScN3XA46ebrQd+HWsGSm+54IQKd72HMyQErP7UQGcq w==;
X-CSE-ConnectionGUID: NrzMUu8lRyCh+uyZ18w3Lw==
X-CSE-MsgGUID: W291wpPqTN6t7269wcfnng==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9605756"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9605756"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
X-CSE-ConnectionGUID: XlH01MyfSY6rGla53J5lQw==
X-CSE-MsgGUID: r91H7pkZSfiHc9ytKJaNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25157824"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: vinay.belgaumkar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 michal.winiarski@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/5] drm/xe: Move xe_gt_init_early() where it belongs
Date: Thu, 25 Apr 2024 11:24:08 -0700
Message-ID: <20240425182410.2705061-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

Early shall be early enough, stop doing other things with gt before it.
Now that xe_gt_init_early() doesn't need forcewake and doesn't depend on
the fake engine_mask initialization, move it where it belongs: it
doesn't need to be after hwconfig config anymore.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bb4fbae5edb6..8d04283b3617 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -566,6 +566,12 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_early(gt);
+		if (err)
+			return err;
+	}
+
 	for_each_gt(gt, xe, id)
 		xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
@@ -604,12 +610,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_early(gt);
-		if (err)
-			goto err_irq_shutdown;
-	}
-
 	err = xe_device_set_has_flat_ccs(xe);
 	if (err)
 		goto err_irq_shutdown;
-- 
2.43.0

