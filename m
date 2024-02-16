Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2CC48BF5
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 17:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D6910E028;
	Fri, 16 Feb 2024 17:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+qwnF7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3581310E028
 for <Intel-Xe@lists.freedesktop.org>; Fri, 16 Feb 2024 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708106298; x=1739642298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ohitymbOTScgIjz5ZZddKsY9+2kCrxX7Ze4KZ2FT1Q=;
 b=m+qwnF7y6gg5dHFBQzk0U7ue7WMC5Qzy8lPpajZOXC7lqJ+tH7G7CyOi
 a/3OiAhlUnz7JkfOUJ5uxl3CRINQUXUkMs+osRML9BUIPpMyl406tPGbn
 zKavgDsK7HM6mJvn+Wu1yHpKF4lAINLqegVl9lBHc5rY4ypguz3ct475i
 G6gJ0v8SMXetq8DNQOxLZ2I2324byI53/aPOap1kmC/9qB9kTINjbZJn4
 RBGbWooPeXMjPf5vqAIBFDPdvnL4i8Awk42w49KPzo6RLP0Vzn08b1Akj
 mhSsCtQGESAl/ULOM6/ixRPUFlh1clNoCT3o5bUmGNQaM3Y752+PjVPsD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2111590"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2111590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 09:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4256328"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 16 Feb 2024 09:58:18 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/2] Support/debug for slow GuC loads
Date: Fri, 16 Feb 2024 09:55:55 -0800
Message-ID: <20240216175558.411497-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Sometimes the GuC load is slower that it should be. For end users,
that usually means some kind of thermal throttling issue. Internally,
there can be any number of bugs that cause it. So don't completely
fail to load, just cope with it and report the problem.

v2: Revert include order (review feedback from Lucas)
v3: Remove '_sysfs' from throttle file names and keep limit query in
the same file rather than moving elsewhere (review feedback from
Rodrigo). Fix the reporting of requested vs granted frequencies
(review feedback from Badal).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Make read_perf_limit_reasons globally accessible
  drm/xe/guc: Port over the slow GuC loading support from i915

 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h       |  26 ++-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_freq.c               |   4 +-
 ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} |  26 +--
 drivers/gpu/drm/xe/xe_gt_throttle.h           |  17 ++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  16 --
 drivers/gpu/drm/xe/xe_guc.c                   | 205 ++++++++++++++----
 drivers/gpu/drm/xe/xe_macros.h                |  32 +++
 9 files changed, 255 insertions(+), 75 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

-- 
2.43.0

