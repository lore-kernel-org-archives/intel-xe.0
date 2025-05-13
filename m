Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A54C3ABD7
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 22:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5701710E21B;
	Tue, 13 May 2025 22:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZvbFShe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74A610E21B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 22:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176595; x=1778712595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XV9ryBP67iOxsCuXhBzi4srfWyGMe2MblGPblDvtjMs=;
 b=bZvbFShexc0zuD2M7KvqHfusZO5EOhMxKMVv4tkN/oPMN5NmSsswlXxN
 ruaALE/AWp+bci3/wVzOU99ca8dMWAxybsZcUxxDVphPWg1Q6JZgHDO9O
 rQqv5p6JXNMgM0+Sq7JD+JB+KFJcJNH3I85PXrI4DnFG8KEpoTj8iUD1n
 mep3oCC53b4Vu32v6JUf4yIf/losa7LhLiJ0vclf127FkolRN/lME1XQB
 AuMT1zA6Df4A3yrevtazLxGsk8VYQNesuEtA9bL6l2lnveqMzMv6tgz1S
 xzS6kPkF3Uiha4TC67t2fIiyWYDseRj0wQ4+Di4dUA6DKGqM4jBv4GGci Q==;
X-CSE-ConnectionGUID: OS9RUGbRQDuf3vfUkmUDEg==
X-CSE-MsgGUID: NmbaWueHQYWyP7aBnBfdfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860504"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:49:55 -0700
X-CSE-ConnectionGUID: 8FcbriGsQJ+x+MU1IcIuxA==
X-CSE-MsgGUID: uaIejyeQQs6OYnNvhTJggQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142789330"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 15:49:54 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 0/7] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Wed, 14 May 2025 00:49:45 +0200
Message-Id: <20250513224952.701343-1-tomasz.lis@intel.com>
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
* for fixing xe_lrc structs within queues
* for fixing xe_job structs and the commands they emit
It also provides some performance and stability fixes - blocking
submissions and resets while the fixups are being applied.
In case of sub-allocator, it removes the cached GGTT addresses
instead of implementing fixups for them.


Tomasz Lis (7):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Finish RESFIX by reset if CTB not enabled
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request

 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  13 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  10 ++
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    |  81 ++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h    |   6 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  59 +++++++++++
 drivers/gpu/drm/xe/xe_lrc.h           |   3 +
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |   8 +-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      | 137 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf.h      |   1 +
 14 files changed, 317 insertions(+), 9 deletions(-)

-- 
2.25.1

