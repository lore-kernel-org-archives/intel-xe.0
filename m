Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5414FE75457
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB0D10E056;
	Tue,  3 Oct 2023 12:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302310E056
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696337523; x=1727873523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gRqxF480AcydSPifinSICLlEjYLx0sLaEf45bRvbH3c=;
 b=gHTJFqlf829HvUYc7QoDRzSJAKmfao35yQ977shXIGFAhzSLGZ1Zoqtn
 kAF/MiRBXdqmyukCq2tNM6ezuAXlWOUrxfVnJxqxRO7wt27CvotT9SXfn
 5XqBz2U2Jib9FrgO6dwhs/6o2MfsH1IOqGrgUxA/EDFxbN7W9jLlps3EC
 6/ijYpuRZaHFM+q2LB61v5tRihR9J/Em0XTrhgFKoMf7sp5W9zyTImSUn
 ZHUQ7bj3BpOSZt73wDocRuikPtPoTVT9cmgbGMMI+N8aznl6HPIceD+GE
 MzgFz2Jl/XCmK3/m7WCbhjS0AQNuRZNsYL7RqjMw4lb/zsb3FtxGpPIRb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022073"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447022073"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998005492"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="998005492"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:51:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 05:52:10 -0700
Message-Id: <20231003125217.3350838-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/7] xe2: Add PAT programming
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the PAT table and allow PTEs to be encoded with the additional bit.

This also adds a new debug capability: allow to dump the PAT table via
debugfs and to dump it automatically when the driver fails to bind to
the device. A wrong PAT table may be related with GuC failing to
initialize or other failures that go away with additional debug
messages. At least dumping the table allows one to quickly check if the
values programmed are the expected ones.

v2: Fix PAT dump for xehp/xehpc/xelpg

Lucas De Marchi (6):
  drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
  drm/xe/xe2: Follow XeHPC for TLB invalidation
  fixup! drm/xe/pat: Prefer the arch/IP names
  drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
  drm/xe/pat: Add debugfs node to dump PAT
  drm/xe/gt: Dump PAT table when failing to initialize

Matt Roper (1):
  drm/xe/xe2: Program PAT tables

 drivers/gpu/drm/xe/xe_bo.h         |   1 +
 drivers/gpu/drm/xe/xe_ggtt.c       |   2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  12 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
 drivers/gpu/drm/xe/xe_pat.c        | 298 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pat.h        |   8 +
 drivers/gpu/drm/xe/xe_vm.c         |   6 +-
 7 files changed, 334 insertions(+), 5 deletions(-)

-- 
2.40.1

