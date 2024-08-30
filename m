Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4216CA0EE5
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B36010E805;
	Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XasiFKzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8743610E7FD
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998991; x=1756534991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sPYCuv9p+rnH6JhkAQUaAAKGMOkn/5hEf33L+8Q1wmk=;
 b=XasiFKzKpnp5Fuv1W+UOYF/YAlqO8cbuQwuZGRwrN5VRe+OKv2Du1Vmg
 TFK+gfIOO1ARcwfvYnYhLB649E3F3LCNQOqrXg0gYDhz5kYlgeK056K8B
 VXB6V1itn1An/vS0bYcKN41JHdWY9/9UJ7UPGwDaQ3/0wZojSNjgFyDbi
 GXSuS5HWG+0TkPnwLi14BcW4I9Ng502tjfuAcnP60I7JYQDmnGSH03vt3
 aKwBt2FLjpdfnpXwXsl3/iyl3/ZK9kDXgwDaKFOYlyAtNfyGToSScfe2L
 whT6CH8CSZ2IzyeZiuJAtqQS8g21eBWmbok2MJy1tQ03o0f4mlQkFdSKQ w==;
X-CSE-ConnectionGUID: pHu97+C0SaG/B94APWUOvg==
X-CSE-MsgGUID: IalfX4d2S+iSYVY7I5GLuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245217"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:11 -0700
X-CSE-ConnectionGUID: KDB9XWehQv+mKvk8EeyNcg==
X-CSE-MsgGUID: HX/MKaWUR3OKK+vlM06JHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040559"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:10 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 0/9] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
Date: Thu, 29 Aug 2024 23:23:01 -0700
Message-ID: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (8):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe: Add ASCII85 dump helper function
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
 drivers/gpu/drm/xe/xe_devcoredump.c           | 102 ++++-
 drivers/gpu/drm/xe/xe_devcoredump.h           |   5 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |  14 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 359 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  25 ++
 drivers/gpu/drm/xe/xe_guc_log.c               | 200 +++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
 drivers/gpu/drm/xe/xe_guc_log_types.h         |  29 ++
 include/drm/drm_print.h                       |  64 ++++
 14 files changed, 717 insertions(+), 114 deletions(-)

-- 
2.46.0

