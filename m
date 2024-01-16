Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBB7C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 23:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7F310E0C6;
	Tue, 16 Jan 2024 23:16:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45B010E0C6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 23:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705446963; x=1736982963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tYGjCg5dePlnkrcRTFmLwr2QqKjc7391MVuRi1C7VQw=;
 b=CkggMlUywK4BOdslXrmfDPlynP6ZrmXQkG8eY75QjxgNL24JGmq4CVWU
 waeoEH4DMwLqRLyfZ02A3fwtoKhJvph+TB5HIqs1vFXfAdOGRS5FM1CD8
 PngDkHJnAbL+Og/NxfADqZ9ir/F+4ULmbiY5I0G2K2O2u0kHVakOwB8JE
 C9flshIaU1DXPI2SBzoGKI5IQTbqpO6LmGdKWlJtnpV+Z83MJmO03l/YO
 mdRlUo0Y8wwPwJEF8DfmX8GSNWc9XtxCbxxbViTUaRV5akbITheemNK/o
 T0/P4/igkZ24ivhdzd7NrBYRR8xXLgtPQWaHrqDmlWrHnK4AQqXI5kzGr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397171512"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397171512"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 15:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1031147487"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="1031147487"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2024 15:16:03 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Tue, 16 Jan 2024 15:15:51 -0800
Message-Id: <20240116231600.154097-1-zhanjun.dong@intel.com>
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

There are 3 parts in this commit:
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

Zhanjun Dong (9):
  drm/xe/guc: Add register defines for GuC based register capture
  drm/xe/guc: Expose dss per group for GuC error capture
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
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   12 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   20 +
 drivers/gpu/drm/xe/xe_gt_mcr.c           |    2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h           |    3 +
 drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_topology.c      |    3 -
 drivers/gpu/drm/xe/xe_guc.c              |    7 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  205 +++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1404 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   35 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  222 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |   73 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  106 +-
 25 files changed, 2329 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

