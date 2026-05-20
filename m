Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1946ACD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 11:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C073110F001;
	Wed, 20 May 2026 11:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfPsk2/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05F810F001
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779277177; x=1810813177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bLsCPtTSuVRns/TlCuxmDb/CxvGrr5BZA/dDSWlTNIg=;
 b=OfPsk2/zMjbAJu2km9P+7FHajHHDMr3G6JTCtc95dN8LSvPVRsMm/WT+
 gUSYYu5f3smOi66HUrsPHCJe5pj1+MhOfU0YOQZ46+Agj4okbsiUl/Rqh
 jtbJA48y2PxXwoe4yduPJ8DVrYRQLvL79+AoW8Mp6GILbHwKPrB7PGpIP
 AhfY+kMDwY6gHcuE3iT1qwn7GHp1jErEjgBew5oOAd8tzc+0j3xQfRQeq
 MBnMOkIwInUK5LGsKISNQTZZy6EpMeCsdXhTImfYhe2V1N+xDbjx3HEMJ
 l1ioAWAEdhzvRwSn6i6l/SjbMoifg1cCiSzha/g5Y7SIi+YUrFd41W2MA A==;
X-CSE-ConnectionGUID: cal8/X7ZT4evTgIV5Z0zsA==
X-CSE-MsgGUID: uhINvTTwSbW9PPMTbt7/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80023165"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80023165"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 04:39:36 -0700
X-CSE-ConnectionGUID: 4IKcXlz/Q+W646v/IqqxBg==
X-CSE-MsgGUID: N1wl/H/eQhSJTOAFK6y82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="233792233"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 04:39:34 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/5] Hardware Error handling for Crescent Island
Date: Wed, 20 May 2026 17:04:05 +0530
Message-ID: <20260520113622.171462-1-raag.jadav@intel.com>
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

v3: Reorder macros (Riana)
    Squash debugfs patch with routing setup patch (Riana)
    Fix runtime survivability regression (Riana)

Raag Jadav (5):
  drm/xe/hw_error: Reuse CSC worker for generic error handling
  drm/xe/hw_error: Initialize hw_error_work per tile
  drm/xe/hw_error: Handle initialization failure
  drm/xe/hw_error: Setup hardware error routing
  drm/xe/hw_error: Allow debugging hardware errors

 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 ++
 drivers/gpu/drm/xe/xe_debugfs.c            |  4 ++
 drivers/gpu/drm/xe/xe_hw_error.c           | 71 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_error.h           |  3 +-
 drivers/gpu/drm/xe/xe_irq.c                |  5 +-
 drivers/gpu/drm/xe/xe_tile_types.h         |  4 +-
 6 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.43.0

