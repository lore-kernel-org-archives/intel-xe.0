Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E673C02195
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F90110E257;
	Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QljPvQXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3E610E257
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362717; x=1769898717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=myE2AXHCu48ZJNtsorZ4NosCWSYOcZ+J2Mb5ABmB50E=;
 b=QljPvQXKbcdLymdyHUDISvFjyyI2ryxP2HCdSzJe+c0iFFWhE2cxLeuP
 vYGgJWI7kp39hARcPtDl7oirh/1SZZYXXMZJTynt/n/CFZ8ecI9V4gI8u
 dYAyUTGIvmndcCmLlNr1Rmes+Z0Ry7S76IZuqTDygxNHbyT1DN0bDgfzo
 6CTT2q53i73N3jJ8nYP31oCDpkUgxJP41DfKTlCjSL/zcdo/SE3xTRZel
 FwI5SOkx1KGbJgAIabrJRIWJhzpMXlAgFiZjBuSltIL1NdulNZ874T4Q4
 ylvGfsPkgXW6atHHPRvVHtW0BKAYLUyTX73UTavwTVxaHsE1PXbHVvDGC Q==;
X-CSE-ConnectionGUID: Cpr9R9zFRYSQDhf8NNwTvw==
X-CSE-MsgGUID: 3bDaZ6XrRLy+tD2ikTSY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149056"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
X-CSE-ConnectionGUID: 4AQVmrvQT6iA5Cp3nX8msA==
X-CSE-MsgGUID: 9tcokElERraHJtvsopyiag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622307"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/7] Cleanup error handling on probe
Date: Fri, 31 Jan 2025 14:31:33 -0800
Message-ID: <20250131223140.4144292-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Mixing style with goto and devm_add_action_or_reset() is very confusing
and error prone. Clean that up. The only missing one is one of the
display calls, but that can be done in parallel to the review of these
first patches.

This received limited load/unload tests on LNL and may very well not be
100%.

Lucas De Marchi (7):
  drm/xe: Fix xe_display_fini() calls
  drm/xe: Fix error handling in xe_irq_install()
  drm/xe: Fix xe_tile_init_noalloc() error propagation
  drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
  drm/xe: Cleanup unwind of gt initialization
  drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
  drm/xe: Move oa fini to xe_oa

 drivers/gpu/drm/xe/display/xe_display.c | 22 +++++-----
 drivers/gpu/drm/xe/display/xe_display.h |  2 -
 drivers/gpu/drm/xe/xe_device.c          | 53 ++++++++-----------------
 drivers/gpu/drm/xe/xe_gt.c              | 52 ++++++++++--------------
 drivers/gpu/drm/xe/xe_gt.h              |  1 -
 drivers/gpu/drm/xe/xe_irq.c             | 14 +------
 drivers/gpu/drm/xe/xe_oa.c              | 48 +++++++++++-----------
 drivers/gpu/drm/xe/xe_oa.h              |  1 -
 drivers/gpu/drm/xe/xe_tile.c            |  4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  | 17 ++++----
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |  2 +-
 11 files changed, 86 insertions(+), 130 deletions(-)

-- 
2.48.0

