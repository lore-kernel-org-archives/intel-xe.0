Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6396BCF9C69
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 20:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092B510E00D;
	Tue, 24 Sep 2024 20:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0mS1SH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502310E00D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727209557; x=1758745557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRxXcFV31+yOvWsJZmi/bai2ZUuBSFOwpIuGMCVwv4c=;
 b=L0mS1SH/lvdTa3ceTuYtApzGUReQveuFJMmGLkYupEPOqPdhseW6fIBz
 qA3Y6sxxTiycsLJkEk73RGWnfYIqPdHR75mqy//7azcLvBvKXktdS96BX
 vqW5jCslHhAG06w0IkrbZ0H3KYZ7f10CDzu1E3Lc1exkLXbjCuRZ8AHqA
 ybsJOuhyIaglYSyruMls82aOk+bFF5cl+d2El99Ws2b0QYammKHU6f70L
 9r2/egZZpEb70wHIsg3Jf0ELZAwCCncDLZLf99U5zv0/hl8xPXnDjzCQM
 FQdBAtM0ZpenFKI+wMmGg7M5Ck9JDizE0uoEzWaXtfzFGDlXtjI2//63P w==;
X-CSE-ConnectionGUID: KNmS+PElR0iT/07819XZpA==
X-CSE-MsgGUID: 3aYza3hXQ3GNBFkFUNKOYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51647404"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="51647404"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 13:25:56 -0700
X-CSE-ConnectionGUID: nKGyC8t6TLGW55H3xOhFiQ==
X-CSE-MsgGUID: tIkPXoIuToK8e81NbgBFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76335575"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa003.jf.intel.com with ESMTP; 24 Sep 2024 13:25:54 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/4] drm/xe/vf: Post-migration recovery worker basis
Date: Tue, 24 Sep 2024 22:25:49 +0200
Message-Id: <20240924202553.1541574-1-tomasz.lis@intel.com>
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

This series introduces a post-migration recovery worker, executed
after migration to perform fixups.

Specific fixups will be added later in further series.

v2: renamed and moved functions, updated logged messages, removed
  unused includes, used anon struct, keeping pm ref during whole
  recovery, skip handshake, style fixes (mwajdeczko)

Tomasz Lis (4):
  drm/xe/vf: React to MIGRATED interrupt
  drm/xe/vf: Send RESFIX_DONE message at end of VF restore
  drm/xe/vf: Start post-migration fixups with provisinoning query
  drm/xe/vf: Defer fixups if migrated twice fast

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 +++++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  47 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   3 +
 drivers/gpu/drm/xe/xe_guc.c                   |  11 ++
 drivers/gpu/drm/xe/xe_memirq.c                |   3 +
 drivers/gpu/drm/xe/xe_sriov.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |  10 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 160 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h              |  14 ++
 11 files changed, 293 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

-- 
2.25.1

