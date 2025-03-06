Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5A5C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A562E10E02D;
	Thu,  6 Mar 2025 22:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhLzvTMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CA310E02D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741299689; x=1772835689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6rYoq9vS1wuWGG4yGi2VxN3d9Wabn1ycBmybE6M8zIw=;
 b=JhLzvTMBKzLy5tuRILlvmiNNoaz6Hf2FRS1kTf0eLd5FdgV5taWwhNX5
 VyIxqllQT+qiFRTvKd8VbDcd91mLr8+U28U8bMRs9EpMp7Q+dO9bz/6KL
 fDKI1XIOlmdGAr/vGMoHxUhbZkhDhySgQi0zVWoNpg45GL+TvUmOFDuMR
 NHn3f504uO4+ufic04IfJrSJodHBNH/V6wg1vuOgg6qY/quh09ZXUpnLC
 XdywRHDvxdbdaOymAiTRzcUrSRPdTJunLCNPm1I9l5CF6NAEuox6FESjP
 Eib9hszsHYc+O2JBa6dRQUI4BqIY5ZAuFDEGrjfM6Cii3do5zREgVMHe+ Q==;
X-CSE-ConnectionGUID: iwR6xMJARMOWGySU2GoyyQ==
X-CSE-MsgGUID: UvzdbsPfRvufvC3fx68pBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53736302"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53736302"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:21:28 -0800
X-CSE-ConnectionGUID: UA72PGOySV2EWKnRHS1wqQ==
X-CSE-MsgGUID: yODWD3IxQlCHihxNTC/EXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119662855"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 14:21:27 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 0/3] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Thu,  6 Mar 2025 23:21:23 +0100
Message-Id: <20250306222126.3382322-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

To support VF Migration, it is necessary to do fixups to any
non-virtualized resources. These fixups need to be applied within
VM, on the KMD working with VF.

This series adds two fixup functions to the recovery worker:
* for fixing drm_mm nodes which represent GGTT allocations
* for fixing content of outgoing CTB buffer

v2: Fixed missing include, made checkpatch happy
v3: Moved some functs to xe_ggtt.c; moved shift computation to just
  after querying; improved documentation; switched some warns to asserts;
  skipping fixups when GGTT shift eq 0; iterating through tiles rather
  than gts; fixes in log messages
v4: Updated kerneldocs, removed unused funct, properly allocate
  balloning nodes if non existent, removed inline keywords, enums for
  offsets in CTB messages, less error messages, if return unused then
  made functs void

Tomasz Lis (3):
  drm/drm_mm: Safe macro for iterating through nodes in range
  drm/xe/sriov: Shifting GGTT area post migration
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |   7 +
 drivers/gpu/drm/xe/xe_ggtt.c              | 163 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  26 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 147 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   4 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  40 ++++++
 include/drm/drm_mm.h                      |  19 +++
 11 files changed, 413 insertions(+)

-- 
2.25.1

