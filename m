Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8271EEF5861
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 04:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3224110E129;
	Mon, 23 Feb 2026 04:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIGe6yqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB310E129
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 04:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771819664; x=1803355664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=we3vQFHVIdFDGVsMzfR1UT91DLD6seyqAxIMtjMzrN8=;
 b=LIGe6yqB0pJUjZ+pPEZz8FbGGgud9zhOt8/nixva2ycnUrpBlJkAUJTd
 sJj6W9WnxWRvwd9wtQsjTNFX5Mozh03S5rsgJrOrnNe7+vXW3QRZ3a8wu
 A7yuJ48ipZeLlq5uj8LPg1Ufd2mFJv2sxLc5EUtcEqqibc9hkteHr09UE
 gManliL6X8h+54KjZzPj3bJ2sueBcClDaK4AZxNvFnt+CaTF41/clPu+j
 ZSImgdx3T9cAMjSMh4b2Wiek/WPEBrUvE00bi7Q8H5ehoPt5Wpbio5Kss
 /zJ8rOw0ur4v88upGGEEZTEzlNhSOq34eJ5rrT9Geqjz6mJZKBbSSsqZi g==;
X-CSE-ConnectionGUID: zv4EJClmRy+eiD9Bp48U7g==
X-CSE-MsgGUID: ZoWKqeSbS6aY33g91FYKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72515864"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72515864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:07:43 -0800
X-CSE-ConnectionGUID: Ta/UQiwHRj2qG1bZqoHtaA==
X-CSE-MsgGUID: 8V9Me7OXTFqniZDdXP0wNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246031947"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:07:41 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v5 0/2] drm/xe: Add prefetch pagefault support for Xe3p
Date: Mon, 23 Feb 2026 09:37:27 +0530
Message-ID: <20260223040729.1157739-1-varun.gupta@intel.com>
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
For failed prefetch faults, the error is logged at debug level to
avoid excessive logging in production settings. The prefetch flag is
packed into BIT(7) of the existing access_type field to avoid growing
the consumer struct.

Based on original patches by Brian Welty and Priyanka Dandamudi.

v5:
 - Read prefetch from producer msg in guc_ack_fault, not consumer field (Matt Brost)
 - Pack prefetch flag into BIT(7) of access_type instead of separate u8 field (Matt Brost)

v4:
 - Downgrade prefetch error log to xe_gt_dbg to avoid spam (Matt Brost/ Stuart)

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
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  6 +++++-
 drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++-----
 drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++--
 6 files changed, 25 insertions(+), 10 deletions(-)

-- 
2.43.0

