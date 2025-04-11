Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311DEC369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 20:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C668010E0BA;
	Fri, 11 Apr 2025 20:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tpb+ozcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5B610E0BA
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 20:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744403791; x=1775939791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eUGVcRZGecHxU3oJMHTQbBoqEg8Logtsj7IJyWnoijc=;
 b=Tpb+ozcYAkSI2G3pO2QGo9/GRdqV4mapNrrvQSE8UgAWhr0NSN1qxyzY
 6hcYyf2Zb6AAzMcT6fhAq+aWpzDp+ow9hUX3mkvPRWw4rYjB4nia1RL4i
 a0W7O6c4RcD9YRQ2pRtPuEmL5UzlZxw67YvsnWxXF7LZrsvCGi9D0iVbs
 7hO+euisvpp57iCQMo1g3POX8upu2XSjLwLszn0tjOD5RX8bIek1F0b5P
 DcmTaXi7pHyOwntKjtkJiWoGqhtkVUjhoh8NgrnkG7KJOUFhbrkZVbKYX
 Fnrpz6YlsgrhhHb9F3qXzJY9/nyoha45jAiyyKzTt74KJtO/Ubh8tBd/j w==;
X-CSE-ConnectionGUID: m1PvQRV1TvCO+rrWrE4YEw==
X-CSE-MsgGUID: 5QgKOt78SamNhLEoG7Xcyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71350482"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="71350482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 13:36:31 -0700
X-CSE-ConnectionGUID: Huvc5CE5RRWgyvXFnqjAig==
X-CSE-MsgGUID: OUw+xNgQRDaWjvphWtIyXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="129054653"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 13:36:28 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v9 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Fri, 11 Apr 2025 22:36:22 +0200
Message-Id: <20250411203626.3272415-1-tomasz.lis@intel.com>
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

Tomasz Lis (4):
  drm/xe/vf: Divide GGTT ballooning into allocation and insertion
  drm/xe/vf: Shifting GGTT area post migration
  drm/xe/guc: Introduce enum with offsets for context register H2Gs
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |  29 +++
 drivers/gpu/drm/xe/xe_ggtt.c              |  81 ++++++--
 drivers/gpu/drm/xe/xe_ggtt.h              |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 216 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 174 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |  17 ++
 drivers/gpu/drm/xe/xe_map.h               |  12 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  40 ++++
 11 files changed, 535 insertions(+), 49 deletions(-)

-- 
2.25.1

