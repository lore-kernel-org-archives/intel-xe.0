Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B328BC5B552
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695E110E203;
	Tue,  3 Jun 2025 18:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfZF4ONi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698B510E032
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976231; x=1780512231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Chcgs4wX5thKu8jQ1EOgArYitCVR7h/gGatq+rkhJwo=;
 b=kfZF4ONiYq9cKGTfsedNhjH/z4T0kYxn115tlpHERSsdHS3EH0TbpJhn
 bhm3iRVukBNb9qiqlrkujaNERhplzFubQDSfUGDriWsjNbB51avdHmTEZ
 ni0x74MfCHGiXuFvNYPlTgL7gxOFUr9ZR3oV5BrsjU4ICACz4tzw2LN7x
 a65C200HAjJP3+cMg5lzbKcVjuODftlKSWgJy6TvRrs9R3C8gCMfulR7M
 JyBbvDK5uS+bCqEJDkyz74Sr135RHnJ7/Dfx2i4nRl4wQ951HVhhN5F2m
 +AHtrBx9BJOkPCKDgDBJ6b3NbP268J+my35du4fyLxbA181UbvEP+ccQ8 A==;
X-CSE-ConnectionGUID: NJQ+wipOSrGfdnpTk86TAw==
X-CSE-MsgGUID: YOT6Oj43SameMCEjFVoHOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50902975"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50902975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:51 -0700
X-CSE-ConnectionGUID: MkfawR+PR6SVmITB6hMSqw==
X-CSE-MsgGUID: ec+q9QYoT8yu/lllt7qj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145899635"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/2] Enhance SVM stats 
Date: Tue,  3 Jun 2025 11:45:20 -0700
Message-Id: <20250603184522.2218192-1-matthew.brost@intel.com>
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

Add ability to clear GT stats and add more SVM stats for profiling.
Scripts should be able to be built on top of stats to breakdown time
spent in parts of the SVM page fault handler, bandwidth of copy engine,
etc... Will help showing concrete performance improvements when
implementing SVM optimizations.

Open suggestions of more stats. Prefetch not considered - can be done in
a follow up.

v2:
 - Include local changes missed in first rev

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/xe: Add clear_stats GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  22 +++
 drivers/gpu/drm/xe/xe_gt_stats.c       |  36 +++++
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  22 +++
 drivers/gpu/drm/xe/xe_svm.c            | 202 ++++++++++++++++++++++++-
 5 files changed, 275 insertions(+), 8 deletions(-)

-- 
2.34.1

