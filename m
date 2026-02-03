Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98E8E8B365
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E91F10E1D5;
	Tue,  3 Feb 2026 21:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTxc/uA5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F45D10E1D5
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770153183; x=1801689183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CgxQy1rAxRTqohC72h+cJnhrZIzWBRFaM8ced8jc8r4=;
 b=lTxc/uA57ov/ThpMfXot5rzvs/y6DBd05xORlG6mU4H/0h20hk0rkUZt
 aNz8SIw/qZlbf8F54zy7gmICCDMuH//3xfAhDQapT4C8CSgVy/fWKiVzC
 dvIeqQe0EcHINoT67YJ18YF9IwJdMUsXor8rW8dywNi8UxJmL7g3rR7SA
 oRgvot419ATSlYFM8G7UDNAWkVXDIN7UL0XXCfkQpYJojBZ2+ft7aBq7L
 dhkaw5q3E6Jrb8HzCmvUcKM4Xt18143LVsx20SUP5cvBkfDwb12zcfLIE
 FG5xinmU37Jp7YTp1JV3wdZHdp6Ap+qIo8iTdld8A10FIvn5BX/DCiJVo Q==;
X-CSE-ConnectionGUID: xBDh1Kt8S/yWoYkqpNDpKg==
X-CSE-MsgGUID: KK3fjS5TSu6Nz7B88EW/xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58913890"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="58913890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:13:03 -0800
X-CSE-ConnectionGUID: ocVAQqzETnOaht9+ras4vQ==
X-CSE-MsgGUID: EWkz6pWyT5So3+a4C/cIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210079734"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 13:13:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2 0/4] Some more _types.h cleanups
Date: Tue,  3 Feb 2026 22:12:35 +0100
Message-ID: <20260203211240.745-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Promote xe_mmio and xe_tile definitions to own files.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>

v1: https://patchwork.freedesktop.org/series/149807/#rev1
v2: rebased

Michal Wajdeczko (4):
  drm/xe: Move xe_root_tile_mmio() to xe_device.h
  drm/xe: Promote struct xe_mmio definition to own file
  drm/xe: Promote struct xe_tile definition to own file
  drm/xe: Drop unnecessary include from xe_tile.h

 drivers/gpu/drm/xe/xe_device.h       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h | 167 +--------------------------
 drivers/gpu/drm/xe/xe_gt_types.h     |   5 -
 drivers/gpu/drm/xe/xe_i2c.c          |   2 +-
 drivers/gpu/drm/xe/xe_mmio.h         |   7 +-
 drivers/gpu/drm/xe/xe_mmio_types.h   |  64 ++++++++++
 drivers/gpu/drm/xe/xe_nvm.c          |   2 +-
 drivers/gpu/drm/xe/xe_soc_remapper.c |   1 +
 drivers/gpu/drm/xe/xe_tile.h         |   4 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c   |   2 +-
 drivers/gpu/drm/xe/xe_tile_types.h   | 141 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram_freq.c    |   2 +-
 12 files changed, 219 insertions(+), 183 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h

-- 
2.47.1

