Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD98C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 20:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E24112DE8;
	Tue,  6 Feb 2024 20:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H33drMYB";
	dkim-atps=neutral
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Tue, 06 Feb 2024 20:21:34 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEABA112DE8
 for <Intel-Xe@lists.freedesktop.org>; Tue,  6 Feb 2024 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707250895; x=1738786895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/GnT2EntRoUV7FlgGXwT7rkX9dwMqeu6ld1Xvnof4jw=;
 b=H33drMYBYmFlvV0+qQsGFgrVpUN8L0dUl/Z90Gsq9D154proRqCO3Bg2
 y41s3jPegwJ6JVJ3/9gjuESbm/3a9W/9Y/qTYHi3Ac8ufbglQyRyo9IOb
 8RmRTug4DYz02FE59b8bTGAIZMp9Lu5S59s1JyUGZ7CpZ+MJDQfAEzov1
 PILjb0ggAVZrjyNCBK8YckqnacIMlamm7wJnVNKIBVdo2gPSaCQu4pTz+
 n9iVT7iBTNXZGyv9z5s1yWt4syPwo7o7uqzESBD4r0YlHZb423Cdf+6DR
 l+336z9hOF9HjptumCl6owdF440CUEJpLSz+08eBUzgrOJ/D19XY0LqHT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="747408"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="747408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1119425"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2024 12:14:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] Support/debug for slow GuC loads
Date: Tue,  6 Feb 2024 12:11:49 -0800
Message-ID: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Make read_perf_limit_reasons globally accessible
  drm/xe/guc: Port over the slow GuC loading support from i915

 drivers/gpu/drm/xe/abi/guc_errors_abi.h   |  26 ++-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |   2 +
 drivers/gpu/drm/xe/xe_gt_freq.c           |  18 +-
 drivers/gpu/drm/xe/xe_gt_freq.h           |   4 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c |  31 ++--
 drivers/gpu/drm/xe/xe_guc.c               | 197 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_macros.h            |  32 ++++
 7 files changed, 244 insertions(+), 66 deletions(-)

-- 
2.43.0

