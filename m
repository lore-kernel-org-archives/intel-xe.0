Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E48CD31897
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8085E10E5A5;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jividP46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F010E562
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345419; x=1799881419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84w2633QcdTos43fviAewY4ilv+tbgFsMlRXnFfujDA=;
 b=jividP46Fi93/bxIMeKHd0U2pdpnwx15iT0CCFWClwuYu9CxMi/Of0Mj
 qOdFuDeM5RfIL8evKngwE0/ZEjCXhtJWWhmkNOYgHvPPHjOJjPPZxU6fm
 bgjzi8SxfoizO0iLoRbG/hJcbAtSeCQbwtcw92TyVQuqTykCsRwcT8sy/
 BfI8EoXxISP1WGv+W5jxxn44KUfTh4BrAyMuaa3kmIER56zbia1rbZ2Xz
 al7oJ6UKk824f0VMYoLpZ4wU+pECs8Qr5T8H/Mk/EfFWuLo2/IyiYBpG7
 w7VXASlDyUINS35iB4wzHxAe10hiDpax6hjW14FVj8x4L1HEVktl+zOMg Q==;
X-CSE-ConnectionGUID: WU+4llINRjq/aqU6/ES24g==
X-CSE-MsgGUID: 0jBD85gNRQ6fbfWMSmK8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311108"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: XGuXOQnjQGCWQxpHn7eyJw==
X-CSE-MsgGUID: rk36PJZaQEeCwOrmx/rZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147264"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 05/79] drm/xe: Drop unused header in xe_exec.c
Date: Tue, 13 Jan 2026 15:03:10 -0800
Message-ID: <20260113230315.3081153-86-matthew.d.roper@intel.com>
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

xe_exec.c doesn't use anything from xe_bo.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 730a5c9c2637..a5485fe6e3f1 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -11,7 +11,6 @@
 #include <uapi/drm/xe_drm.h>
 #include <linux/delay.h>
 
-#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_hw_engine_group.h"
-- 
2.52.0

