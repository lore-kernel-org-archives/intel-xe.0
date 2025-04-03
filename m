Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03124C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B3E10EA77;
	Thu,  3 Apr 2025 18:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fyjrs+v5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46CB10EA6E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743705659; x=1775241659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Fuk5MCtuF1NRlwdg2JmOj73Ay4YjqmDNof2H7Kc6aM=;
 b=Fyjrs+v5c/Xy3EunYhiDnP/n648d9Ptaq/o+GOECFyEkGI7mp0ueyWNW
 H7z7lO72A2+jz9rhoo6xy9c428RP7p37CIa6DFDpGToe7QZU2RkC3Kvid
 XHJ+NaYzMqBj+sEyxZiWj/qr43btPMfFA5Z7cPWfiuDJ683MQGwtJxWwL
 tip+aEXcyf/4asOuI3w1lStogyhy4LF3oqZZHdJI3w8oB4DoCeFu8w8Iq
 BZImA+Vk2JDAXcmIMwrtrApjMzgrJQ2R8ruVV+qOhaQ10rtC5A5lGKMgs
 NBd+m9zEYBqAmj4xVrg8fRMJCieCeQ1KFBzAxw0whkHSexwDdb0tTAZIY A==;
X-CSE-ConnectionGUID: 5Gxd4zvQTEem5SMcs74CIg==
X-CSE-MsgGUID: Sa9YtIDBTlCuNqL6V4OB1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67604255"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="67604255"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:40:58 -0700
X-CSE-ConnectionGUID: 1vn7cmzjSuavBDveDFa9aw==
X-CSE-MsgGUID: 2XogsieURjC+19VgfSAaZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132216392"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2025 11:40:56 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Thu,  3 Apr 2025 20:40:51 +0200
Message-Id: <20250403184055.2317409-1-tomasz.lis@intel.com>
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

Tomasz Lis (4):
  drm/xe/vf: Divide GGTT ballooning into allocation and insertion
  drm/xe/vf: Shifting GGTT area post migration
  drm/xe/guc: Introduce enum with offsets for context register H2Gs
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |  29 ++++
 drivers/gpu/drm/xe/xe_ggtt.c              |  48 +++++-
 drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 195 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 147 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |  22 +++
 drivers/gpu/drm/xe/xe_map.h               |  12 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  40 +++++
 11 files changed, 470 insertions(+), 32 deletions(-)

-- 
2.25.1

