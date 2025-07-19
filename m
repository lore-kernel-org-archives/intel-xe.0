Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6ACC83F27
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 07:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C1510E1DE;
	Sat, 19 Jul 2025 07:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Slny1RFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0DF10E1DE
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752910658; x=1784446658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TaJGekpqn7l0PbLP3FJbJWlVSiuEmZFBe0IgrMFKtz0=;
 b=Slny1RFLSiGx2KPdiRMgokqziRVploUYJp28WNsfFq68mRXsvC2OpTT/
 Uf+h1i8Cm5VcAo4IAYB/kfRyLAGPdkFrCZ0j8lgV5TuqGmg9OYtEI7pRz
 psHrhz1wMq/LGLO/rhZdd8d9zOf+eHz693W436Lo+X5YwKoP7+joXWJz/
 eWLd7zw2MG6Hlh7eibakFF2qkUh3jf/H87SsGap1BBzh2wWdUmFweHKgv
 L0DkBTsaPtxKWqXCBvJ0xq889AKZ45vz3VV6++EVXbkCMfo0AYOi51P8J
 kfz71g5b3ulr9uxqT495x4mChxEtBC2KKjWL5/XO6ymte91+6BNnzRPja w==;
X-CSE-ConnectionGUID: 4Z8WJQ3ITk6sb1VEZjmSXg==
X-CSE-MsgGUID: HDxlbXK/Sw6ctbErzevyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55159699"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="55159699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 00:37:38 -0700
X-CSE-ConnectionGUID: fECBfeEySIyd0rJQgDUHGg==
X-CSE-MsgGUID: xASpuoQ/TreLhJ4M+fmMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158844422"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 Jul 2025 00:37:35 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 0/9] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Sat, 19 Jul 2025 09:37:36 +0200
Message-Id: <20250719073745.74251-1-tomasz.lis@intel.com>
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

v2: Switcghed to update of addresses by xe_lrc_write_ctx_reg()
  to avoid kzalloc(), renamed or moved few functions
v3: Renamed and reordered parameters, added kerneldocs
v4: Take job_list_lock, introduce a new atomic for reset
  blocking, add "refresh utilization buffer" patch
v5: Replaced "Finish RESFIX by reset" patch with "Skip fixups
  before getting GGTT info", rebased "Refresh utilization buffer"
  patch
v6: Rebased to changes in "Make multi-GT migration less error prone",
  used a scratch buffer, and added one more ring recovery patch
v7: Used better matching atomic functs, fixed noop item at end of
  WQ ring, added more exit conditions in wq ring

Tomasz Lis (9):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Skip fixups on migration before getting GGTT info
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request
  drm/xe/vf: Refresh utilization buffer during migration recovery
  drm/xe/vf: Rebase exec queue parallel commands during migration
    recovery

 drivers/gpu/drm/xe/xe_exec_queue.c    |  41 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.h    |   4 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  13 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gt.c            |  10 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  23 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h   |   1 +
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 154 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |   9 ++
 drivers/gpu/drm/xe/xe_guc_types.h     |   6 +
 drivers/gpu/drm/xe/xe_lrc.c           | 107 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.h           |   9 ++
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |  15 ++-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      |  75 ++++++++++++-
 18 files changed, 459 insertions(+), 16 deletions(-)

-- 
2.25.1

