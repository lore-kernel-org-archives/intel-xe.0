Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ED1C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 11:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FEC10E183;
	Mon, 12 May 2025 11:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knSbn/ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0910E183
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747050021; x=1778586021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GEgrXf4NDT6D53YQqhOMnTo++vkglue8n9xzUYptNfc=;
 b=knSbn/adEvdsFWosrnJaYBLzIqqXHWN2C0snlzr9mXY7bHIFdVtqvPtH
 za4R4DEMfEj/bNXFfeAzjirkcaYbIvkBLfFLFCoYfu2mA7frJpMHglHkD
 TiVsEly4GYcOQwXfYVhigSgCXRZwu5uKc2eHuLFjxinuNCurSJtZQcdOH
 u+S6SPsPkAXyJVYWo+KlMfoT/k+rMFD1hG8L2w3y+/qcQa6kifK6jhVSA
 ol9OBjQd+DmBpSeq+lUHLogzkjDBUEHnzT0sRR3XWdBQoDB4aIjMbr8za
 giMM0qX6MB6D+7Wsu1DJ6wKJTH8pxSUceCWO3YdsiyYyMOk8uq3jFvcNT Q==;
X-CSE-ConnectionGUID: dVKWSe4EQk+Tpi5FlrxWCQ==
X-CSE-MsgGUID: 7r8b55e4SaOW3ziP5TPDfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66250681"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66250681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 04:40:21 -0700
X-CSE-ConnectionGUID: 0sqpxmRsTqaPOEXcmFaPbA==
X-CSE-MsgGUID: pBjtijxXTvKnoAlVtItNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142241171"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 04:40:19 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v14 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Mon, 12 May 2025 13:40:14 +0200
Message-Id: <20250512114018.361843-1-tomasz.lis@intel.com>
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
v5: Removed drm_mm change, but added VF init modifications. These then
  allowed to re-use ballooning functions during ggtt node fixing.
v6: Minor update - fixed some misplaced funct declarations; sent to
  a different list by mistake:
  https://patchwork.freedesktop.org/series/146977/#rev2
v7: Altered, rephrased, added or promoted several kerneldocs; added
  _locked versions of some functs; improved lockdep tagging; altered
  error handling; renamed or moved some functions; defined few macros;
  prepared CTB fixups for future changes of CTB handling; renamed and
  introduced enums; did many minor changes to adjust for xe-specific
  coding practices
v8: renamed several functions, reused helpers, separated switch cases,
  documented more functs, shortened asserts, added `_locked` suffixes,
  fixed a leak in error path
v9: More helpers, fixed coding style, renamed and moved functions,
  improved kerneldoc, added asserts, avoided null dereference
v10: More xe_map*() functs to macros, added asserts and debug print,
  changed params of two functions
v11: Errors in place of some asserts, printing ggtt shift via debugfs,
  minor style fixes
v12: Fixed invalid conditionals in CTB fixups
v13: LEN to MIN_LEN in multi-lrc message, removed redundant
  __maybe_unused
v14: Just a shuffling of lines between patches, no real code change

Tomasz Lis (4):
  drm/xe/vf: Divide GGTT ballooning into allocation and insertion
  drm/xe/vf: Shifting GGTT area post migration
  drm/xe/guc: Introduce enum with offsets for context register H2Gs
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |  31 +++
 drivers/gpu/drm/xe/xe_ggtt.c              |  83 ++++++--
 drivers/gpu/drm/xe/xe_ggtt.h              |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 218 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 183 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |  17 ++
 drivers/gpu/drm/xe/xe_map.h               |  18 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  40 ++++
 11 files changed, 556 insertions(+), 49 deletions(-)

-- 
2.25.1

