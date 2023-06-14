Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A83EB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782410E0CE;
	Wed, 14 Jun 2023 20:04:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFD110E0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686773091; x=1718309091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b7KMyfNH1pOiWuKg9IWKS/lbhn57qsGyHDAUXWFCohI=;
 b=WWQ1zKg4Up+KVmasG3ROL7+zc9qcUl0pcrgSgrshikseJwgrQSNzUF/I
 FbUxSbRaAur5YlEvauL9F1rQUZXqAP6pUt/8RusK2k/vGsa9XpdUAqRiD
 4fsqCwwQKvKvxdoiuRFat+rq4j1ZRLZtmPxkJRRTqS201AKb9qfCNX4+I
 6NxqWTRNj93BCNYtNvuTbTNKtRqQujTVnOGkpfmkNMadd0LhVzXofib4Q
 gYywpxVEbrh/awgxK3TzGW3UR/wKivTdq2+TYpD4WvqILg9bFJ9nR4qKu
 Rc5h5/2ZRHELj0LRWUwJyVdYjiDOjZ8+bMemfJVu5d+XjR5Yo1kMzLApv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343423413"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343423413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712190699"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="712190699"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:04:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 13:04:45 -0700
Message-Id: <20230614200445.3363527-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Grab runtime PM over MMIO ioctl
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The MMIO ioctl (which is generally used from IGT's xe_reg tool) may be
called while the device is in D3, resulting in invalid results (i.e.,
all registers read back as 0xFFFFFFFF, writes are dropped).  Make sure
we grab runtime PM wakeref before performing register reads/writes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f7a7f996b37f..5f4c8ae23771 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -19,6 +19,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -476,6 +477,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	 */
 	reg = XE_REG(args->addr);
 
+	xe_pm_runtime_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	if (args->flags & DRM_XE_MMIO_WRITE) {
@@ -519,6 +521,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 
 exit:
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.40.1

