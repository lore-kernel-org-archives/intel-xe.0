Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECB3C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0FE113D8E;
	Thu, 30 May 2024 13:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8qvfvU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B70113C14
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076138; x=1748612138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3k9dAnATlGpbWVQNdDGanyVp2wvDccvbiucJyuHf/xA=;
 b=g8qvfvU9Q2dGjeJ9hmAB8flN9imtGvTtTFlNoyPMdLDHhT1+T/L0QFiX
 D2xckLI1pG2zTN+ZfZZpNZrYnaFOq0l0ClaJnn9hd5xvVHrp9mn97KxRr
 P7PEbev/urVPcrNoI+9rTh7oFsZfOyGCneW8Zi2IX9vgUPI0/IX4flS81
 hscDu+O/qKcBpQr6OTOL/JK4B4KZHB8n+9yvZXBRZ8xrLxPI+offMSvUy
 4QGmLkv/bB2CjFS5HGJY5JxOn7eNuJOgUB2KkJNk9qBB9zSx5TLrsxK2Y
 4EhxXbagmLWk6Lw69eApcJTtwhytSGkq15ZwjYYMLaG2nWnX8z+YD8uWR g==;
X-CSE-ConnectionGUID: iHNEv0FSQ0GJrsE01epa6Q==
X-CSE-MsgGUID: 5NQ1huFTTXyNMD7GDtdZ5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24681344"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24681344"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:37 -0700
X-CSE-ConnectionGUID: uEyfQbCwTkSkH/n0tUKYZQ==
X-CSE-MsgGUID: kY3ic5tOQY2X7xSroeGeow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40733739"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/5] VF: Setup VRAM based on received config data
Date: Thu, 30 May 2024 15:35:22 +0200
Message-Id: <20240530133527.1328-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

VF drivers will obtain VRAM configuration from the GuC as part of
the VF self config. Use that configuration instead of trying to
read inaccessible registers.

But before doing that, do some cleanup of the VRAM probe code.

v1: https://patchwork.freedesktop.org/series/134097/#rev1
v2: rename xe_mmio.c static functions before move to xe_vram.c

Michal Wajdeczko (5):
  drm/xe: Move XEHP_MTCFG_ADDR register definition to xe_regs.h
  drm/xe: Move BAR definitions to dedicated file
  drm/xe: Drop xe_ prefix from static functions in xe_mmio.c
  drm/xe: Promote VRAM initialization function to own file
  drm/xe/vf: Setup VRAM based on received config data

 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/regs/xe_bars.h      |  11 +
 drivers/gpu/drm/xe/regs/xe_regs.h      |   3 +
 drivers/gpu/drm/xe/xe_device.c         |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c    |  17 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h    |   1 +
 drivers/gpu/drm/xe/xe_mmio.c           | 339 +----------------------
 drivers/gpu/drm/xe/xe_mmio.h           |   2 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |   1 +
 drivers/gpu/drm/xe/xe_vram.c           | 368 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h           |  13 +
 11 files changed, 421 insertions(+), 338 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_bars.h
 create mode 100644 drivers/gpu/drm/xe/xe_vram.c
 create mode 100644 drivers/gpu/drm/xe/xe_vram.h

-- 
2.43.0

