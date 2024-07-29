Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE19C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 16:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2806C10E435;
	Mon, 29 Jul 2024 16:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOW7A9WP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB0010E121
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722270041; x=1753806041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vG0IP+CxIb/q7xFxShwmIi2uLmTijxpvAHakY8m53yQ=;
 b=WOW7A9WPZ8xWvVkohWW+JLMKLdhim3dbbdvabb/IbkF7mR4F1Gn4JrnR
 /5ypEEAHvRX9W6l0bU3ISPX7H6Idg5wkTqx6AiYvSZTX/2ZzKk0AF2IAc
 siSQon4sLaLq7ZPcrzxHHo5vJZTM8MU45F8Modcm0T9ll8YBUTvATvfKm
 LxpLPi1QUnOtXyiTdXdSug20LMDi3eyKDJj+cJ+HKuCBYeApeStf6ItdJ
 cmYbfVC7HM9lumDh5/jQMSJMRczuDckhFRkPHcbZxuJsbIAEKhm+bGjwJ
 TA+/2OWocbplzCTzBKW6WbcfGUeTzax5FeaaO0xG3CGTUPOPM1j8y5OXR A==;
X-CSE-ConnectionGUID: Ztf8S58xSHiErvpYCp8T2Q==
X-CSE-MsgGUID: fk7aI7i5QcuEdbqhVqpmjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37514253"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="37514253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:19:54 -0700
X-CSE-ConnectionGUID: oIgDu7DHTw6bitNnigQx7w==
X-CSE-MsgGUID: ZHhhF1oBRn+5aNZBBcwuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53680200"
Received: from unknown (HELO DUT152ICLU.fm.intel.com) ([10.105.23.75])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:19:53 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [CI 0/3] Update page fault queue size calculation
Date: Mon, 29 Jul 2024 16:19:44 +0000
Message-Id: <cover.1722269793.git.stuart.summers@intel.com>
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

