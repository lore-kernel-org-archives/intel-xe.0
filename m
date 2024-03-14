Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA86C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD68510FC3C;
	Thu, 14 Mar 2024 17:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IG2o9csA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDF610FC3C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437522; x=1741973522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+NufrQZ9d43z/VouFRUM2JSkaWnOWQyjChtGWFekPXI=;
 b=IG2o9csAJ9QN1VrBKuRfrgvQKQF1dS7y0x+Z+K4g11x+m4k0G/ebCzvV
 FagZx/mg03evWu0C0/jdqLqvE9wl3qcOg+Uqx2MSuSIv4AL619wXtYe9+
 fJnPvGsOlW8SsRLFv3/JZNx62G8VJz7leHeYv6hz0y+FUKHviGoIW0a0z
 TchylzVrj4AAsi2V8YzG2EId6Cus2w6cqts/OeRQ+Q5mR7I7BW+9pDfZb
 MYU0nUj5qa5FI2pVsFz1ukuZrWAy+cxMJUC8ma3LMhDrR/HiRD/fH/Rk2
 L59wWc3+iL2Wghng4oGstZPBq0YJv3W7sDYEX7CtMgmbTG/QsylwTKPMq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791659"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388797"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/6] drm/xe: Assert size of the struct xe_reg
Date: Thu, 14 Mar 2024 18:31:25 +0100
Message-Id: <20240314173130.1177-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240314173130.1177-1-michal.wajdeczko@intel.com>
References: <20240314173130.1177-1-michal.wajdeczko@intel.com>
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

We want to keep the struct xe_reg as small as possible.
Make sure we don't accidentally change its size.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index c50e7650c09a..114b07db962f 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -6,6 +6,8 @@
 #ifndef _XE_REG_DEFS_H_
 #define _XE_REG_DEFS_H_
 
+#include <linux/build_bug.h>
+
 #include "compat-i915-headers/i915_reg_defs.h"
 
 /**
@@ -44,6 +46,7 @@ struct xe_reg {
 		u32 raw;
 	};
 };
+static_assert(sizeof(struct xe_reg) == sizeof(u32));
 
 /**
  * struct xe_reg_mcr - MCR register definition
-- 
2.43.0

