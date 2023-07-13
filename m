Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8BDC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9D10E6FA;
	Thu, 13 Jul 2023 15:06:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEF810E6F8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260790; x=1720796790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GJsJMiaMxut3rLdl01n54WWxC/CVeJdYm/4v+VyoDBs=;
 b=gZSG23efZgLgtOcvBMM3ajq53ieF9ncVHDsQz3MdNuDO2/NUeI9/79k+
 xfD4ZoWQcCcoFO+lk3bb08XzMpTVSlU92HdcmKxEDzx5179zEe/NufMdQ
 iO/TR2B9ZRiXK9EvoxQEuDaN5esiO0LQPvusTQpyqzKHC2qRx7TamZ++i
 qLWxbb7iRA/pS5N0qQ2mqu+/JrcDofXqThyn8CmM5h3yQg5EpKlgXijg5
 C0nwTHd+kFZsRwG7rb1pWiixUYenxH4012WHbbpjQMcn8WcHT+mCsSRnO
 Qg5mSdp2yv2VLazd1RUiNCDqSCyk9lcFHnUL5GGQmY185ON4XknmtEy8O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856882"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856882"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285515"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285515"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:04 +0000
Message-Id: <20230713150611.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.

Francois Dugast (7):
  drm/xe: Cleanup SPACING style issues
  drm/xe: Cleanup OPEN_BRACE style issues
  drm/xe: Cleanup POINTER_LOCATION style issues
  drm/xe: Cleanup CODE_INDENT style issues
  drm/xe: Cleanup TRAILING_WHITESPACE style issues
  drm/xe: Cleanup COMPLEX_MACRO style issues
  drm/xe: Fix typos

 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  4 ++--
 drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  4 ++--
 drivers/gpu/drm/xe/xe_device.h                     |  6 +++---
 drivers/gpu/drm/xe/xe_device_types.h               |  4 ++--
 drivers/gpu/drm/xe/xe_engine.c                     |  4 ++--
 drivers/gpu/drm/xe/xe_force_wake.c                 |  2 +-
 drivers/gpu/drm/xe/xe_gt.h                         |  2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |  8 ++++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
 drivers/gpu/drm/xe/xe_gt_types.h                   |  8 ++++----
 drivers/gpu/drm/xe/xe_guc.c                        |  2 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |  2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   | 12 ++++++------
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 14 +++++++-------
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  4 ++--
 drivers/gpu/drm/xe/xe_rtp.h                        |  4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h                | 10 +++++-----
 drivers/gpu/drm/xe/xe_sched_job.c                  |  2 +-
 drivers/gpu/drm/xe/xe_uc.c                         | 10 +++++-----
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c                         |  2 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  4 ++--
 26 files changed, 69 insertions(+), 63 deletions(-)

-- 
2.34.1

