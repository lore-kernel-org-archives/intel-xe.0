Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EDCC531E4
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 04:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FE310E14E;
	Fri, 20 Feb 2026 04:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IS6SDgZ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EF810E14E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 04:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771562117; x=1803098117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JHn8fQQqGzO0glk1OR2A9aVBN2UMR0YDrgrcAVrZCzo=;
 b=IS6SDgZ6M2q61QMyea+rcnqa+oek5PedxTWoZ5uCdRgevbTF+GG13fg3
 sP9ySaWxp27I3GtEq8lGArOxxis9Y6I0L5Gg5eZizusC/r7QndO3GJeJH
 ZJ+N+tizyp0GSYh4FDDZghjrwWmMuL8jSrfc6HH1E+54C725bmOjVGrhI
 USVe9b7XdxpLQFmmwY271JgdqAbakhmMQmqBuMJaYKCgwSXQgKvptLokU
 Q3BGPlCQLQmjrTkirNRKiwovix7aDmoY/WiJMjKFJTIXKullyxRpZTTcK
 3/IJMqPFHPfVo8lChKjXSkbgiCjGzPCJg9h6bMBI3QVEqS1iKhrlpb4Re A==;
X-CSE-ConnectionGUID: 6w4p0i/JRyG5wRhb+vccGQ==
X-CSE-MsgGUID: h3Zc3QrUSUWT79GjXeE81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84019080"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="84019080"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 20:35:17 -0800
X-CSE-ConnectionGUID: FgvGTsr1Q/SvcwG7KlzYSA==
X-CSE-MsgGUID: eBBRUMNDS86qWI5sJFz06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214592694"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 20:35:15 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v4 0/2] drm/xe: Add prefetch pagefault support for Xe3p
Date: Fri, 20 Feb 2026 10:05:00 +0530
Message-ID: <20260220043502.1060473-1-varun.gupta@intel.com>
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
avoid excessive logging in production settings.

Based on original patches by Brian Welty and Priyanka Dandamudi.

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
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++++
 6 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.43.0

