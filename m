Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF55EC47DD8
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5595D10E939;
	Fri, 19 Jan 2024 00:42:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375F810E08E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705624930; x=1737160930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bTVbrEy4k7bxcJcbh/QgrqXcwbrN2uOhmYzgfHfgIHc=;
 b=NF5SqX2ZqxH2pfbH1XtBqzL0hNBH9ibAxkq6L8kuvf0Sw5gSIVnpBgmS
 2VWoSJ1ZlL9EHP1SNKpaOKdzYGAk5KGW7auiJCihgQYUQFOebuUyRvGUF
 XNL3X8YEAvb/DtHMOrWJfCUhUXdWdT14a3b0kfBPAYdCrIyzodOQawxgh
 RSnueRTiOHFwHFxlg1xQo6RtWiQzhXABqKYWzS/KgRCz0qB3AwjIoFO1O
 hpyl5HIasr9oPfVwfNEQ9siieZWgDxTZLm90E9cFGaiBH9V0ZuDkegTqi
 6RScU6eyta9TCG3DaKaml5Pg/TKSkdb3+hatp8ew3nqwY4+XwLkzZfw5J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="8016588"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="8016588"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903999219"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="903999219"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2024 16:42:06 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/9] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Thu, 18 Jan 2024 16:41:54 -0800
Message-Id: <20240119004203.393262-1-zhanjun.dong@intel.com>
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

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

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
 drivers/gpu/drm/xe/xe_guc.c              |    6 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  222 +++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1386 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   21 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  222 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  172 ++-
 drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  111 +-
 26 files changed, 2421 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

