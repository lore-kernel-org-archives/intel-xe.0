Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF16D31894
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5BF10E5A1;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSJB46dm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B98D10E580
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jPZojQlzJvXBlOixM27gCcenXleOnd1t6v3eeN6g+xA=;
 b=GSJB46dmwPmBX9ID/x1hzVw+7NtRr57X9yitFL3GzwUJLi/BselrIXUR
 Dl5uZ1hrEwV5wS9xbGKvCtsrVaw4kMuGUSBkOpB99om5hzEFIRn9McfVU
 h/cEzu3QKSyi5hllQxxJZVhF7tmLbPC4GXQCgj2OgeiPPgJHbK6IL+zhe
 BoleiiJNequH09wUmK6LOF4DIYW5CfgrEVN36VvSQKo42sXaq4L+E/tto
 0QxisepcC4v/Ja0IIGa8EfGuz/JoUGTb5OcRX5JkuIAavfXUaC4bI+5DM
 q/XqGSiQ4AiUHtPFC4kWQH0m6KR0bCs3+yn0UcgccoopB42QfxqwyKBOq A==;
X-CSE-ConnectionGUID: HoV7R7o1TKW7gRCz/tMBPA==
X-CSE-MsgGUID: 8MgGJAxzTwOY3EhMvVMo5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311181"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: 3gPnZ86BSLSDpE/OcgMFgQ==
X-CSE-MsgGUID: b46yxDgCS+yYF70oclTFMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147479"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 75/79] drm/xe: Drop unused header in xe_vram_freq.c
Date: Tue, 13 Jan 2026 15:04:20 -0800
Message-ID: <20260113230315.3081153-156-matthew.d.roper@intel.com>
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

xe_vram_freq.c doesn't use anything from xe_gt_types.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_freq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 17bc84da4cdc..6f8281e0b96a 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -5,7 +5,6 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_gt_types.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
 #include "xe_tile.h"
-- 
2.52.0

