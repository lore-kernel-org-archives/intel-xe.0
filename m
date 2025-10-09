Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC2CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 23:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB110E118;
	Thu,  9 Oct 2025 23:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoFHXRsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516010E118
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 23:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760051109; x=1791587109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G0JxG8V/4im1kqW0bFVeVCs16vLtatD66IGjHQvnTGQ=;
 b=QoFHXRsJdcJHqciKC2eQV6KOFv39o+I4N7O7Ebke3IB5esa9SFaXbbRP
 kIG8Ftpo1GFF2oR42IJmnxqd+MqFBfNaUCbk4tCcFi0IYJKX+g5h3q/ST
 aZV18vYy8p49dpndR0x8ZrU7AyFt1AE4gGfN485qXKjDSPOAoqOFj1MT0
 sguIwgwUrEqPPniHddw11cQbJ5dPKJgkHD7+NQABpWwVGnffyph4cnAdn
 IkMdVF4Asac7ZYgQnpWAzGcALB71kXHkpGr8iqNAFp2ey7N6mjvx+rIft
 ABwD2HyPpoem0kA5IaYSBHGI0CmAhlmtAii2syff1bvqzrIuftxOd9eEp A==;
X-CSE-ConnectionGUID: 0QQwOYIHR52nDDrAfFmahw==
X-CSE-MsgGUID: LDPljxuoQBOt3WoWO1xvwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72884905"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="72884905"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:05:06 -0700
X-CSE-ConnectionGUID: SaFfsP4HRHOl1tPyMRem+Q==
X-CSE-MsgGUID: fcP7QkXUTC6jjZFd0Jpgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181601068"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2025 16:05:04 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Fix copyright in xe_ttm_stolen_mgr
Date: Thu,  9 Oct 2025 23:02:29 +0000
Message-ID: <20251009230239.2830207-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251009230239.2830207-5-shuicheng.lin@intel.com>
References: <20251009230239.2830207-5-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

- Correct Red Hat copyright year from "2002" to "2022".
- Sort the include lines alphabetically.

No functional changes intended.

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index dc588255674d..9b00bdc8ef1a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2021-2023 Intel Corporation
- * Copyright (C) 2021-2002 Red Hat
+ * Copyright (C) 2021-2022 Red Hat
  */
 
 #include <drm/drm_managed.h>
@@ -24,8 +24,8 @@
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
-#include "xe_wa.h"
 #include "xe_vram.h"
+#include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
-- 
2.49.0

