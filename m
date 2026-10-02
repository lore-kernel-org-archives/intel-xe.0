Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E33ACA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C8910E375;
	Fri,  2 Oct 2026 10:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSl3SMtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B410E42C
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790935735; x=1822471735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zCCqTiRGlD/RqutPp2RHwRor9Lu7TE4iS5xzakTPMAg=;
 b=WSl3SMtTh3FwKfGk/aPZvzP+GLbL9C4NcuMM+TUAUAidhuYKChiVlCNH
 VSrZ2tj6oofMJ64Y33A3RcxXvdigq7GrWtBWtTovRPbzDlH39j6MWc5WN
 OmS8p1mGrh6JCuyBGST4Y4JCFYPk4CL+y516WaAzUx7y9fJQTxDd3h6NQ
 rEKbh4esfM3xuErW+Rk9i/+xvBj9udiFw38t2JlXc1trrTGmtztRqUpvn
 nXtWA1Q0iMw9/UzlcG+bw1gb8ershFIRYd6RvymcXnlXLRV/veM4q/uVp
 CElGok4AiQDpVu248Zoc3f3v5+6vENAQY7GHQS82q1iwj3fEakxHv4v/4 w==;
X-CSE-ConnectionGUID: 2RythV5cSwyxza2oOclwYA==
X-CSE-MsgGUID: boNeuIVZTr6S9pB/ON6AWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102224576"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="102224576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:08:55 -0700
X-CSE-ConnectionGUID: ZzSWrt2fQNO/LK1HJRFhLg==
X-CSE-MsgGUID: bFmdIvh8S2KZAqw6Uo4mgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="275412051"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.200])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:08:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 0/2] drm/xe: Fix two bo pin/unpin accounting bugs
Date: Fri,  2 Oct 2026 12:08:28 +0200
Message-ID: <20261002100830.12297-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Two independent fixes uncovered while auditing the bo pin/unpin and
shrinker accounting paths:

1/2 fixes a double-subtraction of the shrinker's page/object
accounting on nested xe_bo_pin_external()/xe_bo_unpin_external()
calls, which can desynchronize the shrinker's counts from reality and,
due to a signed-to-unsigned interpretation in xe_shrinker_count(),
turn into a huge bogus shrinkable/purgeable page count that causes the
shrinker to be invoked excessively under memory pressure.

2/2 fixes a stale xe->pinned.late.external list entry left behind when
a bo pinned both externally and as an fb has its final unpin performed
via the fb-pin path, which bypasses pinned_link maintenance and can
lead to list corruption or a use-after-free once the bo is freed.

Both are tagged for stable.

v2:
- Added 2/2, fixing a stale pinned_link entry found by Sashiko AI
  review.
- Minor cleanup in 1/2.

v3:
- Fixed an additional shrinker accounting underflow in 1/2, affecting
  imported dma-bufs, found by Sashiko AI review.
- Rebased 2/2 on top of 1/2's changes.

Thomas Hellström (2):
  drm/xe: Fix shrinker accounting double-subtraction on nested external
    pins
  drm/xe: Fix stale pinned_link entry when fb-pin performs the final
    unpin

 drivers/gpu/drm/xe/display/xe_fb_pin.c |   6 +-
 drivers/gpu/drm/xe/xe_bo.c             | 139 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h             |   2 +
 3 files changed, 110 insertions(+), 37 deletions(-)

-- 
2.55.0

