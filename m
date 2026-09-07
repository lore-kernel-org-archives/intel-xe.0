Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B9EC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE43B10E707;
	Mon,  7 Sep 2026 08:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhbzWkOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B558928D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770168; x=1820306168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H3ZufxZJWijd43z4Fog6SlHfGIkSQSq39vMWnPiXsTs=;
 b=jhbzWkOtP3J00M6Ps+K3nfzPfjYFZ3Z3d5W0/WfzOxSRB3nYD6L7YRe+
 iOGYNNw/I/tt5Mm6xr25x2MGtyYtl1u0qZQbH/Mj3hyjFKxoG++sAmPCe
 2Hn/bmvQlJJJT6hZYhw7JshrHn4oUg0sgNXHjffIACtyHVdFNfVhRteOz
 gMmqQf2oi+LTVfEIoD/ENYHRRnUjS145zVHswusUgMB2BwbjWoDi4LmJo
 RKupPMULmxmGKObFnM7G6NhufZ8KhaoBTgT4bWmXsKRs+qcQy/OKc2m2D
 D2DVpr6B6f9elLR3ZqBsgMRYJLPfS48gNcgoC2QUc9y3H9oVSwuCpFnEr w==;
X-CSE-ConnectionGUID: 0aMcF4aqRtWxLZgdmoO9JQ==
X-CSE-MsgGUID: 9ZpH4nBRSjih58znRYVSUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76725967"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76725967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:08 -0700
X-CSE-ConnectionGUID: RUpaD+QgR2yq0+AqGWkcYg==
X-CSE-MsgGUID: IdJ5QQQqQpyrDCGVwZ6/Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274451010"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 01:36:05 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/5] Introduce xe_wedge
Date: Mon,  7 Sep 2026 14:04:35 +0530
Message-ID: <20260907083541.2194747-1-raag.jadav@intel.com>
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

v3: Respect the component namespace (Rodrigo)
    Avoid chaining header includes (Rodrigo)
    Squash debugfs changes with xe_wedge patch (Lukasz)

Raag Jadav (5):
  drm/xe/gt: Use GT ordered workqueue for wedging
  drm/xe: Move xe_device_wedged_fini() registration to
    xe_device_probe_early()
  drm/xe: Make xe_device_declare_wedged() IRQ safe
  drm/xe: Introduce xe_wedge
  drm/xe/ras: Move xe_ras_process_errors() to xe_ras

 Documentation/gpu/xe/xe_device.rst          |   2 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   3 +-
 drivers/gpu/drm/xe/xe_amc.c                 |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  66 +----
 drivers/gpu/drm/xe/xe_device.c              | 190 +------------
 drivers/gpu/drm/xe/xe_device.h              |  10 -
 drivers/gpu/drm/xe/xe_device_types.h        |  28 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |   3 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  26 +-
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   3 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   6 +
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   7 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  11 +-
 drivers/gpu/drm/xe/xe_guc_rc.c              |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  13 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   3 +-
 drivers/gpu/drm/xe/xe_mert.c                |   5 +-
 drivers/gpu/drm/xe/xe_pci_error.c           |   9 +-
 drivers/gpu/drm/xe/xe_ras.c                 |  12 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            |   3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c  |   5 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c               | 286 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wedge.h               |  20 ++
 drivers/gpu/drm/xe/xe_wedge_types.h         |  45 +++
 31 files changed, 454 insertions(+), 330 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

-- 
2.43.0

