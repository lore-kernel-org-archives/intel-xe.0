Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204FAC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9410EDFA;
	Thu,  8 Feb 2024 21:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKwmpZiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16A210EE14
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707427161; x=1738963161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zrIy6NxJ62pvxqBQZ2Z+2f5yFO7K9iNX+Ubt0OVdCKM=;
 b=GKwmpZiq2FnX1Zda2QBgpBqIGnUTbrfnY8OOuMoOdlYx6JLvTUZwuKvY
 +yVml2NI05ZJR24DuWCXVxH/WHnzoNsNlnaVnISA8Xiyx5dFfi9o05mHl
 QtxC8ppWbg0AFGHdpIz0NSNHMUE+qbWDt4gXxSvxkeDRA//3lJDxHcQcD
 v22bpH2GCYCOfrMT/7QVmxX0LG53ExYDyqlVbpzDD2+b/5XAGJQdxwVGE
 38uBCVYXpbXcVYOEyviZxzqQ+Z7UEkaWbBVzyUgmXy8oEZOL1cQBnEaXw
 Lf0mlkniE/dD0GhVIk0kPJMi+Z8hYrXCMhjfzSKRGfBxKEID1cbYchvb1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18823810"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="18823810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2141864"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 08 Feb 2024 13:19:21 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v5 0/8] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Thu,  8 Feb 2024 13:19:10 -0800
Message-Id: <20240208211918.81789-1-zhanjun.dong@intel.com>
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

Port GuC based register capture for error capture from i915 to Xe.

There are 3 parts inside:
. Prepare for capture registers
    There is a bo create at guc ads init time, that is very early
    and engine map is not ready, make it hard to calculate the
    capture buffer size, new function created for worst case size
    caluation. Other than that, this part basically follows the i915
    design.
. Process capture notification message
    Basically follows i915 design
. Sysfs command process.
    Xe switched to devcoredump, adopted command line process with
    captured node list.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
  v5:-  Split dss helper code code as standalone patch.
        Remove old platform registers definition.
        Split register map table to 32 and 64bit each.
  v4:-  Move register map table to xe_hw_engine.c
  v3:-  Remove condition compilation in code
  v2:-  Split into multiple chunks

Zhanjun Dong (8):
  drm/xe/guc: Add kconfig for GuC based register capture
  drm/xe/guc: Update GuC ADS size for error capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Check sizing of guc_capture output
  drm/xe/guc: Extract GuC error capture lists on G2H notification
  drm/xe/guc: Pre-allocate output nodes for extraction
  drm/xe/guc: Plumb GuC-capture into dev coredump

 drivers/gpu/drm/xe/Kconfig               |   11 +
 drivers/gpu/drm/xe/Makefile              |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |    5 +
 drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
 drivers/gpu/drm/xe/xe_guc.c              |    6 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  229 +++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1332 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   21 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   21 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  257 ++++-
 drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   96 +-
 22 files changed, 2396 insertions(+), 115 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h


base-commit: 26c94721565996b1990ccb2a64b05947e1f201b5
-- 
2.34.1

