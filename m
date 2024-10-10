Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE79D24456
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 22:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1737610E9E5;
	Thu, 10 Oct 2024 22:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrY54C5T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5DA10E9E5
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728599294; x=1760135294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EUv1RGwDApeL/BsiVZ0JGv1sFVgohJuEXU9UQQP3buA=;
 b=CrY54C5TujnFCMdJ7N8IZTOaPDq+ZqsK2tgI8GtHix8pRzmwgVoejufu
 0/UzSZGKU0CEcIBk7NwOgxLm+VKJJyUTUA3ncZIYVSOuFbLnnN+LyeOol
 7rdbOs/jDNpqsMaYKBvrb7s3MiR1g+doGx6jqWc25qAaTRNyhoX1ukTxv
 iBpeDa+uuPGq+3QAGcRnbs0N7FcyUYBcQkQ4MTBgoq/URiC0Fm2QgiZps
 SyyFg2pguKbrCYuiefqV18gSwcdusMY3FsWvKVnzeRNIN12qCsGD8tp2Z
 LbzhufzO/NIFUqXd5OkDrOpBfnINtZJI2oiGcZE9d2SEi1UbLBIF1kcLX A==;
X-CSE-ConnectionGUID: A7AOdIuLRZOm44n7Rqgkmw==
X-CSE-MsgGUID: clNRWYsaS0qQKzd3AntVMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27880617"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="27880617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 15:28:14 -0700
X-CSE-ConnectionGUID: +ywGP5HqSIWGNTOsxQomaQ==
X-CSE-MsgGUID: wxUDRwFySFGOLoLbotVkdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="107589984"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa002.jf.intel.com with ESMTP; 10 Oct 2024 15:28:12 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3] drm/xe: Enlarge the invalidation timeout from 150 to 500
Date: Thu, 10 Oct 2024 21:53:46 +0000
Message-Id: <20241010215346.1002048-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

There are error messages like below that are occurring during stress testing:
"[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
Previously it was hitting this 3 with 1000 executions of warm reboot.
After raising it to 500, 1000 warm reboot executions passed and it didn't
fail.

Due to the way xe_mmio_wait32() is implemented, the timeout is able to expire
early when the register matches the expected value due to the wait increments
starting small. So, the larger timeout value should have no effect during
normal use cases.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Tested-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd241a8e1838..60aebf7561ec 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 	spin_lock(&gt->global_invl_lock);
 	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
 
-	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 	spin_unlock(&gt->global_invl_lock);
 
-- 
2.25.1

