Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21284C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D6410F4A1;
	Fri,  7 Aug 2026 12:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj2rXEeV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4880910F4A1;
 Fri,  7 Aug 2026 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786104944; x=1817640944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ss0H7nUkjOgMM3ujPQ3L3EZ67Y/7KSOmHNauN9PZwLI=;
 b=dj2rXEeV3XsbL1W7/NNzn/WPWI/njOKVuTs6V5SLqgYnmK3uygQL86nV
 MWPgcQGXy2NE4RzzMTEIDUuN7eo7KPZoSoiKf1KnDDcFBx5JfR8MV4Tpx
 a24Ffdr7LjkBRIbptUasPjf4qB5Sv9fHkL05iE7WNT7+wZqpHza7e7hHi
 8Y2+BiXFbnRk2HBIbjwiuhyTAHme5pKDo5rS04ES0j9Uiee942pjkMdzy
 0/EHxRWq2NNxjayeUhTi/eequIbkfELSs0JCh1qrMoCayLGsPBxtK7Lhy
 ggft2lMxbbY7Km0PmyUzShZ6qM0ZhwWC9bHi/gwtd0SYq4H6H0silQIQA w==;
X-CSE-ConnectionGUID: 1mbONPhkRnK4TuezTDdgpg==
X-CSE-MsgGUID: C6Hi5iFGQau2yvHQ6lO50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86562841"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86562841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:15:44 -0700
X-CSE-ConnectionGUID: opB80UT0Sj+6P0GXuDFhsw==
X-CSE-MsgGUID: yY+mlzkBS1ePgODdZvAYuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260611601"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa006.jf.intel.com with ESMTP; 07 Aug 2026 05:15:43 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 0/3] drm/i915/display: fix flipq pipe CRC mismatch in
 kms_cursor_crc
Date: Fri,  7 Aug 2026 12:15:37 +0000
Message-ID: <20260807121540.2032283-1-mika.kahola@intel.com>
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

kms_cursor_crc's cursor-alpha-opaque subtest fails igt_assert_crc_equal()
once flipq is enabled. Flipq commits complete asynchronously via pipe
DMC, but frontbuffer tracking isn't notified when the queued update
actually lands, so a CRC taken right after can observe stale state.

Patch 1 fixes that by deferring the frontbuffer flip notification until
the flipq commit has actually completed. Patches 2 and 3 close two
related eligibility gaps found while tracking this down: flipq being
selected for commits more complex than a simple queued plane update,
and a stale use_flipq surviving into a duplicated crtc state, letting a
legacy cursor commit slip through without re-evaluating eligibility.

Tested on pixel with kms_cursor_crc and kms_frontbuffer_tracking.

Mika Kahola (3):
  drm/i915/display: Flush frontbuffer tracking on flipq completion
  drm/i915/display: Restrict flipq to simple single-plane updates
  drm/i915/display: Reset use_flipq when duplicating crtc state

 drivers/gpu/drm/i915/display/intel_atomic.c   |  1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |  3 +
 drivers/gpu/drm/i915/display/intel_display.c  | 56 ++++++++++++++--
 .../drm/i915/display/intel_display_types.h    |  9 +++
 drivers/gpu/drm/i915/display/intel_dsb.c      | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dsb.h      |  2 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 21 ++++++
 drivers/gpu/drm/i915/display/intel_fbc.h      |  1 +
 8 files changed, 151 insertions(+), 7 deletions(-)

-- 
2.43.0

