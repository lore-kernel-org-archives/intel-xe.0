Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB4AC3DA70
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02AE10EC8B;
	Fri, 19 Jul 2024 17:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFMqd8+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491C210EC8A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721411916; x=1752947916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4L0voMJ0lAPxvjh0PDB6FFjCUUgxTGLJ3nf5MVVY7tA=;
 b=cFMqd8+a45hh+wYqHaEWdLyxFloo5A5wZRG5kRtoXPR+0lWxYIBFnhvI
 B4VZEGnVrRPD97CAP5cC626OPv3se1nBXny44EUNp3wOQ3Q83iTRO1ONx
 h/tm0F6x4swKWOqExdDlvD0YnX6wNGZyQDXw79mTIFnFlWjkY3G2NNb7p
 ZZO0r7WVE0fk93L7JslMlQD2h0JCdaBxTpXPy/2jFunSRVOoYgVLzVP8G
 VHUtUIhK+6BavUauxUG2vO1aQCvfWVMcvykxy/HZYg6jT4D98Cpcty5UL
 kQOv9c8ZQL3hUEQEXBmm5j2Y1Ja0Eq6JFwKG2XUNiFea1CyJ/R14L6JTl g==;
X-CSE-ConnectionGUID: /1CCI88ITCeWHjS6rzh6pw==
X-CSE-MsgGUID: qWNo0xt/ThCVa7NbH3euaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29701555"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29701555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:58:35 -0700
X-CSE-ConnectionGUID: rl/QKo6gSpOn2mQBD8/uzQ==
X-CSE-MsgGUID: Fsb5LAh4RPW6yt5h1xm5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="56316032"
Received: from dut152iclu.fm.intel.com ([10.105.23.86])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:58:35 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/3] Update page fault queue size calculation
Date: Fri, 19 Jul 2024 17:58:25 +0000
Message-Id: <cover.1721411802.git.stuart.summers@intel.com>
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

Original series: https://patchwork.freedesktop.org/series/134694/

Stuart Summers (3):
  drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
  drm/xe: Use topology to determine page fault queue size
  drm/xe/guc: Bump the G2H queue size to account for page faults

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 72 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 10 +++-
 3 files changed, 74 insertions(+), 17 deletions(-)

-- 
2.34.1

