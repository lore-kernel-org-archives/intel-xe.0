Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D3E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 10:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5927410E5FB;
	Mon,  6 Jan 2025 10:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/0gY7QW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2C710E5FB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736157924; x=1767693924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w5dhyCdZd7faVOLxLqHfvonl2E2lxjMeNlO/DVVR8Ro=;
 b=f/0gY7QWnmiinkFBrk6I0Hks85Ak36wjiHWqVPo3aK4Z21dlMjCRhXaX
 qoZa8IY5Ob+E6hL77HkruUMP7Q7cMfGn0fOyACP0Lfce9ryF3AwqFKlz6
 891ipoTdlx6xxLQs+S/D93bHFrdJI5eCECz8gd9l3OGAHY0Uo3OfAa3at
 cgNfsHJeqArDoxRXpX9z1c7goEWgNgZ0i58yQ/oxGTjw8XVKNGqpt/4fS
 DG6gz0Lnpb8GV+csxrKwieLaTntWOCTl6oa0T3Xyb9QHcLOg9KOCnhXl2
 v3LdRDAcqQuZPBsSsQI5j2I1rkxsVgGFLrZHVmCxMc2Phtcb81vJXAEqm Q==;
X-CSE-ConnectionGUID: YBNx2MUMRzewrJOmduiB0w==
X-CSE-MsgGUID: M57/LVXTRX+R0vICn3IXSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36178884"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="36178884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 02:05:24 -0800
X-CSE-ConnectionGUID: 1pjC2hJaSjuBLhT2piOADg==
X-CSE-MsgGUID: lLwSSumgQdq8u1HoF5wk3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="107460613"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by orviesa003.jf.intel.com with ESMTP; 06 Jan 2025 02:05:22 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, andi.shyti@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 0/1] drm/xe: Fix all typos in xe
Date: Mon,  6 Jan 2025 15:56:45 +0530
Message-Id: <20250106102646.1400146-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

fix all typos in files of xe, reported by codespell tool.

Nitin Gote (1):
  drm/xe: Fix all typos under xe

 drivers/gpu/drm/xe/Kconfig.debug           | 4 ++--
 drivers/gpu/drm/xe/abi/guc_capture_abi.h   | 2 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      | 6 +++---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h      | 2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c         | 2 +-
 drivers/gpu/drm/xe/xe_bb.c                 | 2 +-
 drivers/gpu/drm/xe/xe_bo.c                 | 8 ++++----
 drivers/gpu/drm/xe/xe_bo_doc.h             | 2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c        | 2 +-
 drivers/gpu/drm/xe/xe_device.c             | 2 +-
 drivers/gpu/drm/xe/xe_drm_client.c         | 2 +-
 drivers/gpu/drm/xe/xe_exec.c               | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
 drivers/gpu/drm/xe/xe_gt.h                 | 2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c             | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c        | 2 +-
 drivers/gpu/drm/xe/xe_guc_capture_types.h  | 4 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c             | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c         | 2 +-
 drivers/gpu/drm/xe/xe_hmm.c                | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c            | 2 +-
 drivers/gpu/drm/xe/xe_pci.c                | 4 ++--
 drivers/gpu/drm/xe/xe_pcode.c              | 2 +-
 drivers/gpu/drm/xe/xe_pm.c                 | 2 +-
 drivers/gpu/drm/xe/xe_pt.c                 | 2 +-
 drivers/gpu/drm/xe/xe_rtp.h                | 4 ++--
 drivers/gpu/drm/xe/xe_uc_fw_types.h        | 2 +-
 drivers/gpu/drm/xe/xe_vm.c                 | 4 ++--
 29 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.25.1

