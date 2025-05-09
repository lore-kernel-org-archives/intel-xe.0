Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B5C3ABC5
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 00:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F1B10E226;
	Fri,  9 May 2025 00:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1D9V9zu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9646210E226
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 00:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746749709; x=1778285709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pbF1lbGgqMLgMwqbsnVxytpq98nl+zZYLLNf+um65kc=;
 b=D1D9V9zuJB9tF03SCAxXJt1nQDoqQS0B34VvHP4pE2MIoSoyDSOd8ogM
 7GZ0kf04txr8zSncA4fMb+EIPcFPc0gGRiHwAITqBEgd9+McZzL9jLSbH
 FyDzMIZikP+AS+Dp/jKZSFXt52p/dUIuEO0M5JQ5WxGTjQ8InClcBsDc6
 J+HMyykDobQQmZFLXaQZDLAaeiVMR6hrkt5pz9cLo7u6XhK3RpmslxALe
 zJVztAr7zGGduz14yigzNj96oWzOqciKooIdW/wc+gsIPdrLC1c5qSHPH
 9RwOFgQpSd8QShxlAztayGwPSfyJGKyazYo3mLoYrRNDDleBOR8BkbJjK A==;
X-CSE-ConnectionGUID: f/uHP7hWSr+QLW0c4VEfbg==
X-CSE-MsgGUID: 8DA9LC99S/+d1+dlgiFGRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59961354"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="59961354"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:15:09 -0700
X-CSE-ConnectionGUID: qCABFePaRLe5MPEaz7P66Q==
X-CSE-MsgGUID: WD4WphAXRXahIO0cIU6o8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="167524516"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa001.fm.intel.com with ESMTP; 08 May 2025 17:15:08 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Fri,  9 May 2025 02:15:02 +0200
Message-Id: <20250509001506.257709-1-tomasz.lis@intel.com>
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

