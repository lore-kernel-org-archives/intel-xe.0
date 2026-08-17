Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C47C5DF70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60FA10E6E5;
	Mon, 17 Aug 2026 09:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgfIRtfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCD110E6E5;
 Mon, 17 Aug 2026 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786958965; x=1818494965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SVrrR93sHtW317ZDhWfpruRYed+Q/MR6kk7SUYNVMrw=;
 b=QgfIRtfj3lq+VnL4rHW5O17hjvk9Cjahl7XutZkD9ITIU/HoSwLxtkXv
 84fTTNb4lhRtp1O+rG3Yk2t8MSz+a/JesIe215FUe0LSRQreJtVvdYWbC
 DrEETT9g0Cl4eBziWM7RxUL6RevSTMczQHM9dnUAPkLofeJ5RI1JyjDxV
 clPXZeqOsx0kjqg/mT0XiYc3q5tSFNyMMjfJrnHkVtbZHwvbeB9v99NYd
 NKKvR1brfhaiXksHIVfy1RffMe3rIEHqo0jFCG4oCMhxqr2IJb6pRVOd2
 fTMm5CN84J1D3swakRjgFX8VqsxXfVzImrrz/uuOfv8msEBXLH87h6bP4 g==;
X-CSE-ConnectionGUID: fga2sCznQa+OrVAhcK6gsw==
X-CSE-MsgGUID: Aic8ZeI/TkWrjMAjIH1qFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87189991"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87189991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:25 -0700
X-CSE-ConnectionGUID: NHCyV3jgRG+wLYttkllI1Q==
X-CSE-MsgGUID: l7Zw0yX9QsWFj/ZCd9t7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268348870"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.136])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:23 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v3 0/5] drm/i915/display: reduce clock_gating interface
 between core and display
Date: Mon, 17 Aug 2026 12:26:19 +0300
Message-ID: <20260817092911.342072-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

As a follow up to my previous clock-gating patches, this series
reduces the interface between core and display by combining all the
platform-specific exported functions and letting the display code
decide what to do for each platform.

In v2:

  * Reworked the previous version so we have only one entry point,
    instead of an _early() and a _late() function.  It turns out that
    this is not necessary because some platforms were using only
    _early() and the others were using _late() (not both);
    
  * Removed back-dependency from the display code into the core code
    by avoiding calls to intel_clock_gating_init() (Jani);

In v3:

   * Added intel_display_clock_gating.o to xe's Makefile to prevent
     linking breakage;

Please review.

Cheers,
Luca.


Luca Coelho (5):
  drm/i915/display: consolidate Gen9 clock gating initialization
  drm/i915/display: consolidate remaining clock gating initialization
  drm/i915/display: remove unnecessary clock_gating include from
    intel_display.c
  drm/i915/display: add a way to restore only display/pch registers in
    clock_gating
  drm/i915/display: split part of intel_display_reset_finish() to a new
    function

 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 .../i915/display/intel_display_clock_gating.c | 74 +++++++++++++++----
 .../i915/display/intel_display_clock_gating.h | 17 +----
 .../drm/i915/display/intel_display_power.c    |  4 +-
 .../drm/i915/display/intel_display_reset.c    | 19 +++--
 .../drm/i915/display/intel_display_reset.h    |  1 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |  5 ++
 drivers/gpu/drm/i915/intel_clock_gating.c     | 30 +++-----
 drivers/gpu/drm/xe/Makefile                   |  1 +
 9 files changed, 95 insertions(+), 57 deletions(-)

-- 
2.53.0

