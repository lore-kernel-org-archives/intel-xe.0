Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B67E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 23:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230CD10E00C;
	Fri, 20 Dec 2024 23:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5YGgdXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3801110E00C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 23:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734737652; x=1766273652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6xtRPIJ6Z8W9JnXCV9Okbku3VbnDO9vwDvXGKr4ydLk=;
 b=H5YGgdXDBtqbf9avyqGIaPWMjqyvaAL+j6azZfyWATsUfrGd11vUPq8U
 sepsXj6SoOHoBvhqLhamcM5U6c55Phk9nGFq1eowzN9HipT51PTF++Bsa
 Qqg1pGaGZxKu2R8arkjaWEHz9vPwpOY3Dvw/3ReCqDx8OlU8aoPm9Eqec
 L14qHjQ53DQHFR8z3tXCzRNT0Md9Lf6Bj7BZTvG0FcBfHgb7uMzYyb7pe
 CiFomRWFnsP2Uv8Rsw5vzvOELtZf4KNaHefepv969gGExDyit3KG4q1yF
 to+WfEOmEW9wTu0cUDwEhcGHxkiNjIqOkeGWIcxC78vmwehgcXyG9N9vj g==;
X-CSE-ConnectionGUID: rNxbgsXYQjGPhCbv9A5shw==
X-CSE-MsgGUID: IxVmB++FTI6J+VmJ9Q5sww==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57768593"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="57768593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 15:34:11 -0800
X-CSE-ConnectionGUID: G6n0Zs78Tl+vTnSuWH6M+g==
X-CSE-MsgGUID: JhuiyjEORwS0OyLua8Ne5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="99156398"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 15:34:10 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 0/3] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Sat, 21 Dec 2024 00:34:06 +0100
Message-Id: <20241220233409.2956004-1-tomasz.lis@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_ct.c            | 144 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   4 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  40 ++++++
 include/drm/drm_mm.h                      |  19 +++
 11 files changed, 410 insertions(+)

-- 
2.25.1

