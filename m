Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E823CDE03D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 22:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FA010E199;
	Thu, 26 Sep 2024 22:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxsDyA+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863DD10E199
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727389206; x=1758925206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CvMNcdRB5yKSxehBAskqtZY25EWI+I/ABpZ8HDecBOI=;
 b=kxsDyA+3BXGOFy5pCJ+7Wp1Xid6pqi+9XznR4vg60YD9/ALd0X0a8LEi
 p3YJ6fS0dP7l5F3gayFmJta+npU1tasHQyjUOP3K9O8hNtoB/92/tuFLJ
 L+fmxcK4O81rn2wM7zK4fu+dQeg74uK1YzdL1G5z+N5zX/+MZF/E4p4IW
 IVq6F5tidhfeqBs8UObhXWM2mDlynAW7nxUPNMB0FVIAAOqzXO9K6Jplm
 6mMfF0uldUmAwz6RNzGP2fqrVsA9X1NeN8mteYG46J+2ANv6lN8ZVbDoc
 zUcraqOp1x1aWqfzWWsoKIDcSZMz0s/LvYRO8ZcpLDdequCgjsK9+ctLV g==;
X-CSE-ConnectionGUID: TGqqfsThTy2csLMP7xc0Dw==
X-CSE-MsgGUID: 8TpqgF2KQA2y/b3o3eRG0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26617033"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26617033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 15:20:06 -0700
X-CSE-ConnectionGUID: RM17+lNWRHKybsSBXYU7xw==
X-CSE-MsgGUID: 1Z70BDEJT0K0gWFq5seKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72636196"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2024 15:20:05 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v3 0/4] drm/xe/vf: Post-migration recovery worker basis
Date: Fri, 27 Sep 2024 00:20:00 +0200
Message-Id: <20240926222004.2462345-1-tomasz.lis@intel.com>
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
  recovery, skip handshake, style fixes (Michal)
v3: ordering, kerneldoc, asserts, debug messages, on_all_tiles ->
  on_all_gts, switched 'err' and 'ret'  (Michal)

Tomasz Lis (4):
  drm/xe/vf: React to MIGRATED interrupt
  drm/xe/vf: Send RESFIX_DONE message at end of VF restore
  drm/xe/vf: Start post-migration fixups with provisinoning query
  drm/xe/vf: Defer fixups if migrated twice fast

 drivers/gpu/drm/xe/Makefile                   |   3 +-
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 +++++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  56 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_memirq.c                |   3 +
 drivers/gpu/drm/xe/xe_sriov.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |  16 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 160 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h              |  14 ++
 11 files changed, 310 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

-- 
2.25.1

