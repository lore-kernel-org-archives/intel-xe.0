Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D5DC5AE5B
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B317E10E183;
	Mon, 20 Nov 2023 21:28:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4210E16D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515680; x=1732051680;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jfBOgPhj/7hbsoJYKgGhehby6yuP558cXCgeaU0LmFw=;
 b=CSrSscS9fvggWKlaGe4xLYOT/sXW5dYR1DspeI7FF1kHV1MFebCsOJ1Y
 ldErqh7LVpVsq7wZW9D3Ww3glGBPqND+oL6jqeemJR1kVTsxJqcll9EbZ
 kEpUyRoCUAFW5kGZ5ry2mw8CcoIVQMlSQo0lIixgkyZyJnMuYqd0abPu6
 QItWrVPqoMCHTZ69QZgwbLPXJfx9fHgCjPIU51ICmsnAVr5jXsG7GzXC6
 MILzn+jAB4vSVLkE0IQO6A2RVAIUNqkXaI15yIsN5CuLbU/ntjaHV0ZjM
 il7xzRgGL1DNxbjxfDsyPb/vLvySYjkD9xFsrqQTiENJaH7cgeFCI3AIN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13256859"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13256859"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883984461"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883984461"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:51 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 13:27:29 -0800
Message-ID: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 00/10] GSC FW loading
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

CI: all patches reviewed, re-sending for last CI after minor doc fix and
squashing 2 of the patches together

Daniele Ceraolo Spurio (10):
  fixup! drm/xe/guc: Report submission version of GuC firmware
  drm/xe/uc: Rework uC version tracking
  drm/xe/gsc: Introduce GSC FW
  drm/xe/gsc: Parse GSC FW header
  drm/xe/gsc: GSC FW load
  drm/xe/gsc: Implement WA 14015076503
  drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
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
 drivers/gpu/drm/xe/xe_uc_fw_types.h           |  44 +-
 drivers/gpu/drm/xe/xe_uc_types.h              |   3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
 25 files changed, 1278 insertions(+), 97 deletions(-)
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

