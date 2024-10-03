Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CB9CF8549
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472C10E073;
	Thu,  3 Oct 2024 00:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2b8mM0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F2E10E05D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727914568; x=1759450568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YX06wwAhEBPmslUl3BQKPuTkYx68M7wTYRDlkJCf3Mk=;
 b=Y2b8mM0+n4QGL7rltnqBWEVObKKEmRft59Dnt5Q4gtvFBdlYf9updlDg
 xIgiI/vCNq9lfsBC5qWmTP+/3dKshDaKDop5vSrNFaaMcrommCx/K5RLg
 o2lh4BYQdxv+3AaaQ5dPfAgNchdjwv9YcmfZQv9owTwzCOVd8mTJCoi7T
 tkNgyXbBSG7sQ74FzR+l9cCFu0Qplw/yYMkuRsDu4coXbAUmprUONqdWz
 EY+bYoopJRCLAk1pgc0kS7HNmq5gbftgQmoBo7qTgT+xT5trnXhpBWEuX
 QYOiWoIFWC8UmmCayL6EzTUKOYEtR/pm7x2L2uVbNKkkECESuU6Z1lJGP g==;
X-CSE-ConnectionGUID: WAsc1DEgRA+cc1Mh8kru2A==
X-CSE-MsgGUID: cXuxhT+bRvOkOpD91Unllg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30983001"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="30983001"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:16:07 -0700
X-CSE-ConnectionGUID: MD7eUNeiQQ6XRCTxiZdhyw==
X-CSE-MsgGUID: 8dvjdDpTRW+ZPnEyE24QHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78195120"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:15:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com,
	matthew.auld@intel.com
Subject: [PATCH 0/2] TDR fixes 
Date: Wed,  2 Oct 2024 17:16:55 -0700
Message-Id: <20241003001657.3517883-1-matthew.brost@intel.com>
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

Fix a couple of TDR problems. The 2nd fixes relies on the 1st fix so
maybe we want to squash into a single patch for backporting?

Matt

Matthew Brost (2):
  drm/xe: Take job list lock in xe_sched_add_pending_job
  drm/xe: Don't free job in TDR

 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c    | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1

