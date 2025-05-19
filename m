Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01068C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E8610E3A3;
	Mon, 19 May 2025 23:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPlyfR5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32910E3A3
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747696768; x=1779232768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QWw76gi6CZEaFRixZUyDrbwCyuV0ICjloAgT8D24iuQ=;
 b=mPlyfR5A29Hb96sxn37SQ9rgnzokfQz21f8N38/7FaOq2m0BD8EzBJfx
 MWui/mHQRb3oHlLaBWSVCB6+dyy/00/4GwupPq0z3HDQSRlE/Utt7OZ8X
 9/oHOiyVhZ/EEZU3iwW4QJVvulX9t2beW/Fi1+a+OfGUt5hPMWIUs25Qt
 oCiQnlfXTO9gzKzjLfTAnL6zESiZN8yVz6V2TCKdkFSEshDKaZa7zOSy2
 COKr2DFnRV38Rxkzh8UP/yGj/VvSqre9bn6hO47uA1YURBlersviMWKLK
 lnHf2Azf2itiOavJnMxyZObxp/IPTmS8xg8uOlp68yKoGvQrvDd5GmuMx A==;
X-CSE-ConnectionGUID: iU+qortsT9uKsLFUApnLlw==
X-CSE-MsgGUID: PizRG/nWR/ueBtWzNUleXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49677807"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49677807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:19:28 -0700
X-CSE-ConnectionGUID: dsW/yR7mRPST6Q80mwxo+g==
X-CSE-MsgGUID: e9LR7wOGRKm4AJveK6zRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140414054"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 May 2025 16:19:27 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 0/7] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Tue, 20 May 2025 01:19:18 +0200
Message-Id: <20250519231925.3196154-1-tomasz.lis@intel.com>
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

Tomasz Lis (7):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Finish RESFIX by reset if CTB not enabled
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request

 drivers/gpu/drm/xe/xe_exec_queue.c    |  32 ++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h    |   4 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  13 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  10 +++
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    |  96 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h    |   8 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  51 +++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h           |   3 +
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |  15 +++-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      | 105 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf.h      |   1 +
 16 files changed, 337 insertions(+), 9 deletions(-)

-- 
2.25.1

