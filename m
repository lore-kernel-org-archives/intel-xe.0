Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C4CC624D2
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 12:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2408710ECB8;
	Tue,  1 Sep 2026 12:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0Gp3/aY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912810E6D5;
 Tue,  1 Sep 2026 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788265592; x=1819801592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G5Eqw2GtNO/wnpZXnj9eC3OjMxtP1vB7ZxlB8cj2fDc=;
 b=f0Gp3/aYmN44LOyJVa/kfXMq1gH1D2JMftI9w/UiAFlGabqVGLHpqCRE
 aVoWFpDw5nmGQW0r5SgVeiPMzQ//ljaXtH4xkquPEL1bijTE26LklYejT
 nVaJhFswKcLF2y7V/1tGXfP5GxD+Ib5Tdam3Zw10LV9pIXpXSdsJpLB/U
 uBFDSsHkATl2PPXSqzaUTaWKcMrNBiRt0o2zE+C8jfUMCb2avumPtSgD3
 mYx76+q38BTPXi26wGCVILMzv7IEXgNxRBw+4eWwiC2fQTF/FsZRS766x
 o4MfSzLWBCYmuqEWSMpwzvFyyaIpWv8FhQPmzwe3ULdIJMfVBjkoKiJxL A==;
X-CSE-ConnectionGUID: PiJUPokVTqGiUaUh1Ar1cw==
X-CSE-MsgGUID: +DbDRq3KSKu3/J+4rhmCFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106064559"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="106064559"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 05:26:31 -0700
X-CSE-ConnectionGUID: 9fw3MeG8Tzu58nJKn4kPFg==
X-CSE-MsgGUID: LLRebeZRT7KnckTQUWUVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265368134"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2026 05:26:30 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: uma.shankar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [v2 0/2] Support YUV buffers in HDR planes
Date: Tue,  1 Sep 2026 17:32:52 +0530
Message-ID: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
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

v2:
 - Increase MAX_COLOROP to 5 (Sashiko)

Chaitanya Kumar Borah (2):
  [DO_NOT_REVIEW] drm/i915/color: Add color pipeline support for SDR
    planes
  drm/i915/color: Add YUV buffer support on HDR planes

 drivers/gpu/drm/i915/display/intel_color.c    | 76 +++++++++++++++----
 .../drm/i915/display/intel_color_pipeline.c   | 34 +++++++--
 .../drm/i915/display/intel_display_limits.h   |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_plane.c    | 53 ++++++++++++-
 .../drm/i915/display/skl_universal_plane.c    | 45 ++++++-----
 6 files changed, 168 insertions(+), 42 deletions(-)

-- 
2.50.1

