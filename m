Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989910F9956
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 16:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B2A10E69F;
	Wed,  8 Apr 2026 16:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEta2zbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C0C10E462
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775664329; x=1807200329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IHkM6vrwMmPTwUQtiti/L61aeXN/b237bKKEURy1udE=;
 b=BEta2zbbwpOxyMSl8sykX49F9NnOEhAh9SlheNovE3g0NbihyvB9IOTP
 qVt8KLpDUvha+sPRsRd/qJQJLEZoRMP7JEr7mXqWFHwiDA207CltFwl3C
 WaaIH9SbiSYexKPHg+/TY9Lrhe+j8lX/n2rp9H1uri0NPCNGS2dEOS8qs
 g1FgEdamCvFOebSe5GjY0SouWA7DDKh99qq0nuywZBa4ZpupXpayw3/Vo
 nI3P/89hyECa7V2T7yANmkzwMI+p4QkmJjWrrmDEC8Atfce3m56ACjNTM
 M2DycjGMWJTuab+fw3+hLR/c25YiM4LfvZzAlS2aYBp5X5mpAfN6faGGs g==;
X-CSE-ConnectionGUID: TnaU1ublSKKeA/+VAPScQg==
X-CSE-MsgGUID: ykNRwqbMTIWCCiMVzRl5Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102107828"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="102107828"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 09:05:26 -0700
X-CSE-ConnectionGUID: PWnPZI61RiyU4ZcbCpN1nQ==
X-CSE-MsgGUID: 89r8Wwt4TRuDvTfgB3mLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232887774"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa004.jf.intel.com with ESMTP; 08 Apr 2026 09:05:23 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v10 0/3] Do not create drm device for PF only admin mode
Date: Wed,  8 Apr 2026 16:05:15 +0000
Message-ID: <20260408160514.2388689-5-satyanarayana.k.v.p@intel.com>
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
management functions and should not allow users to run workloads.
Suppress device capabilities to userspace in admin-only PF mode.

---
V9 -> V10:
- Moved some parts of admin_only_pf mode under CONFIG_PCI_IOV config
option (Michal).

V8 -> V9:
- Memory regions are skipped in case of admin_only_pf mode (Michal)
- Removed .dumb_create, .dumb_map_offset and .show_fdinfo device specific
operations in admin-only mode (Michal).
- Added new commits to derive admin-only PF mode from xe_device state and
corresponding changes in test cases.

V7 -> V8:
- Fixed issues reported by CI.Hooks
- Updated commit message (Ashutosh)
- Removed gem_prime_import from admin_only_driver structure (Michal)

V6 -> V7:
- Allowed xe_observation_ioctl as well with admin-only PF (Ashutosh,
Michal Wajdeczko).
- Updated commit message with steps to enable admin-only mode (Rodrigo).

V5 -> V6:
- Updated commit message.
- Make content of query_engines and query_mem_regions as empty in
admin-only PF mode instead of query size as zero.
- Allow all other query IOCTLs excepts query_engines and query_mem_regions
(Michal Wajdeczko).

V4 -> V5:
- Updated commit message (Matt B).
- Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
- Updated all query configs (Michal Wajdeczko).
- Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
- Fixed other review comments (Michal Wajdeczko).

V3 -> V4:
- Suppressed device capabilities in admin-only PF mode. (Wajdeczko)

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().

Satyanarayana K V P (3):
  drm/xe/pf: Restrict device query responses in admin-only PF mode
  drm/xe/tests: Fix pf_set_admin_mode() after sriov.pf.admin_only
    removal
  drm/xe/pf: Derive admin-only PF mode from xe_device state

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 22 ++++++-
 drivers/gpu/drm/xe/xe_device.c                | 65 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h                |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  3 +
 drivers/gpu/drm/xe/xe_query.c                 |  8 ++-
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  6 --
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  3 +-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  3 -
 8 files changed, 94 insertions(+), 17 deletions(-)

-- 
2.43.0

