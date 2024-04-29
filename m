Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A95C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6577A112BF8;
	Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDshfynC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BEE112C04
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392951; x=1745928951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7Bq5tf3dM3nrgP04mUdYmVVql+cKsXqOyIgeXYevpE=;
 b=bDshfynCCBSnKOBAo5T9AZOb4EPtvUHtFDOuXTAIQmG3or+UHMnQPt3K
 vKmut/WrGJ+LbkOIyP7TT9jNGX6Y9L6JBsgOEGHOa3qelwxRdqk18dfEw
 QHR7IEqBT19kwItVpowfzdVEU1WkjqwbUevBUnVVpuqpdYAx6C8cq1BOZ
 hDV24zEhTXYf5K8vemBWxpewSUBGK4t+mBv2dGYyQKZiw/LT5YCOdbkWd
 h+4B/fgEhFnd46YXJ4sY2xs2o9foiQ9emOux5dZhPYcJ5q6D5RTmdQ1Tg
 RFWv/KVWUQeilwn7PaN15mjPwyHevSPTacx9JEk3Plrlf6OLJ8wOivrwT Q==;
X-CSE-ConnectionGUID: 8UX0HGLhRsuzCT+rBQzIEA==
X-CSE-MsgGUID: owoJn+OqT6C80wX8J3RZYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878386"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:51 -0700
X-CSE-ConnectionGUID: L3VwsTsYSfeBSWkbDBorHQ==
X-CSE-MsgGUID: 4t3eC1Y9RiWjNJy8Sp2aDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303391"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/8] drm/xe/guc: move guc_fini over to devm
Date: Mon, 29 Apr 2024 13:14:40 +0100
Message-ID: <20240429121436.33013-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
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

Make sure to actually call this when the device is removed. Currently we
only trigger it when the driver instance goes away, but that doesn't
work too well with hotunplug, since device can be removed and re-probed
with a new driver instance, where the guc_fini() is called too late.
Move the fini over to devm to ensure this is called when device is
removed.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..97e2b62df486 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -239,7 +239,7 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
-static void guc_fini(struct drm_device *drm, void *arg)
+static void guc_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -323,7 +323,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
+	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
 	if (ret)
 		goto out;
 
-- 
2.44.0

