Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D6E68174
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 11:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA5510E20F;
	Tue, 17 Feb 2026 11:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oD60qFJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B9C10E20F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771329060; x=1802865060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YwTYhZpFdIm1Vk3/1sTfGiIYgchf8ty+Wcs+/RxTA98=;
 b=oD60qFJd2etf8XOzr2stTTu4D5yvZp7yrsiuBbJDVU2VljYunbL6sjGc
 YzIq3j8couzpnekBJTdCEU9g7WH8ym16Cml3faxQ+Sj4aY9FyPNdwahmM
 ciF7OulJD+1xzD9iAnvBfvOZ5NR2jSNV6BLzNCWrv7ZXlUMPcfoIKY7CB
 6Dvz9+gRmByHFGGxqO7jHdsKCo+iYm7THY/RQ2EvffrJ4NXouIqqE92TW
 7FcfTel3ybLcM8rK2zP5gcL6FtTFe0JxeOl/ni6H1mbngtVXuYFJCZqOq
 3367AsG2FP4pj3Nlmx7UShz1pSolgMYEPT2Qz5lG28mA2/MNd0RXFZd0D A==;
X-CSE-ConnectionGUID: 2PrESqwkQjqOOxiMHKyQ2g==
X-CSE-MsgGUID: 7fYIuDGtQr6W2f0wwNH6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83495349"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83495349"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:50:59 -0800
X-CSE-ConnectionGUID: 9URvAiARRPiJ1bZJaAXKCg==
X-CSE-MsgGUID: Fb/CA6j9T86lHUFP+f6TpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="251546372"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 17 Feb 2026 03:50:56 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/3] Hardware Error handling for Crescent Island
Date: Tue, 17 Feb 2026 17:16:30 +0530
Message-ID: <20260217114656.2546878-1-raag.jadav@intel.com>
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

This series sets up hardware error routing for debug cases on Crescent
Island and handles them by wedging the device so that it is available
to the user for debugging.

Raag Jadav (3):
  drm/xe/cri: Setup hardware error routing
  drm/xe/hw_error: Reuse CSC worker for generic error handling
  drm/xe/cri: Wedge the device on hardware error

 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 51 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
 drivers/gpu/drm/xe/xe_tile_types.h         |  4 +-
 4 files changed, 49 insertions(+), 12 deletions(-)

-- 
2.43.0

