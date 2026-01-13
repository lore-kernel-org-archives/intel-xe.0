Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F90D31890
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9710E59D;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0l1BZR9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF7410E568
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fwrf6GxL/2qaJw+sJBE4IJqB1aMT6LcuFbnXLJfQEkE=;
 b=d0l1BZR9CCpEhKd/LlDEXCQmX33XLky6daNGi/ofh/0B382VZBJLRsxp
 VdgbPpVavIpfUE7+k3wtRA1rAIItkemUeigWqKyoDvMtyOSR43Ftm8PaT
 rmyPsBdvOwUJ1LUbAJ/As6lZZQkgrZ2fAc0Qd9iWPQzv5SPMYkIh1ceyd
 Dhm0/IUff7BX/0bYxRwTuzSukiyp6hzFEvPcSGPCsGH5gzzzGuGA5XxtS
 2SPbZbL0li+Nwo3meIEux66jPPUIehXeOblWNbOsCdsPWBQ9v4J3Me611
 zUfTc9iEBAtgl4KX5elRWyagPQp26hbEx0nwF/EkvL4QNvrOfWW+Oy62u Q==;
X-CSE-ConnectionGUID: ObacOcJSTN2IO3Qr505A1Q==
X-CSE-MsgGUID: ZxRW84rrT2u4pAKDVVAr1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311138"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: h3i3BRl3SKSIN9VP1OntEQ==
X-CSE-MsgGUID: +ySxFjDATqKJDL9dvy7RFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147378"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 33/79] drm/xe: Drop unused headers in xe_guc_submit.c
Date: Tue, 13 Jan 2026 15:03:38 -0800
Message-ID: <20260113230315.3081153-114-matthew.d.roper@intel.com>
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

xe_guc_submit.c doesn't use anything from xe_lrc_layout.h or
xe_hw_fence.h.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..a27ea931b956 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -17,7 +17,6 @@
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_actions_slpc_abi.h"
 #include "abi/guc_klvs_abi.h"
-#include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -36,7 +35,6 @@
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
-#include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
-- 
2.52.0

