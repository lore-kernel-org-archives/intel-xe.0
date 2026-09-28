Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B47C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84EF10E6AC;
	Mon, 28 Sep 2026 09:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGAI0Uda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA1E10E6AC
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587444; x=1822123444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gWTjtlgZjcYfEGI0W+tYCHDUbvCPphe1axzJ0tlB7QI=;
 b=eGAI0UdaQYa494zhDFmK6ci0LMcAkZ8pYcxWWMP6NJOQCIOGlyc3mJXP
 /1tcsWyA4gCx2QKya4RhMrhYLxaoiIwUAL+5QKbi5RoHvQVIktuNWeD1J
 JrORTAL0fwjnejp9ZvWKT4Cm+hr5gfhDCkEQzW0wgmqz9cwZOUJRSfLOW
 B5+4vjgQLdOV894sXLaLlwHOtQpteckZ3CtVcs2EQ/ehAgkZ7af0XNu69
 OhcbGcdNRkaOKP6vYSX+EmzJG+eQIKi7Amh+GJn1S+o9vbT587AKqVGsZ
 LaVSvrOlHyUqpDqPjWzOlI9qVsTCuAv2sblFDz4uUz1PZve10w0YBzp35 w==;
X-CSE-ConnectionGUID: ikR3n7zVRdijgA2ddvzVig==
X-CSE-MsgGUID: eWo1lbeWSeunHp0QIT8PCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845431"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845431"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:18 -0700
X-CSE-ConnectionGUID: O+JMVWEZTsq3apGYE4TumQ==
X-CSE-MsgGUID: BqXIT5+JTZ+7IK94rAdi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283077988"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:16 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 00/12] drm/xe: Convert IO_BUS errors to structured xe_log
 API
Date: Mon, 28 Sep 2026 14:51:02 +0530
Message-ID: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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

This series meant for converitng the logs struct of IO_BUS device hardware
catergories with different components such as GT, RTP, HWWOM, REGS, PAT,
GT, LMTT, VRAM.

Patch 1 adds the new component definitions. Patches 2-12 convert individual
subsystems to use xe_log_err/xe_log_err_fatal/xe_log_info with the
appropriate component tags:

  - GGTT: Graphics stolen memory probe and configuration errors
  - HWMON: PCode readback and registration failures
  - MMIO/REGS/RTP: BAR mapping, save-restore and force-wake errors
  - MEMIRQ: Page allocation and GuC setup failures
  - PAT: Missing PAT table detection
  - GT: Unknown GMDID version reporting
  - LMTT: HW invalidation failures
  - VRAM: BAR validation and visibility errors

Dnyaneshwar Bhadane (12):
  drm/xe/log: Add VRAM, PAT, and HWMON DRIVER_HARDWARE components
  drm/xe/ggtt: Report GGTT errors using structured logging
  drm/xe/hwmon: Report errors using structured xe_log API
  drm/xe/mmio: Report BAR mapping errors using structured xe_log API
  drm/xe/memirq: Report errors using structured xe_log API
  drm/xe/reg_sr: Report save-restore errors using structured xe_log API
  drm/xe/pat: Return error from xe_pat_init_early() on unknown platform
  drm/xe/pat: Report missing PAT table using structured xe_log API
  drm/xe/pci: Report unknown GMDID versions using structured xe_log API
  drm/xe/lmtt: Report invalidation errors using structured xe_log API
  drm/xe/vram: Report tile vs device VRAM visibility errors
  drm/xe/vram: Report VRAM errors using structured xe_log API

 drivers/gpu/drm/xe/abi/xe_log_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_device.c      |  4 +++-
 drivers/gpu/drm/xe/xe_ggtt.c        |  9 ++++++---
 drivers/gpu/drm/xe/xe_hwmon.c       | 10 ++++++----
 drivers/gpu/drm/xe/xe_lmtt.c        | 10 ++++++----
 drivers/gpu/drm/xe/xe_memirq.c      |  7 ++++---
 drivers/gpu/drm/xe/xe_mmio.c        | 12 ++++++++----
 drivers/gpu/drm/xe/xe_pat.c         | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_pat.h         |  4 +++-
 drivers/gpu/drm/xe/xe_pci.c         | 10 ++++++----
 drivers/gpu/drm/xe/xe_reg_sr.c      | 11 ++++++-----
 drivers/gpu/drm/xe/xe_vram.c        | 20 +++++++++++++++-----
 12 files changed, 81 insertions(+), 37 deletions(-)

-- 
2.54.0

