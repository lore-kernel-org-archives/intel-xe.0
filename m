Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39236CEBF61
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 14:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81710E0AB;
	Mon, 17 Nov 2025 14:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jO1vYdZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C71610E3A3
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763390724; x=1794926724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dK76Nyaf0ay/YG6KAgaeDEPEOr14TRNurEOcibI33/s=;
 b=jO1vYdZcwN7JiSZiyQZsosm+/1KwkuidikDpcjQ9BLus/lmHlBWgcPuS
 YWZI9HwvAQssd24GRgmyvgV9a9I/5t/zrZ240FLFNoPWVFIYK5z2SnVkS
 4UxCAAMEvuSwkRjtw98GyI3ukr5XWWAS3CW/XzRm/I8rHBXU85ODqnIyX
 ildL4D7X/UJklu73Gu7BNWXY5NLnm5yL+sedhBXyp9gPCFzRILy/yLimX
 VZM8O6h1gWrs1jQYQUQrX0lQPSEPrEzKntXFaWHF0iUm8LTdlBZkec16y
 6sN6vHZZWrIZYdeiM5FuNmTw0z4fkHxdtYPeIF1XPz3PvvjOagYehbDLV g==;
X-CSE-ConnectionGUID: cCmzpKgaRWWlWEjxVMlrwA==
X-CSE-MsgGUID: svoZFPWjSTK/DzHxJ3pRsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64594021"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="64594021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:45:24 -0800
X-CSE-ConnectionGUID: y80klHGdSvmjAC9sP9mCCw==
X-CSE-MsgGUID: 72q87sJ3TJyhqWSA80jpqw==
X-ExtLoop1: 1
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:45:22 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
Date: Mon, 17 Nov 2025 20:14:21 +0530
Message-ID: <20251117144420.2873155-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

In xe_oa_add_config_ioctl(), we accessed oa_config->id after dropping
metrics_lock. Since this lock protects the lifetime of oa_config, an
attacker could guess the id and call xe_oa_remove_config_ioctl() with
perfect timing, freeing oa_config before we dereference it, leading to
a potential use-after-free.

Fix this by caching the id in a local variable while holding the lock.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6614
Fixes: cdf02fe1a94a7 ("drm/xe/oa/uapi: Add/remove OA config perf ops")
Cc: <stable@vger.kernel.org> # v6.11+
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 87a2bf53d661..8f954bc3eed5 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2403,11 +2403,13 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 		goto sysfs_err;
 	}
 
-	mutex_unlock(&oa->metrics_lock);
+	id = oa_config->id;
+
+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, id);
 
-	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
+	mutex_unlock(&oa->metrics_lock);
 
-	return oa_config->id;
+	return id;
 
 sysfs_err:
 	mutex_unlock(&oa->metrics_lock);
@@ -2461,10 +2463,10 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
 	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
 	idr_remove(&oa->metrics_idr, arg);
 
-	mutex_unlock(&oa->metrics_lock);
-
 	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
 
+	mutex_unlock(&oa->metrics_lock);
+
 	xe_oa_config_put(oa_config);
 
 	return 0;
-- 
2.43.0

