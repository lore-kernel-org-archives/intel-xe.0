Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8DFC5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B6310EE9C;
	Wed, 19 Aug 2026 19:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQsqClv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE41B10EE9C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166887; x=1818702887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FV6pblVv8A+gRLGRXBa3k77EX+KBxZqSq3GCyh2KvUk=;
 b=CQsqClv1CdsCffElkca58oEpNrS7GT6WhBMalRYpcVmY53ZAPaAah3qC
 qQQx+1pf35nUd7seQK7diXQB29glno7hBX6LpQkRJqSMNyk4LaGOakGbO
 RfF0cZ1a3gBYbIvR7vurdJgOZ8Phf9Zc0TGl7JEsgGdIFYRFylDK80+/z
 aCJcfsxT84oLgrF0eS8bVdcH5Pptt8JTyZgvr3hqy9bV8VQ2ayzoeC0I/
 oIUfMAN7AUsDxGtRRWXhkCw6SKF/44b6iH6vJ+6NVayhLCGD8vOj2pft9
 fy4Sc9jfvxgjrx7lgqqIqg5L5GV1olgwq7HfROH8HWpr/Xj/MMCG37X2i Q==;
X-CSE-ConnectionGUID: mJVrhWi5TrCNFg3NbRgkpg==
X-CSE-MsgGUID: 4N8TjaKOSqSGIdVk+t/jCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647271"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:46 -0700
X-CSE-ConnectionGUID: To6D7MEkQIueKSmyN+/vPQ==
X-CSE-MsgGUID: c0NwxwQXSYuQdywVT2dsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556670"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:45 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 00/12] drm/xe: Convert IO_BUS errors to structured xe_log API
Date: Thu, 20 Aug 2026 00:44:29 +0530
Message-ID: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Patch 1 adds the new component definitions. Patches 2-12 convert individual
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

Dnyaneshwar Bhadane (12):
  drm/xe/log: Add VRAM, PAT, and HWMON DRIVER_HARDWARE components
  drm/xe/ggtt: Report GGTT errors using structured logging
  drm/xe/hwmon: Report errors using structured xe_log API
  drm/xe/mmio: Report BAR mapping errors using structured xe_log API
  drm/xe/memirq: Report errors using structured xe_log API
  drm/xe/reg_whitelist: Report whitelist overflow using structured
    xe_log API
  drm/xe/reg_sr: Report save-restore errors using structured xe_log API
  drm/xe/pat: Assert pat.ops before dereferencing members
  drm/xe/pat: Report missing PAT table using structured xe_log API
  drm/xe/pci: Report unknown GMDID versions using structured xe_log API
  drm/xe/lmtt: Report invalidation errors using structured xe_log API
  drm/xe/vram: Report VRAM errors using structured xe_log API

 drivers/gpu/drm/xe/abi/xe_log_abi.h   |  3 +++
 drivers/gpu/drm/xe/xe_ggtt.c          |  9 ++++++---
 drivers/gpu/drm/xe/xe_hwmon.c         | 10 ++++++----
 drivers/gpu/drm/xe/xe_lmtt.c          | 11 +++++++----
 drivers/gpu/drm/xe/xe_memirq.c        |  5 +++--
 drivers/gpu/drm/xe/xe_mmio.c          | 12 ++++++++----
 drivers/gpu/drm/xe/xe_pat.c           |  7 +++++--
 drivers/gpu/drm/xe/xe_pci.c           | 10 ++++++----
 drivers/gpu/drm/xe/xe_reg_sr.c        | 22 +++++++++++-----------
 drivers/gpu/drm/xe/xe_reg_whitelist.c |  7 ++++---
 drivers/gpu/drm/xe/xe_vram.c          | 27 +++++++++++++++++----------
 11 files changed, 76 insertions(+), 47 deletions(-)

-- 
2.54.0

