Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D315D31893
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D210E5A4;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RG7EpvUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CD210E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OaSLuY7f0PXRjE+t5yCrdkGbfSBEUF01tYOer5KRGSw=;
 b=RG7EpvUNg74dBBb/gMaiyGeBdOL7AmzSdyGYhDFQTdVnUiKWB7dDYFNh
 yUHgNCwUqLFluYdLtigRu7QxbzAgBSeWOuMLYGvJQX0bR2sjFhuOhmvLL
 e2nKQif6PXxhEOHzAQcO0b9kbgBF4rfX/Q4i7GSwss8jQMnY+widfl5Kq
 NLy5mG4oGd2+XeKzKgs3sx48JDn20aiMHThLJh88pPR6vX/UZzcQUEHfy
 ZizbhoiU5AIpK3LInB2X75QVhATl4PvCLVO5kgG+Dxu1JaPGiWw57bFcI
 3AD8nvvCktuQjn8fwAccB4nQLfOxw4CyrOoABF7oxNEiMJ7GWhYBJpdDq Q==;
X-CSE-ConnectionGUID: Ij1FPFyjRWiUBDXcQv5kpw==
X-CSE-MsgGUID: zNhqJlBBT2CXNX0Fq7vx1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311131"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311131"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: QmGQzWKGQo6RbBFmCb3UjQ==
X-CSE-MsgGUID: CM6ZoCzeQpurTKMh1MYuXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147357"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 24/79] drm/xe: Simplify header in xe_gt_sysfs.c
Date: Tue, 13 Jan 2026 15:03:29 -0800
Message-ID: <20260113230315.3081153-105-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_gt_sysfs.c doesn't use anything from xe_gt.h; it only needs the
corresponding "types" header.  Replace the include accordingly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index ec2b8246204b..1448be047b4a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_managed.h>
 
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
-- 
2.52.0

