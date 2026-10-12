Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77160CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C210EC73;
	Mon, 12 Oct 2026 05:19:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C74B10E118
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782361; x=1823318361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ewaNM+1k4zGJcsZpYJPD9AbR+SdLfCJ7RLI66jiOPU=;
 b=Qja9Ke8xm939OV4C7j7bWV3Adb44jL3qdjkocZ+GlBDHiIXbeULrEXCa
 bMybtu68Fs1oydHIn6vtyDw8Oc3GUqPaWNpmfTU3lwIKe0bjRyT39iGYN
 eJKxmRCdCKcJTVMnauFxJUY1TWII58T52ENK9RtVXHjePCCgEzYxkpKYJ
 gdtZzhwZyGXvp0U2Xuc78KDNT/VIuehACWEF6Qbw2nYZ70DmMDI6zWzVi
 8qBg+A9OKc8VQk6d8MbJnLhdTlU4FQvzTYynFdKwMT/fr3E+mItAaWCqJ
 j89zubNvSDZ4tTM4zvXjjqiDNYKl1Eb6gYfGlf8x5JqfMZZ74xhW9ohnq g==;
X-CSE-ConnectionGUID: ZPJTL9aMSWWhu/fYCinKCg==
X-CSE-MsgGUID: I3T+WOqpStqYK0bLATMZHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390498"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:30 -0700
X-CSE-ConnectionGUID: 5Xg7NLm8SI66vqHequYlTw==
X-CSE-MsgGUID: orDQQS5cTdSSAqUq77RhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735783"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:29 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 00/12] drm/xe: Convert IO_BUS errors to structured xe_log
 API
Date: Mon, 12 Oct 2026 10:48:11 +0530
Message-ID: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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
 drivers/gpu/drm/xe/xe_lmtt.c        | 10 ++++---
 drivers/gpu/drm/xe/xe_memirq.c      |  7 ++---
 drivers/gpu/drm/xe/xe_mmio.c        | 12 ++++++---
 drivers/gpu/drm/xe/xe_pat.c         | 17 +++++++++---
 drivers/gpu/drm/xe/xe_pat.h         |  4 ++-
 drivers/gpu/drm/xe/xe_pci.c         | 10 ++++---
 drivers/gpu/drm/xe/xe_reg_sr.c      | 11 ++++----
 drivers/gpu/drm/xe/xe_vram.c        | 41 ++++++++++++++++++-----------
 12 files changed, 94 insertions(+), 49 deletions(-)

-- 
2.54.0

