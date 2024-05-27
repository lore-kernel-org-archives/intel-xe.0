Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CADC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 17:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26E610E331;
	Mon, 27 May 2024 17:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCt6XEst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F66F10E331
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716831393; x=1748367393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BpgcqwJjAiviKV0bzosGX4qUWyWd8OOH00Zw6Oz1JLg=;
 b=DCt6XEstpRqBqivJAoeDHLgAJRJNopFtsnILfu5qawvI1MU0Rx1QyZyN
 FcUM7S4c27qCmJjNVZ6rlQHEhVaR1TxmoEE0pQkFCdtrfhwqEqZ3gmcmH
 sTQ9I6LiPJxb/hWNlZoe9a+G4h1whpt52R/ARaooPgLXuvVSZYTT7fUNv
 gkI3HKKKoCtMGHvl/z+Qkz93ZEQ3KDHAUp6uWj24fGj+kV3kwH/FSVSuR
 /ar7LYa9/fJl2GCStFsL1E+Z7f5dW+38BAqow9F7xc5uMssGxsJH8BpHT
 ctWy+8qOtlPzYeVTo1RNNP6BSNb3GfM/OGLgy4NxRfMCySx46xdRQalIv A==;
X-CSE-ConnectionGUID: 7pqlldoXTs+IpHGBxd/xuQ==
X-CSE-MsgGUID: BIJAqxnWTKaypGCMTM7Nmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23722627"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="23722627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 10:36:32 -0700
X-CSE-ConnectionGUID: hhtqwUQ6QkyyULirPbRqKw==
X-CSE-MsgGUID: 93vbbPtbQOeDAcmeRqJhoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="34901662"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.33.240])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 10:36:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] VF: Setup VRAM based on received config data
Date: Mon, 27 May 2024 19:35:49 +0200
Message-Id: <20240527173554.1108-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (5):
  drm/xe: Move XEHP_MTCFG_ADDR register definition to xe_regs.h
  drm/xe: Move BAR definitions to dedicated file
  drm/xe: Promote VRAM initialization function to own file
  drm/xe: Rename internal vram helper function
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

