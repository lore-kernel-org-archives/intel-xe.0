Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA8ACAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 20:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5548E10E133;
	Fri, 26 Sep 2025 20:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPWhTpst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C33410E133
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758917360; x=1790453360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EljpuIHywAQYhJRpAppP52EaZ6LFZdocosjARAZh5dk=;
 b=gPWhTpstrx2DIWAaHrNe08F0p0rPcM5GafvCSAxEjfuOrMTNfz9vJU0A
 h5k5ZpfaOaaBQq8vEweMEJd4WpXf8Ht1x1xKAy8a7f9UagtSgmOKKHoK3
 OIf5FYxj4kAGVZZsY+UFFGhwcPsksz2+upj5aKIeWQ6c9BPG6Q6tIdWVs
 vQPnxbNQHapZODs5Be5fsa3t/NgZo5uaw4uATnzyfIQTT3ULk1PW/6COU
 pv9NfMRzIp5LUe9nP7GuST5V9+11NfjjItgcxHHcrx8CYJ7VxYpBpPBA0
 zVBf6ifeoo9tofe4d5LLrNERuknsCdFgKW54sJDTkZyNpbE/AFh6Ddayq w==;
X-CSE-ConnectionGUID: ZaMh9oHiTFOR3I5KsQuhBA==
X-CSE-MsgGUID: GsusDfQtSNmqKk5y80CrNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72352462"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72352462"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:20 -0700
X-CSE-ConnectionGUID: 1PWoc+35RzuPeDlKKMTiew==
X-CSE-MsgGUID: qwv7t+BURkCw0PizQCUBog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177634930"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 0/5] drm/xe: Guard against NULL return for xe_device_get_gt
Date: Fri, 26 Sep 2025 20:09:18 +0000
Message-ID: <20250926200917.164618-7-jonathan.cavitt@intel.com>
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

In many cases, this can be prevented by using xe_root_mmio_gt instead of
xe_device_get_gt.  Add guards for all other cases.

v2:
- Various commit message fixups (Michal)
- Use xe_assert in xe_guc.c (Michal, Matt)
- Add assert to vf_post_migration_recovery (Michal)
- Modify various xe_pmu functions to take an xe_gt pointer (Michal)
- Fix potential memory leak (Michal)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Jonathan Cavitt (5):
  drm/xe: Guard against NULL GT in xe_sriov_vf.c
  drm/xe: Guard against NULL GT in xe_pmu.c
  drm/xe: Don't call xe_device_get_gt twice in xe_hw_engine_lookup
  drm/xe: Guard against NULL GT in xe_guc.c
  drm/xe/tests: Use xe_root_mmio_gt instead of xe_device_get_gt

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  7 +++--
 drivers/gpu/drm/xe/xe_hw_engine.c             |  3 +-
 drivers/gpu/drm/xe/xe_pmu.c                   | 30 +++++++++++--------
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  4 ++-
 9 files changed, 32 insertions(+), 22 deletions(-)

-- 
2.43.0

