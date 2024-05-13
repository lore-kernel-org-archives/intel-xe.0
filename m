Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B71AC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F0B10E775;
	Mon, 13 May 2024 21:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDfX1yv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54610E995
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715636235; x=1747172235;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=13/PjYk9AVfdfwyGkzwrHwhdlOJaGRLwh1bzdhKazZA=;
 b=nDfX1yv5c1wztjHbXacN1M5a+zLliBbzDEELjnxAPhbmRQglkUlFnZX4
 FtRIKd9dDSBqnKkbhpRyT1oXTth4rKr2ejoBWsuutZ63Jvlxqf1vxFiDw
 FkxjcGzFGtuPyESj6gbbmWrFaDqnN8ObsCurwwK3bVAh8dTxFHo52rzqe
 TqMLICq9t4V6f4B63WQMvXrB31m45mipQRJH2703gw0J4lkcgLbiUHWuF
 ElLn7rWJ5zdlMEQghdhejtVBxfpEN2Dxf64I5vhIYJ0JhxCJ5L743nkN7
 uDDdEtn/mP4clnnQyr/UvLrLN4F8B0GdBcQlaviRmIKy9ZVHnnpET7mkQ Q==;
X-CSE-ConnectionGUID: HW2P4xkhTNSAy2nDRD6xyg==
X-CSE-MsgGUID: 9OuVrvTiRzSv8Pu5dMqB/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11505917"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11505917"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:06 -0700
X-CSE-ConnectionGUID: sPin2Iy4QHumKZ2WaOxYnw==
X-CSE-MsgGUID: rOK3u5XFTuSISRcyUegfGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35348589"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 3/5] drm/xe: Move xe_gt_init_early() where it belongs
Date: Mon, 13 May 2024 14:37:49 -0700
Message-ID: <20240513213751.1017791-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513213751.1017791-1-lucas.demarchi@intel.com>
References: <20240513213751.1017791-1-lucas.demarchi@intel.com>
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

Early shall be early enough, stop doing other things with gt before it.
Now that xe_gt_init_early() doesn't need forcewake and doesn't depend on
the fake engine_mask initialization, move it where it belongs: it
doesn't need to be after hwconfig config anymore.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f89c781986a5..b08d4f213302 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -568,6 +568,12 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_early(gt);
+		if (err)
+			return err;
+	}
+
 	for_each_gt(gt, xe, id)
 		xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
@@ -606,12 +612,6 @@ int xe_device_probe(struct xe_device *xe)
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

