Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154C3E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786810E3DA;
	Fri, 20 Dec 2024 19:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/GVM5rQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4669D10E011
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723738; x=1766259738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h2MDaU+5qXR8SIKszOwjB3SokhiyIgxVT0KRCAaCoKw=;
 b=G/GVM5rQ3Wl+9pLiakViAhxhWCg40Xk95Jg0MuYNfx3x4UWSOOI9eA5K
 Nmz5DpChpQkC2eTH7FuddHF6yGgaU7bVWGfjTzk+CFhMVzVZYiPrSpOT9
 KId/UwfA09kGu3e90coYlRmIQY3rlAexiqe7ymZVuAI9NjiANCRcz4Ogu
 xNwuTYcrKiI1J9Nlhh/9N9KMtytbr4AA9UnctYEf9qUzam1nNdbKU4XGB
 ylW2wdK2aYivGjvYnG28QzZh7QzK7oyVZFrSYq2czoZAC+IeIeqniPH6t
 J/cKTpc4yRaFcwPGCz+MI3tSTuNICZUFtcRnDa9gDv0CMNo2uRDyupXaQ Q==;
X-CSE-ConnectionGUID: A9xrTUM2QRitPmM91tbW4Q==
X-CSE-MsgGUID: gauSHqY7QE2e2iRRDKCJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965210"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:17 -0800
X-CSE-ConnectionGUID: 2rcMJQdmTXCjgkWbq6xqmg==
X-CSE-MsgGUID: XZYJJNlnSnGSjnPxh39czg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075418"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 00/11] The xe_sa_manager based GuC Buffer Cache
Date: Fri, 20 Dec 2024 20:41:53 +0100
Message-Id: <20241220194205.995-1-michal.wajdeczko@intel.com>
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

v0: https://patchwork.freedesktop.org/series/139801/
v1: https://patchwork.freedesktop.org/series/142458/#rev1
v2: drop separate bo cleanup patch (Matt)
    drop is_iomem removal patch (N/A)
    add kernel-doc xe_sa_bo_new (Matt)
    move init to xe_guc_init_post_hwconfig (CI)
    make sure to call xe_guc_buf_flush (Michal)

Michal Wajdeczko (11):
  drm/xe/sa: Always call drm_suballoc_manager_fini()
  drm/xe/sa: Drop redundant NULL assignments
  drm/xe/sa: Improve error message on init failure
  drm/xe/sa: Tidy up coding style in init()
  drm/xe/sa: Allow making suballocations using custom gfp flags
  drm/xe/sa: Allow creating suballocator with custom guard size
  drm/xe/sa: Minor header cleanups
  drm/xe/guc: Introduce the GuC Buffer Cache
  drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
  drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
  drm/xe/kunit: Add KUnit tests for GuC Buffer Cache

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 335 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                  |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  68 ++--
 drivers/gpu/drm/xe/xe_guc.c                 |   5 +
 drivers/gpu/drm/xe/xe_guc_buf.c             | 176 ++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h             |  47 +++
 drivers/gpu/drm/xe/xe_guc_buf_types.h       |  28 ++
 drivers/gpu/drm/xe/xe_guc_types.h           |   3 +
 drivers/gpu/drm/xe/xe_sa.c                  |  51 ++-
 drivers/gpu/drm/xe/xe_sa.h                  |  30 +-
 11 files changed, 692 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h

-- 
2.47.1

