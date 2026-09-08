Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE1C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FFE10EB03;
	Tue,  8 Sep 2026 10:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUlc14rS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5972510EAF8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862734; x=1820398734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1GpY+slU1fLotvpYtF0kwlNCVWXqYIRTBl4LUFXW6nk=;
 b=hUlc14rSu/gJf9a4X9EwWJeHXb4SXphpcCEarok3vAYXNx+9YZOWo0mD
 9LIGBxxV+BcFgYbOxs/dMAKNazX2PrjbxHD0aSvavkZ9l6sDPqWahF5cx
 JnsMtlDO0peoJJYSQeg1Fa5BDI/85BbXW8+3eLC4gB3X5jGHwGNQq1fRb
 RGhJEkdNMZlvcOJgt1xghxdbeh0qxA8iAb0j2Mv5znWiiSx6TSyzAhYfo
 imk3ExrXU23IxMwPTLKfX/xqlVaX0uD2GyUtAH7iYnZGjoNaS+TRfGpOn
 50mC/8RJ+95UrdPesTHODNvuNy3WcX+hF2ewxoK7GmWzncGmg/LVwTC7d g==;
X-CSE-ConnectionGUID: gWxNNdiDSfSBEjAw9cY/Sg==
X-CSE-MsgGUID: 6s8sCmceRtOAScWcsKuxDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278264"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278264"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:18:54 -0700
X-CSE-ConnectionGUID: hMUKqxs1Q0u7kNNTe8rhqA==
X-CSE-MsgGUID: uQWFf6ljRCqRSWv/87s5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628413"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:18:53 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 00/13] drm/xe: Convert IO_BUS errors to structured xe_log
 API
Date: Tue,  8 Sep 2026 15:48:36 +0530
Message-ID: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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
catergories with different components such as GT, HWWOM, REGS, PAT, GT,
LMTT, VRAM.

Patch 1 adds the new component definitions. Patches 2-13 convert individual
subsystems to use xe_log_err/xe_log_err_fatal/xe_log_info with the
appropriate component tags:

  - GGTT: GSM probe and configuration errors
  - HWMON: PCode readback and registration failures
  - MMIO/REGS: BAR mapping, save-restore, whitelist, and force-wake errors
  - MEMIRQ: Page allocation and GuC setup failures
  - PAT: Missing PAT table detection
  - GT: Unknown GMDID version reporting
  - LMTT: HW invalidation failures
  - VRAM: BAR validation and visibility errors

Dnyaneshwar Bhadane (13):
  drm/xe/log: Add VRAM, PAT, and HWMON DRIVER_HARDWARE components
  drm/xe/ggtt: Report GGTT errors using structured logging
  drm/xe/hwmon: Report errors using structured xe_log API
  drm/xe/mmio: Report BAR mapping errors using structured xe_log API
  drm/xe/memirq: Report errors using structured xe_log API
  drm/xe/reg_whitelist: Report whitelist overflow using structured
    xe_log API
  drm/xe/reg_sr: Report save-restore errors using structured xe_log API
  drm/xe/pat: Return error from xe_pat_init_early() on unknown platform
  drm/xe/pat: Report missing PAT table using structured xe_log API
  drm/xe/pci: Report unknown GMDID versions using structured xe_log API
  drm/xe/lmtt: Report invalidation errors using structured xe_log API
  drm/xe/vram: Report tile vs device VRAM visibility errors
  drm/xe/vram: Report VRAM errors using structured xe_log API

 drivers/gpu/drm/xe/abi/xe_log_abi.h   |  3 +++
 drivers/gpu/drm/xe/xe_device.c        |  4 +++-
 drivers/gpu/drm/xe/xe_ggtt.c          |  9 ++++++---
 drivers/gpu/drm/xe/xe_hwmon.c         | 10 ++++++----
 drivers/gpu/drm/xe/xe_lmtt.c          | 10 ++++++----
 drivers/gpu/drm/xe/xe_memirq.c        |  7 ++++---
 drivers/gpu/drm/xe/xe_mmio.c          | 12 ++++++++----
 drivers/gpu/drm/xe/xe_pat.c           | 20 +++++++++-----------
 drivers/gpu/drm/xe/xe_pat.h           |  2 +-
 drivers/gpu/drm/xe/xe_pci.c           | 10 ++++++----
 drivers/gpu/drm/xe/xe_reg_sr.c        | 22 +++++++++++-----------
 drivers/gpu/drm/xe/xe_reg_whitelist.c |  7 ++++---
 drivers/gpu/drm/xe/xe_vram.c          | 20 +++++++++++++++-----
 13 files changed, 82 insertions(+), 54 deletions(-)

-- 
2.54.0

