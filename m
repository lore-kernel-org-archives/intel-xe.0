Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B37C54798
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 01:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4910E561;
	Wed, 28 Feb 2024 01:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1idigAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D75210E561
 for <Intel-Xe@lists.freedesktop.org>; Wed, 28 Feb 2024 01:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709082725; x=1740618725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ETLp/xtuqva3Ez+YbsQ1Nw3w3mpwYbJG1vKqz2XTY08=;
 b=K1idigAbNzo1mugjxa7HjlwxX6TnjXuM/P2IRJSACKhfgvekhkVc7Qua
 slcWBUn+7LbyTgisQQVKnBnJNkroW2PCG24U6iGrHvL5aD8ACymyeeP89
 gMhH834UgCkssQhmL+94fg4/ocuTFZJAfmfkQSUjM0Fs/ePGO91ofckeY
 HRHuj1zL91TCL5ovqY0TbB6Mcu6i3SFYx8pQAXXZm3EjTZ9dp0bEQkBCZ
 nbRQ8MTiI0b1qPIHsX8IkU82Mf46sXxh0HOt7MIFUoJ49HoYg/RPlWPQe
 HaWvomFtrpJTM9o1IChZGyKgr16zEKnQnGyDrEAyASrB6Q5gaBcVG5QkM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3618730"
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="3618730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 17:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="7808446"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2024 17:12:04 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 0/2] Support/debug for slow GuC loads
Date: Tue, 27 Feb 2024 17:09:54 -0800
Message-ID: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
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
v4: Manually code the loop timeout/condition checking because helper
functions are not allowed (review feedback from Lucas/Rodrigo)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Make read_perf_limit_reasons globally accessible
  drm/xe/guc: Port over the slow GuC loading support from i915

 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h       |  26 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_freq.c               |   4 +-
 ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} |  26 +-
 drivers/gpu/drm/xe/xe_gt_throttle.h           |  17 ++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  16 --
 drivers/gpu/drm/xe/xe_guc.c                   | 226 ++++++++++++++----
 drivers/gpu/drm/xe/xe_mmio.c                  |  61 +++++
 drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
 10 files changed, 307 insertions(+), 75 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

-- 
2.43.0

