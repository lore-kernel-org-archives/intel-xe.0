Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB5CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB1210F05F;
	Mon, 12 Oct 2026 12:25:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170EE10F05F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807925; x=1823343925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NqLqEUOpEUELfp/PM273+IZtQfT65X4y0hoiUWsKLY0=;
 b=DyxeqZcGO+VX5AQ//OYzQ/8liuD4xO96617VBniW7JdwO4WqslOhaOc3
 q3GrYz7mU2IdZ4lR9nmnWz3Z9D8MW05a9Oi0TH9xMGVXRwgGSsuq/sXAJ
 q9CeVL+G2+mSWi4Up+Z88fXqUw0O8gaADRI3aQj5yQlBCNrHPEJDanhx7
 yeDQvg5tU+LxJfss/XO++7eyJfMQCqlgKOcmeksA3Fe8Xvfwhwu9gZXVY
 Zn9I8LqPAkQSB0P9HbN6KCEQxLiqtpXv3Ssn01lngMyZfILq7R4C/C0Ad
 nvDzkYEvLPyhYZMOGlT94eQSqjwiTrnjv2DauP/Sg09p8/VJURiQj3/6l Q==;
X-CSE-ConnectionGUID: NqZwJt3yRgiBxpJBmgtE0Q==
X-CSE-MsgGUID: bs3UkIJ8Qk6JetP0sFOnnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522895"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:25 -0700
X-CSE-ConnectionGUID: tywD6Ct6TMymQE4mxk+6vw==
X-CSE-MsgGUID: U5jMBjs7QjKU/XbJ9eU36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962775"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:24 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 00/12] drm/xe: Convert IO_BUS errors to structured xe_log
 API
Date: Mon, 12 Oct 2026 17:55:09 +0530
Message-ID: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c      |  4 ++-
 drivers/gpu/drm/xe/xe_ggtt.c        |  9 ++++---
 drivers/gpu/drm/xe/xe_hwmon.c       | 15 ++++++-----
 drivers/gpu/drm/xe/xe_lmtt.c        | 10 +++++---
 drivers/gpu/drm/xe/xe_memirq.c      |  7 ++---
 drivers/gpu/drm/xe/xe_mmio.c        | 12 ++++++---
 drivers/gpu/drm/xe/xe_pat.c         | 17 +++++++++---
 drivers/gpu/drm/xe/xe_pat.h         |  4 ++-
 drivers/gpu/drm/xe/xe_pci.c         | 10 +++++---
 drivers/gpu/drm/xe/xe_reg_sr.c      | 11 ++++----
 drivers/gpu/drm/xe/xe_vram.c        | 40 +++++++++++++++++------------
 12 files changed, 92 insertions(+), 50 deletions(-)

-- 
2.54.0

