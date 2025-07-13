Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C81C83F17
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 10:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA5010E169;
	Sun, 13 Jul 2025 10:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IesYLzTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E2710E161
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752402996; x=1783938996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ez5DffeLs2ZR5McbLbEUfi7LOCe9zaE4d4cJt0H295Q=;
 b=IesYLzTuK4r/ROiRrN9J9GPnOdsW96b+4Mxw9n0/ScxhyvLg7ZmLDwIl
 pfpk3322beoYDP1+hcxFV3mctV1Y+GI8KPbGkILquZ7Yc0Od+BXhA6bnr
 IQ3EFt1eFJHb38+IEZwvYK3suh7lG0x/XzrzFW3Gr41flbFAtjfDzGGne
 DvPbknA9QgBQ8pUDBC0NcCJRNqoFkct0YZUcRtCep0BZ7c7OFKmt5NW/B
 0V5SHprr4kLlpHbuREnGaeX3p+LaWfPccUagtTCd+aTKT9QdFqDnjjNFf
 cYQ0L2KtYU9BJcq1+TuxkuQXYsfO0DjBH55B+FJwzccKYxYz6uAaKMzqu w==;
X-CSE-ConnectionGUID: GMytsWHsRxuViYgSkxA+LA==
X-CSE-MsgGUID: AKf0j0ufQYq68Rcuhk4Jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64883039"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="64883039"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 03:36:36 -0700
X-CSE-ConnectionGUID: DdZGPkgpTsO4f4225tWFuw==
X-CSE-MsgGUID: NKIq4G1/SMCzu5kbk+xkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="156802462"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 03:36:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [CI v4 0/7] Relax VF/PF version negotiation
Date: Sun, 13 Jul 2025 12:36:18 +0200
Message-Id: <20250713103625.1964-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

It was clarified by the arch team that initial version negotiation
can be done by the VF just once, by using any available GuC/GT.

v1: https://patchwork.freedesktop.org/series/150711/#rev1
v2: https://patchwork.freedesktop.org/series/150711/#rev2
 - don't WARN on missed mandatory print func (Piotr)
 - use gt_is_main/tile_is_root helpers (Piotr)
 - drop leftover test include (Piotr)
 - add more asserts (Piotr)
v3: rebased
v4: rebased again (there was no CI.FULL for v3)

Michal Wajdeczko (7):
  drm/xe: Combine PF and VF device data into union
  drm/xe: Move PF and VF device types to separate headers
  drm/xe: Introduce xe_tile_is_root helper
  drm/xe: Introduce xe_gt_is_main_type helper
  drm/xe/pf: Expose basic info about VFs in debugfs
  drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
  drm/xe/vf: Store negotiated VF/PF ABI version at device level

 drivers/gpu/drm/xe/Makefile                   |   3 +-
 .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ------------------
 .../drm/xe/tests/xe_sriov_pf_service_kunit.c  | 227 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.c                    |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |  12 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |   2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   3 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  12 +-
 drivers/gpu/drm/xe/xe_gt.h                    |   5 +
 drivers/gpu/drm/xe/xe_gt_idle.c               |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  30 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 166 +------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |   2 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  34 +--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  12 -
 drivers/gpu/drm/xe/xe_irq.c                   |   7 +-
 drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  61 ++++-
 drivers/gpu/drm/xe/xe_sriov_pf.h              |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_service.c      | 216 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_service.h      |  23 ++
 .../gpu/drm/xe/xe_sriov_pf_service_types.h    |  36 +++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  45 ++++
 drivers/gpu/drm/xe/xe_sriov_types.h           |  36 ---
 drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  41 ++++
 drivers/gpu/drm/xe/xe_tile.h                  |   6 +
 29 files changed, 744 insertions(+), 503 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h

-- 
2.47.1

