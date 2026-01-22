Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7730FD3EE8A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 16:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FD810E9EF;
	Thu, 22 Jan 2026 16:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/34Bkn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FDA10E9EF
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769099335; x=1800635335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TYGyt8eSOdMLAnBvPKMCxqYBBLhhjomTRfVbcjfCj4o=;
 b=P/34Bkn/v6AoaQy+RJeXBt8laBTYLisD9ua6JZSteKEw1mYoc9mZ5PXr
 6Yy5krn1KFMkofrUPupvE3497i2izuAL5yTerHJejzaMeFKKAumnz0IGY
 CFMMDPh7ThM1YtkSIPEROfmsRgINQ/F/iVFcFDewUmvvwHoTqJsuhKsGP
 aSEOQflehBpInI/1NVIRgdLmU+5jvG6Q4b+HOqv80NwAxUNKN6zdLzECX
 pXUIgB33cCN9wTjgVpk5GOjwtYjfqyRxZE1Vr2lBUEXNvU4KidgRR5F0l
 3S4iru3v4068MkbyXNQ1kzcNNWf2rhFWUAb+IMnuHZl+blwe2Ua6swLOU g==;
X-CSE-ConnectionGUID: nWUI1nDhSWGDFpRXe3yStQ==
X-CSE-MsgGUID: aj9b+9mMRreIZBv+biioAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87760408"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87760408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:28:55 -0800
X-CSE-ConnectionGUID: fTqc1L1DRlqIHhjY01kqIQ==
X-CSE-MsgGUID: tXn6fpW5RIWOCeIVZ2GLXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206595220"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 22 Jan 2026 08:28:53 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Sort xe_module.c includes alphabetically
Date: Thu, 22 Jan 2026 16:25:23 +0000
Message-ID: <20260122162520.3150505-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260122162520.3150505-4-shuicheng.lin@intel.com>
References: <20260122162520.3150505-4-shuicheng.lin@intel.com>
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

Reorder local header includes in xe_module.c to follow
alphabetical ordering. No functional change.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index a0048f64ed12..7e3f91a212c4 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,13 +10,13 @@
 
 #include <drm/drm_module.h>
 
+#include "xe_configfs.h"
 #include "xe_device_types.h"
 #include "xe_drv.h"
-#include "xe_configfs.h"
 #include "xe_hw_fence.h"
+#include "xe_observation.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
-#include "xe_observation.h"
 #include "xe_sched_job.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-- 
2.50.1

