Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7535CC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0110F051;
	Wed,  2 Sep 2026 08:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kV+jKV61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFF210F051;
 Wed,  2 Sep 2026 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788337072; x=1819873072;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mLbacIJ+T+AHxNKmkDAsAf0UVdMtPCQ3RsJeQvGg3gc=;
 b=kV+jKV61FwVmJglZi7qBdpD64Nt645q7Km1s7cPvN6fVgrGbRXStsYlr
 Orwq9U9CjFL7Tca+BnjBwoqPIBq5HYebZ0TcSBDg6+P1YIHaODmkJyKJX
 5Iae4OmcQ7dyTeYrwEKx3qFWnHubJj3Y/F8+XxL0H47hFNQ6ewt1cIJk0
 1gpjky2rJ+jQeACclQOVfJpt8R36NKkZ5u0KUDCcJzFLVPdEAUbRlIS3s
 saHSD9SXCn4TA0ZaKsQ4u7jPFrJPeTcTrJCyEQ/eJfmUhLrtogTeL9b7a
 BLKt59hXwBWm5D2zUoHqV3XbR3+eTAnm7TyATXmwlT0EmNPGdxpD0saB7 A==;
X-CSE-ConnectionGUID: dvEUVR7CSu+hVKOQIZk9yA==
X-CSE-MsgGUID: PKOqoP2SRVi0EJIoRGATsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299810"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100299810"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:17:52 -0700
X-CSE-ConnectionGUID: Fubq5NAhSluu2VrjH1NZxQ==
X-CSE-MsgGUID: rT04AkBsRK6+L7CKZMxLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263193647"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:17:51 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [CI 0/9] drm/i915/color: Add YUV Support in color pipeline
Date: Wed,  2 Sep 2026 13:24:08 +0530
Message-ID: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

This series is just for CI results. It combines the following:

https://patchwork.freedesktop.org/series/162786/#rev7
https://patchwork.freedesktop.org/series/172057/#rev2

Chaitanya Kumar Borah (7):
  drm/i915/color: Add CSC on SDR plane color pipeline
  drm/i915/display: extract glk_plane_color_ctl_input_csc helper
  drm/i915/display: simplify glk_plane_color_ctl_input_csc
  drm/i915/display: Program CSC on SDR planes based on Fixed Matrix
    Colorop
  drm/i915/color: Add support for 1D LUT in SDR planes
  drm/i915/color: Add color pipeline support for SDR planes
  drm/i915/color: Add YUV buffer support on HDR planes

Pranay Samala (2):
  drm/i915/color: Extract HDR post-CSC LUT programming to helper
    function
  drm/i915/color: Program Plane Post CSC registers for SDR planes

 drivers/gpu/drm/i915/display/intel_color.c    | 76 +++++++++++++++----
 .../drm/i915/display/intel_color_pipeline.c   | 34 +++++++--
 .../drm/i915/display/intel_display_limits.h   |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_plane.c    | 53 ++++++++++++-
 .../drm/i915/display/skl_universal_plane.c    | 45 ++++++-----
 6 files changed, 168 insertions(+), 42 deletions(-)

-- 
2.50.1

