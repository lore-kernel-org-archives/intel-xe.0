Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A895AD172CC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 05:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB910E103;
	Mon,  2 Feb 2026 05:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4WJpZ9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A001010E103
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 05:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770009257; x=1801545257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W7PmMtPpPOKMpdRFcvf9WVs/VgoefIaNBmlhQ6Jw1aI=;
 b=I4WJpZ9lgH9Ze8vxD562q6L8+fjEGyqd2ddv8MXSaOdxQeu58aBraOUh
 Ngw+xT8eSxA3yx/1v33BXCLe6cSt0zsBkGh7q5ruBBeP2rm4Y1N4U50sC
 9Ak8U0z4yGrW5V/Cj249IxxwINfDOgg0K3E4RvtCC3CTdOad2K4unqUxT
 Eh6411Yy3CVRjcRqRpPT+wMdVVWMhg4dtwpzffNNJxBSs8CCbM7it+e9m
 20YpsBZryFDR/iTqT48qDEuLja/fmSKybVGZB5CjlHrZ+zlNbgyLqSfsz
 ajw88Rq1YOmrXZRC//x4i4q+IAeFIKibLsi0fktwsb38smOCE2nFWf6Vi w==;
X-CSE-ConnectionGUID: j3xvB+jFQ8S/+DsCmL8bxA==
X-CSE-MsgGUID: ux+HSDW4Qf2awMu3CgWR3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58745185"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58745185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:14:16 -0800
X-CSE-ConnectionGUID: 3IawEKDPS/u0qe//+P+yVw==
X-CSE-MsgGUID: csJ8jdagTPmx2qsJLjcm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213953046"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:14:15 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH v3 0/2] drm/xe: Add prefetch fault support for Xe3p
Date: Mon,  2 Feb 2026 10:44:02 +0530
Message-ID: <20260202051404.835714-1-varun.gupta@intel.com>
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
For failed prefetch faults, a single-line error message with the prefetch
bit value is printed to reduce excessive logging.

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

