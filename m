Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97969C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE84B10E054;
	Tue, 11 Jun 2024 01:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E64OI0cc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FB210E054
 for <Intel-Xe@lists.freedesktop.org>; Tue, 11 Jun 2024 01:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718068830; x=1749604830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rgRkoG2T2h+I0VURuYc+Q/v4NdXxom2TFVWzNyx/oDc=;
 b=E64OI0ccqueeSR5LynyoCYbPGm7Sa0mh1PzK2DnsQ3ZuuoUJDaCQCEZE
 PelU18tmlZ9bOSWTGQ18x5C06ly3p7IPFsWVTHoM0yAtNG9v2v/jYGzSF
 bqYF2myG5NsmtrxwuwXzSvPWxTOgzjd//jVl3Y8jZcQvc7affFG3yCKOv
 z8u38Ujg3rVAQ4VstH83yn1PXz2kLZHmZZjPpecB3Zi6seWmTVl5Eo3YI
 hM5nBPL6NSVC2hw8FG6lwbJPzn6VJpT9K3g1SBhQJa4g4hXoyzxcrUKgW
 bNKvKHO4zwljS0zPoaZNOMIEZXpS2FHypLlOqVFgNzk+L5CJMuPEyLLoN A==;
X-CSE-ConnectionGUID: mwOhTgplSX2IHH4ynq9tyg==
X-CSE-MsgGUID: PSYdLeJ9RlyN40MjTnlM1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18612241"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18612241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 18:20:29 -0700
X-CSE-ConnectionGUID: HcY+g5qKQgunmuezZRtH8A==
X-CSE-MsgGUID: ogeT0wbdSX+yuui9yTF3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43684343"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2024 18:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 0/7] drm/xe/guc: Improve quality and robustness of GuC log
 dumping
Date: Mon, 10 Jun 2024 18:20:21 -0700
Message-ID: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
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

Note that the ultimate aim is to add the GuC log to the devcoredump
capture. And then to provide a mechanism for generating a devcoredump
at an arbitrary point (such as dead CTB or failed selftest) and
dumping that to dmesg. Unfortunately, there are still issues with
doing that. But this is a good first step along the way.

v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
v3: Add firmware filename and 'wanted' version number.
v4: Use DRM level line printer wrapper from Michal W. Add 'dead CTB'
dump support. Lots of restructuring of capture vs dump for both GuC
log and CTB capture for both the dead CTB dump and for future
inclusion in devcoredump.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (6):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/guc: Copy GuC log prior to dumping
  drm/xe/guc: Use a two stage dump for GuC logs and add more info
  drm/xe/guc: Add a helper function for dumping GuC log to dmesg
  drm/xe/guc: Dead CT helper
  drm/xe/guc: Dump entire CTB on errors

Michal Wajdeczko (1):
  drm/print: Introduce drm_line_printer

 drivers/gpu/drm/drm_print.c                   |  14 +
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c           |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 356 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h                |   9 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  24 ++
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.c               | 227 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h               |  11 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h         |  29 ++
 include/drm/drm_print.h                       |  64 ++++
 12 files changed, 637 insertions(+), 103 deletions(-)

-- 
2.43.2

