Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84738CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 17:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CA410EF99;
	Wed, 13 May 2026 17:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv64qFnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72A10EF92;
 Wed, 13 May 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778692204; x=1810228204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhTnuX0dQZ+0PXOjDsiGnIlnElnl2br0dmQsXNoc6FA=;
 b=Vv64qFnhDwGQ4S3TlzlPshTHzjmgxi3wGv99wgFjTClmhvrxMAZ+p1nY
 OgSoKlTHJMS+cGEacBWjK6Ni2W3e0X55axnaDZ6G34diL6cf0aR36a9Ie
 ZvH++Ix6BixUA4vd+hjURde4W4OhgP4OmfNZvWxw8O/R2O66PfYiwjLF1
 Zsnm/ksAH3GTq7wcU2xptv2x9OozaBJ/XIsVxw1bC3AFQ2TWFa85jVqcH
 Se98NjYCtd5sZlISRWqDUL/cu0vd8Mh/qbBsFankh8Pv0Z5nY3AdcVvJI
 T9TNp47zc8zQj6cNuHkSBnfLzuWsx9JAyFRQ6IacxKeDGb31/v7nC0BZ6 g==;
X-CSE-ConnectionGUID: qPQT2vq0R5eemz2JZqw+WA==
X-CSE-MsgGUID: iPVlEa47T2quIXGn5HSjAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102295291"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="102295291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:10:04 -0700
X-CSE-ConnectionGUID: pYvbZkYtTQKGQux2LwzV4g==
X-CSE-MsgGUID: 4k0fiuWOT7GbbKp67DbIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="238030116"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 13 May 2026 10:10:02 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 00/16] CMTG enablement
Date: Wed, 13 May 2026 22:08:41 +0530
Message-Id: <20260513163857.1541888-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Common mode timing generator (CMTG) support is added NVL onwards.
Enable CMTG which will be needed by other fearure like dynamic dc
state enablement later.

Testing ongoing, currently counters are incrementing as expected.

Animesh Manna (13):
  drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
  drm/i915/cmtg: Set CMTG clock select
  drm/i915/cmtg: Add cmtg transcoder offset in struct _device_info
  drm/i915/cmtg: Set timings for CMTG
  drm/i915/cmtg: Program VRR registers of CMTG
  drm/i915/cmtg: Set transcoder mn for CMTG
  drm/i915/cmtg: Add hook to enable CMTG with sync to port
  drm/i915/cmtg: Add a hook to make eDP transcoder secondary
  drm/i915/cmtg: Split CMTG support check from intel_cmtg_is_allowed()
  drm/i915/cmtg: Add CMTG interrupt handling
  drm/i915/cmtg: Add trigger to enable/disable cmtg
  drm/i915/cmtg: Restore CMTG after DC6 entry
  [NOT FOR REVIEW] debug patch

Dibin Moolakadan Subrahmanian (3):
  drm/i915/cmtg: Modify existing hook to disable CMTG
  drm/i915/cmtg: Add CMTG HWGB programming
  drm/i915/cmtg: Add CMTG scan line programming

 drivers/gpu/drm/i915/display/intel_cmtg.c     | 328 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  15 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  24 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  35 ++
 .../drm/i915/display/intel_display_device.c   |  14 +
 .../drm/i915/display/intel_display_device.h   |   2 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |  12 +
 .../drm/i915/display/intel_display_limits.h   |   2 +
 .../drm/i915/display/intel_display_power.c    |  25 ++
 .../drm/i915/display/intel_display_power.h    |   3 +
 .../gpu/drm/i915/display/intel_display_regs.h |   6 +
 .../drm/i915/display/intel_display_types.h    |   4 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |   5 +
 14 files changed, 469 insertions(+), 11 deletions(-)

-- 
2.29.0

