Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FEBD1D88F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 16:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D9610E09E;
	Tue, 15 Oct 2024 16:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzqVVlvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0D10E09E
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729010886; x=1760546886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F/XsZDUILhNCqadUlVhVGF4X/4lQWkq+RXdI2w6j3rQ=;
 b=LzqVVlvydE6X/7V5O/FDcYRPmazJHxdRkJVltcd538Qz+Ev/lpcazoo2
 etiaI5BuyiUz0B5mOb33msyfnGW1kKPV1MN6SFLDQNAWKKHgTBerV+Xvo
 xDUU93cK9oAld3fh+g7wc4Z0HVfwXhJKyzU7WjrITP6l9aofdwiIt5yPp
 lDHanF5aelARnmmkT69ZcNpPgDgmJ4o9nDtfX1BUmik5D43uTVkciJWSG
 iMvi0Uc3Kly/LT8CFpEKelFmxmcOT953uQX8dOtwf9ksuD/uiHfjlhz+G
 Uj92M7/wTTt3oGhaEIyU9yEvGdNLIvfAUJc0YcF0AZP07Uqd6IBLjeUOM w==;
X-CSE-ConnectionGUID: zjnzrTmsRHyvD3lEN2Ri5g==
X-CSE-MsgGUID: al0eOCJ9QbyHFwD3qWtMLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27896924"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="27896924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:48:06 -0700
X-CSE-ConnectionGUID: wGMLrlkLR+W3PdthSoZmqA==
X-CSE-MsgGUID: kfyBncZEQR2OcM+Oq6pofA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108724498"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa002.jf.intel.com with ESMTP; 15 Oct 2024 09:48:04 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Jia Yao <jia.yao@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v4] drm/xe: Enlarge the invalidation timeout from 150 to 500
Date: Tue, 15 Oct 2024 16:12:07 +0000
Message-Id: <20241015161207.1373401-1-shuicheng.lin@intel.com>
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

v2 (Jonathan):
  - rework the commit message
v3 (Lucas):
  - add conclusive message for the fail rate and test case
v4:
  - add suggested-by

Suggested-by: Jia Yao <jia.yao@intel.com>
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
index 962751c966d1..22b572f0612c 100644
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

