Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25396D30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D383610E29A;
	Tue, 13 Jan 2026 23:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaTY1Z0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C6510E573
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+iu4n+MLjWspu1HjeAMgX/ZyePNIz+N0GLrtoW8tGM=;
 b=ZaTY1Z0mgk4wKMjtBuF57f7w9v+Atfr+JAA6E90ywxbvCk0W93c5PosU
 91CosepmBdCUu7/ui8YZdcTQVr7OKdcFhfzfe8xw2ZsPW4KocqWBIG0Gs
 OQ2IRMszXKL/hVMGBTQGnHZI1FS+lTz9IkEfUihh98C+MxW8Z7H7xMBD9
 IXZ+3PW5WSvRgBwbH9rsS4HDyY5qe1faRP+ZN2tSv3sEmtHZZTz/Hy2c9
 CJpZEtncTQVWjNb+Cf9VVFSjP+4qbatU7zuTzzjm8q9ZM/MC8Dx2eLnw4
 N54OVuepXdO0HvyqC6x3Q5fMjT7CYZwih/OnWONQJviFjxrr+CSM2BNst Q==;
X-CSE-ConnectionGUID: apSLmrB3S6OvIn+Sg/2Ysw==
X-CSE-MsgGUID: j8aeePrCTJS4mUR4wd2TPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311150"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311150"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: wap96vOHSXa4cl6BvEOLug==
X-CSE-MsgGUID: v5J/Ry8ITbGF2IWGoDvVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147398"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 42/79] drm/xe: Drop unused header in xe_irq.c
Date: Tue, 13 Jan 2026 15:03:47 -0800
Message-ID: <20260113230315.3081153-123-matthew.d.roper@intel.com>
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

xe_irq.c doesn't use anything from xe_guc_regs.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index baf5d2c6e802..7560a45f7f64 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -10,7 +10,6 @@
 #include <drm/drm_managed.h>
 
 #include "display/xe_display.h"
-#include "regs/xe_guc_regs.h"
 #include "regs/xe_irq_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
-- 
2.52.0

