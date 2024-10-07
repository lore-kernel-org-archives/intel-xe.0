Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618C5CFB45F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 20:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA0510E346;
	Mon,  7 Oct 2024 20:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV0AsLBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107FE10E346
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728332194; x=1759868194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fpAPRYT960Ow5vBi0/z+QpedDbwYRRIJJ0GspWhXKJg=;
 b=bV0AsLByby/WPF0NPxle36pW0b74hhV8Bn9kDjYZZ82Ugy7G+7pHPT47
 NUIIboM+4POAwLuuEmPswdY8r+w8ktXTo4J70NA79KsfaeHiVkp+0rFRq
 +O6s/ilIpc2oQoEgf81xsqQfpFNLnNG/ikstKSVgRABFvm3O5dasr2M7J
 jvSzqx/HTZpOCYeb+JrhQYdTk5daQEaaT3c+MEcNsaYztLzuCqJ/RhRss
 rit8RaCZo6uy5rKSMb2icFAzaI3tP1jlLW5ghE9SIuegFHqN5aIw4NBNc
 bGZEL8w2ILweo/e0JZhm5noj1r3YqRT9FGhcvihNQ63w/6RSklgpu3MJO g==;
X-CSE-ConnectionGUID: 46X0U5csTzuXMxtLGHmy/Q==
X-CSE-MsgGUID: 75FRyvlMTOmlL6CpNe24FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="44968860"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="44968860"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 13:16:34 -0700
X-CSE-ConnectionGUID: oq1ZoN+NRceozL+BJgOR3Q==
X-CSE-MsgGUID: re71Mi9ySXyKLROBYIu3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75964160"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2024 13:16:32 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v4 0/4] drm/xe/vf: Post-migration recovery worker basis
Date: Mon,  7 Oct 2024 22:16:27 +0200
Message-Id: <20241007201631.3369513-1-tomasz.lis@intel.com>
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
v4: fixed missing header include in one patch

Tomasz Lis (4):
  drm/xe/vf: React to MIGRATED interrupt
  drm/xe/vf: Send RESFIX_DONE message at end of VF restore
  drm/xe/vf: Start post-migration fixups with provisinoning query
  drm/xe/vf: Defer fixups if migrated twice fast

 drivers/gpu/drm/xe/Makefile                   |   3 +-
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 +++++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  60 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_memirq.c                |   3 +
 drivers/gpu/drm/xe/xe_sriov.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |  17 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 161 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h              |  14 ++
 11 files changed, 316 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

-- 
2.25.1

