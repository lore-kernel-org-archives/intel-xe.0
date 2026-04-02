Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52857D6AAF6
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 17:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC8310EFAD;
	Thu,  2 Apr 2026 17:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIsxz2U9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09F710EFAD
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775152001; x=1806688001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JPZ5wHrdElLAm0tFkbT1FHDqcsKEtR/qEGA0WoFTFSU=;
 b=IIsxz2U9FFKMfZFJfM5v1ZnxABmFqXju/xBZak/NxouLkm/y9HeRLCxr
 XwAkSxV5x0hH2RZ2dYwOt+hzo8tfqQLvNqaioQSK9pZjiOpHONc9APUMM
 WuMWT8YPrIGXgyML5xZouCU14t4Fa38Mw1AOsAvjpleTuOG1iYuvoYFpI
 qLkeTVP1q+WhsCwPbvPg6kidGHiN6cNYWLbVbGUR/oyXG3746kfkiyeTU
 luw428o6zEV+lNHrhTNcha5zXnD0FQqbVyYW0+ghNLrR+ufA2AjCIryIn
 nJWzwE+klTMaVHTD0t52q5tZDhq6YyzsVAZWh16t9OMAMpuR6OkTmPAQt g==;
X-CSE-ConnectionGUID: exioykGpTo2gXfoD1UZ2jQ==
X-CSE-MsgGUID: 9iAl4KVyTtijX3mH2fBrwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93612064"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93612064"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 10:46:27 -0700
X-CSE-ConnectionGUID: PkXG8VONTLWkopmTv2kZQQ==
X-CSE-MsgGUID: pixcywaCT0e01qUTe+ERCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226209487"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 02 Apr 2026 10:46:25 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/4] Hardware Error handling for Crescent Island
Date: Thu,  2 Apr 2026 23:12:25 +0530
Message-ID: <20260402174229.1062874-1-raag.jadav@intel.com>
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
Island and handles them by wedging the device so that they are available
to the user for debugging.

v2: Explain the usecase (Matt Roper)
    Allow hardware error routing through debugfs (Mallesh)

Raag Jadav (4):
  drm/xe/hw_error: Setup hardware error routing
  drm/xe/hw_error: Reuse CSC worker for generic error handling
  drm/xe/hw_error: Allow debugging hardware errors
  drm/xe/debugfs: Update hardware error routing with wedged.mode

 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 ++
 drivers/gpu/drm/xe/xe_debugfs.c            |  2 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 55 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
 drivers/gpu/drm/xe/xe_tile_types.h         |  4 +-
 5 files changed, 56 insertions(+), 11 deletions(-)

-- 
2.43.0

