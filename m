Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630B7CF8540
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 21:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AE210E22C;
	Wed,  2 Oct 2024 21:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gfbak682";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AA810E009
 for <Intel-Xe@lists.freedesktop.org>; Wed,  2 Oct 2024 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727903663; x=1759439663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eoz/Cow07MKInVsIwDFRpFmEdRC92EsiNX8fFLC7MHo=;
 b=Gfbak682KGCt15zEe7x13NLn6F2eM5VlxHuwBUC9DkQlJf+VATkSzLqZ
 q8xWN8zhxibRGUP3GKNSXGo87ZqANcpg08rLGCQ4xKe32dWRQujZLkhM3
 3rkSTfpnoe7NMrMZBlOKjg0y5Wj3KovaKHIUzwVdFQeVOy/TyP9sxE0Lv
 KHwHBJibsJxDu6CAjmyk/PBX2gGl5IFMl9lsn/YDf1m2mesKAPygpeX5P
 5G1w5vJFA/GmJDQeg9NjAjiTi8dZYEv+/nbCdvXFjrPWb1NGcuxZLWwIP
 OrovnWq4/XDS/ugRCXLRaTLgP5XVIHbHkigu0akQKSmZSCXPFiAtKX8Xu Q==;
X-CSE-ConnectionGUID: F0Vq+tdXTyeFemZdt5p4Xw==
X-CSE-MsgGUID: 5dNXwu1WS1e3cGvr7j8koQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30879584"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="30879584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 14:14:23 -0700
X-CSE-ConnectionGUID: 3SMAltt/RlGtA1G+7fyC8w==
X-CSE-MsgGUID: X6kF9VzlSs6+gq0G5uyHgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="111584909"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa001.jf.intel.com with ESMTP; 02 Oct 2024 14:14:22 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v9 00/11] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
Date: Wed,  2 Oct 2024 14:14:11 -0700
Message-ID: <20241002211422.2135130-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There is a debug mechanism for dumping the GuC log as an ASCII hex
stream via dmesg. This is extremely useful for situations where it is
not possibe to query the log from debugfs (self tests, bugs that cause
the driver to fail to load, system hangs, etc.). However, dumping via
dmesg is not the most reliable. The dmesg buffer is limited in size,
can be rate limited and a simple hex stream is hard to parse by tools.

So add extra information to the dump to make it more robust and
parsable. This includes adding start and end tags to delimit the dump,
using longer lines to reduce the per line overhead, adding a rolling
count to check for missing lines and interleaved concurrent dumps and
adding other important information such as the GuC version number and
timestamp offset. Also, switch to using the much more compact ASCII85
encoding rather than 0x%08X hexdumping.

There are various internal error states that the CTB code can check
for. These should never happen but when they do (driver bug, firmware
bug or even hardware bug), they can be a nightmare to debug. So add in
a capture of the GuC log and CT state at the point of error and
subsequent dump from a worker thread.

Finally, include the GuC log and full CTBs in a devcoredump capture.

Note that the ultimate aim is to then provide a mechanism for
generating a devcoredump at an arbitrary point (such as dead CTB or
failed selftest) and dumping that to dmesg. There are still a few
issues with doing that, but this is all good steps along the way.

v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
v3: Add firmware filename and 'wanted' version number.
v4: Use DRM level line printer wrapper from Michal W. Add 'dead CTB'
dump support. Lots of restructuring of capture vs dump for both GuC
log and CTB capture for both the dead CTB dump and for future
inclusion in devcoredump.
v5: Add missing kerneldocs and other review feedback from Michal W.
Fix printf of size_t, clean up re-arming of dead CTBs, add GuC log to
devcoredump captures.
v6: Replace hexdumps with much more compact ascii85 encoding, drop
module parameter (review feedback from Matthew B). Fix potential
use-after-free bug.
v7: Couple of bug fixes and a bunch of changes to improve
readability/parsablility of the core dump file, debugfs file and dead
CTB dmesg dump.
v8: Fix string size calculation, clean up a macro, fix some
formatting, re-work CT_DEAD capture to prevent potential leak (review
feedback by Julia F). Add more section headers, use drm_puts, use
cached variables.
v9: Disable a couple of CT_DEAD checks that are being hit by CI until
the underlying issues can be debugged and fixed.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (10):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/devcoredump: Use drm_puts and already cached local variables
  drm/xe/devcoredump: Improve section headings and add tile info
  drm/xe/devcoredump: Add ASCII85 dump helper function
  drm/xe/guc: Copy GuC log prior to dumping
  drm/xe/guc: Use a two stage dump for GuC logs and add more info
  drm/xe/guc: Dead CT helper
  drm/xe/guc: Dump entire CTB on errors
  drm/xe/guc: Add GuC log to devcoredump captures
  drm/xe/guc: Add a helper function for dumping GuC log to dmesg

Michal Wajdeczko (1):
  drm/print: Introduce drm_line_printer

 drivers/gpu/drm/drm_print.c                   |  14 +
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
 drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
 drivers/gpu/drm/xe/xe_device.c                |   1 +
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 430 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
 drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
 drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
 include/drm/drm_print.h                       |  64 +++
 17 files changed, 816 insertions(+), 142 deletions(-)

-- 
2.46.0

