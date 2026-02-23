Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F837EA4FCF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 15:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0164310E2F1;
	Mon, 23 Feb 2026 15:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6laZ7jP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBD210E2F1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771859364; x=1803395364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5OXbw7+0+ut+xHSygQQBlRxDSuVzX4W21pRvhy/7jT0=;
 b=U6laZ7jPpGfwyE7SYu2dhabCJJbk4xI7BdV4QefMzaLyXnj266VgKXjC
 2wLvTrBJ6HW+7MXQEIDFG2SUeQRPssNJ7TUGyHQgh7KKlwlXI6R5269Ga
 fuiZvNZ+BJMmAUy0wx/5kWndQRVHfKYt+74GqfuKKk6Vi5+T6WhkQ2WhL
 mxJhRzVthU6OX/83dNZiPeQzi01OEJQl3JE62ySGZZzQ9BotEeD6EWpK2
 QjCtUq/vMtsO9Of2qPzIz0laZwPExXKwduqJ7g4Ujvx5Qx2QF0RxB4SeU
 JErptUqi3dMoaxrpFdsC8ssscGGRNZP3DajfRJYwf64+w1h3TIvB0hAGM A==;
X-CSE-ConnectionGUID: a9a2oFShSnaal/WwWkXvGw==
X-CSE-MsgGUID: I8+oGBldRpGKHvRdgIKosA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72918988"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72918988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:09:24 -0800
X-CSE-ConnectionGUID: iMhWT4iXRs+XzLUysgyFgA==
X-CSE-MsgGUID: t50MWEssSmW68sNLBKoWeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219136605"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2026 07:09:23 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v2 0/1] Do not create drm device for PF only admin mode
Date: Mon, 23 Feb 2026 15:09:50 +0000
Message-ID: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not expose a device node that would allow
users to run workloads.

In this mode, no DRM device entry is created; however, sysfs and debugfs
interfaces for the PF remain available at:

sysfs: /sys/devices/pci0000:00/<B:D:F>
debugfs: /sys/kernel/debug/dri/<B:D:F>

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().

Satyanarayana K V P (1):
  drm/xe/pf: Skip creating DRM device entries in PF admin‑only mode

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c               | 18 +++--
 drivers/gpu/drm/xe/xe_debugfs_helpers.c       | 78 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs_helpers.h       | 27 +++++++
 drivers/gpu/drm/xe/xe_device.c                | 20 +++--
 drivers/gpu/drm/xe/xe_gsc_debugfs.c           |  8 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 20 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  5 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c           | 20 ++---
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |  8 +-
 drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 23 ++++--
 drivers/gpu/drm/xe/xe_sriov.h                 |  8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  5 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  5 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          | 10 +--
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 14 ++--
 17 files changed, 202 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.h

-- 
2.43.0

