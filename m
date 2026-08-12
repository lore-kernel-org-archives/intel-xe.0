Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1A9C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD6010EF10;
	Wed, 12 Aug 2026 09:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVWb26Ra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1DE10EEE1;
 Wed, 12 Aug 2026 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786526576; x=1818062576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hp6+7VNBYYTRgc/CQegp3+b+6XBQlV1pa2nUZEuz7bc=;
 b=VVWb26Ra/PZ2+hGqBAmo+GsqxeA8BGZJfwswlfej/yCUsZOvcA5zh9gP
 L0qLAnDo1c4WDn/giLcxVCUSS415WX3EzWGgNfWXM8saf7hN/VoBjrbCA
 0fdeeSqE9ij5vQ0RUsmGN/q6L3kPOILDsxQXUf6y0wMyyLO1J3ydh5Fyu
 GFe2JKHqAIdAYG+LwWrrkbthsmvI6v5kiZcL03wwK+6kJmBk37cQ6hnln
 Spp/WzKpHrBTX4wNCd68Goz+gAcInbZJ0ePTZeG3Xkmc0TYXqR6IvttvS
 8331ASvyIr6LXJWbN3Zh3m+ff/j5P8HB9EoB7yzldyfGW5h4S5V1QNZgh w==;
X-CSE-ConnectionGUID: jPKK0W2oQPeGkoCftaF96w==
X-CSE-MsgGUID: 3VHut+mXSjWTGV/BgzofdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86928539"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86928539"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:22:56 -0700
X-CSE-ConnectionGUID: 4mI19DsdTwKdOHawg81Tpw==
X-CSE-MsgGUID: NUq/VtnqRqWdZBUoqfnjPQ==
X-ExtLoop1: 1
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2026 02:22:54 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 0/2] Support YUV buffers in HDR planes
Date: Wed, 12 Aug 2026 14:29:06 +0530
Message-ID: <20260812085908.3159828-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

The legacy COLOR ENCODING and COLOR RANGE properties are mutually exclusive
for HDR planes. Add support for FIXED MATRIX colorops in HDR plane color
pipeline that can be used for YCbCr to RGB conversion.

The first patch contains the base work done for SDR planes and is being
reviewed separately.

Chaitanya Kumar Borah (2):
  [DO_NOT_REVIEW] drm/i915/color: Add color pipeline support for SDR
    planes
  drm/i915/color: Add YUV buffer support on HDR planes

 drivers/gpu/drm/drm_atomic.c                  |   4 +
 drivers/gpu/drm/drm_atomic_uapi.c             |   7 +
 drivers/gpu/drm/drm_colorop.c                 | 107 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.c    |  76 ++++++++---
 .../drm/i915/display/intel_color_pipeline.c   |  32 ++++-
 .../drm/i915/display/intel_display_limits.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_plane.c    |  53 +++++++-
 .../drm/i915/display/skl_universal_plane.c    |  45 ++++---
 include/drm/drm_colorop.h                     | 127 ++++++++++++++++++
 include/uapi/drm/drm_mode.h                   |  12 ++
 11 files changed, 424 insertions(+), 41 deletions(-)

-- 
2.50.1

