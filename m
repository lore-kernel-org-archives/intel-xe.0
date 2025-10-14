Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B7CCD194
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B2210E668;
	Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yrh5xPgO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB8610E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460481; x=1791996481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AcdyUM9B5Ra4z36ySCMwi/2OaVwn0UbDfiVMcmj0DzY=;
 b=Yrh5xPgOPtRtot6H5mhsoqlEqccq5WQAeu7tlNbQZQQAnxkTHK0bAs06
 Rlk0v1NXUHEejtuGdwsd8qEQTHFkj7KLw1oupCQuao3DS11BKfw8Frjyj
 WLx9QkMOqBaNHDFD7o6FU/4jTC5/xFQna0t0Pc1CYYXQjvhoiAieyQYPE
 k+QcYvc1+QnTBuoCrkAH/lxKog9OPZE+dC4eWhYfieBafmkq+rA2D62Es
 CHj4/8ESYY0Sfl0xCtEJUrttly3ASfD5JEbQukv0Ho+c20U4qHnvDOHjn
 FSrKy+IAflvha4kqIVkx4wVhqbOpJDhMtLxk8Keabo83e91CB7Cdj/4oT Q==;
X-CSE-ConnectionGUID: VVgTwgMtSuyRxfhajnuqrg==
X-CSE-MsgGUID: txt7kE8FSzWEjJUS4DJ2ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063042"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
X-CSE-ConnectionGUID: XJeUMDJFRh6kWP6l8AzMXw==
X-CSE-MsgGUID: IYrC6L4dRfCI6/G6273JWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184677"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 0/7] drm/xe: Guard against NULL return for xe_device_get_gt
Date: Tue, 14 Oct 2025 16:47:59 +0000
Message-ID: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Modify xe_device_get_gt to assert a non-NULL return value.  This breaks
some macros (namely, for_each_gt), so keep the old functionality in
xe_device_lookup_gt, and only use xe_device_get_gt in places where it is
necessary to assert a non-NULL return value.  Finally, add
xe_device_get_any_gt, a kunit-only macro that returns the first
available GT while asserting at least one exists, for cases where the GT
with ID 0 is masked off.

v2:
- Various commit message fixups (Michal)
- Use xe_assert in xe_guc.c (Michal, Matt)
- Add assert to vf_post_migration_recovery (Michal)
- Modify various xe_pmu functions to take an xe_gt pointer (Michal)
- Fix potential memory leak (Michal)

v3:
- Add xe_device_lookup_gt macro (Michal, Rodrigo)
- Modify xe_device_get_gt to assert gt existance (Michal, Rodrigo)
- Use xe_device_get_gt where necessary (jcavitt)
- Add xe_device_get_any_gt for kunit (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>

Jonathan Cavitt (7):
  drm/xe: s/xe_device_get_gt/xe_device_lookup_gt
  drm/xe: Don't call xe_device_lookup_gt twice in xe_hw_engine_lookup
  drm/xe/xe_device: Reintroduce xe_device_get_gt
  drm/xe: Guard against NULL GT in xe_sriov_vf.c
  drm/xe: Guard against NULL GT in xe_pmu.c
  drm/xe: Guard against NULL GT in xe_guc.c
  drm/xe/tests: Use any available GT for testing

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  8 ++--
 drivers/gpu/drm/xe/xe_device.h                | 41 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eu_stall.c              |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  5 +--
 drivers/gpu/drm/xe/xe_pmu.c                   | 13 +++---
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 10 files changed, 59 insertions(+), 20 deletions(-)

-- 
2.43.0

