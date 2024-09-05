Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA19CD5BAE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 11:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B394D10E86F;
	Thu,  5 Sep 2024 11:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buiKszBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1D810E86D;
 Thu,  5 Sep 2024 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725537207; x=1757073207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JXZvJMWvkG12N6bx9lWqrtOoqmDlkCbtedLqWYq6BCk=;
 b=buiKszBGxRwGooSzK3Wub3i4cwbIhQjvoduIIwG7iKqVNWLjA9ndaHaG
 bQjXX71RED5gXYUCSfTFCohZjxpSNe6TYszA7GPNURRh074YQMIclyqp5
 MZXO4H01WI11cnJ47TGgCDojLPeEqlM6MoH4ep2agQHgXgCmqgFemyP0v
 k/UN4NHB5/m0JH7AVvHDW62CSw3iUtRP1iHfYXuUOiSirFPYN2xFfaar/
 ykz9AVb1e0CYZx7BQIdDqbju+Uio/aZ+pWK6W6aUnwV+OrTyL4F7otgfM
 VTRL0PcSB77PC4+s/4AOJbi/C+aR+TUCvHFfysx6MYHfwwmh4CYgIGXvl Q==;
X-CSE-ConnectionGUID: 5Hh/vutARjKJtHgYUb60Qw==
X-CSE-MsgGUID: ZNHeJx1ATfiVr3Mi673ZHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24406105"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24406105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 04:53:27 -0700
X-CSE-ConnectionGUID: yQ88MjQSTyubY6k/Heo4dw==
X-CSE-MsgGUID: rmdSxzkqQHqWFVlnrlaxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65918112"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 04:53:26 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com
Subject: [PATCH 0/5] Implement Wa_14021768792 to bypass m_n ratio limit
Date: Thu,  5 Sep 2024 17:25:00 +0530
Message-ID: <20240905115505.3629087-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Ankit Nautiyal (5):
  drm/i915/display: Add bits for link_n_exended for DISPLAY >= 14
  drm/i915/display: Limit m/n ratio to 10 for display > 12
  drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
  drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n
    ratio > 10
  drm/i915: Add Wa_14021768792 as per WA framework

 drivers/gpu/drm/i915/display/intel_display.c  | 132 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.h  |  14 +-
 .../drm/i915/display/intel_display_types.h    |   3 +
 .../gpu/drm/i915/display/intel_display_wa.h   |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  66 +++++++--
 drivers/gpu/drm/i915/display/intel_dp.h       |   5 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  37 +++--
 drivers/gpu/drm/i915/display/intel_fdi.c      |  15 +-
 drivers/gpu/drm/i915/i915_reg.h               |   7 +
 drivers/gpu/drm/xe/display/xe_display_wa.c    |   5 +
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
 11 files changed, 241 insertions(+), 46 deletions(-)

-- 
2.45.2

