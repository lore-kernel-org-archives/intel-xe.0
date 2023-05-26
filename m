Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14525C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64D610E1D7;
	Fri, 26 May 2023 16:44:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ECA10E824
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119452; x=1716655452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v/LufTYG3UydbijnBZC0tuc7+GmlSt8/XoLJDQeGJt0=;
 b=NQWgZXX7qavefeWyKhBb9FQuuAj2K4LLCOpZ1ZVCt1iog6zpMr+ZpIqR
 CFS0R8c+/aoO6qNxgsjcvL3ZxjWmov4ybm6QxaCr6SlI1bRjtCLOoLi/Y
 j1P4RBzsH0yltYGDrTTyE2Iw+aBmDm/Se/CbXXHo4T3qz5x7qMs6alQtO
 rI+J72ozemjR5+9sKyq4dpm6mHcNYRhdQ65rPO07c4dRO4h7RSHFYox3O
 d6j/XX5tEHJw44EenyKUaOKdhfJM8uTj09DAUQmKgVYVaSFn13jmDXliK
 7T6D6FbqXlO51yW988anIuw2vabOxqgbRQd0eNgy44wanoMQ+0JVueemI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628371"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628371"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151445"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151445"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:37 -0700
Message-Id: <20230526164358.86393-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 00/21] Dump + OOB workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Previous version can be seen here:
https://lore.kernel.org/intel-xe/20230525213407.3907094-1-lucas.demarchi@intel.com/

Changes in v5:
  - Fix some conditions in the WAs to match current WA database
  - Fix xe_gen_wa_oob to allow 3 or more OR'ed conditions
  - Collect r-b
  - Fix kunit build, the dumb way: sources including xe_wa_oob.h need a
    build dep on that header - all my attempts to fix it in a better way
    were not successful and there was always a race between the code
    generation and building the compilation unit. This can be improved
    later.

Lucas De Marchi (21):
  drm/xe: Fix Wa_22011802037 annotation
  drm/xe/rtp: Split rtp process initialization
  drm/xe/rtp: Replace XE_WARN_ON
  drm/xe/rtp: Add "_sr" to entry/function names
  drm/xe/rtp: Allow to track active workarounds
  drm/xe/wa: Track gt/engine/lrc active workarounds
  drm/xe/debugfs: Dump active workarounds
  drm/xe/rtp: Rename STEP to GRAPHICS_STEP
  drm/xe/rtp: Add check for media stepping
  drm/xe/rtp: Add support for entries with no action
  drm/xe: Include build directory
  drm/xe: Add support for OOB workarounds
  drm/xe/guc: Port Wa_22012773006 to xe_wa
  drm/xe/guc: Port Wa_16011759253 to xe_wa
  drm/xe/guc: Port Wa_14012197797/Wa_22011391025 to xe_wa
  drm/xe/guc: Port Wa_16011777198 to xe_wa
  drm/xe/guc: Port Wa_22012727170/Wa_22012727685 to xe_wa
  drm/xe/guc: Port Wa_16015675438/Wa_18020744125 to xe_wa
  drm/xe/guc: Port Wa_1509372804 to xe_wa
  drm/xe/rtp: Also check gt type
  drm/xe/guc: Port Wa_14014475959 to xe_wa and fix it

 drivers/gpu/drm/xe/Makefile            |  15 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  23 +--
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 165 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c             |   6 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  12 ++
 drivers/gpu/drm/xe/xe_gt_types.h       |  12 ++
 drivers/gpu/drm/xe/xe_guc.c            |  49 ++----
 drivers/gpu/drm/xe/xe_hw_engine.c      |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |   6 +-
 drivers/gpu/drm/xe/xe_rtp.c            | 207 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_rtp.h            |  63 ++++++--
 drivers/gpu/drm/xe/xe_rtp_types.h      |  29 +++-
 drivers/gpu/drm/xe/xe_tuning.c         |  12 +-
 drivers/gpu/drm/xe/xe_wa.c             | 172 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa.h             |  12 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules     |  16 ++
 16 files changed, 662 insertions(+), 147 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
 create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules

-- 
2.40.1

