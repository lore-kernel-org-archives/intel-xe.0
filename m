Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C37DC2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A9410E974;
	Thu, 15 May 2025 22:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqmsKfDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD410E975
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747347516; x=1778883516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lzbyMFbly9jJV1z2GqRLWx5v8omN1D29Bu3YJJO6FqQ=;
 b=YqmsKfDs/CMmCSLDFbNKWgZLb+WYXyMuTba/SDCNwHxDOXdSDDfdlnI6
 T/b3LxJYWefaw+IapAVCA9mxyCyhMePVlyR7jen9xOHMdyogOpCYwV4KX
 e/Np9xMVkjNSodZ8n66362l/lUJvE9SAxzulVRlehRWiTEyGx4s67iokA
 CTw8I3EJc4C9uOe3DyaO1J+h3Wx/+/Sa2km7pAAvCmRasVtUe2DE136an
 UMoIZvTwRuYGNmpRkh21IUrcjpy/0dVU07xMH9o2vbS0xdY26SJkInXrC
 fBa5zJamCOf0qnF+Z6CzxdSM79J0bXZ8IDVvl1MYCZm82Ngh7RbCFBdve g==;
X-CSE-ConnectionGUID: M6asejQGTe62hde26JbV5A==
X-CSE-MsgGUID: 6kvyX3LdS1y22rKn/s4hOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49237268"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49237268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:18:30 -0700
X-CSE-ConnectionGUID: OTu8R5yXRKGtCsTPXga1hA==
X-CSE-MsgGUID: KMo7hc1vT4a5yOrRW7CoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138242823"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 15 May 2025 15:18:28 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/7] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Fri, 16 May 2025 00:18:20 +0200
Message-Id: <20250515221827.1493032-1-tomasz.lis@intel.com>
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

Tomasz Lis (7):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Finish RESFIX by reset if CTB not enabled
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request

 drivers/gpu/drm/xe/xe_exec_queue.c    |  27 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.h    |   4 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  13 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  10 +++
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    |  91 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h    |   8 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  51 +++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h           |   3 +
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |  15 +++-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      | 105 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf.h      |   1 +
 16 files changed, 327 insertions(+), 9 deletions(-)

-- 
2.25.1

