Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31984C4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 19:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA50112322;
	Sun, 14 Apr 2024 19:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joBTG5u5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2279112322
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713121321; x=1744657321;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ephPBHT464zrskvMPURoHqAYud2DgfQ10wqWwpp5cu4=;
 b=joBTG5u5EfF1AfNtNzoSMLhSBO3+uey0xXY0JEEQ6BBXjOToRzBHyKP4
 FdEXziskYgiijypYMCv7wVahA+ZY1+BklNI6i8LZvlef0SUjiSXzN5RZM
 YnOmivuvJ08x2uvnJmNtXHs1J7adqCWBLQJQb2/AnxAPMlg6UwdMw29RW
 A/Sjk9hvhgOQIuHTK3zvr7q+XW9cVkZbcSZ9qXT9/o0qEbtTb7nbH0dO0
 yMN5Sdr42yoZ9p/GvlKQILoDSYby9oWObPCEstosBzP1KHEqqPMQZEjRM
 gF8VPH7xwrLWRtqsTyNXfIuBQon76cJDaqcjgKa1PrhOl1PyddOf8K6uD Q==;
X-CSE-ConnectionGUID: DIpGryK9Tw6AF+cqPAsd8Q==
X-CSE-MsgGUID: StFZhIa6SAKju1a8GJpOKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="30983591"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="30983591"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:00 -0700
X-CSE-ConnectionGUID: bwnMRwUERMW4jjJIlQvXZg==
X-CSE-MsgGUID: tW0ZfCIJRgWEUdxtDX8i9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="26383419"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.61.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:01:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] PF: Add support to configure SR-IOV VFs
Date: Sun, 14 Apr 2024 21:01:31 +0200
Message-Id: <20240414190137.1243-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (6):
  drm/xe: Add helper to format SR-IOV function name
  drm/xe: Allow to assign GGTT region to the VF
  drm/xe: Add xe_ttm_vram_get_avail
  drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
  drm/xe/pf: Add SR-IOV PF specific early GT initialization
  drm/xe/pf: Add support to configure SR-IOV VFs

 drivers/gpu/drm/xe/Makefile                   |    2 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |   55 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h         |    2 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   44 +
 drivers/gpu/drm/xe/xe_ggtt.h                  |    4 +
 drivers/gpu/drm/xe/xe_gt.c                    |    7 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   52 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   20 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 1960 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   56 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   54 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   13 +
 drivers/gpu/drm/xe/xe_sriov.c                 |   17 +
 drivers/gpu/drm/xe/xe_sriov.h                 |    1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   12 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |    1 +
 16 files changed, 2300 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h

-- 
2.43.0

