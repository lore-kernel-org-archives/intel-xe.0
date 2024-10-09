Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE34CEE358
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 22:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4310E0E6;
	Wed,  9 Oct 2024 22:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRhT94BH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D3010E0E6
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 22:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728511548; x=1760047548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A1+uZo4H/+H9XDGJIK8chn58mtDpizsaAH1NvHZE4hs=;
 b=SRhT94BHuXaHh2eCnBwSlQpcoD7K4tDQuzwH4q5kHQuJoV0orbotPtJa
 /LiAZmMvsgfYl4Up9vnyvN21R3h9ohWEkq6Ig7MCxXKZKyDPybZp8Ox+r
 SHjrVtQ05VrShS4FHeONEkVumZGJkVzI7ZoF7H8TOq5zs2PgWTQUQaLHL
 lGg3qxkIVwHUxsV4xka6qtWIRbsjG7/+dl3dyluaoRJ5nnIaQRqZH+V/A
 771SFdRrVZuinU+xXKIipMp8ZicCgE33zyxHs5kK5v6S6Gvf1Gh+8vnp9
 muTJt6+x1vthJzRhnOLWsS2Ls/ArTlM4NWVd9hgmMA/DugFWwLgYTDQST w==;
X-CSE-ConnectionGUID: +xoE7tOfRPqTf7NRS9qGlQ==
X-CSE-MsgGUID: 7QbMyR8sTPuCjSl6Zse7aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27289069"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="27289069"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 15:05:48 -0700
X-CSE-ConnectionGUID: HAGTVb63R/e6ICQDrlP4Dw==
X-CSE-MsgGUID: HkN5q6eFRdCZ5D9o0jFjUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="76706633"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2024 15:05:46 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v2] drm/xe: Enlarge the invalidation timeout from 150 to 500
Date: Wed,  9 Oct 2024 21:30:57 +0000
Message-Id: <20241009213057.958453-1-shuicheng.lin@intel.com>
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
Changing the timeout value from 150 to 500 could help avoid these error messages
in the stress tests.

Due to the way xe_mmio_wait32() is implemented, the timeout is able to expire
early when the register matches the expected value due to the wait increments
starting small. So, the larger timeout value should have no effect during
normal use cases.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
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

