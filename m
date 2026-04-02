Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DD0D6AAF4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 17:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA72610E423;
	Thu,  2 Apr 2026 17:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqBcR4rx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D64F10E423
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775152011; x=1806688011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IwcIynMlmRLvOml7U7ySCEYYZOV5LWx4Nmb29uvE0ik=;
 b=PqBcR4rxrYQZUIZNYTgPlWBsSI+GxgwCYmYul8CIRYwSs8YLxXPJ38UH
 GjSAfur2usG7vpxUNIx8Lm7V3AJ2GZLIrfiwq2I/hGTSMp/mESq+yPEQE
 TJ+JrvqOPOFJNFCcC2V5dm/sX7vgL2vSkn1/pigWEEIKJfCARWwBwfSf/
 GpDsaapqbD4IF/nXCUmweG5prsqBBdMH/liLL7E6cYsBjvDe7WkXzLg2b
 oMHB856WfhEhHN0svZqvmEBfG/RCdxvIVQoztn7s50+KD2oa7Glqtmkwi
 hTqwaGchvEFOhehNJa7BTPAmiddoWSRTEC7gjMUfnSd0ZEp/X0mtNMYpx w==;
X-CSE-ConnectionGUID: wv5ytkVsT+SetxN9VY1new==
X-CSE-MsgGUID: 5/SMZXAlSC2twAsoKAUYVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93612147"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93612147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 10:46:38 -0700
X-CSE-ConnectionGUID: yutmLmysTkyqq+rrqZkN3A==
X-CSE-MsgGUID: Hr1KqqgRRnihixETtpuLeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226209507"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 02 Apr 2026 10:46:36 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 4/4] drm/xe/debugfs: Update hardware error routing with
 wedged.mode
Date: Thu,  2 Apr 2026 23:12:29 +0530
Message-ID: <20260402174229.1062874-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402174229.1062874-1-raag.jadav@intel.com>
References: <20260402174229.1062874-1-raag.jadav@intel.com>
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

Hardware error routing is now setup based on wedged.mode for debug
cases. Update hardware error routing along with wedged.mode when changed
at runtime.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Allow hardware error routing through debugfs (Mallesh)
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 4989dc21021c..c49d987de852 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
+#include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -329,6 +330,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	}
 
 	xe->wedged.mode = wedged_mode;
+	xe_hw_error_irq_route(xe);
 
 	return size;
 }
-- 
2.43.0

