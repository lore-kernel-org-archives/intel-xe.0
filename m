Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7ABC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE6810E23B;
	Wed, 15 Nov 2023 00:46:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0AA10E235
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 00:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700009186; x=1731545186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gotrU679ptgK+QLgmzgEdTpI5MbCfxfkDVbm2WKH3W0=;
 b=F7LSvmr3Z/vk63jEawRysT7m8p2xTl946bFon0707vGba6Zl8x8tv9aZ
 cNYaTkhqGLyN0vT1DQPxrnZuZcrxxz4Nb4ANFUxsUn9O3e8r+RTW0Qeve
 h0n8COOXyVDenrUank0/iSp6CNbd5zwdJwggBNBDasP7TFylzhjj1gqnL
 /n0yAKqxkPoFtOVl5AXvcCUjXMHpn6KlvzAs4YYdJV8pPPi8i3ug5Hji4
 ex/p9XEux8RnyLx9A35wvInn4CeW1IBD3xMmKUdeMFEVrUQEQs80Tj7uF
 FdkWuRf1Rfc1PbPuFI0fBG18Eq7xVFLKl4WnN/H5oBrGzJWZwudeUlgVK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3890944"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="3890944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12609366"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:25 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 16:46:03 -0800
Message-ID: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/11] GSC FW loading
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

The GSC (Graphics Security Controller) is the root of trust for content
protection operations (PXP, HDCP), so loading the the GSC FW is a
prerequisite for those features. Loading the FW is required to turn off
the GSC forcewake well (which we must turn on to enable GSCCS idleness)
and therefore allows MC6 entry.

The GSC FW uses 3 separate versions: release, compatibility and
security. The compatibility version is the one that dictates whether the
driver knows how to interface with the binary so that's the one we match
against, but we also fetch the other two for debug information.

The GSCCS is used to both load the FW (via the GSC_FW_LOAD command) and
to send heci packets to it (via the GSC_HECI_PKT command).

v2: rebase, minor improvements/reworks from review feedback

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>

Daniele Ceraolo Spurio (11):
  fixup! drm/xe/guc: Report submission version of GuC firmware
  drm/xe/uc: Rework uC version tracking
  drm/xe/gsc: Introduce GSC FW
  drm/xe/gsc: Parse GSC FW header
  drm/xe/gsc: GSC FW load
  drm/xe/gsc: Implement WA 14015076503
  drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
  drm/xe/gsc: Add an interface for GSC packet submissions
  drm/xe/gsc: Query GSC compatibility version
  drm/xe/gsc: Define GSCCS for MTL
  drm/xe/gsc: Define GSC FW for MTL

 drivers/gpu/drm/xe/Makefile                   |  13 +-
 .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 ++
 .../gpu/drm/xe/abi/gsc_mkhi_commands_abi.h    |  39 ++
 .../gpu/drm/xe/instructions/xe_gsc_commands.h |  36 ++
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  39 ++
 drivers/gpu/drm/xe/tests/xe_pci_test.c        |   9 +-
 drivers/gpu/drm/xe/xe_gsc.c                   | 430 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h                   |  20 +
 drivers/gpu/drm/xe/xe_gsc_submit.c            | 184 ++++++++
 drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++
 drivers/gpu/drm/xe/xe_gsc_types.h             |  39 ++
 drivers/gpu/drm/xe/xe_gt.c                    |   5 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   9 -
 drivers/gpu/drm/xe/xe_hw_engine.c             |  20 +
 drivers/gpu/drm/xe/xe_module.c                |   5 +
 drivers/gpu/drm/xe/xe_module.h                |   1 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
 drivers/gpu/drm/xe/xe_uc.c                    |  21 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 | 259 ++++++++---
 drivers/gpu/drm/xe/xe_uc_fw.h                 |   6 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h             | 113 +++++
 drivers/gpu/drm/xe/xe_uc_fw_types.h           |  40 +-
 drivers/gpu/drm/xe/xe_uc_types.h              |   3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
 25 files changed, 1274 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h

-- 
2.41.0

