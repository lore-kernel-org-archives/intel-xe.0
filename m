Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7994C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF3210E24E;
	Mon, 31 Aug 2026 04:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy6FLQrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBB10E24E
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788150412; x=1819686412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MZW/+Jk8d8biTt2jIbTwpadX5ItkL6xGtkgt1/jLhVI=;
 b=Oy6FLQrptKgsqVwClmIouC0ccIvoMIoK4RIZ7bJF6waAI0M8xInM0HVh
 5rxTsqCzNxbqgRQS4CujYkYPKR0AMxbjBH5USIGkdmIx8zFVI0Qa3lXPo
 Z3JghHX5e2WieUsbne6g7eKGCGUZfoBeos3Tw6Z9L0tmgJ7yI6cT/Uwfl
 iLohz6bh8pbpDBpJuxONe/Z9vA10lrsex4+v5rt6mn/SeV/I2cEMnY9KH
 JAlh/adjJYC1GJdCWu1wa14U4VPd2KuGOGMR3x2ILWdwijuBSbYupU8yF
 QRgk5m7sfVXqA6NPFCIsZaLE0Q2uVhNHEaZylaS0aOvNOGbH9dms5D/Xi A==;
X-CSE-ConnectionGUID: tUHHkexWTFu6O7fOHSW4tw==
X-CSE-MsgGUID: Z14OjUf5QSikdQLsYYQ5fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106072222"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106072222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 21:26:52 -0700
X-CSE-ConnectionGUID: 8sZMf4+qRLC+nN/WXcczsQ==
X-CSE-MsgGUID: S3tQsUjOSbWS3OlGEWme1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272878082"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 30 Aug 2026 21:26:49 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/5] Introduce xe_wedge
Date: Mon, 31 Aug 2026 09:55:48 +0530
Message-ID: <20260831042633.1760474-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

In the history of xe technical debt, this series takes one more step and
consolidates all wedging implementation into a dedicated xe_wedge component.

While at it, this fixes a few pre-existing issues related to wedge handling.
Detailed description in commit message.

v1: https://patchwork.freedesktop.org/series/172727/

v2: Split fixes into separate patches (Rodrigo, Michal)
    Also move struct xe_wedge and wedged_mode debt to xe_wedge (Lukasz, Michal)
    Naming and aesthetic adjustments (Lukasz, Michal)

Raag Jadav (5):
  drm/xe/gt: Use GT ordered workqueue for wedging
  drm/xe: Make xe_device_declare_wedged() IRQ safe
  drm/xe: Introduce xe_wedge
  drm/xe/debugfs: Consolidate wedged_mode debt into xe_wedge
  drm/xe/wedge: Update naming to match with xe_wedge

 Documentation/gpu/xe/xe_device.rst          |   2 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   2 +-
 drivers/gpu/drm/xe/xe_amc.c                 |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  65 +----
 drivers/gpu/drm/xe/xe_device.c              | 178 +-----------
 drivers/gpu/drm/xe/xe_device.h              |  11 +-
 drivers/gpu/drm/xe/xe_device_types.h        |  28 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  23 +-
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   2 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   9 +
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   6 +-
 drivers/gpu/drm/xe/xe_guc_rc.c              |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  12 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   2 +-
 drivers/gpu/drm/xe/xe_mert.c                |   4 +-
 drivers/gpu/drm/xe/xe_pci_error.c           |   8 +-
 drivers/gpu/drm/xe/xe_ras.c                 |   4 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            |   2 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c  |   4 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c               | 288 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wedge.h               |  21 ++
 drivers/gpu/drm/xe/xe_wedge_types.h         |  45 +++
 30 files changed, 428 insertions(+), 315 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

-- 
2.43.0

