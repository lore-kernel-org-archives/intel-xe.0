Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0F0C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38B910E023;
	Fri, 11 Sep 2026 04:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0y0GKXs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9605010E023;
 Fri, 11 Sep 2026 04:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100099; x=1820636099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fLm+VkNPuBhVLQ4l0OmpdPK9PPL/h5e3bVFppB6VsIA=;
 b=T0y0GKXs4KHWBz71n8xtktychzWHBma/x7pJG2Sj+PKP/ECHBqdeDrAl
 BxUQrF3Hmez9aK011yAQNTSky7qK5xJ0OJfIwYzGqc8+OwB1yXAK3RHIK
 kiF8sSMl9kYN2nUFgpJbYKJ1zFo2wXb5ATgl0xY9cZZgvqqrFU136cVMD
 Hnj/EMZLLHEaFCvIHdyzq/JAxMzDYquxeSeeL2o+W7s7IZau3ol0r/kLl
 LGcB7YHcyWupnEvKrYs+7uU5HxOuGKKAaxwse8RdXJSmy/sOFGUGd8P49
 Uexe7J3jhyaQrbRx7GZXYThkDclQQdY+IYvb/xkNpRLlDcrKT6qbp27Et g==;
X-CSE-ConnectionGUID: X5345AKwTXiDhbBNdhIcoQ==
X-CSE-MsgGUID: KLWVf7bwTZ2tXMMSs1Nh0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599948"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599948"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:14:59 -0700
X-CSE-ConnectionGUID: ZFi+my+ATgeMvwF2H0SGQw==
X-CSE-MsgGUID: bUhwlGRMQAO47N/sbDX7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334408"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:14:57 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 00/10] Implement Wa_14021768792 to bypass m_n ratio limit
Date: Fri, 11 Sep 2026 09:44:39 +0530
Message-Id: <20260911041449.3699400-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

For Platforms that support higher link rates, there is a limitation on
Link M /Link N ratio.
If the CEILING( Link M / Link N ) ratio is greater than 10.0, then
hardware cannot support the given resolution / refresh rate at the given
configuration.
For BMG Wa_14021768792 helps to bypass this limitation and allows it to
support the ratio till 15.0.

This series adds the missing restrictions for earlier platforms and adds
the Wa_14021768792 for BMG as per Bspec:49266

Ankit Nautiyal (8):
  drm/i915/display: Add helper to compute link M/N ratio for reuse
  drm/i915/dp_mst: Limit M/N ratio for MST
  drm/i915/dp: Add M/N ratio check with warning for DP link config
  drm/i915/display: Add bits for link_n_extended for DISPLAY >= 14
  drm/i915/display_wa: Add support for Wa_14021768792
  drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
  drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n
    ratio > 10
  drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG M/N bypass

Suraj Kandpal (2):
  drm/i915/dp: Limit M/N ratio for DP SST
  drm/i915/dp: Bump the max Link M/N ratio to 22 for DISPLAY_VER >= 35

 drivers/gpu/drm/i915/display/intel_display.c  | 128 +++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.h  |   5 +
 .../gpu/drm/i915/display/intel_display_regs.h |  12 ++
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../gpu/drm/i915/display/intel_display_wa.c   |   9 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 147 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   7 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   7 +
 9 files changed, 307 insertions(+), 11 deletions(-)

-- 
2.34.1

