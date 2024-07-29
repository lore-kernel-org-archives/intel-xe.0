Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D29C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF8B10E430;
	Mon, 29 Jul 2024 23:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1rYfrOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D6110E3C1
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295074; x=1753831074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4SUo+qXvVG/ghZjE+pIL1jYxIdFiJcK2TXKt+BVeres=;
 b=a1rYfrOYIVKFRqk3g1RMNrdYeEGtzxlbBuVYSe7Kzmcl5Fj+k1xh9+aa
 q8pcFGcxnXhX61BitKBKShuSFCNpXzQmCKwJMPrdDNZ43z8x4dfxrALUe
 jsVZtKNosTvji3/z2fIn7QtNNAKlm94giO+lgErPnafYFfx7/US8Cppzv
 Ht/KrCc3+Kv/7n4PZg+TAD2kKLAVmnDNGApjvT/NfnG7TJzMk1EeiqPLb
 fdLBEUmAodlcsTu4X462tPPezE3yk5xM69Lt6rym+vva5oGRmUdXv9k9K
 c1hIZOXYLo8EbG8HS01uv/yoPShLsrVaC59V4MBtDA86sl9pxEwvgHDIn g==;
X-CSE-ConnectionGUID: kAXgU4olQYSDPLl44O/hXg==
X-CSE-MsgGUID: C2Z+A6SMQE+4/D+V+5Wmtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966919"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:54 -0700
X-CSE-ConnectionGUID: 7/0lh3SfQb6pOFuA57YB9g==
X-CSE-MsgGUID: rNhJ11BcS/OKFUxBOBP0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103529"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 0/8] drm/xe/guc: Improve quality and robustness of GuC log
 dumping
Date: Mon, 29 Jul 2024 16:17:44 -0700
Message-ID: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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

drm/xe/guc: Improve GuC log dumping and add dump on CT failures

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
timestamp offset.

There are various internal error states that the CTB code can check
for. These should never happen but when they do (driver bug, firmware
bug or even hardware bug), they can be a nightmare to debug. So add in
a capture of the GuC log and CT state at the point of error and
subsequent dump from a worker thread.

Finally, add the option to include the GuC log in a devcoredump
capture. This is currently optional as the GuC log can be huge as an
ASCII hexdump. The intent is to add compression support for all binary
data in the core dump to get the size down to something manageable.
Until then, keep it optional so it is available when necessary but
doesn't flood dumps when not required.

Note that the ultimate aim is to then provide a mechanism for
generating a devcoredump at an arbitrary point (such as dead CTB or
failed selftest) and dumping that to dmesg. There are still a number
of issues with doing that, but this is all good steps along the way.

v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
v3: Add firmware filename and 'wanted' version number.
v4: Use DRM level line printer wrapper from Michal W. Add 'dead CTB'
dump support. Lots of restructuring of capture vs dump for both GuC
log and CTB capture for both the dead CTB dump and for future
inclusion in devcoredump.
v5: Add missing kerneldocs and other review feedback from Michal W.
Fix printf of size_t, clean up re-arming of dead CTBs, add GuC log to
devcoredump captures.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (7):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/guc: Copy GuC log prior to dumping
  drm/xe/guc: Use a two stage dump for GuC logs and add more info
  drm/xe/guc: Add a helper function for dumping GuC log to dmesg
  drm/xe/guc: Dead CT helper
  drm/xe/guc: Dump entire CTB on errors
  drm/xe/guc: Add GuC log to devcoredump captures

Michal Wajdeczko (1):
  drm/print: Introduce drm_line_printer

 drivers/gpu/drm/drm_print.c                   |  14 +
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c           |  22 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |  12 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 365 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h                |   9 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  24 ++
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.c               | 269 ++++++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h               |  10 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h         |  29 ++
 drivers/gpu/drm/xe/xe_module.c                |   3 +
 drivers/gpu/drm/xe/xe_module.h                |   1 +
 include/drm/drm_print.h                       |  64 +++
 15 files changed, 712 insertions(+), 114 deletions(-)

-- 
2.43.2

