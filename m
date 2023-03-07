Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3A3C678DB
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B26B10E3CB;
	Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587C510E3C3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181129; x=1709717129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Zi2fTzQjvMSo9oEap2cNLYHiNAMnJ8Oi63rdndkgjc=;
 b=VwwG/73wElHgeMpYdkPPfmMNel45HErjR5FQnDDntY023esqMstEk1VD
 fh4xlRXTi5qOkePC/+QRArSSMxgvR5rz0Y+00ZT3erXXeEFN0KoaDD/PL
 6gcdQV9sTOhcqtUBZcQOQ0fbohVN6hW0WuJDOkdd2b7kDlCag7ln7yY/6
 YGRXrV3M24j7QCIfZkt3GYOsYdDgR8my8VEUnJRVtk/mdbF2y0qWT/wnL
 eKMtF2tSs7mIo9sI7V4HqEy8qZDtIXv2UD2nE4DKhy5iNWVytSrq5czr6
 vUZFgsWJm6CMa5gFZ3rpY16XKbuCt44oRJ/AzQ+GQVYagrxGT/BBwFClm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079111"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079111"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798789"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798789"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:27 -0800
Message-Id: <20230307092446.1263266-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/19] DG2 + PVC workarounds and infra
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

Bundle together pending changes for DG2 and PVC workarounds. This
includes previous patch series from me thar are pending review:

1) "drm/xe/mcr: Add L3BANK steering for DG2"
(https://lore.kernel.org/intel-xe/20230307015635.986043-1-lucas.demarchi@intel.com/T/#t)

2) "Allow const propagation in gt_to_xe()"
(https://lore.kernel.org/intel-xe/20230306175025.720323-1-lucas.demarchi@intel.com/T/#t)

3) "RTP and SR improvements for PVC WAs"
(https://lore.kernel.org/intel-xe/20230301093112.2893689-1-lucas.demarchi@intel.com/T/#t)

4) The WAs for PVC and DG2

This has been more tested on DG2 than PVC. Driver at least still loads
and and basic tests fine. For PVC I may need to do some
manual executions to make sure it's not introducing regressions.
Some of the RTP improvements (item 3) are not really required, but they
helped when adding these WAs.

For "drm/xe: Add helper to get dss per group" and "drm/xe/rtp: Add match
helper for gslice fused off", Matt Roper: can you take a look if I got the
condition correct wrt the group?

Lucas De Marchi (19):
  drm/xe/mcr: Add L3BANK steering for DG2
  drm/xe: Allow const propagation in gt_to_xe()
  drm/xe: Constify xe_dss_mask_group_ffs()
  drm/xe: Add helper to get dss per group
  drm/xe/rtp: Move match function from wa to rtp
  drm/xe/rtp: Add match for render reset domain
  drm/xe/rtp: Add match helper for gslice fused off
  drm/xe: Remove dump function from reg_sr
  drm/xe: Name LRC wa after the engine it belongs
  drm/xe/debugfs: Dump register save-restore tables
  drm/xe/reg_sr: Tweak verbosity for register printing
  drm/xe/pvc: Remove A* steppings
  drm/xe: Reorder WAs to consider the platform
  drm/xe: Add PVC gt workarounds
  drm/xe: Add PVC engine workarounds
  drm/xe: Add missing DG2 gt workarounds and tunings
  drm/xe: Add missing DG2 engine workarounds
  drm/xe: Add missing DG2 lrc tunings
  drm/xe: Add missing DG2 lrc workarounds

 drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  84 ++++-
 drivers/gpu/drm/xe/xe_gt.c              |   2 +-
 drivers/gpu/drm/xe/xe_gt.h              |   8 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c      |  24 ++
 drivers/gpu/drm/xe/xe_gt_mcr.c          |   9 +-
 drivers/gpu/drm/xe/xe_gt_topology.c     |   8 +-
 drivers/gpu/drm/xe/xe_gt_topology.h     |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   5 +
 drivers/gpu/drm/xe/xe_reg_sr.c          |  51 ++-
 drivers/gpu/drm/xe/xe_reg_sr.h          |   4 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h    |   5 -
 drivers/gpu/drm/xe/xe_rtp.c             |  26 ++
 drivers/gpu/drm/xe/xe_rtp.h             |  41 +++
 drivers/gpu/drm/xe/xe_step.c            |   2 -
 drivers/gpu/drm/xe/xe_tuning.c          |  25 ++
 drivers/gpu/drm/xe/xe_wa.c              | 401 +++++++++++++++++++++---
 16 files changed, 613 insertions(+), 87 deletions(-)

-- 
2.39.0

