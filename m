Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3DFD2F004
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 11:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50B10E54C;
	Tue, 27 Jan 2026 11:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTyMl4W5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8AB10E54C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515056; x=1801051056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ueUX1QRujgPnFYw1YPwHAFt1bgxJtTvETAtm3z/LRs=;
 b=jTyMl4W5yf107KscxkBKL37FecJ1B+faaeB98h8diPSSpmhTipNuga6X
 UvY1LAsdLK0v/j0qXxY+gNLwli9kBnq24sR9Fef075CcxssxMgBoLlzm0
 423GApEjtB5hPq3gckUznGqwkbTARv4129MblE67nU5tPo9YDMN/dXTSI
 73dE9fX9ruki9NrVDL2zWg2wehM6BRRQe4cUA93VE0KjE6te/3pfWatTS
 Sf/JC/HXzkQ1OvsPzviLwIXQ1o813tm+g2BYmvtwvLK8bv85lZNvq9oQd
 rTSrBsfDOzryBJ6VEHT/B8yPbO2IYN2xeK4fyq9VhgRCqLJCMax1kueOA A==;
X-CSE-ConnectionGUID: U5/emS28SfqDCz1BaT/ZEQ==
X-CSE-MsgGUID: KialH8i6RJW3w25vNtmrgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74330358"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74330358"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:57:36 -0800
X-CSE-ConnectionGUID: 3sdmBiXKTp2KDttLTebN6w==
X-CSE-MsgGUID: JpHiBFUGTqyPW05KRGnz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="245576195"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:57:33 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 priyanka.dandamudi@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/2] drm/xe: Add prefetch pagefault support for Xe3p
Date: Tue, 27 Jan 2026 17:27:11 +0530
Message-ID: <20260127115713.869000-1-varun.gupta@intel.com>
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

Patch 1 renames xe_pagefault_print to xe_pagefault_error_account and
adds an err parameter to prepare for prefetch error handling.

Patch 2 implements the prefetch support by extracting the prefetch bit
from the fault descriptor and echoing it in the response (bit 6) only
when handling fails. This prevents CAT errors for prefetch faults.
Stats are incremented for prefetch errors without verbose logging to
avoid log spam.

Based on original patches by Brian Welty and Priyanka Dandamudi.

v2: Clarified first commit message to describe only the changes made
    in that commit.
    Changed comment wording from "repairs" to "handling" for clarity.
    (Matt Roper)

Varun Gupta (2):
  drm/xe: Rename xe_pagefault_print to xe_pagefault_error_account
  drm/xe: Add prefetch fault support for Xe3p

 drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
 drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 16 ++++++++++++++--
 drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
 6 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.43.0

