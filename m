Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC23E6ADDE
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 03:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3B10E46E;
	Sat, 23 Nov 2024 03:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0CLD2mQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA0210E46E
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732331618; x=1763867618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhgexLs/b1K1Z9tIB+wwdHGIwJxvASegLPTEZbeNmog=;
 b=U0CLD2mQOMY0zWmJv9GMl/YbHaXXg0Ok6/CVcM+BRDu7cUZNISJZcHet
 jYYRyZRKw6VoKrDYUtzBwjq70z26dxZliADDLk3erOU/3oCHgNJL+4DxL
 XFWm5tWZTpjz5x2hzrBS3xygl072t7Lz/ZNhgNbU0WknLz48GT8CIU4OH
 ii8iaKpk3ZsHeTtiaPUulHTmPYPdq32Yv8qOR5k88/U/DTm8nK1ix/NIY
 vYCP+EyNBFNe71LmPvWnOS/wLCDQJsBnJ1nsADUGEyn7+LpWCXqDub7KF
 0jeBIBbYMKKvv1Wx01m+ClSIjbpE5i5Z+xzajzb7NHmHZ+mA65IfEFLpz g==;
X-CSE-ConnectionGUID: GCvoo1TcSqSz2x6U1r2Slg==
X-CSE-MsgGUID: xHg58WKTS0SewK6udwLzrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32363181"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="32363181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 19:13:37 -0800
X-CSE-ConnectionGUID: ynxJ1im9Sr6bzZG9xXbZtA==
X-CSE-MsgGUID: UCe4I9HhTHKVBPMmXHDREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="94830328"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2024 19:13:35 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/3] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Sat, 23 Nov 2024 04:13:29 +0100
Message-Id: <20241123031333.3435414-1-tomasz.lis@intel.com>
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

Tomasz Lis (3):
  drm/drm_mm: Safe macro for iterating through nodes in range
  drm/xe/sriov: Shifting GGTT area post migration
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/xe_ggtt.c              | 139 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  25 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 148 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  38 ++++++
 include/drm/drm_mm.h                      |  19 +++
 9 files changed, 377 insertions(+)

-- 
2.25.1

