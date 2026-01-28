Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07864D35696
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 09:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2AB10E62F;
	Wed, 28 Jan 2026 09:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hn+yn9L/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3875010E62C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769591527; x=1801127527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4qU2TmvoaydGeGQENYx+74IRJMftY9NtEZUS5bW9ejY=;
 b=hn+yn9L/sQAy9EqCc7WNbABYBZGZQ57s9EdtP42nR6pdD65WEh2rdAS6
 tasqFy2sWJSJiYJo6XLyM7FGH5OEFmnr2RjMtFtwd9iiwTw4EByWLOR6V
 Mg16FaLK06QrAuz2/zuZOOyB99CYaR8kvvmnx86u2RCQX5MzW9vqDG3XR
 0gUSj75W8OHJ5vL9/XuiqRGFddmMEGt+8oXAsREBKRskthSIa+GEOyxXK
 mHDn1Rm/LCtUPs8ge6R+0pSpwMo3ic3+L3c4Gx8pQ44HRVDb94kFFW4nJ
 NJ3/VpzamqIenTTcvC33SsSh2dV5pRdaVbO/ZL1DW3c5JkhXSoF74wCT0 A==;
X-CSE-ConnectionGUID: sYiiR9+8QFuIRP6EWrYrXg==
X-CSE-MsgGUID: trjm7gX1QayPxvYmFsyS3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81113259"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81113259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 01:12:07 -0800
X-CSE-ConnectionGUID: AbbAh3olQUSo15BqbDpIXA==
X-CSE-MsgGUID: ST8xWUTdSnqQuptkJFBm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208003379"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 01:12:04 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH v3 0/2] Add prefetch fault support for Xe3p
Date: Wed, 28 Jan 2026 14:41:51 +0530
Message-ID: <20260128091153.25543-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

Xe3p hardware prefetches memory ranges and notifies software via an
additional bit (bit 11) in the page fault descriptor that the fault
was caused by prefetch.

Patch 1 adds a dedicated stats counter to track invalid prefetch
pagefaults separately from regular faults.

Patch 2 implements the prefetch support by extracting the prefetch bit
from the fault descriptor and echoing it in the response (bit 6) only
when handling fails. This prevents CAT errors for prefetch faults.
Stats are incremented for prefetch errors without verbose logging to
avoid log spam. The prefetch bit value is included in error messages
to distinguish prefetch faults from regular faults.

Based on original patches by Brian Welty and Priyanka Dandamudi.

v3:
 - Split stats counter into separate patch (Matt Brost)
 - Drop xe_guc_pagefault_types.h rename patch (Matt Brost)
 - Move prefetch check to caller of xe_pagefault_print (Matt Brost)
 - Rename XE3P_PFD_PREFETCH/PFR_PREFETCH to remove XE3P_ prefix,
   add comments about Xe3+ platform support (Matt Brost)
 - Rename PREFETCH_PAGEFAULT_COUNT to INVALID_PREFETCH_PAGEFAULT_COUNT
   for clarity (Matt Brost)
 - Include prefetch bit value in error message (Matt Brost)

v2:
 - Initial implementation combining all changes

Varun Gupta (2):
  drm/xe: Add counter for invalid prefetch pagefaults
  drm/xe: Add prefetch fault support for Xe3p

 drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
 drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++++---
 drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
 6 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.43.0

