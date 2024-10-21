Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC8DD3E1AE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 17:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8710E573;
	Mon, 21 Oct 2024 17:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azvBjvc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E0510E114;
 Mon, 21 Oct 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729533401; x=1761069401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=auE5L5TVgyxy7vI/+3AzDX0h/WuZBtsbUp+NxCZIaUA=;
 b=azvBjvc4rAuIA0Z3nvdsarqv5Ohei3YqKm27I3wErT0o/f8FeG3qaq9X
 OvdQAWC4tudyzCY6qKPt9Wv46G4Shm7mRMEynUA8pJ3xZredUnpb5Kp8p
 Y+z6FNIUKQoTWoFSvtnjfB1eDQ0bYjSB3+hgVCk8XVTOqjBs5HTksxcwu
 Lh5QI3rGoIDc70x0enf/ZrY7+94bqsBuAkqEwD30a2BqWm7w+3GEMl3rM
 MaRHFUIA4/e6Oj5dEga6qIJExru8Z9oeKXUl2k1D/KrkMQQd7Jo6rzhG7
 vMsTjKUrDOzODr4Ok/ilZIIZgkHgmLZtV9QVmTYfm5vig9/3v0SiSl4Lx A==;
X-CSE-ConnectionGUID: 6nqsm+0CTNiZbgEvU12c8Q==
X-CSE-MsgGUID: Czo4kF/cQ1S9ruTWEk2QPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28910168"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28910168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:40 -0700
X-CSE-ConnectionGUID: +LAM13/9QQWIRa1VGNh4aA==
X-CSE-MsgGUID: RwqXfwh4QBeovJpKi92+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79680260"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	pstanner@redhat.com
Subject: [PATCH 0/4] Mark work queues with WQ_MEM_RECLAIM
Date: Mon, 21 Oct 2024 10:57:01 -0700
Message-Id: <20241021175705.1584521-1-matthew.brost@intel.com>
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

Mark scheuduler and several worrk queues in Xe with WQ_MEM_RECLAIM. Will
these work queues can make forward progess when reclaim is occuring.

Matt

Matthew Brost (4):
  drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
  drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
  drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
  drm/xe: Mark GT work queue with WQ_MEM_RECLAIM

 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c           | 2 +-
 drivers/gpu/drm/xe/xe_gt.c             | 3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c         | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.34.1

