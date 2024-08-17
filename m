Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2091C531DC
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 02:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63210E01F;
	Sat, 17 Aug 2024 02:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPKEcLUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D545410E01F
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 02:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723862863; x=1755398863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2NWEuaZCW6Q5K3mfIlaWjbKSKIpnrtt76kdcGpR2t20=;
 b=dPKEcLUZCOaSlkTkbRVpZWpX4z3co95buC5RmQtcDjOEq0W0mZZr4r2X
 w/Z2zeSKoUefQ7SZo8oXj4wQjO/LnwG3rd//1NdzfYqjXvBiVYHfa2YqR
 NhDmNMZ8vxTf01osTzcM1vSPoSMksgtCca8zA1MVWTN7iBS6TP9MrC2KV
 8FEbtldj/RMZwQg2eTxSVQ04qb0uG9fDW4HkTGLYqjg1LcKLnjbAnwdiM
 ZwKJGJL+07r9t3O8kXtygirmcocDqwGgmxdFDWzTpftN17CwJCm7G5A2I
 mTwa+igyvUHbrNZcF3atXQtuC5M5FK6PeYMQ4bW1Pp4ci6d21ig7zkMN7 A==;
X-CSE-ConnectionGUID: tFmUFA06TMK+/sfY4itvpw==
X-CSE-MsgGUID: 7rGeEm8WQla5FnwcIxNaaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33316196"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="33316196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 19:47:43 -0700
X-CSE-ConnectionGUID: jQS5J8R7SAyTlLFxJlXupQ==
X-CSE-MsgGUID: 4agnJA41SGSePvRxWJqfvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="59852819"
Received: from dut4310arlh.fm.intel.com ([10.105.10.103])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 19:47:42 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [CI 0/3] Update page fault queue size calculation
Date: Sat, 17 Aug 2024 02:47:29 +0000
Message-Id: <cover.1723862633.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
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

Right now the page fault queue size is hard coded with an
estimated value based on legacy platforms. Add a more precise
calculation based on the number of compute resources available
which can utilize these page fault queues.

v2: Add a drm reset callback for the teardown changes and other
    suggestions from Matt.
v3: Add a pf_wq destroy when the access counter wq allocation
    fails (Rodrigo) and pf queue size calculation adjustment (Matt)
v4: Bump up the size of the G2H queue as well (Matt)
v5: Make the G2H buffer size 64K (Matt)
v6: Rebase and resend for CI
v7: Rebase (again) and resend for CI
    The prior series was showing an unexpected failure in some
    of the display tests. I tried running the main one manually
    after rebasing this series again recently and it passed
    on manual execution, so giving this series another try on CI
    with the expectation that those prior issues were unrelated
    to my series. Here's the test I ran manually:
    igt@kms_cursor_edge_walk@64x64-top-bottom

Stuart Summers (3):
  drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
  drm/xe: Use topology to determine page fault queue size
  drm/xe/guc: Bump the G2H queue size to account for page faults

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 72 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 12 ++++-
 3 files changed, 75 insertions(+), 18 deletions(-)

-- 
2.34.1

