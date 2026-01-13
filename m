Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F847D30CF3
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2018410E575;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhAL/9Iu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CC410E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HjJwvJWRo4Ub2EjY6Ya6TWj7eB3dQEuHVlti/QzNE2s=;
 b=jhAL/9IuZjkKQ8YtBJDuKdgMAUltMQXJNCa6rBMPkLp+D3Cz/ypYLR8O
 wS7THYZatKNVLXsiZMzq3cNm5gfTzSGnELgf3pwuRa4CPrmOQTuHeWhe9
 cTt/sbigrZDL6TxJ0CcfkZJFRe/ZfFWd3ElLhEi1beVAzDMH8PXe2AlH0
 71FVk7Gv9zaOIzb0/Xh4j4I6vZ0/u5o/AuCEvpyR5qW+JkR7BLwKdCDeu
 Vrz4sKIzTa55JxreaCbI2L3c8VomHQo8y3NF92nPg7ub/g4X/n/96/1zq
 kIRoS0qjjLXfNQ+BdUlwMFO0dTX1p2v16lRkwuKByKxpudIBLy/O4OwMU w==;
X-CSE-ConnectionGUID: CzxtG6ypSdS79M0gg75m7w==
X-CSE-MsgGUID: KwFIMbxrQXKlsapCZVEYRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311135"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: N9H9Rs1fSnGmxlDWvk5MTg==
X-CSE-MsgGUID: 1aMeb8ZiQ7OUeHjz/Ch8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147367"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 29/79] drm/xe: Cleanup headers in xe_guc_debugfs.c
Date: Tue, 13 Jan 2026 15:03:34 -0800
Message-ID: <20260113230315.3081153-110-matthew.d.roper@intel.com>
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

xe_guc_debugfs.c doesn't use anything from xe_macros.h.  It also doesn't
need xe_device.h and xe_gt.h, only their corresponding 'types' headers.
Remove/replace the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 23827e87450f..2f23119686d4 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -8,13 +8,12 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
+#include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
-#include "xe_macros.h"
 #include "xe_pm.h"
 
 /*
-- 
2.52.0

