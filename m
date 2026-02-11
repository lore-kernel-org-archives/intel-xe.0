Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53985ECD6F7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF26889E69;
	Wed, 11 Feb 2026 22:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZElkvW19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CF389701
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770848424; x=1802384424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4yDLDxXnxav1e/UzovE9SxYlwPPBxnW9m2+bfQVbWBw=;
 b=ZElkvW19cdIRT2vNDYIaAt/B9nzhID1J2/JpLbwete4j0s/XsVzgsUdi
 lfzZVwxzEhgRZT244b/b41PcStRSFs3Dv1gv4WL8e+KkUWM2TzGAtOcxK
 046T4lq5fSXzoqGzklgM6gC9JguWauLpmLzSfdSAj9SheWdUgaTvEygx9
 9/ih0QEe//RAGaJvfr3ouL02TIsP4Crt7ib8LVX4xO8gHszJbPdjm3pWd
 5aUOkQLY04op9p/frg/k0rHzHAmCCY6COzj8tAmRL3P3niGfDiD028iSD
 /xQgbp8is6OSrIP4/IBXNu56EdkiB6yVmNGXR4ixE57diVLccB1+W4QAB A==;
X-CSE-ConnectionGUID: XCgrxmtNTBWH3EwqdfJ+xw==
X-CSE-MsgGUID: LYPFE3O9TjeQy/tXz/lTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89415206"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="89415206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 14:20:23 -0800
X-CSE-ConnectionGUID: LS1UyBqZQTyoeZXpacjHFw==
X-CSE-MsgGUID: kUSRgJOFSDGmFtXcvZZGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212479568"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 14:20:23 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 0/6] Attempt to fixup reset, wedge, unload corner cases
Date: Wed, 11 Feb 2026 17:20:14 -0500
Message-Id: <20260211222020.848341-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

We have several bug reports [1], [2], [3] describing failures in reset,
wedge, and unload corner cases where memory is not properly freed or
fences fail to signal. This patch attempts to address the issue by
forcefully killing any remaining queues on driver unload and wedging the
device if not in mode 2.

Zhanjun Dong

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6029

---
History started from v2 (v1 not found):
v6:
 - Split guc_submit_fini into 2 parts, device related by devm and software
   only part by drmm
v5:
 - Removed redundant xe_guc_ct_stop() and __xe_guc_submit_reset_prepare()
   calls (Michal and Matthew)
 - Split patch 3 into 2 patches(new #3 and #4), #3 is for fixes old patch purpose,
   #4 add as separate commit uses the enum for better code maintainability (Matthew)
v4:
 - Make guc_submit_fini a devm managed action
 - Squash patch 2 with 6 from v3
 - Commit message update (Matthew)
v3:
 - Add patch 3-6 in series
 - For "Trigger queue cleanup if not in wedged mode 2":
     Add guc_ct_stop and reset prepare in patch of:
     Sync with baseline changes

Matthew Brost (1):
  drm/xe: Always kill exec queues in xe_guc_submit_pause_abort

Zhanjun Dong (5):
  drm/xe: Forcefully tear down exec queues in GuC submit fini
  drm/xe: Trigger queue cleanup if not in wedged mode 2
  drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum instead of
    magic number
  drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
  drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup

 drivers/gpu/drm/xe/xe_guc.c        | 18 ++++++-
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 86 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_uc.c         |  2 -
 5 files changed, 79 insertions(+), 29 deletions(-)

-- 
2.34.1

