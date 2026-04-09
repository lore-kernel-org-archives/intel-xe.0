Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBC1F31E43
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 15:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258510E826;
	Thu,  9 Apr 2026 15:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gn+ErlSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E421910E826
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775749474; x=1807285474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pyjrvg/Rk+noHuzBudOJxm2xem/KZO4g3WyJGsvZXok=;
 b=gn+ErlSlNI8jX9OuAOAoHKkEQxYyFi9IM5vn24pYuyyUAPNOXvI8KQfM
 a0Ztt3Hyb6R70nSWDHeA2tSDjryrq/i9MeqhTzAxHc92qiJgFL2/OwFZm
 yob5zywlKB9ndazQ8a4BK0NhGW9jIAgSGACbFpYk6uRRd+Xjyor3fqGKA
 ZCdYvLKcm8kthwwB16b6qJFFU0sAX9oZhxkMrXt9FjRAIT+RdpE8m4zlm
 RC6a44dQBsKnoe15ppmRgICYAuL6xZSiMIdwaNUo+GLDgOW/lqe28mBWy
 x86hn8z0KKIzjvS+WcwaXuVr/GjkZ4eVhNyPiTBdrmvAe2eg6ZehPad3H A==;
X-CSE-ConnectionGUID: 7efNStGtS0WAho0QssMO7g==
X-CSE-MsgGUID: VWXgn2CbTZ2X2xKg/nno+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99385964"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="99385964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 08:44:33 -0700
X-CSE-ConnectionGUID: P6VCtABKSeKjAeCY4byVmQ==
X-CSE-MsgGUID: 4Ybu0+NfS8iwl+WNkUc6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="224048821"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2026 08:44:32 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v11 0/2] Do not create drm device for PF only admin mode
Date: Thu,  9 Apr 2026 15:44:24 +0000
Message-ID: <20260409154423.2499340-4-satyanarayana.k.v.p@intel.com>
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
V10 -> V11:
- Moved xe_device_is_admin_only() definition for !CONFIG_PCI_IOV option
as per review comments (Michal).
- Fixed some more generic review comments (Michal).
- Cleandup pf_set_admin_mode() as per review comments (Michal).

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

Satyanarayana K V P (2):
  drm/xe/pf: Restrict device query responses in admin-only PF mode
  drm/xe/pf: Derive admin-only PF mode from xe_device state

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 21 ++++++-
 drivers/gpu/drm/xe/xe_device.c                | 59 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h                |  9 +++
 drivers/gpu/drm/xe/xe_hw_engine.c             |  3 +
 drivers/gpu/drm/xe/xe_query.c                 |  7 +++
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  6 --
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  3 +-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  3 -
 8 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.43.0

